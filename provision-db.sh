#!/usr/bin/env bash
set -e
export DEBIAN_FRONTEND=noninteractive

# 1) Instalar PostgreSQL
apt-get update -y
apt-get install -y postgresql postgresql-contrib

# 2) Detectar versión mayor (p. ej., "12") y ruta de config
PGMAJOR=$(psql -V | awk '{print $3}' | cut -d. -f1)
CONF_DIR="/etc/postgresql/${PGMAJOR}/main"

# 3) Escuchar en todas las interfaces
if grep -q "^[#[:space:]]*listen_addresses" "$CONF_DIR/postgresql.conf"; then
  sed -i "s/^[#[:space:]]*listen_addresses.*/listen_addresses = '*'/" "$CONF_DIR/postgresql.conf"
else
  echo "listen_addresses = '*'" >> "$CONF_DIR/postgresql.conf"
fi

# 4) Permitir acceso desde la red privada
DB_NET="192.168.56.0/24"
if ! grep -q "$DB_NET" "$CONF_DIR/pg_hba.conf"; then
  echo "host    all             all             ${DB_NET}            md5" >> "$CONF_DIR/pg_hba.conf"
fi

# 5) Habilitar y reiniciar servicio
systemctl enable postgresql
systemctl restart postgresql

# 6) Crear usuario/BD/tabla/datos (idempotente)
DB_NAME="demoapp"
DB_USER="demo"
DB_PASS="demo123"

# 6.1 Usuario
sudo -u postgres psql -v ON_ERROR_STOP=1 <<'SQL'
DO
$$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'demo') THEN
    CREATE ROLE demo LOGIN PASSWORD 'demo123';
  END IF;
END
$$;
SQL

# 6.2 Base de datos (fuera de DO)
DB_EXISTS=$(sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='${DB_NAME}'")
if [ "$DB_EXISTS" != "1" ]; then
  sudo -u postgres createdb -O "${DB_USER}" "${DB_NAME}"
fi

# 6.3 Esquema, datos y permisos
sudo -u postgres psql -v ON_ERROR_STOP=1 <<'SQL'
\c demoapp

CREATE TABLE IF NOT EXISTS productos (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  precio NUMERIC(10,2) NOT NULL
);

INSERT INTO productos (nombre, precio)
SELECT * FROM (VALUES
  ('Teclado', 79.90),
  ('Mouse',   39.50),
  ('Monitor', 899.00)
) AS v(nombre, precio)
WHERE NOT EXISTS (SELECT 1 FROM productos);

-- Propiedad de la tabla para el usuario de la app
ALTER TABLE IF EXISTS public.productos OWNER TO demo;

-- Permisos actuales y por defecto para futuras tablas
GRANT USAGE ON SCHEMA public TO demo;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO demo;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO demo;
SQL

echo "[DB] PostgreSQL ${PGMAJOR} listo. BD=${DB_NAME} USER=${DB_USER} PASS=${DB_PASS} (escuchando en 0.0.0.0:5432)"

# Taller Vagrant + Provisionamiento con Shell

Repositorio del taller (fork de jmaquin0) realizado por **danielojedav19**.  
Se crean 2 VMs (web y db) con **Vagrant + VirtualBox** y se provisionan con **Shell**.

## Topologia e IPs
- **web**: 192.168.56.10 (Ubuntu 20.04)  Apache2 + PHP 7.4 + `php-pgsql`
- **db** : 192.168.56.11 (Ubuntu 20.04)  PostgreSQL 12 (BD `demoapp`, user `demo`/`demo123`)
- Red privada: `192.168.56.0/24`

## Requisitos en el host
- VirtualBox, Vagrant, Git (en Windows: instalar y reiniciar).

## Capturas de pantalla

A continuación se muestran las evidencias del taller en ejecución, incluyendo las máquinas `web` y `db`, el acceso a las páginas y la conexión PHP ↔ PostgreSQL.

<img width="1042" height="467" alt="Captura de pantalla 2025-10-27 185605" src="https://github.com/user-attachments/assets/9fd527ad-7fc3-40d8-9176-71e52a700fbb" />

<img width="877" height="510" alt="Captura de pantalla 2025-10-27 185620" src="https://github.com/user-attachments/assets/15196352-e732-433a-9c77-6b63d50e188a" />

<img width="744" height="316" alt="Captura de pantalla 2025-10-27 185636" src="https://github.com/user-attachments/assets/1e9f3e8c-f0c6-45a0-843f-ed18a56ebe3b" />

<img width="635" height="333" alt="Captura de pantalla 2025-10-27 185645" src="https://github.com/user-attachments/assets/54264bb3-a14d-4d23-8f81-4bd741bb8e90" />

## Como ejecutar
```bash
git clone https://github.com/danielojedav19/vagrant-web-provisioning.git
cd vagrant-web-provisioning
vagrant up db
vagrant up web
# Reprovisionar si editas scripts:
vagrant provision db
vagrant provision web

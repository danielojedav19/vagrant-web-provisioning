<?php
header('Content-Type: text/html; charset=utf-8');

echo "<h1>Hola desde PHP</h1>";

$host = '192.168.56.11';   // IP de la VM db
$db   = 'demoapp';
$user = 'demo';
$pass = 'demo123';
$dsn  = "pgsql:host=$host;port=5432;dbname=$db;";

try {
  $pdo = new PDO($dsn, $user, $pass, [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  ]);

  $rows = $pdo->query("SELECT id, nombre, precio FROM productos ORDER BY id")->fetchAll();

  echo "<h2>Productos (PostgreSQL)</h2>";
  if (!$rows) {
    echo "<p>No hay productos.</p>";
    exit;
  }

  echo "<table border='1' cellpadding='6' cellspacing='0'>
          <tr><th>ID</th><th>Nombre</th><th>Precio</th></tr>";
  foreach ($rows as $r) {
    $id = htmlspecialchars($r['id']);
    $nom = htmlspecialchars($r['nombre']);
    $pre = htmlspecialchars($r['precio']);
    echo "<tr><td>$id</td><td>$nom</td><td>$pre</td></tr>";
  }
  echo "</table>";

} catch (Throwable $e) {
  http_response_code(500);
  echo "<h2>Error conectando a la BD</h2><pre>" . htmlspecialchars($e->getMessage()) . "</pre>";
}

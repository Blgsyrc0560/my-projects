<?php
<<<<<<< HEAD:Kubernetes/Basic-Web-Application/phpapp/index.php
// $servername = "database";
// $username = "bekir";
// $password = "123456789";
// $database = "mydatabase";

$servername =  getenv('DATABASE_HOST');
$username =  getenv('DATABASE_USERNAME');
$password =  getenv('DATABASE_PASSWORD');
$database = getenv('DATABASE_NAME');
=======
$servername = "mysql-service";
$username = "bekir";
$password = "123456789";
$database = "mydatabase";

>>>>>>> 44cda9bcecfe652009529d3395d7d9fd14945b95:Kubernetes/Basic-Web-Application/index.php

// Connection
$conn = new mysqli($servername, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully " . $username;
// Close connection
$conn->close();
?>

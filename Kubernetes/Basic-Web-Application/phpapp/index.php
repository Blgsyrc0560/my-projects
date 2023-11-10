<?php
// $servername = "database";
// $username = "bekir";
// $password = "123456789";
// $database = "mydatabase";

$servername =  getenv('DATABASE_HOST');
$username =  getenv('DATABASE_USERNAME');
$password =  getenv('DATABASE_PASSWORD');
$database = getenv('DATABASE_NAME');

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
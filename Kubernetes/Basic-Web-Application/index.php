<?php
//$servername = "34.234.91.79:3307";
//$username = "bekir";
//$password = "123456789";
//$database = "mydatabase";

$servername = $_ENV['DB_HOST'];
$username   = $_ENV['DB_USERNAME'];
$password   = $_ENV['DB_PASSWORD'];
$database   = $_ENV['DB_DATABASE'];

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
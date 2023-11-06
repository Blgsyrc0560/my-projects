<?php
$servername = "mysql-service";
$username = "bekir";
$password = "123456789";
$database = "mydatabase";


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

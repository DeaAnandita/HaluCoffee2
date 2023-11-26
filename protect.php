<?php 
    if (!isset($_SESSION['pelanggan'])) {
        echo "<script>location='main_pelanggan.php';</script>";
        exit();
    }
?>
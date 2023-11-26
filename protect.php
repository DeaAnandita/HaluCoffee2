<?php 
    if (!isset($_SESSION['login'])) {
        echo "<script>location='main_pelanggan.php';</script>";
        exit();
    }
?>
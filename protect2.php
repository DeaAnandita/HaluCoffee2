<?php 
    if (!isset($_SESSION['main_pelanggan'])) {
        echo "<script>location='.php';</script>";
        exit();
    }
?>
<?php 
    if (!isset($_SESSION['admin'])) {
        echo "<script>location='.php';</script>";
        exit();
    }
?>
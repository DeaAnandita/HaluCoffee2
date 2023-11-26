<?php 
    if (!isset($_SESSION['login'])) {
        echo "<script>location='index.php';</script>";
        exit();
    }
?>
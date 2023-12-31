<?php
    session_start();  
    include 'protect.php';
    include 'koneksi.php';
    if (!$_SESSION['keranjang']) {
        header("location: cart.php");
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">

    <title>
        Cek Pesanan
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Poppins:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="asset/css/font-awesome.css" rel="stylesheet">
    <link href="asset/css/bootstrap.min.css" rel="stylesheet">
    <link href="asset/css/animate.min.css" rel="stylesheet">
    <link href="asset/css/owl.carousel.css" rel="stylesheet">
    <link href="asset/css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="asset/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="asset/css/custom.css" rel="stylesheet">

    <script src="asset/js/respond.min.js"></script>

    <link rel="shortcut icon" href="logo2.png">

</head>

<body>
    <!-- *** TOPBAR ***
 _________________________________________________________ -->
 <!-- <div id="top">
    <div class="container">
        <div class="col-md-6" data-animate="fadeInDown">
            <ul class="menu">
                <li><a href="profile.php">Welcome, <?php echo $_SESSION['pelanggan']['nama_pelanggan']; ?></a>
                </li>
                <li><a href="logout.php">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div> -->

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

 <div class="navbar navbar-default yamm" role="navigation" id="navbar">
    <div class="container">
        <div class="navbar-header">

                <a class="navbar-brand home" href="index.php" data-animate-hover="bounce">
                    <img src="logo2.png" class="hidden-xs">
                    <img src="logo2.png" class="visible-xs"><span class="sr-only"> go to homepage</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <a class="btn btn-default navbar-toggle" href="cart.php">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">Keranjang Belanja</span>
                    </a>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li> <a href="all-menu.php">Menu</a>
                    </li>
                    <li> <a href="warung.php">Detail</a>
                    </li>
                    </li>
                </ul>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">
                <?php
                error_reporting(0);                     
                    if (!$_SESSION['keranjang']) {
                    ?>
                        <div class="navbar-collapse collapse right" id="basket-overview">
                            <a href="cart.php" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">Keranjang Belanja</span></a>
                        </div>
                    <?php        
                    }
                    else{
                    $item = count($_SESSION['keranjang']);
                    ?>
                        <div class="navbar-collapse collapse right" id="basket-overview">
                            <a href="cart.php" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">Keranjang Belanja (<?php echo $item;?>)</span></a>
                        </div>
                    <?php
                    }
                ?>
            </div>

            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->

    <div id="all">
        <div id="content">
            <div class="container">
                <div class="col-md-3">
                </div>

                <div class="col-md-13" id="customer-order">
                    <div class="box">
                        <h1>Detail Pembelian : </h1>

                        <p class="lead">Berikut rincian pembelian anda  </p>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Menu</th>
                                        <th>Nama Produk</th>
                                        <th>Jumlah</th>
                                        <th>Harga Satuan</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                        $total = 0; 
                                    ?>
                                   <?php foreach ($_SESSION["keranjang"] as $id_produk => $jumlah): ?>
                                    <?php 
                                        $query = $conn->query("SELECT * FROM produk 
                                            WHERE id_produk='$id_produk'");
                                        $data=$query->fetch_assoc();
                                        $subharga=$data['harga_produk']*$jumlah;
                                        $total = $total+$subharga;
                                        $total_jumlah=count($_SESSION['keranjang']);
                                        $bayar=$total+$ongkir;                                        
                                    ?>
                                    <tr>
                                        <td>
                                            <a href="detail_produk.php?id=<?php echo $data['id_produk']; ?>">
                                                <img src="foto_produk/<?php echo $data['foto_produk'];?>" alt="">
                                            </a>
                                        </td>
                                        <td><a href="foto_produk/<?php echo $data['foto_produk'];?>"><?php echo $data['nama_produk']; ?></a></td>
                                        
                                        <td><?php echo $jumlah;?></td>
                                        <td>Rp.<?php echo number_format($data['harga_produk']); ?></td>
                                        <td>Rp.<?php echo number_format($subharga); ?></td>
                                    </tr>
                                    <?php endforeach ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5" class="text-right"><b>Total</b></th>
                                        <th><b>Rp.<?php echo number_format($bayar); ?></b></th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="row">
                        </div>
                        <form method="POST">
                            <div class="box-footer">
                                <div class="pull-right">
                                    <!-- <input type="hidden" name="total" value="<?=$total?>">
                                    <input type="hidden" name="bayar" value="<?=$total?>">
                                    <input type="hidden" name="id" value="<?=$id_pelanggan?>">
                                     -->
                                    <button type="submit" class="btn btn-primary" name="submit_co">Checkout<i class="fa fa-chevron-right"></i></button>
                                </div>
                            </div>
                        </form>
                        <?php 
                            if (isset($_POST['submit_co'])) {
                                // var_dump($_POST);
                                $id_pelanggan = $_SESSION['pelanggan']['id_pelanggan'];
                                $tanggal_pembelian = date('Y-m-d');
                                //Simpan data pembelian ke tabel pembelian
                                $conn->query("INSERT( INTO pembelian (`id_pembelian`, `tanggal_pembelian`, `jumlah_pembelian`, `total_pembelian`, `id_pelanggan`) VALUES ('','$tanggal_pembelian','$total','$bayar','$id_pelanggan')");

                                //get id_pembelian barusan
                                $id_pembelian_produk = $conn-> insert_id;
                                $stok=$data['stok'];

                                foreach ($_SESSION['keranjang'] as $id_produk => $jumlah) {
                                    $stok_update = $stok-$jumlah;
                                    $conn->query("INSERT INTO pembelian_produk (`id_pembelian_produk`, `jumlah`, `id_pembelian`, `id_produk`) VALUES ('','$jumlah','$id_pembelian_produk','$id_produk','$id_pembelian')");
                                    $conn->query("UPDATE produk SET stok='$stok_update' WHERE id_produk=$id_produk");
                                }

                                unset($_SESSION['keranjang']);

                                echo "<script>alert('Pembelian Sukses')</script>";
                                echo "<script>location='nota.php?id=$id_pembelian_produk'</script>";
                            }else{
                                echo "<script>alert('gagal')</script>";
                            }
                        ?>
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
 <div id="copyright">
    <div class="container">
        <div class="col-md-6">
            <p class="pull-left">© Kelompok 6</p>
        </div>
        <div class="col-md-6">
            <p class="pull-right">Alright Reserved
            </p>
        </div>
    </div>
</div>
<!-- *** COPYRIGHT END *** -->



</div>
<!-- /#all -->


    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
 <script src="asset/js/jquery-1.11.0.min.js"></script>
 <script src="asset/js/bootstrap.min.js"></script>
 <script src="asset/js/jquery.cookie.js"></script>
 <script src="asset/js/waypoints.min.js"></script>
 <script src="asset/js/modernizr.js"></script>
 <script src="asset/js/bootstrap-hover-dropdown.js"></script>
 <script src="asset/js/owl.carousel.min.js"></script>
 <script src="asset/js/front.js"></script>



</body>

</html>
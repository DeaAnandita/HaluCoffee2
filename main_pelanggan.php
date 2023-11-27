<?php 
include 'koneksi.php';   
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login Halu Coffee</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="logo2.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="asset/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="asset/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="asset/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="asset/login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="POST">
					<span class="login100-form-title p-b-26">
						Halu Coffee
					</span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="nama_pelanggan" value="">
						<span class="focus-input100" data-placeholder="Masukkan Nama"></span>
					</div>

					<div class="wrap-input100 validate-input" >
						<input class="input100" type="number" name="no_meja" value="">
						<span class="focus-input100" data-placeholder="Masukkan No Meja"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name="submit">
								Login
							</button>
						</div>
					</div>
				</form>
				<?php 
				if (isset($_POST['submit'])) {
					$nama_pelanggan = mysqli_escape_string($conn,$_POST['nama_pelanggan']);
					$no_meja = mysqli_escape_string($conn,$_POST['no_meja']);

					$query=$conn->query("SELECT * FROM pelanggan WHERE nama_pelanggan='$nama_pelanggan' AND no_meja='$no_meja'");
					$result=$query->num_rows;
					if ($result==1) {
						session_start();
						$_SESSION['pelanggan']=$query->fetch_assoc();
						echo "<br>";
						echo "<div class='alert alert-info'><center>Login Succeeded</center></div>";
						echo "<meta http-equiv='refresh' content='1;url=all-menu.php'>";
					}
					else{
						echo "<br>";
						echo "<div class='alert alert-danger'><center>Login Failed</center></div>";
						echo "<meta http-equiv='refresh' content='1;url=main_pelanggan.php'>";
					}
				}
				?>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="asset/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="asset/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="asset/login/vendor/bootstrap/js/popper.js"></script>
	<script src="asset/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="asset/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="asset/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="asset/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="asset/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="asset/login/js/main.js"></script>

</body>
</html>
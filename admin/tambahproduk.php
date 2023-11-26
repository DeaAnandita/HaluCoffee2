<?php include 'protect.php'; ?>
<h2>Tambah Produk</h2>

<form method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label>Kategori</label>
		<input type="text" class="form-control" name="kategori">
	</div>
	<div class="form-group">
		<label>Nama Produk</label>
		<input type="text" class="form-control" name="nama">
	</div>
	<div class="form-group">
		<label>Harga(Rp)</label>
		<input type="number" class="form-control" name="harga">
	</div>
	<div class="form-group">
		<label>Stok</label>
		<input type="number" class="form-control" name="stok">
	</div>
	<div class="form-group">
		<label>Deskripsi</label>
		<textarea class="form-control" name="deskripsi" rows="5"></textarea>
	</div>
	<div class="form-group">
		<label>Foto Produk</label>
		<input type="file" class="form-control" name="foto">
	</div>
	<button class="btn btn-primary" name="submit">Simpan</button>
</form>
<?php if (isset($_POST['submit'])) {
	$namafoto = $_FILES['foto']['name'];
	$lokasi= $_FILES['foto']['tmp_name'];
	move_uploaded_file($lokasi, "../foto_produk/".$namafoto);
	$nama = $_POST['nama'];
	$kategori = $_POST['kategori'];
	$harga = $_POST['harga'];
	$stok = $_POST['stok'];
	$deskripsi = $_POST['deskripsi'];
	$conn->query("INSERT INTO produk(kategori,nama_produk,harga_produk,stok,foto_produk,deskripsi_produk) 
		VALUES ('$kategori','$nama','$harga','$stok','$namafoto','$deskripsi')");
	echo "<div class='alert alert-info'>Data Tersimpan</div>";
	echo "<meta http-equiv='refresh' content='1;url=index.php?halaman=produk'>";
}?>

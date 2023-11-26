<?php include 'protect.php'; ?>
<h2>Pelanggan</h2>

<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Nama</th>
				<th>No Meja</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php $no=1; ?>
			<?php $query=$conn->query("SELECT * FROM pelanggan"); ?>
			<?php while ($data=$query->fetch_assoc()) {
				?>
				<tr>
					<td><?php echo $no++; ?></td>
					<td><?php echo $data['nama_pelanggan']; ?></td>
					<td><?php echo $data['no_meja']; ?></td>
					<td>
						<a href="index.php?halaman=hapuspelanggan&id=<?php echo $data['id_pelanggan']; ?>" class="btn btn-danger">Hapus</a>
					</td>
				</tr>
				<?php
			} ?>
		</tbody>
	</table>
</div>
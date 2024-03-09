<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <?= $title; ?>
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">

    <?php if (hasMessage()) : ?>
      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h4><i class="icon fa fa-check"></i> Pemberitahuan!</h4>
        <?= getMessage(); ?>
      </div>
    <?php endif; ?>

    <div class="box box-primary">
      <!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th style="width: 20px;">Nomor</th>
              <th>Peminjam</th>
              <th>Judul Buku</th>
              <?php if ($this->uri->uri_string() === 'laporan-buku-populer' or $this->uri->uri_string() === 'laporan-buku-cetak') : ?>
                <th>Total</th>
              <?php endif; ?>
              <th>Dipinjam</th>
              <th>Tenggat</th>
              <th>Pengembalian</th>
              <th>Denda</th>
              <th>Status</th>
              <?php if (isJabatan('Petugas')) : ?>
                <th>Bukti</th>
              <?php endif; ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($items as $item) : ?>
              <tr>
                <?php $pinjam = strtotime($item['tanggal_pinjam']); ?>
                <?php $tenggat = strtotime($item['tanggal_tenggat']); ?>
                <?php $kembali = strtotime($item['tanggal_kembali'] ?? time()); ?>
                <td><?= $item['no_peminjaman']; ?></td>
                <td><?= $item['nama'] ?: '-'; ?></td>
                <td><?= $item['judul'] ?: '-'; ?></td>
                <?php if ($this->uri->uri_string() === 'laporan-buku-populer' or $this->uri->uri_string() === 'laporan-buku-cetak') : ?>
                  <td><?= $item['total'] ?: '-'; ?></td>
                <?php endif; ?>
                <td><?= date('d/m/Y', $pinjam); ?></td>
                <td><?= date('d/m/Y', $tenggat); ?></td>
                <td><?= $item['tanggal_kembali'] ? date('d/m/Y', strtotime($item['tanggal_kembali'])) : '-'; ?></td>
                <td>Rp<?= $kembali > $tenggat ? number_format(floor(($kembali - $tenggat) / 60 / 60 / 24) * 500, 2, ",", ".") : '0'; ?></td>
                <td><?= $item['tanggal_kembali'] ? 'Dikembalikan' : 'Dipinjam'; ?></td>
                <?php if (isJabatan('Petugas')) : ?>
                  <td>
                    <a href="<?= base_url("bukti-pinjam-buku/{$item['id_peminjaman']}"); ?>" target="_blank" class="btn btn-primary btn-sm">Cetak</a>
                  </td>
                <?php endif; ?>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
        <hr>
        <h4>Buku Terpopuler</h4>
        <div class="chart">
          <canvas id="populerChart3" style="height:300px"></canvas>
        </div>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->


  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
  window.print();
</script>
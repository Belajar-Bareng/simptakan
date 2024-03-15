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
      <div class="box-header">
        <h3 class="box-title">
          <a href="<?= base_url('laporan-pengunjung-hari-ini'); ?>" class="btn btn-primary">Hari ini</a>
          <a href="<?= base_url('laporan-pengunjung'); ?>" class="btn btn-success">Semua</a>
          <a href="<?= base_url('laporan-pengunjung-terbanyak'); ?>" class="btn btn-warning">Grafik</a>
          <a href="<?= base_url('laporan-pengunjung-cetak'); ?>" class="btn btn-danger">Cetak</a>
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
				<div class="form-group">
					<br>
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<input type="text" data-date-index="1" class="form-control pull-right" id="table-search-daterange">
					</div>
					<!-- /.input group -->
				</div>
        <table id="table1" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th style="width: 20px;">No.</th>
              <th>Tanggal</th>
              <th>NIS/No. Pendaftaran</th>
              <th>Nama</th>
              <th>Kelas</th>
              <?php if ($this->uri->uri_string() === 'laporan-pengunjung-terbanyak' or $this->uri->uri_string() === 'laporan-pengunjung-cetak') : ?>
                <th>Total</th>
              <?php endif; ?>
              <th>Keperluan</th>
            </tr>
          </thead>
          <tbody>
            <?php $no = 1; ?>
            <?php foreach ($items as $item) : ?>
              <tr>
                <td><?= $no++; ?></td>
                <td><?= date('d/m/Y', strtotime($item['tanggal'])); ?></td>
                <td><?= $item['nis'] ?: '-'; ?></td>
                <td><?= $item['nama'] ?: '-'; ?></td>
                <td><?= $item['kelas'] ?: '-'; ?></td>
                <?php if ($this->uri->uri_string() === 'laporan-pengunjung-terbanyak' or $this->uri->uri_string() === 'laporan-pengunjung-cetak') : ?>
                  <td><?= $item['total'] ?: '-'; ?></td>
                <?php endif; ?>
                <td><?= $item['keperluan'] ?: '-'; ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
        <?php if ($this->uri->uri_string() === 'laporan-pengunjung-terbanyak') : ?>
          <hr>
          <h4>Pengunjung Terbanyak</h4>
          <div class="chart">
            <canvas id="populerChart2" style="height:300px"></canvas>
          </div>
        <?php endif; ?>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>

</script>

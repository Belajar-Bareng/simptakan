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
			<div class="chart box-body">
				<div class="">
					<button class="btn btn-xs report-toggle btn-primary" data-type='daily'>Harian</button>
					<button class="btn btn-xs report-toggle" data-type='monthly'>Bulanan</button>
					<button class="btn btn-xs report-toggle" data-type='annual'>Tahunan</button>
				</div>

				<canvas id="reportChart" data-json='<?= json_encode($chart) ?>' style="height:300px; width: 100%"></canvas>
			</div>
      <div class="box-header">
        <h3 class="box-title">
          <div class="form-group">
            <br>
            <div class="input-group">
              <div class="input-group-addon">
                <i class="fa fa-calendar"></i>
              </div>
              <input type="text" data-date-index="<?= in_array($this->uri->uri_string(), ['laporan-buku-populer', 'laporan-buku-cetak']) ? 4: 3; ?>" class="form-control pull-right" id="table-search-daterange">
            </div>
            <!-- /.input group -->
          </div>
        </h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <table id="table1" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th style="width: 20px;">No.</th>
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
            <?php foreach ($items as $index => $item) : ?>
              <tr>
                <?php $pinjam = strtotime($item['tanggal_pinjam']); ?>
                <?php $tenggat = strtotime($item['tanggal_tenggat']); ?>
                <?php $kembali = strtotime($item['tanggal_kembali'] ?? time()); ?>
                <td><?= $index + 1; ?></td>
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
        <?php if ($this->uri->uri_string() === 'laporan-buku-populer') : ?>
          <hr>
          <h4>Buku Terpopuler</h4>
          <div class="chart">
            <canvas id="populerChart3" style="height:300px"></canvas>
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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	const reportChartData = JSON.parse(document.getElementById('reportChart').dataset.json);

	const xValues = [];
	const yValues = [];
	const colors = [];

	let highestY = 0;

	for(let i = 0; i < reportChartData.length; i++) {
		const valueY = parseInt(reportChartData[i]['total'])
		yValues.push(valueY);
		if (highestY < valueY) {
			highestY = valueY;
		}

		xValues.push(reportChartData[i]['date']);
		colors.push('#' + Math.floor(Math.random()*16777215).toString(16));
	}

	const reportChart = new Chart("reportChart", {
		type: xValues.length < 5 ? "bar" : "line",
		data: {
			labels: xValues,
			datasets: [{
				label: '# jumlah peminjaman',
				data: yValues,
				backgroundColor: colors,
				fill: false,
				borderColor: 'rgb(75, 192, 192)',
				tension: 0.1
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true,
					title: {
						display: true,
						text: 'Jumlah Peminjaman'
					},
        	max: highestY + 10,
				},
				x: {
					ticks: {
						stepSize: 1,
					},
					title: {
						display: true,
						text: 'Tanggal'
					}
				},
			}
		}
	});
</script>

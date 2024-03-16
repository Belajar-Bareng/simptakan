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
				label: '# jumlah kunjungan',
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
						text: 'Jumlah Kunjungan'
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

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
			<div class="chart">
				<canvas id="popularChart" data-json='<?= json_encode($popular) ?>' style="height:300px; width: 100%"></canvas>
			</div>
			<table class="table table-bordered table-striped">
				<thead>
					<th style="width: 20px;">No.</th>
					<th>Judul</th>
					<th>Total Peminjaman</th>
				</thead>
				<tbody>
					<?php $total = 0; ?>
					<?php foreach($popular as $index => $item): ?>
						<?php $total += (int) $item['total']; ?>
						<tr>
							<td><?= $index + 1 ?></td>
							<td><?= $item['judul'] ?></td>
							<td><?= $item['total'] ?></td>
						</tr>
					<?php endforeach; ?>
					<tr>
						<td colspan="2">Total</td>
						<td><?= $total ?></td>
					</tr>
				</tbody>
			</table>
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
	const popularBookData = JSON.parse(document.getElementById('popularChart').dataset.json);

	const xValues = [];
	const yValues = [];
	const colors = [];

	for(let i = 0; i < popularBookData.length; i++) {
		xValues.push(popularBookData[i]['judul']);
		yValues.push(parseInt(popularBookData[i]['total']));
		colors.push('#' + Math.floor(Math.random()*16777215).toString(16));
	}

	let number = 0;

	const reportChart = new Chart("popularChart", {
		type: "bar",
		data: {
			labels: xValues,
			datasets: [{
				label: '# total peminjaman',
				data: yValues,
				borderWidth: 1,
				backgroundColor: colors,
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true,
					title: {
						display: true,
						text: 'Total Peminjaman'
					},
				},
				x: {
					ticks: {
						callback: function(value) {
							number++;
							return 'No. ' + number;
							// return 'eh';
							// return value.substr(0, 10);//truncate
						},
					},
					title: {
						display: true,
						text: 'Nomor Urut Buku'
					}
				},
			}
		}
	});
</script>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
		<?php if(count($new_book) > 0): ?>
			<div id="notification-container" style="padding: 20px 30px; background: rgb(243, 156, 18); z-index: 999999; font-size: 16px; font-weight: 600; color: white">
				<span class="float-right" href="#" data-toggle="tooltip" data-placement="left" title="Tutup!" style="color: rgb(255, 255, 255); font-size: 20px; margin-right: 10px;cursor:pointer;">×</span>
				Ada buku baru lho! Silakan klik <a href="<?= base_url('buku') . '?new=true' ?>" style="text-decoration: underline; color: white;">di sini</a> untuk melihatnya.
			</div>
		<?php endif; ?>
		<?php if(count($new_ebook) > 0): ?>
			<div id="notification-container" style="padding: 20px 30px; background: rgb(243, 156, 18); z-index: 999999; font-size: 16px; font-weight: 600; color: white">
				<span class="float-right" href="#" data-toggle="tooltip" data-placement="left" title="Tutup!" style="color: rgb(255, 255, 255); font-size: 20px; margin-right: 10px;cursor:pointer;">×</span>
				Ada ebook baru lho! Silakan klik <a href="<?= base_url('ebook') . '?new=true' ?>" style="text-decoration: underline; color: white;">di sini</a> untuk melihatnya.
			</div>
		<?php endif; ?>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?= $title; ?>
        <small>awali dengan langkah kecil</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <?php if(hasMessage()): ?>
      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h4><i class="icon fa fa-check"></i> Pemberitahuan!</h4>
        <?= getMessage(); ?>
      </div>
      <?php endif; ?>

      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?= $count['minjam']; ?></h3>

              <p>Peminjaman Hari ini</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <br>
            <span class="small-box-footer">&nbsp;</span>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?= $count['buku']; ?></h3>

              <p>Buku</p>
            </div>
            <div class="icon">
              <i class="fa fa-book"></i>
            </div>
            <br>
            <span class="small-box-footer">&nbsp;</span>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?= $count['siswa']; ?></h3>

              <p>Anggota</p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
            <br>
            <span class="small-box-footer">&nbsp;</span>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?= $count['kunjung']; ?></h3>

              <p>Pengunjung Hari ini</p>
            </div>
            <div class="icon">
              <i class="fa fa-user"></i>
            </div>
            <br>
            <span class="small-box-footer">&nbsp;</span>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      
      <div class="row">
        <div class="col-lg-6">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Diagram Popularitas Buku Populer</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="populerChart" style="height:300px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <div class="col-lg-6">

					<?php if(isJabatan('Petugas')): ?>
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Pengajuan Peminjaman Buku</h3>
						</div>

						<div class="box-body">
							<?php if(count($to_be_confirmed) > 0): ?>
								<ul class="products-list product-list-in-box">
									<?php foreach($to_be_confirmed as $index => $item): ?>
									<li class="item">
										<div class="product-img">
											<img style="border-radius: 100%; width: 100%" src="<?= asset('img/profile.png') ?>" alt="Product Image" />
										</div>
										<div class="product-info">
											<div class="product-title">
												Tanggal <?= date('d/m/Y', strtotime($item['tanggal_pinjam'])) . ' s.d. ' . date('d/m/Y', strtotime($item['tanggal_tenggat'])) ?>
												<a href="<?= base_url('/ubah-pengajuan/' . $item['id'] . '/status/1') ?>" onclick="return confirm('Anda yakin ingin menyutujui peminjaman?')" class="label label-success pull-right"><i class="fa fa-check"></i></a>
												<a href="<?= base_url('/ubah-pengajuan/' . $item['id'] . '/status/2') ?>" style="margin-right: 3px;" onclick="return confirm('Anda yakin ingin menolak peminjaman?')" class="label label-danger pull-right"><i class="fa fa-remove"></i></a>
											</div>
											<span class="product-description"><?= $item['nama'] . ' (' . $item['nis'] . ')' ?></span>
										</div>
										<div style="margin-top: 15px;">
											<?php if(count($item['books']) > 0): ?>
												<!-- <ol> -->
													<?php foreach($item['books'] as $index => $book): ?>
														<div><?= $index + 1 . '. ' .  $book['judul'] ?></div>
													<?php endforeach; ?>
													<!-- </ol> -->
											<?php else: ?>
												<p>Belum ada pengajuan baru.</p>
											<?php endif; ?>
										</div>
									</li>
									<?php endforeach; ?>
								</ul>
							<?php else: ?>
								<p>Belum ada pengajuan baru.</p>
							<?php endif; ?>
						</div>
					</div>
					<?php endif; ?>

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Koleksi Buku Baru</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body no-padding">
              <table id="table3" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th style="width: 20px;">No.</th>
                        <th>Buku</th>
                        <th>Jumlah</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; ?>
                    <?php foreach($bukubaru as $item): ?>
                    <tr>
                        <td><?= $no++; ?></td>
                        <td><?= $item['judul']; ?></td>
                        <td><?= $item['jumlah']; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

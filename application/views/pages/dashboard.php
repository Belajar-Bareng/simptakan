
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

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

    <form class="form-horizontal" method="POST" action="<?= current_url(); ?>">
      <div class="row">
        <div class="col-lg-6">
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Peminjam</h3>
            </div>
            <div class="box-body">
              <div class="form-group">
                <label for="nis" class="col-sm-2 control-label">Nama</label>
                <div class="col-sm-10">
                  <select class="form-control select2" name="nis" id="nis">
                    <option value="-">-- Belum dipilih --</option>
                    <?php foreach ($siswa as $item) : ?>
                      <option value="<?= $item['nis']; ?>"><?= $item['nama']; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="tanggal_pinjam" class="col-sm-2 control-label">Pinjam</label>
                <div class="col-sm-10">
                  <input type="date" class="form-control" id="tanggal_pinjam" value="<?= set_value('tanggal_pinjam', date('Y-m-d')); ?>" disabled>
                </div>
              </div>
              <div class="form-group <?= isInvalid('tanggal_tenggat') ?>">
                <label for="tanggal_tenggat" class="col-sm-2 control-label">Tenggat</label>
                <div class="col-sm-10">
                  <input type="date" class="form-control" id="tanggal_tenggat" name="tanggal_tenggat" placeholder="Masukkan tenggat" value="<?= set_value('tanggal_tenggat', date('Y-m-d', time() + (60 * 60 * 24 * 3))); ?>">
                </div>
              </div>
              <div class="form-group <?= isInvalid('email') ?>">
                <label for="keterangan" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="email" name="email" placeholder="Masukkan email" value="<?= set_value('email'); ?>">
                </div>
              </div>
              <div class="form-group <?= isInvalid('keterangan') ?>">
                <label for="keterangan" class="col-sm-2 control-label">Keterangan</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="keterangan" name="keterangan" placeholder="Masukkan keterangan" value="<?= set_value('keterangan'); ?>">
                </div>
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
              <h3 class="box-title">Buku</h3>
            </div>
            <div class="box-body">
              <div class="form-group">
                <div class="col-sm-12">
                  <select class="form-control select2" name="id_buku[]">
                    <option value="-">-- Belum dipilih --</option>
                    <?php foreach ($buku as $item) : ?>
                      <option value="<?= $item['id_buku']; ?>"><?= $item['judul']; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-12">
                  <select class="form-control select2" name="id_buku[]">
                    <option value="-">-- Belum dipilih --</option>
                    <?php foreach ($buku as $item) : ?>
                      <option value="<?= $item['id_buku']; ?>"><?= $item['judul']; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-12">
                  <select class="form-control select2" name="id_buku[]">
                    <option value="-">-- Belum dipilih --</option>
                    <?php foreach ($buku as $item) : ?>
                      <option value="<?= $item['id_buku']; ?>"><?= $item['judul']; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Pinjamkan</button>
              <button type="reset" class="btn btn-default pull-right">Ulangi</button>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </form>

    <div class="box box-primary">
      <div class="box-header">
        <h3 class="box-title">
          Daftar Buku dipinjam
          <br>
          <br>
          <a href="<?= base_url('riwayat-peminjaman'); ?>" class="btn btn-primary">Riwayat</a>
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
              <th>Dipinjam</th>
              <th>Tenggat</th>
              <th>Denda</th>
              <th>Status</th>
              <th style="width: 150px;" class="notexport">Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($dipinjam as $index => $item) : ?>
              <tr>
                <?php $pinjam = strtotime($item['tanggal_pinjam']); ?>
                <?php $tenggat = strtotime($item['tanggal_tenggat']); ?>
                <td><?= $index + 1 ?? $item['no_peminjaman']; ?></td>
                <td><?= $item['nama'] ?: '-'; ?></td>
                <td><?= $item['judul'] ?: '-'; ?></td>
                <td><?= date('d/m/Y', $pinjam); ?></td>
                <td><?= date('d/m/Y', $tenggat); ?></td>
                <td>
									<?php if($item['status'] == 0): ?>
										Rp50.000,00
									<?php else: ?>
										Rp<?= time() > $tenggat ? number_format(floor((time() - $tenggat) / 60 / 60 / 24) * 500, 2, ",", ".") : '0'; ?>
									<?php endif; ?>
								</td>
                <td>
                  <?php
                  $tanggal_sekarang = new DateTime();
                  $tanggal_tenggat = new DateTime($item['tanggal_tenggat']);
                  $selisih_tanggal = $tanggal_sekarang->diff($tanggal_tenggat);
                  ?>
                  <?php if ($item['status'] == 0): ?>
                    <div class="badge bg-red">Buku Hilang</div>
                  <?php elseif ($tanggal_sekarang < $tanggal_tenggat): ?>
                    <div class="badge bg-red">Kembalikan <?php echo $selisih_tanggal->days + 1 ?> Hari Lagi</div>
                  <?php elseif (!empty($item['tanggal_kembali'])): ?>
                    <div>-</div>
                  <?php else: ?>
                    <div class="badge bg-red">Segera Dikembalikan</div>
                  <?php endif; ?>
                </td>
                <td>
									<?php if($item['status'] == 1): ?>
										<a style="margin: 2px 0;" href="<?= base_url("pengembalian/{$item['id_peminjaman']}"); ?>" class="btn btn-success btn-sm" onclick="return confirm('Apakah benar buku ini dikembalikan?')">Kembalikan</a>
										<a style="margin: 2px 0;" href="#" class="btn btn-primary btn-sm btn-ubah-tenggat" data-toggle="modal" data-target="#tenggatModal" data-id="<?= $item['no_peminjaman']; ?>" data-tenggat="<?= $item['tanggal_tenggat']; ?>">Perpanjang</a>
										<form style="display: inline-block;" action="<?= base_url('send'); ?>" method="post">
											<input type="hidden" name="no_peminjaman" value="<?= $item['no_peminjaman']; ?>">
											<input type="hidden" name="nama" value="<?= $item['nama'] ?>">
											<input type="hidden" name="buku" value="<?= $item['judul'] ?>">
											<input type="hidden" name="denda" value="Rp<?= time() > $tenggat ? number_format(floor((time() - $tenggat) / 60 / 60 / 24) * 500, 2, ",", ".") : '0'; ?>">
											<input type="hidden" name="email" value="<?= $item['email'] ?>">
											<button style="margin: 2px 0;" type="submit" class="btn btn-sm btn-warning">Kirim Email</button>
										</form>
										<a style="margin: 2px 0;" href="<?= base_url("kehilangan/{$item['id_peminjaman']}") ?>" onclick="return confirm('Apakah Anda yakin ingin menandai buku ini hilang?')" class="btn btn-danger btn-sm">Hilang</a>
									<?php endif; ?>
                </td>
              </tr>
            <?php endforeach; ?>
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

<!-- Modal -->
<div class="modal fade" id="tenggatModal" tabindex="-1" role="dialog" aria-labelledby="tenggatModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="tenggatModalLabel">Perpanjang Tenggat</h4>
      </div>
      <form action="<?= base_url('perpanjang'); ?>" method="post">
        <div class="modal-body">
          <input type="hidden" name="no_peminjaman" value="" id="modal-no-peminjaman">
          <div class="form-group <?= isInvalid('tanggal_tenggat') ?>">
            <label for="modal-tenggat" class="col-sm-2 control-label">Tenggat</label>
            <div class="col-sm-10">
              <input type="date" class="form-control" id="modal-tenggat" name="tanggal_tenggat" placeholder="Masukkan tenggat" value="<?= set_value('tanggal_tenggat', date('Y-m-d', time() + (60 * 60 * 24 * 3))); ?>">
            </div>
          </div>
          <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
          <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>


<div class="modal fade" id="pengingatModal" tabindex="-1" role="dialog" aria-labelledby="pengingatModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="pengingatModalLabel">Pengingat Pengembalian</h4>
      </div>
      <div class="modal-body">
        <form action="<?= base_url('send'); ?>" method="post">
          <input type="hidden" name="no_peminjaman" value="" id="modal-no-peminjaman">
          <div class="form-group m-2">
            <label for="modal-pengingat" class="col-sm-2 control-label">Peminjam</label>
            <div class="col-sm-10">
              <select class="form-control select2" name="nama" id="nama">
                <option value="-">-- Belum dipilih --</option>
                <?php foreach ($siswa as $item) : ?>
                  <option value="<?= $item['nama']; ?>"><?= $item['nama']; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
          </div>
          <div class="form-group m-2">
            <label for="modal-pengingat" class="col-sm-2 control-label">Buku</label>
            <div class="col-sm-10">
              <select class="form-control select2" name="buku">
                <option value="-">-- Belum dipilih --</option>
                <?php foreach ($buku as $item) : ?>
                  <option value="<?= $item['judul']; ?>"><?= $item['judul']; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
          </div>
          <div class="form-group m-2">
            <label for="modal-pengingat" class="col-sm-2 control-label">Denda</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="modal-pengingat" name="denda" placeholder="Masukkan Denda">
            </div>
          </div>
          <div class="form-group m-2">
            <label for="modal-pengingat" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" id="modal-pengingat" name="email" placeholder="Masukkan Email">
            </div>
          </div>
          <br>
      </div>
      <div class="modal-footer mt-3">
        <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Kirim</button>
      </div>
      </form>
    </div>
  </div>
</div>

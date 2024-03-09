<!-- Full Width Column -->
<div class="content-wrapper">
  <div class="container">
    <!-- Content Header (Page header) -->
    <form action="<?php in_array('buku', $sidebar) ? site_url('katalog') : site_url('katalog-ebook') ?>" method="get">
      <section class="content-header">
        <div class="row">
          <div class="col-lg-6">
          </div>
          <div class="col-lg-6">
            <div class="input-group">
              <input type="text" name="q" placeholder="Pencarian..." class="form-control" value="<?= isset($_GET['q']) ? $_GET['q'] : ''; ?>">
              <span class="input-group-btn">
                <button type="submit" class="btn btn-primary btn-flat">Cari</button>
              </span>
            </div>
          </div>
        </div>
      </section>
    </form>


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col">
          <?php if (hasMessage()) : ?>
            <div class="alert alert-success alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-check"></i> Pemberitahuan!</h4>
              <?= getMessage(); ?>
            </div>
          <?php endif; ?>
          <div class="box box-primary">
            <div class="box-body">
              <table id="table1" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th style="width: 20px;">Nomor</th>
                    <th>Judul Buku</th>
                    <th>Dipinjam</th>
                    <th>Tenggat</th>
                    <th>Pengembalian</th>
                    <th>Denda</th>
                    <th>Status</th>
                    <th>Pengingat</th>
                    <th>Bukti</th>
                  </tr>
                </thead>
                <tbody>
                  <?php $no = 1; ?>
                  <?php foreach ($items as $item) : ?>
                    <tr>
                      <?php $pinjam = strtotime($item['tanggal_pinjam']); ?>
                      <?php $tenggat = strtotime($item['tanggal_tenggat']); ?>
                      <?php $kembali = strtotime($item['tanggal_kembali'] ?? time()); ?>
                      <td><?= $no++; ?></td>
                      <td><?= $item['judul'] ?: '-'; ?></td>
                      <td><?= date('d/m/Y', $pinjam); ?></td>
                      <td><?= date('d/m/Y', $tenggat); ?></td>
                      <td><?= $item['tanggal_kembali'] ? date('d/m/Y', strtotime($item['tanggal_kembali'])) : '-'; ?></td>
                      <td>Rp<?= $kembali > $tenggat ? number_format(floor(($kembali - $tenggat) / 60 / 60 / 24) * 500, 2, ",", ".") : '0'; ?></td>
                      <td><?= $item['tanggal_kembali'] ? 'Dikembalikan' : 'Dipinjam'; ?></td>
                      <td>
                        <?php
                        $tanggal_sekarang = new DateTime();
                        $tanggal_tenggat = new DateTime($item['tanggal_tenggat']);
                        $selisih_tanggal = $tanggal_sekarang->diff($tanggal_tenggat);
                        ?>
                        <?php if ($tanggal_sekarang < $tanggal_tenggat) { ?>
                          <div class="badge bg-red">Kembalikan <?php echo $selisih_tanggal->days + 1 ?> Hari Lagi</div>
                        <?php } else if (!empty($item['tanggal_kembali'])) { ?>
                          <div>-</div>
                        <?php } else { ?>
                          <div class="badge bg-red">Segera Dikembalikan</div>
                        <?php } ?>
                      </td>
                      <td>
                        <a href="<?= base_url("bukti-pinjam-buku/{$item['id_peminjaman']}"); ?>" target="_blank" class="btn btn-primary btn-sm">Cetak</a>
                        <a href="#" class="btn btn-success btn-sm btn-ubah-tenggat" data-toggle="modal" data-target="#tenggatModal" data-id="<?= $item['no_peminjaman']; ?>" data-tenggat="<?= $item['tanggal_tenggat']; ?>">Perpanjang</a>
                      </td>
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
  <!-- /.container -->
</div>
<!-- /.content-wrapper -->

<div class="modal fade" id="tenggatModal" tabindex="-1" role="dialog" aria-labelledby="tenggatModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="tenggatModalLabel">Perpanjang Tenggat</h4>
      </div>
      <form action="<?= base_url('katalog/perpanjang'); ?>" method="post">
        <div class="modal-body">
          <input type="hidden" name="no_peminjaman" value="" id="modal-no-peminjaman">
          <div class="form-group <?= isInvalid('tanggal_tenggat') ?>">
            <label for="modal-tenggat" class="col-sm-2 control-label">Tenggat</label>
            <div class="col-sm-10">
              <input type="date" class="form-control" id="modal-tenggat" name="tanggal_tenggat" placeholder="Masukkan tenggat" value="<?= set_value('tanggal_tenggat', date('d-m-Y', time() + (60 * 60 * 24 * 3))); ?>">
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
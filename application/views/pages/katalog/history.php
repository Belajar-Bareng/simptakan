<!-- Full Width Column -->
<div class="content-wrapper">
  <div class="container">
		
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
						<div class="box-header with-border">
							<h3 class="box-title">Riwayat Peminjaman</h3>
							<p>Kamu baru saja mengajukan peminjaman? Klik <a href="#pengajuan-peminjaman">di sini</a> untuk melihat daftar pengajuan peminjaman kamu.</p>
						</div>
            <div class="box-body">
              <table id="table1" class="table1 table table-bordered table-striped">
                <thead>
                  <tr>
                    <th style="width: 20px;">No.</th>
                    <th>Judul Buku</th>
                    <th>Dipinjam</th>
                    <th>Tenggat</th>
                    <th>Pengembalian</th>
                    <th>Denda</th>
                    <th>Status</th>
                    <th>Pengingat</th>
                    <th>Aksi</th>
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
                      <td>
												<?php if($item['status'] == 0): ?>
													Rp50.000,00
												<?php else: ?>
													Rp<?= $kembali > $tenggat ? number_format(floor(($kembali - $tenggat) / 60 / 60 / 24) * 500, 2, ",", ".") : '0'; ?>
												<?php endif; ?>
											</td>
                      <td>
												<?php if ($item['status'] == 0): ?>
														Buku Hilang
												<?php else: ?>
														<?= $item['tanggal_kembali'] ? 'Dikembalikan' : 'Dipinjam'; ?>
												<?php endif; ?>
											</td>
                      <td>
                        <?php
                        $tanggal_sekarang = new DateTime();
                        $tanggal_tenggat = new DateTime($item['tanggal_tenggat']);
                        $selisih_tanggal = $tanggal_sekarang->diff($tanggal_tenggat);
                        ?>
												<?php if ($item['status'] == 0) { ?>
													-
                        <?php } else if ($tanggal_sekarang < $tanggal_tenggat) { ?>
                          <div class="badge bg-red">Kembalikan <?php echo $selisih_tanggal->days + 1 ?> Hari Lagi</div>
                        <?php } else if (!empty($item['tanggal_kembali'])) { ?>
                          <div>-</div>
                        <?php } else { ?>
                          <div class="badge bg-red">Segera Dikembalikan</div>
                        <?php } ?>
                      </td>
                      <td>
												<?php if($item['status'] == 1): ?>
                        <a href="<?= base_url("bukti-pinjam-buku/{$item['id_peminjaman']}"); ?>" target="_blank" class="btn btn-primary btn-sm">Cetak</a>
                        <a href="#" class="btn btn-success btn-sm btn-ubah-tenggat" data-toggle="modal" data-target="#tenggatModal" data-id="<?= $item['no_peminjaman']; ?>" data-tenggat="<?= $item['tanggal_tenggat']; ?>">Perpanjang</a>
												<?php endif ?>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>

          <div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Pengajuan Peminjaman</h3>
						</div>
            <div class="box-body" id="pengajuan-peminjaman">
              <table id="table3" class="table1 table table-bordered table-striped">
                <thead>
                  <tr>
                    <th style="width: 20px;">No.</th>
                    <th>Judul Buku</th>
                    <th>Dipinjam</th>
                    <th>Tenggat</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($prop_items as $index => $item) : ?>
                    <tr>
                      <td><?= $index + 1 ?></td>
                      <td><?= $item['judul'] ?: '-'; ?></td>
                      <td><?= date('d/m/Y', strtotime($item['tanggal_pinjam'])); ?></td>
                      <td><?= date('d/m/Y', strtotime($item['tanggal_tenggat'])); ?></td>
                      <td><?= $item['status'] ?></td>
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

<!-- Full Width Column -->
<div class="content-wrapper">
    <div class="container">
        
        <form class="form-horizontal" method="POST" action="<?= current_url(); ?>">
            <!-- Main content -->
            <section class="content">
                <?php if (hasMessage()) : ?>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h4><i class="icon fa fa-check"></i> Pemberitahuan!</h4>
                        <?= getMessage(); ?>
                    </div>
                <?php endif; ?>
                <div class="row">
                    <div class="col-lg-6 col-md-6">

						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Keranjang</h3>
							</div>

							<?php if(count($carts) > 0): ?>
							<div class="box-body">
								<ul class="products-list product-list-in-box">
									<?php foreach($carts as $index => $cart): ?>
									<li class="item">
										<div class="product-img">
											<img src="<?= $cart['foto'] ? upload($cart['foto']) : asset('img/book.png') ?>" alt="Product Image">
											<input type="hidden" name="id_buku[]" value="<?= $cart['id_buku'] ?>">
										</div>
										<div class="product-info">
											<div class="product-title">
												<?= $cart['isbn'] ? isbn($cart['isbn']) : '-'; ?> <a href="<?= base_url('clear-cart/' . $cart['id_buku']) ?>" onclick="return confirm('Anda yakin ingin menghapusnya dari keranjang?')" class="label label-danger pull-right"><i class="fa fa-remove"></i></a>
											</div>
											<span class="product-description"><?= $cart['judul'] ?></span>
										</div>
									</li>
									<?php endforeach; ?>
								</ul>
							</div>

							<div class="box-footer text-center">
								<a href="<?= base_url('/clear-cart') ?>" onclick="return confirm('Anda yakin ingin membersihkan keranjang?')" class="uppercase">Bersihkan Keranjang</a>
							</div>
							<?php else: ?>
							<div class="box-body">
								<p>Belum ada buku di keranjangmu.</p>
							</div>
							<?php endif; ?>

						</div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <!-- Default box -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Peminjam</h3>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="nis" class="col-sm-2 control-label">NIS</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nis" name="nis" value="<?= $_SESSION['nis']; ?>" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="nama" class="col-sm-2 control-label">Nama</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nama" placeholder="Masukkan nama" value="<?= $_SESSION['nama']; ?>" disabled>
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
                                        <input type="date" class="form-control" id="tanggal_tenggat" name="tanggal_tenggat" placeholder="Masukkan tenggat" value="<?= set_value('tanggal_tenggat', date('Y-m-d', time() + (60 * 60 * 24 * 3))); ?>" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" value="<?= set_value('email'); ?>" name="email" placeholder="Masukkan Email">
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
                            <div class="box-footer">
                                <button type="submit" <?= count($carts) > 0 ? '' : 'disabled' ?> class="btn btn-primary pull-right">Ajukan Peminjaman</button>
                            </div>
                            <!-- /.box-footer -->
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </form>
    </div>
    <!-- /.container -->
</div>
<!-- /.content-wrapper -->

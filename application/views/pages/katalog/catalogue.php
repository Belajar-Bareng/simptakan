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
              <input type="text" name="q" placeholder="Pencarian..." class="form-control" id="search-catalogue" value="<?= isset($_GET['q']) ? $_GET['q'] : ''; ?>">
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
      <div class="row" id="catalogue-content" data-items='<?= json_encode($items) ?>' data-segment='<?= $segment ?>' data-carts='<?= json_encode($carts) ?>'>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.container -->
</div>
<!-- /.content-wrapper -->

<script>
	const containerElement = document.getElementById('catalogue-content');
	const catalogueBooks = JSON.parse(containerElement.dataset.items);
	const cartBooks = JSON.parse(containerElement.dataset.carts);
	const segment = containerElement.dataset.segment;

	let cartButtons = [];

	const addToCart = (e) => {
		console.log(e.target.dataset.id);
		fetch(`<?= base_url('') ?>katalog/add_to_cart/${e.target.dataset.id}`).then(res => res.json()).then(res => {
			window.location.reload();
		}).catch(e => {
			window.alert('Gagal Menambahkan ke Keranjang');
		});
	};
	
	const bookCart = (book) => {
		const link = `<?= base_url('') ?>` + segment + '/' + (book.id_buku ?? book.id_ebook);
		const defaultImage = `<?= asset('img/book.png') ?>`;
		let image = defaultImage;
		if (book.foto) {
			image = `<?= upload('') ?>` + book.foto;
		}

		const isbn = (isbnNumber) => {
			isbnNumber = isbnNumber.replace(/[-\s]/g, '');

			// Check if the ISBN length is valid
			if (isbnNumber.length !== 13) {
					return isbnNumber;
			}

			// Insert hyphens at the appropriate positions
			return isbnNumber.slice(0, 3) + '-' + isbnNumber.slice(3, 6) + '-' + isbnNumber.slice(6, 11) + '-' + isbnNumber.slice(11, 12) + '-' + isbnNumber.slice(12);
		}

		const addToCartButton = book.id_buku && !cartBooks.map(e => e.id_buku).includes(book.id_buku) && cartBooks.length < 3 ? `<button class="btn btn-xs btn-warning add-to-cart" data-id="` + book.id_buku + `"><i class="fa fa-cart-plus" data-id="` + book.id_buku + `"></i></button>` : '';

		let template = `<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="box box-widget widget-user">
								<div class="widget-user-header bg-black" style="background: url('` + image + `') center center; height: 250px; position: relative;">` + addToCartButton + `</div>
								<div class="box-footer no-padding">
									<ul class="nav nav-stacked">
										<li><a href="` + link + `">` + (book.isbn ? isbn(book.isbn) : '-') + ` <span class="pull-right badge bg-red">ISBN</span></a></li>
										<li><a href="` + link + `" class="only-one-line" title="`+ book.judul +`">` + book.judul + `</a></li>
										<li><a href="` + link + `" class="only-one-line" title="`+ (book.pengarang ?? '-') +`">Oleh: ` + (book.pengarang ?? '-') + `</a></li>`;
										
		if (!segment.includes('ebook')) {
			template += `<li><a href="` + link + `"><span class="badge bg-green">` + (book.jumlah > 0 ? 'Tersedia' : 'Tidak Tersedia') + `</span></a></li>`;
		}
											
		template +=    `<li><a href="` + link + `">` + book.tahun + `<span class="pull-right badge">` + (book.baru === '1' ? 'Baru' : '') + `</span></a></li>
									</ul>
								</div>
							</div>
						</div>`;
		
		return template;
	};

	const renderCards = (search) => {
		cartButtons.forEach(btn => {
			btn?.removeEventListener("click", addToCart);
		});

		containerElement.innerHTML = '';
		for (const book of catalogueBooks) {
			if (!book.judul.toLowerCase().includes(search) && !book.isbn?.includes(search)) {
				continue;
			}
			
			containerElement.innerHTML += bookCart(book);
		}

		cartButtons = document.querySelectorAll('button.add-to-cart');

		cartButtons.forEach(btn => {
			btn.addEventListener('click', addToCart);
		});
	}

	document.getElementById('search-catalogue').addEventListener('keyup', function(e) {
		const search = e.target.value.toLowerCase();

		renderCards(search);
	});

	renderCards('');

</script>

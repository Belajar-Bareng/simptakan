  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.18
    </div>
    <strong>Copyright &copy; 2021 SIMPTAKAN.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->

  <!-- jQuery 3 -->
  <script src="<?= asset('bower_components/jquery/dist/jquery.min.js') ?>"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="<?= asset('bower_components/bootstrap/dist/js/bootstrap.min.js') ?>"></script>
  <!-- Select2 -->
  <script src="<?= asset('bower_components/select2/dist/js/select2.full.min.js') ?>"></script>
  <!-- date-range-picker -->
  <script src="<?= asset('bower_components/moment/min/moment.min.js') ?>"></script>
  <script src="<?= asset('bower_components/bootstrap-daterangepicker/daterangepicker.js') ?>"></script>
  <!-- bootstrap datepicker -->
  <script src="<?= asset('bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') ?>"></script>
  <!-- DataTables -->
  <script src="<?= asset('bower_components/datatables.net/js/jquery.dataTables.min.js') ?>"></script>
  <script src="<?= asset('bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') ?>"></script>
  <script src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.colVis.min.js"></script>
  <script src="https://cdn.datatables.net/fixedheader/3.1.9/js/dataTables.fixedHeader.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap.min.js"></script>
  <!-- SlimScroll -->
  <script src="<?= asset('bower_components/jquery-slimscroll/jquery.slimscroll.min.js') ?>"></script>
  <!-- FastClick -->
  <script src="<?= asset('bower_components/fastclick/lib/fastclick.js') ?>"></script>
  <!-- ChartJS -->
  <script src="<?= asset('bower_components/chart.js/Chart.js') ?>"></script>
  <!-- AdminLTE App -->
  <script src="<?= asset('dist/js/adminlte.min.js') ?>"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="<?= asset('dist/js/demo.js') ?>"></script>
  <script>
    $(document).ready(function() {

      console.log(<?= isset($populer) ?>);

			const schoolLogo = "data:image/jpeg;base64,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";

      $('.sidebar-menu').tree();

      $('.select2').select2()

      $('.custom-file-input').on('change', function() {
        previewImage();
      });

      $('.custom-file-input-pdf').on('change', function() {
        console.log('klik ganti');
        previewPdf();
      });

      if ($('.pengadaan-tr-button').length) {
        $('.pengadaan-tr-button').click(function() {
          $('#pengadaan-tr').clone().appendTo('table');
        });
      }

      if ($('#tenggatModal').length) {
        $('.btn-ubah-tenggat').click(function() {
          const no_peminjaman = $(this).data('id');
          const tenggat = $(this).data('tenggat').split(' ')[0];

          $('#modal-no-peminjaman').val(no_peminjaman);
          $('#modal-tenggat').val(tenggat);
        });
      }

			if ($('#notification-container').length) {
				$('#notification-container > span').on('click', function() {
					$(this).parent('#notification-container').remove();
				});
			}


      if ($('#table1').length) {
        var table1 = $('#table1').DataTable({
          responsive: true,
          buttons: [
            <?php if (isJabatan('Kepala')) : ?> {
                extend: 'copy',
                exportOptions: {
                  columns: ':not(.notexport)'
                }
              },

              {
                extend: 'excel',
                text: 'Excel',
                exportOptions: {
                  columns: ':not(.notexport)'
                }
              },

              {
                extend: 'pdf',
                orientation: 'landscape',
                text: 'PDF',
                exportOptions: {
                  columns: ':not(.notexport)'
                },
                customize: function(doc) {
									doc.content[0].margin = [0, 25, 0, 25];

                  doc.content[1].table.widths = Array(doc.content[1].table.body[0].length + 1).join('*').split('');
									doc.content[1].table.widths[0] = 30;

									const title = doc.content[0].text.replace(' | SIMPTAKAN', '');
									doc.content[0].text = title;
									doc.content[0].bold = true;

									if (typeof reportChart !== 'undefined') {
										doc.content.splice(1, 0, {
											margin: [0, 25, 0, 25],
											image: reportChart.toBase64Image(),
											width: 750,
											alignment: 'center',
										});
									}

									doc.content.unshift({
										columns: [
											{
												width: 40,
												alignment: 'center',
												image: schoolLogo,
											},
											[
												{
													stack: [
														{
															alignment: 'center',
															text: 'PEMERINTAH PROVINSI KALIMANTAN SELATAN',
															fontSize: 14,
															bold: true
														},
														{
															alignment: 'center',
															text: 'DINAS PENDIDIKAN DAN KEBUDAYAAN',
															fontSize: 14,
															bold: true
														},
														{
															alignment: 'center',
															text: 'SMA NEGERI 13 BANJARMASIN',
															fontSize: 14,
															bold: true
														},
														{
															alignment: 'center',
															text: 'Jl.Setia No. 248 RT.37 Pemurus Dalam Telp. 0511-3262382',
														},
													],
												},
											],
										]
									});
                }
              },
              {
                extend: 'colvis',
                text: 'Kolom',
              },
            <?php endif; ?>
          ]
        });
        table1.buttons().container().appendTo('#table1_wrapper .col-sm-6:eq(0)');
        // new $.fn.dataTable.FixedHeader( table1 );
      }


      if ($('#table2').length) {
        console.log('table 2');
        const table2 = $('#table2').DataTable({
          responsive: true
        })
        // new $.fn.dataTable.FixedHeader( table2 );
      }

      if ($('#table3').length) {
        console.log('table 3');
        const table3 = $('#table3').DataTable({
          'responsive': true,
          'paging': true,
          'lengthChange': false,
          'searching': false,
          'ordering': true,
          'info': true,
          'autoWidth': false
        })
        // new $.fn.dataTable.FixedHeader( table3 );
      }

			if (typeof reportChart !== 'undefined') {
				$('.report-toggle').on('click', function(e) {
					$('.report-toggle').removeClass('btn-primary');
					this.classList.add('btn-primary');
					console.log(this.dataset.type);

					let highestYHere = 0;

					switch (this.dataset.type) {
						case 'daily':
							reportChart.data.datasets[0].data = yValues;
							reportChart.data.labels = xValues;
							highestYHere = highestY;
							break;
					
						default:
							reportChart.data.datasets[0].data = [];
							reportChart.data.labels = [];

							const months = [];
							const mapping = {};
							for (let i = 0; i < xValues.length; i++) {
								const label = xValues[i].slice(this.dataset.type === 'monthly' ? -7 : -4);
								if (mapping[label] === undefined) {
									mapping[label] = yValues[i];
									months.push(label);
								} else {
									mapping[label] += yValues[i];
								}
							}

							for (let i = 0; i < months.length; i++) {
								const valueY = mapping[months[i]];
								reportChart.data.datasets[0].data.push(valueY);
								reportChart.data.labels.push(months[i]);

								if (highestYHere < valueY) {
									highestYHere = valueY;
								}
							}
							break;
					}

					reportChart.type = reportChart.data.labels.length < 5 ? 'bar': 'line';
					reportChart.options.scales.y.max = highestYHere + 10;
					reportChart.update();
				});
			}

			if ($('#table-search-daterange').length) {
				const tableSearchDateRange = $('#table-search-daterange');
        tableSearchDateRange.daterangepicker();
				
				const dateIndex = parseInt(tableSearchDateRange.data('date-index') ?? 0);

				tableSearchDateRange.on('apply.daterangepicker', function(ev, picker) {
					$(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
					const startDate = new Date(picker.startDate.format('YYYY-MM-DD'));
					const endDate = new Date(picker.endDate.format('YYYY-MM-DD'));

					const convertDate = (column) => {
						const columnArray = column.split('/');
						return new Date(columnArray[2], parseInt(columnArray[1]) - 1, columnArray[0]);
					}

					$.fn.dataTableExt.afnFiltering.push((setting, aData, index) => {
						const date = convertDate(aData[dateIndex]);
						return ((isNaN(startDate) && isNaN(endDate)) || (isNaN(startDate) && date <= endDate) || (startDate <= date && isNaN(endDate)) || (startDate <= date && date <= endDate));
					});

					if ($('#table1').length) {
						table1.draw();
					}

					if ($('#table2').length) {
						table2.draw();
					}

					if ($('#table3').length) {
						table3.draw();
					}

					if (typeof reportChart !== 'undefined') {
						reportChart.data.datasets[0].data = [];
						reportChart.data.labels = [];
						for (let i = 0; i < xValues.length; i++) {
							const date = convertDate(xValues[i]);
							if ((isNaN(startDate) && isNaN(endDate)) || (isNaN(startDate) && date <= endDate) || (startDate <= date && isNaN(endDate)) || (startDate <= date && date <= endDate)) {
								reportChart.data.datasets[0].data.push(yValues[i]);
								reportChart.data.labels.push(xValues[i]);
							}
						}
						reportChart.type = reportChart.data.labels.length < 5 ? 'bar': 'line';
						reportChart.update();
					}
				});
			}

      <?php if (isset($populer)) : ?>
        if ($('#populerChart').length) {
          const pieChartCanvas = $('#populerChart').get(0).getContext('2d')
          const pieChart = new Chart(pieChartCanvas)
          const PieData = [
            <?php foreach ($populer as $item) : ?> {
                value: <?= $item['total'] ?>,
                color: '#' + Math.floor(Math.random() * 16777215).toString(16),
                highlight: '#' + Math.floor(Math.random() * 16777215).toString(16),
                label: '<?= $item['judul'] ?>'
              },
            <?php endforeach; ?>
          ]
          var pieOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            //String - The colour of each segment stroke
            segmentStrokeColor: '#fff',
            //Number - The width of each segment stroke
            segmentStrokeWidth: 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps: 100,
            //String - Animation easing effect
            animationEasing: 'easeOutBounce',
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //String - A legend template
            legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<segments.length; i++){%><li><span style="background-color:<%=segments[i].fillColor%>"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>'
          }
          //Create pie or douhnut chart
          // You can switch between pie and douhnut using the method below.
          pieChart.Doughnut(PieData, pieOptions)
        }
      <?php endif; ?>

      <?php if (isset($popular)) : ?>
        if ($('#populerChart2').length) {
          const pieChartCanvas = $('#populerChart2').get(0).getContext('2d');
          const pieChart = new Chart(pieChartCanvas);
          const PieData = [
            <?php foreach ($popular as $item) : ?> {
                value: <?= $item['total'] ?>,
                color: '#' + Math.floor(Math.random() * 16777215).toString(16),
                highlight: '#' + Math.floor(Math.random() * 16777215).toString(16),
                label: '<?= $item['nama'] ?>'
              },
            <?php endforeach; ?>
          ];

          var pieOptions = {
            segmentShowStroke: true,
            segmentStrokeColor: '#fff',
            segmentStrokeWidth: 2,
            percentageInnerCutout: 50,
            animationSteps: 100,
            animationEasing: 'easeOutBounce',
            animateRotate: true,
            animateScale: false,
            responsive: true,
            maintainAspectRatio: true,
            legend: {
              display: true,
              position: 'top', // Adjust the position as needed
              fullWidth: true,
              labels: {
                boxWidth: 15, // Adjust the box width as needed
              }
            },
            tooltips: {
              callbacks: {
                label: function(tooltipItem, data) {
                  var dataset = data.datasets[tooltipItem.datasetIndex];
                  var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                    return previousValue + currentValue;
                  });
                  var currentValue = dataset.data[tooltipItem.index];
                  var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
                  return percentage + "%";
                }
              }
            }
          };

          pieChart.Doughnut(PieData, pieOptions);
        }
      <?php endif; ?>


      <?php if (isset($buku_populer)) : ?>
        if ($('#populerChart3').length) {
          const pieChartCanvas = $('#populerChart3').get(0).getContext('2d')
          const pieChart = new Chart(pieChartCanvas)
          const PieData = [
            <?php foreach ($buku_populer as $item) : ?> {
                value: <?= $item['total'] ?>,
                color: '#' + Math.floor(Math.random() * 16777215).toString(16),
                highlight: '#' + Math.floor(Math.random() * 16777215).toString(16),
                label: '<?= $item['judul'] ?>'
              },
            <?php endforeach; ?>
          ]
          var pieOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            //String - The colour of each segment stroke
            segmentStrokeColor: '#fff',
            //Number - The width of each segment stroke
            segmentStrokeWidth: 2,
            //Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            //Number - Amount of animation steps
            animationSteps: 100,
            //String - Animation easing effect
            animationEasing: 'easeOutBounce',
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            //Boolean - whether to make the chart responsive to window resizing
            responsive: true,
            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
            maintainAspectRatio: true,
            //String - A legend template
            legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<segments.length; i++){%><li><span style="background-color:<%=segments[i].fillColor%>"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>'
          }
          //Create pie or douhnut chart
          // You can switch between pie and douhnut using the method below.
          pieChart.Doughnut(PieData, pieOptions)
        }
      <?php endif; ?>

    })

    function previewImage() {
      const cover = document.querySelector('.custom-file-input');
      const coverLabel = document.querySelector('.custom-file-label');
      const imgPreview = document.querySelector('.img-preview');
      coverLabel.textContent = cover.files[0].name;
      const coverFile = new FileReader();
      coverFile.readAsDataURL(cover.files[0]);
      coverFile.onload = function(e) {
        imgPreview.src = e.target.result;
      }
    }

    function previewPdf() {
      const cover = document.querySelector('.custom-file-input-pdf');
      const coverLabel = document.querySelector('.custom-file-label-pdf');
      const imgPreview = document.querySelector('.pdf-preview');
      coverLabel.textContent = cover.files[0].name;
      const coverFile = new FileReader();
      coverFile.readAsDataURL(cover.files[0]);
      coverFile.onload = function(e) {
        imgPreview.src = e.target.result;
      }
    }
  </script>
  </body>

  </html>

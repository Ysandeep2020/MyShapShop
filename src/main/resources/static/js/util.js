/********* datatable start **********/
var datatableExport = [];
datatableExport.push('copyHtml5');
datatableExport.push('excelHtml5');
datatableExport.push('csvHtml5');
datatableExport.push('pdfHtml5');
datatableExport.push('print');
datatableExport.push('colvis');


function initializeDatatables(datatableId) {
	if (datatableId == 'datatable') {
		BootstrapDialog.alert("Choose another id for Data Table");
	} else {
                $('#' + datatableId).next('tfoot').remove();
		$('#' + datatableId).append("<tfoot><tr id='filterrow' class='no-print'></tr></tfoot>");
		var tfooot = "";
		$('#' + datatableId + ' tbody tr:first td').each(function() {
			tfooot += "<td></td>"
		});
		$('#' + datatableId + ' tfoot tr#filterrow').html(tfooot);
		$('#' + datatableId + ' tfoot tr#filterrow td').each(function() {

			var title = $('#' + datatableId + ' thead th').eq($(this).index()).text();
			if ($(this).index() === 0) {
			} else {
				$(this).html('<input type="text" class="form-control" placeholder="Search ' + title + '" />');
			}
		});

		table = $('#' + datatableId).DataTable({
			"lengthMenu": [[15, 25, 50, 100, -1], [15, 25, 50, 100, "All"]],
			"columnDefs": [{
				"searchable": false,
				"orderable": false,
				"targets": 0
			}],
			"oLanguage": {
				"sSearch": "<span'>Filter records:</span>",
				"sLengthMenu": "<span'>Display MENU records per page</span>",
				"sInfo": "<span'>START - END of TOTAL</span>"
			}
		});

		// Apply the search
		table.columns().every(function() {
			var that = this;
			$('input', this.footer()).on('keyup change', function() {
				if (that.search() !== this.value) {
					that.search(this.value).draw();
				}
			});
		});
	}
}

function InitializeDatatable(params) {
	console.log(params.pageSize);

	$('#' + params.datatableId + ' tfoot th').each(function() {
		var title = $(this).text();
		$(this).html('<input type="text" placeholder="Search ' + title + '" class="form-control form-control-sm" />');
	});

	if (params.pageSize === undefined || params.pageSize === "") {
		params.pageSize = "A4";
	}
	if (params.datatableId == 'datatable') {
		BootstrapDialog.alert("Choose another id for Data Table");
	} else {
                $('#' + params.datatableId).next('tfoot').remove();
		$('#' + params.datatableId).append("<tfoot><tr id='filterrow' class='no-print'></tr></tfoot>");
		var tfooot = "";
		$('#' + params.datatableId + ' tbody tr:first td').each(function() {
			tfooot += "<td></td>"
		});
		$('#' + params.datatableId + ' tfoot tr#filterrow').html(tfooot);
		$('#' + params.datatableId + ' tfoot tr#filterrow td').each(function() {

			var title = $('#' + params.datatableId + ' thead th').eq($(this).index()).text();
			if ($(this).index() === 0) {
			} else {
				$(this).html('<input type="text" class="form-control" placeholder="Search ' + title + '" />');
			}
		});

		table = $('#' + params.datatableId).DataTable({
			paging: true,
			ordering: true,
			info: true,
			"bFilter": true,
			search: {
				return: true,
			},
			lengthMenu: [
				[15, 25, 50, 100, -1],
				[15, 25, 50, 100, 'All'],
			],
			dom: 'Blfrtip',//PQlfrtip
			colReorder: true,
			// buttons: datatableExport
			// 
			// table buttons
			buttons: [
				{
					extend: 'copyHtml5',
					text: '<i class="fa fa-files-o import_exportTableIcons"></i>',
					titleAttr: 'Copy',
					title: function() {
						return document.querySelector('.col.d-flex.align-items-center h4').textContent;
					}
				},
				{
					extend: 'excelHtml5',
					text: '<i class="fa fa-file-excel-o import_exportTableIcons borderLeftVerticalLine"></i>',
					titleAttr: 'Excel',
					title: function() {
						return document.querySelector('.col.d-flex.align-items-center h4').textContent;
					}
				},
				{
					extend: 'csvHtml5',
					text: '<i class="fa fa-file-text-o import_exportTableIcons borderLeftVerticalLine"></i>',
					titleAttr: 'CSV',
					title: function() {
						return document.querySelector('.col.d-flex.align-items-center h4').textContent;
					}
				},
				{
					extend: 'pdfHtml5',
					orientation: 'landscape',
					pageSize: params.pageSize,
					text: '<i class="fa fa-file-pdf-o import_exportTableIcons borderLeftVerticalLine"></i>',
					titleAttr: 'PDF',
					title: function() {
						return document.querySelector('.col.d-flex.align-items-center h4').textContent;
					},
					headerCallback: function(pdf, settings) {
						var currentPage = pdf.internal.getCurrentPageInfo().pageNumber;
						pdf.setPageTitle('Page ' + currentPage);
					}
				},
				{
					extend: 'print',
					text: '<i class="fas fa-print import_exportTableIcons borderLeftVerticalLine"></i>',
					titleAttr: 'Print',
					autoPrint: false,
					title: function() {
						return document.querySelector('.col.d-flex.align-items-center h4').textContent;
					},
					customize: function(win) {
						var currentPage = win.doc().internal.getCurrentPageInfo().pageNumber;
						$(win.document.body).find('title').text('Page ' + currentPage);
					}
				}
			]
		});
		$("#" + params.datatableId + " th").addClass("sort text-ligh t bg-primary");

		// Apply the search
		table.columns().every(function() {
			var that = this;
			$('input', this.footer()).on('keyup change', function() {
				if (that.search() !== this.value) {
					that.search(this.value).draw();
				}
			});
		});
	}
}

/********* datatable end **********/


/********* Toast Message start **********/
toastr.options.closeButton = true;
function toastMessage(type, message) {
	if (type == undefined || type == null || type.trim() == '') {
		type = 'info';
	}
	type = type.toLowerCase();
	if (type == 'success') {
		toastr.success(message);
	} else if (type == 'info') {
		toastr.info(message);
	} else if (type == 'warning') {
		toastr.warning(message);
	} else if (type == 'error') {
		toastr.error(message);
	} else {
		toastr.info(message);
	}
}
/********* Toast Message end **********/

//method for number type field maximum of characters and only allow numeric input only and prevents'e' 
function validateNumberInput(element) {
	element.onkeydown = function(event) {
		return event.keyCode !== 69;
	};
	element.oninput = function() {
		if (this.value.length > this.maxLength) {
			this.value = this.value.slice(0, this.maxLength);
		}
	};
}

/text field space trim and cpatilize words/
function trimSpacesAndCapitalize(event) {
	var inputElement = event.target;
	var inputValue = inputElement.value;

	var startPosition = inputElement.selectionStart;
	var endPosition = inputElement.selectionEnd;

	var trimmedValue = inputValue
		.replace(/(^\s*)|(\s*$)/g, '') // Remove leading and trailing spaces
		.replace(/[ ]{2,}/g, ' ') // Replace multiple spaces with one space
		.replace(/\n\s+/g, '\n'); // Remove spaces after newlines

	var uppercaseValue = trimmedValue.toUpperCase();
	inputElement.value = uppercaseValue;

	// Adjust the cursor position based on the modification
	var diff = inputValue.length - trimmedValue.length;
	inputElement.selectionStart = startPosition - diff;
	inputElement.selectionEnd = endPosition - diff;
}

// Show main loader
function startLoader() {
	$("#main-loader").removeClass("hide");
  }

  // Hide main loader
  function stopLoader() {
	$("#main-loader").addClass("hide");
  }
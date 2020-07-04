$(function() {
	$('#item-price').on('change', function() {
		let price = $('#item-price').val();
		price = Number(price).toFixed(2);

		$('#item-price').val(price);
	});

	supplier_id = 0;
	category_id = 0;
	unit_id = 0;
	animate = [
		"bounce", "flash", "pulse", "rubberBand", "shake", "swing", "tada", "wobble", "bounceIn",
		"bounceInDown", "bounceInLeft", "bounceInRight", "bounceInUp", "fadeIn", "fadeInDown",
		"fadeInDownBig", "fadeInLeft", "fadeInLeftBig", "fadeInRight", "fadeInRightBig", "fadeInUp", 
		"fadeInUpBig", "flip", "flipInX", "flipInY", "flipOutX", "flipOutY", "lightSpeedIn", 
		"rotateIn", "rotateInDownLeft", "rotateInDownRight", "rotateInUpLeft", 
		"rotateInUpRight", "slideInDown", "slideInLeft", "slideInRight", "hinge", "rollIn"
	];



	$(".delete").on("click", function() {
		var id = $(this).data("key");
		var page = $(this).data("page");
		var selected = $(this).data("selected");
		swal({
	        title: "Are you sure?",
	        text: "You are going to delete " + selected.toUpperCase(),
	        type: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#DD6B55",
	        confirmButtonText: "Yes, delete it!",
	        closeOnConfirm: false
	    }, function () {
	    	$.ajax({
	    		url: base_url + page + "/delete" ,
	    		method: "post",
	    		data: {id: id},
	    		success: (response => {
	    			swal({
				        title: "Deleted! ",
				        text: selected.toUpperCase() +" was deleted!",
				        type: "success",
				        showCancelButton: false,
				        confirmButtonColor: "#337ab7",
				        confirmButtonText: "Done",
				        closeOnConfirm: false
				    }, function () {
				    	window.location.href = base_url + page;
				    });
    			})
    		});
	    });
	});
	$('.invoice').on('click', function() {
		var id = '#' + $(this).data('key');
		$(id).printThis();
	});

	$('.footable').footable();
	$("a").tooltip();
	$(".select2").select2();

    $(".create-serial").on("click", function() {
        $("#item-serial").val(createSerial());
    });

    function createSerial(limit) {
    	var key = "0123456789";
		var serial = "";
        for (var i = 1; i <= 13; i++) {
            serial += key.charAt(Math.floor(Math.random() * key.length));
        }
        return serial
    }


	loadInventoryStock();
	loadMonthlySales();
	loadMovingProducts();
	loadNotMovingProducts();
	loadSupplierChart();
	loadCategoryChart();
	loadUnitChart();

	function loadCategoryChart() {
		if (document.getElementById("category-chart")) {
			$.ajax({
				url: base_url + 'category/category-chart',
				dataType: 'json',
				success: function(response) {
					var labels = [];
					var totals = []; 
					response.forEach(data => {
	    				labels.push(data.label);
						totals.push(data.total);
					}); 

					$('.leading-category').text(labels[0].toUpperCase())
					category_id = response[0].id
					var barData = {
				        labels: labels,
				        datasets: [
				            {
				                label: "Suppliers",
				                fillColor: "#f39c12",
				                strokeColor: "#f39c12",
				                highlightFill: "rgba(26,179,148,0.75)",
				                highlightStroke: "rgba(26,179,148,1)",
				                data: totals
				            }
				        ]
				    };

				    var barOptions = {
				        scaleBeginAtZero: true,
				        scaleShowGridLines: true,
				        scaleGridLineColor: "rgba(0,0,0,.05)",
				        scaleGridLineWidth: 1,
				        barShowStroke: true,
				        barStrokeWidth: 2,
				        barValueSpacing: 5,
				        barDatasetSpacing: 1,
				        responsive: true,
				    }
 

				    var ctx = document.getElementById("category-chart").getContext("2d");
				    var myNewChart = new Chart(ctx).Bar(barData, barOptions);
				}
			});
		} 
	}

	function loadUnitChart() {
		if (document.getElementById("unit-chart")) {
			$.ajax({
				url: base_url + 'unit/unit-chart',
				dataType: 'json',
				success: function(response) {
					var labels = [];
					var totals = []; 
					response.forEach(data => {
	    				labels.push(data.label);
						totals.push(data.total);
					}); 

					$('.leading-unit').text(labels[0].toUpperCase())
					unit_id = response[0].id
					var barData = {
				        labels: labels,
				        datasets: [
				            {
				                label: "Suppliers",
				                fillColor: "#605ca8",
				                strokeColor: "#605ca8",
				                highlightFill: "rgba(26,179,148,0.75)",
				                highlightStroke: "rgba(26,179,148,1)",
				                data: totals
				            }
				        ]
				    };

				    var barOptions = {
				        scaleBeginAtZero: true,
				        scaleShowGridLines: true,
				        scaleGridLineColor: "rgba(0,0,0,.05)",
				        scaleGridLineWidth: 1,
				        barShowStroke: true,
				        barStrokeWidth: 2,
				        barValueSpacing: 5,
				        barDatasetSpacing: 1,
				        responsive: true,
				    }
 

				    var ctx = document.getElementById("unit-chart").getContext("2d");
				    var myNewChart = new Chart(ctx).Bar(barData, barOptions);
				}
			});
		} 
	}

	function loadSupplierChart() {
		if (document.getElementById("supplier-chart")) {
			$.ajax({
				url: base_url + 'supplier/supplier-chart',
				dataType: 'json',
				success: function(response) {
					var labels = [];
					var totals = []; 
					response.forEach(data => {
	    				labels.push(data.label);
						totals.push(data.total);
					}); 

					$('.leading-supplier').text(labels[0].toUpperCase())
					supplier_id = response[0].id
					var barData = {
				        labels: labels,
				        datasets: [
				            {
				                label: "Suppliers",
				                fillColor: "rgba(26,179,148,0.5)",
				                strokeColor: "rgba(26,179,148,0.5)",
				                highlightFill: "rgba(26,179,148,0.75)",
				                highlightStroke: "rgba(26,179,148,1)",
				                data: totals
				            }
				        ]
				    };

				    var barOptions = {
				        scaleBeginAtZero: true,
				        scaleShowGridLines: true,
				        scaleGridLineColor: "rgba(0,0,0,.05)",
				        scaleGridLineWidth: 1,
				        barShowStroke: true,
				        barStrokeWidth: 2,
				        barValueSpacing: 5,
				        barDatasetSpacing: 1,
				        responsive: true,
				    }
 

				    var ctx = document.getElementById("supplier-chart").getContext("2d");
				    var myNewChart = new Chart(ctx).Bar(barData, barOptions);
				}
			});
		} 
	}

	function loadInventoryStock() {

		if (document.getElementById("flot-pie-chart")) {
			$.ajax({
				url: base_url + 'item/get-stock',
				dataType: 'json',
				success: function(response) {
					console.log(response)
					var data = [{
				        label: "Full",
				        data: response.full,
				        color: "#1ab394",
				    }, {
				        label: "Critical",
				        data: response.critical,
				        color: "#f8ac59",
				    }, {
				        label: "Good",
				        data: response.good,
				        color: "#1c84c6",
				    }, {
				        label: "Empty",
				        data: response.empty,
				        color: "#ed5565",
				    }];

				    var plotObj = $.plot($("#flot-pie-chart"), data, {
				        series: {
				            pie: { show: true }
				        },
				        grid: {
				            hoverable: true
				        },
				        tooltip: true,
				        tooltipOpts: {
				            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
				            shifts: {
				                x: 20,
				                y: 0
				            },
				            defaultTheme: false
				        }
				    });
				}
			}); 
		} 
	}


    function loadMonthlySales() {
		if (document.getElementById("flot-line-chart")) {
			var year = new Date().getFullYear();
			if (document.getElementById("year_sale")) {
				year = $('#year_sale').val();
			}
	    	$.ajax({
				url: base_url + 'sale/get-monthly-sale',
				data: {year: year},
				method: 'get',
				dataType: 'json',
				success: function(response) {

			    	var barOptions = {
				        series: {
				            lines: {
				                show: true,
				                lineWidth: 2,
				                fill: true,
				                fillColor: {
				                    colors: [{
				                        opacity: 0.0
				                    }, {
				                        opacity: 0.0
				                    }]
				                }
				            }
				        },
				        xaxis: {
				            tickDecimals: 0
				        },
				        colors: ["#1ab394"],
				        grid: {
				            color: "#999999",
				            hoverable: true,
				            clickable: true,
				            tickColor: "#D4D4D4",
				            borderWidth:0
				        },
				        legend: {
				            show: false
				        },
				        tooltip: true,
				        tooltipOpts: {
				            content: "month: %x, total: %y"
				        }
				    };
				    var barData = {
				        label: "line",
				        data: [
				            [1, response[0]], 
				            [2, response[1]], 
				            [3, response[2]], 
				            [4, response[3]], 
				            [5, response[4]], 
				            [6, response[5]], 
				            [7, response[6]], 
				            [8, response[7]], 
				            [9, response[8]], 
				            [10, response[9]], 
				            [11, response[10]], 
				            [12, response[11]], 
				        ]
				    };
				    $.plot($("#flot-line-chart"), [barData], barOptions);
				}
			});
		}
    }


    function loadMovingProducts() {
    	if (document.getElementById("fast") && document.getElementById("slow")) {
	    	$.ajax({
				url: base_url + 'item/get-moving-products',
				dataType: 'json',
				success: function(response) {
					console.log(response)
					var labels = [];
					var totals = [];
					var slow_labels = [];
					var slow_totals = [];
					response.fast.forEach(data => {
	    				labels.push(data.item_name);
						totals.push(data.total);
					});


					response.slow.forEach(data => {
	    				slow_labels.push(data.item_name);
						slow_totals.push(data.total);
					});

					$('.fastest-product').text(labels[0].toUpperCase());
					$('.slowest-product').text(slow_labels[0].toUpperCase());


					var barData = {
				        labels: labels,
				        datasets: [
				            {
				                label: "Fast Moving Products",
				                fillColor: "rgba(12, 202, 50, 0.8)",
				                strokeColor: "rgba(12, 202, 50, 0.8)",
				                highlightFill: "rgba(26,179,148,0.75)",
				                highlightStroke: "rgba(26,179,148,1)",
				                data: totals
				            }
				        ]
				    };

				    var barOptions = {
				        scaleBeginAtZero: true,
				        scaleShowGridLines: true,
				        scaleGridLineColor: "rgba(0,0,0,.05)",
				        scaleGridLineWidth: 1,
				        barShowStroke: true,
				        barStrokeWidth: 2,
				        barValueSpacing: 5,
				        barDatasetSpacing: 1,
				        responsive: true,
				    }


				    var ctx = document.getElementById("fast").getContext("2d");
				    var myNewChart = new Chart(ctx).Bar(barData, barOptions);

				    var slow_barData = {
				        labels: slow_labels,
				        datasets: [
				            {
				                label: "Fast Moving Products",
				                fillColor: "rgba(225, 58, 7, 0.8)",
				                strokeColor: "rgba(225, 58, 7, 0.8)",
				                highlightFill: "rgba(26,179,148,0.75)",
				                highlightStroke: "rgba(26,179,148,1)",
				                data: slow_totals
				            }
				        ]
				    };

				    var slow_barOptions = {
				        scaleBeginAtZero: true,
				        scaleShowGridLines: true,
				        scaleGridLineColor: "rgba(0,0,0,.05)",
				        scaleGridLineWidth: 1,
				        barShowStroke: true,
				        barStrokeWidth: 2,
				        barValueSpacing: 5,
				        barDatasetSpacing: 1,
				        responsive: true,
				    }


				    var ctx = document.getElementById("slow").getContext("2d");
				    var myNewChart = new Chart(ctx).Bar(slow_barData, slow_barOptions);
				}
			});
		}
    }

    function loadNotMovingProducts() {
    	if (document.getElementById("not")) {
	    	$.ajax({
				url: base_url + 'item/get-not-moving-products',
				dataType: 'json',
				success: function(response) {
					var labels = [];
					var totals = []; 

					response.forEach(data => {
	    				labels.push(data.name);
						totals.push(data.quantity);
					});
	 

					var barData = {
				        labels: labels,
				        datasets: [
				            {
				                label: "Not Moving Products",
				                fillColor: "rgba(21, 160, 211, 0.8)",
				                strokeColor: "rgba(21, 160, 211, 0.8)",
				                highlightFill: "rgba(26,179,148,0.75)",
				                highlightStroke: "rgba(26,179,148,1)",
				                data: totals
				            }
				        ]
				    };

				    var barOptions = {
				        scaleBeginAtZero: true,
				        scaleShowGridLines: true,
				        scaleGridLineColor: "rgba(0,0,0,.05)",
				        scaleGridLineWidth: 1,
				        barShowStroke: true,
				        barStrokeWidth: 2,
				        barValueSpacing: 5,
				        barDatasetSpacing: 1,
				        responsive: true,
				    }


				    var ctx = document.getElementById("not").getContext("2d");
				    var myNewChart = new Chart(ctx).Bar(barData, barOptions);
	 
				}
			});
		}
    }
    
});




if (document.getElementById("app")) {
	$('.addToCart').show();
	$('#search-barcode').show();
	var app = new Vue({
		el: '#wrapper',
		data: {
			invoice: false,
			cart: true,
			items: [],
			orders: [],
			search: '',
			transactionID: '',
			total: 0.00,
			amountReceived: '',
			selected: '',
			mdl_search: ''
		},
		mounted() {
			this.fetchItems();
		},
		watch: {
			search() {
				this.findItem();
			},
			mdl_search() {
				$.ajax({
					url: base_url + 'item/find',
					data: {serial: this.mdl_search},
					method: 'get',
					dataType: 'html',
					success: (response => {
						$('#item-search .modal-body').html(response);
					})
				})
			}
		},
		methods: {
			addToCart() {
				this.findItem($('#selected').val())
			},
			reset() {
				$('.checkOut').show();
				$('#search-barcode').focus();
				$('#itemsearch-serial').focus(); 
				$('.spiner-example').hide();
				this.invoice = false,
				this.cart = true,
				this.items = [],
				this.orders = [],
				this.search = '',
				this.transactionID = '',
				this.total = 0.00,
				this.amountReceived = '',
				this.fetchItems();
			},
			printInvoice() {
				$('#invoice').printThis();
			},
			checkOut() {
				// console.log($('meta[name="csrf-token"]')[0]['content']);
				if (app.amountReceived - app.total < 0) {
					swal({
		                title: "Warning",
		                type: "warning",
		                text: "Insufficient Money Received."
		            });
				} else {
					$('.spiner-example').show();
					$('.checkOut').hide();
					app.cart = false;
					$.ajax({
						url: base_url + 'item/save-sale',
						method: 'post',
						data: {
							orders: app.orders,
							total: app.total,
							customer_id: app.transactionID,
							invoice: $('#invoice').html()
							// _csrf: $('meta[name="csrf-token"]')[0]['content']
						},
						success: function(response) {
							// if(app.total >= 100) {
							// 	// app.invoice = true;
							// } else {
								
							// }

							swal({
				                title: "Sales Recorded",
				                type: "success",
				                text: "Automatic Recorded into Sales."
				            });

				            app.reset();
							
							$('.spiner-example').hide();
						}
					}); 
				}
			},
			checkInput(index) {
				if (Number(app.orders[index].order_quantity) > Number(app.orders[index].quantity)) {
					swal({
		                title: "Warning",
		                text: "Quantity Exceed. All Available will used instead."
		            });
		            app.orders[index].order_quantity = app.orders[index].quantity;
				} 
			},
			computeChange(amountReceived, total) {
				var change = (amountReceived - total).toFixed(2);
				change = (change <= 0) ? 0 : change;
				return change;
			},
			computeTotalCost() {
				var total = 0.00;
				app.orders.forEach(item => {
					total += item.price * item.order_quantity;
				});
				// total = (total <= 0) ? 0 : total;
				app.total = total;
			},
			remove(index) {
				app.orders.splice(index, 1);
				app.computeTotalCost();
			},

			findItem(serial = "") {
				item_serial = (serial) ? serial : this.search;
				// app.items.forEach(item => {
				// 	if (item.serial == item_serial) {
				// 		if (!app.orders.includes(item)) {
				// 			var order = item;
				// 			order.order_quantity = 1;
				// 			if (order.quantity == 0) {
				// 				swal({
				// 	                title: order.name,
				//                 	type: 'warning',
				// 	                text: "No More Stock."
				// 	            });
				// 			} else {
				// 				this.orders.unshift(order);
				// 				app.computeTotalCost();
				// 				app.search = '';
				// 			}
				// 		} else {
				// 			swal({
				//                 title: "Warning",
				//                 type: 'warning',
				//                 text: "Item Already Added."
				//             });
				// 		}
				// 	}
				// });

				var item_length = app.items.length;

				for (var i = item_length - 1; i >= 0; i--) {
					if (app.items[i].serial == item_serial) {
						if (!app.orders.includes(app.items[i])) {
							var order = app.items[i];
							order.order_quantity = 1;
							if (order.quantity == 0) {
								swal({
					                title: order.name,
				                	type: 'warning',
					                text: "No More Stock."
					            });
							} else {
								this.orders.unshift(order);
								app.computeTotalCost();
								app.search = '';
							}
						} else {
							var order_length = app.orders.length;
							for (var x = order_length - 1; x >= 0; x--) {
								if (app.orders[x].serial == item_serial) {
									app.orders[x].order_quantity++;
								} 
							}
							app.computeTotalCost();
							app.search = '';
						}
					}
				}
			},

			fetchItems() {
				$.ajax({
					url: base_url + 'item/fetch-all',
					dataType: 'json',
					success: function(response) {
						app.items = response.items;
						app.transactionID = response.transactionID;
					} 
				});
			}
		}
	});

} else {
	$('#search-barcode').hide();
	$('.addToCart').hide();
}


$('#search-barcode').focus();
$('#itemsearch-serial').focus(); 
$('.print-report').on('click', function(){
	$('#report').printThis();
})
$('.spiner-example').hide();

$('.style1, .green, .fastest-product, .slowest-product').tooltip();





function createLabel(label) {
	if (label == 'FULL') {
		return '<span style="color: #1ab394">FULL</span>';
	} else if(label == 'GOOD') {
		return '<span style="color: #1c84c6">GOOD</span>';
	} else if(label == 'CRITICAL') {
		return '<span style="color: #f8ac59">CRITICAL</span>';
	} else if(label == 'EMPTY') {
		return '<span style="color: #ed5565">EMPTY</span>';
	}
}


$('.item-stat').on('click', function() {
	var key = $(this).data("key");
	$.ajax({
		url: base_url + 'item/get-stock',
		dataType: 'json',
		method: 'post',
		data: {status: key},
		success: (response => {
			var animateClass = animate[Math.floor(Math.random() * animate.length)];
			
			var html = '<div class="modal-content animated ' + animateClass + '">';
            html += '<div class="modal-header">';
                html += '<button type="button" class="close" data-dismiss="modal">';
                	html += '<span aria-hidden="true">&times;</span>';
                	html += '<span class="sr-only">Close</span>';
                html += '</button>';
                html += '<h4 class="modal-title">'+ createLabel(key.toUpperCase()) +' INVENTORY STOCK</h4>';
                html += '<small class="font-bold">~ Items Included ~</small>';
            html += '</div>';
            html += '<div class="modal-body"> ';
            
				html += '<table class="table table-striped table-bordered data upper">';
			    	html += '<thead>';
			    		html += '<tr>';
			    			html += '<th>NAME</th>';
			    			html += '<th>CATEGORY</th>';
			    			html += '<th>PRICE</th>';
			    			html += '<th>QUANTITY</th>';
			    			html += '<th>SUPPLIER</th>';
			    			html += '<th>UNIT</th>';
			    		html += '</tr>';
			    	html += '</thead>';
			    	html += '<tbody>';
						response.forEach(item => {
							html += '<tr>';
								html += '<td>' + item.name + '</td>';
								html += '<td>' + item.category.name+ '</td>';
								html += '<td><span class="pull-right">₱ ' + item.price + '</span></td>';
								html += '<td><span class="pull-right">' + item.quantity + '</span></td>';
								html += '<td>' + item.supplier.name + '</td>';
								html += '<td>' + item.unit.name + '</td>';
						});
					html += '</tbody>';
			    html += '</table>'; 

		    html += '</div>';

            html += '<div class="modal-footer">';
                html += '<button data-dismiss="modal" class="btn btn-primary">Close</button>';
            html += '</div>';
        html += '</div>';

		    $('.modal-dialog').html(html);
		    $('.data').dataTable();
		    $('#item-list').modal("show");
		})
	})
});





$('.leading-supplier').on('click', function() {
	$.ajax({
		url: base_url + 'supplier/get-items',
		dataType: 'json',
		method: 'post',
		data: {supplier_id: supplier_id},
		success: (response => {
			console.log(response)
			var animateClass = animate[Math.floor(Math.random() * animate.length)];
			
			var html = '<div class="modal-content animated ' + animateClass + '">';
            html += '<div class="modal-header">';
                html += '<button type="button" class="close" data-dismiss="modal">';
                	html += '<span aria-hidden="true">&times;</span>';
                	html += '<span class="sr-only">Close</span>';
                html += '</button>';
                html += '<h4 class="modal-title">'+ $(this).text().toUpperCase() +'</h4>';
                html += '<small class="font-bold">~ Items Included ~</small>';
            html += '</div>';
            html += '<div class="modal-body"> ';
            
				html += '<table class="table table-striped table-bordered data upper">';
			    	html += '<thead>';
			    		html += '<tr>';
			    			html += '<th>NAME</th>';
			    			html += '<th>CATEGORY</th>';
			    			html += '<th>PRICE</th>';
			    			html += '<th>QUANTITY</th>';
			    			html += '<th>SUPPLIER</th>';
			    			html += '<th>UNIT</th>';
			    		html += '</tr>';
			    	html += '</thead>';
			    	html += '<tbody>';
						response.forEach(item => {
							html += '<tr>';
								html += '<td>' + item.name + '</td>';
								html += '<td>' + item.category.name+ '</td>';
								html += '<td><span class="pull-right">₱ ' + item.price + '</span></td>';
								html += '<td><span class="pull-right">' + item.quantity + '</span></td>';
								html += '<td>' + item.supplier.name + '</td>';
								html += '<td>' + item.unit.name + '</td>';
						});
					html += '</tbody>';
			    html += '</table>'; 

		    html += '</div>';

            html += '<div class="modal-footer">';
                html += '<button data-dismiss="modal" class="btn btn-primary">Close</button>';
            html += '</div>';
        html += '</div>';

		    $('.modal-dialog').html(html);
		    $('.data').dataTable();
		    $('#item-list').modal("show");
		})
	})
});



$('.leading-category').on('click', function() {
	$.ajax({
		url: base_url + 'category/get-items',
		dataType: 'json',
		method: 'post',
		data: {category_id: category_id},
		success: (response => {
			console.log(response)
			var animateClass = animate[Math.floor(Math.random() * animate.length)];
			
			var html = '<div class="modal-content animated ' + animateClass + '">';
            html += '<div class="modal-header">';
                html += '<button type="button" class="close" data-dismiss="modal">';
                	html += '<span aria-hidden="true">&times;</span>';
                	html += '<span class="sr-only">Close</span>';
                html += '</button>';
                html += '<h4 class="modal-title">'+ $(this).text().toUpperCase() +'</h4>';
                html += '<small class="font-bold">~ Items Included ~</small>';
            html += '</div>';
            html += '<div class="modal-body"> ';
            
				html += '<table class="table table-striped table-bordered data upper">';
			    	html += '<thead>';
			    		html += '<tr>';
			    			html += '<th>NAME</th>';
			    			html += '<th>CATEGORY</th>';
			    			html += '<th>PRICE</th>';
			    			html += '<th>QUANTITY</th>';
			    			html += '<th>SUPPLIER</th>';
			    			html += '<th>UNIT</th>';
			    		html += '</tr>';
			    	html += '</thead>';
			    	html += '<tbody>';
						response.forEach(item => {
							html += '<tr>';
								html += '<td>' + item.name + '</td>';
								html += '<td>' + item.category.name+ '</td>';
								html += '<td><span class="pull-right">₱ ' + item.price + '</span></td>';
								html += '<td><span class="pull-right">' + item.quantity + '</span></td>';
								html += '<td>' + item.supplier.name + '</td>';
								html += '<td>' + item.unit.name + '</td>';
						});
					html += '</tbody>';
			    html += '</table>'; 

		    html += '</div>';

            html += '<div class="modal-footer">';
                html += '<button data-dismiss="modal" class="btn btn-primary">Close</button>';
            html += '</div>';
        html += '</div>';

		    $('.modal-dialog').html(html);
		    $('.data').dataTable();
		    $('#item-list').modal("show");
		})
	})
});


$('.leading-unit').on('click', function() {
	$.ajax({
		url: base_url + 'unit/get-items',
		dataType: 'json',
		method: 'post',
		data: {unit_id: unit_id},
		success: (response => {
			console.log(response)
			var animateClass = animate[Math.floor(Math.random() * animate.length)];
			
			var html = '<div class="modal-content animated ' + animateClass + '">';
            html += '<div class="modal-header">';
                html += '<button type="button" class="close" data-dismiss="modal">';
                	html += '<span aria-hidden="true">&times;</span>';
                	html += '<span class="sr-only">Close</span>';
                html += '</button>';
                html += '<h4 class="modal-title">'+ $(this).text().toUpperCase() +'</h4>';
                html += '<small class="font-bold">~ Items Included ~</small>';
            html += '</div>';
            html += '<div class="modal-body"> ';
            
				html += '<table class="table table-striped table-bordered data upper">';
			    	html += '<thead>';
			    		html += '<tr>';
			    			html += '<th>NAME</th>';
			    			html += '<th>CATEGORY</th>';
			    			html += '<th>PRICE</th>';
			    			html += '<th>QUANTITY</th>';
			    			html += '<th>SUPPLIER</th>';
			    			html += '<th>UNIT</th>';
			    		html += '</tr>';
			    	html += '</thead>';
			    	html += '<tbody>';
						response.forEach(item => {
							html += '<tr>';
								html += '<td>' + item.name + '</td>';
								html += '<td>' + item.category.name+ '</td>';
								html += '<td><span class="pull-right">₱ ' + item.price + '</span></td>';
								html += '<td><span class="pull-right">' + item.quantity + '</span></td>';
								html += '<td>' + item.supplier.name + '</td>';
								html += '<td>' + item.unit.name + '</td>';
						});
					html += '</tbody>';
			    html += '</table>'; 

		    html += '</div>';

            html += '<div class="modal-footer">';
                html += '<button data-dismiss="modal" class="btn btn-primary">Close</button>';
            html += '</div>';
        html += '</div>';

		    $('.modal-dialog').html(html);
		    $('.data').dataTable();
		    $('#item-list').modal("show");
		})
	})
});

$('.fastest-product, .slowest-product').on('click', function() {
	var item_name = $(this).text();
	$.ajax({
		url: base_url + 'item/get-moving-product-by-name',
		dataType: 'json',
		method: 'post',
		data: {item_name: item_name},
		success: (response => {
			var animateClass = animate[Math.floor(Math.random() * animate.length)];
			
			var html = '<div class="modal-content animated ' + animateClass + '">';
	            html += '<div class="modal-header">';
	                html += '<button type="button" class="close" data-dismiss="modal">';
	                	html += '<span aria-hidden="true">&times;</span>';
	                	html += '<span class="sr-only">Close</span>';
	                html += '</button>';
	                html += '<h4 class="modal-title">'+ $(this).text().toUpperCase() +'</h4>';
	                html += '<small class="font-bold">~ Items Included ~</small>';
	            html += '</div>';
	            html += '<div class="modal-body"> ';
	            
					html += '<table class="table table-striped table-bordered data upper">';
				    	html += '<thead>';
				    		html += '<tr>';
				    			html += '<th>NAME</th>';
				    			html += '<th>QUANTITY SOLD</th>';
				    			html += '<th>DATE</th>';
				    		html += '</tr>';
				    	html += '</thead>';
				    	html += '<tbody>';
							response.forEach(item => {
								html += '<tr>';
									html += '<td>' + item.item_name + '</td>';
									html += '<td>' + item.quantity + '</td>';
									html += '<td>' + item.date + '</td>';
							});
						html += '</tbody>';
				    html += '</table>'; 

			    html += '</div>';

	            html += '<div class="modal-footer">';
	                html += '<button data-dismiss="modal" class="btn btn-primary">Close</button>';
	            html += '</div>';
	        html += '</div>';

		    $('.modal-dialog').html(html);
		    $('.data').dataTable();
		    $('#item-list').modal("show");
		})
	});



});
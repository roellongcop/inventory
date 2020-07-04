$(document).ready(function() {
	var getItem = function(id = "") {
		$.ajax({
			url: base_url + 'item-get/' + id,
			dataType: 'html',
			success: (response => {
				$('.item-detail').html(response);
			})
		});
	};
	var updateItem = function() {
		$.ajax({
			url: base_url + 'item-update',
			method: 'post',
			data: $('#create-item').serialize(),
			success: (response => {
				swal({
	                title: "Updated",
					text:"Item has been updated.",
					type: "success",
					confirmButtonText: "Done",
				}, function () {
					window.location.href = base_url + 'items';
				})
			})
		});
	};


	var deleteItem = function() {
		$.ajax({
			url: base_url + 'item-delete',
			method: 'post',
			data: {id: item_id},
			success: (response => {
				swal({
	                title: "Success",
					text:"Item has been deleted.",
					type: "success",
					confirmButtonText: "Done",
				}, function () {
					window.location.href = base_url + 'items';
				})
			})
		});
	};




	$('.update-item').on('click', function() {
		updateItem();
	});

	$('.delete-item').on('click', function() {
		swal({
                title: "Are you sure?",
                text: "You will not be able to recover this file!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: false
            }, function () {
            	deleteItem();
            });
	});

	$('.item').on('click', function() {
		item_id = $(this).data('id');
		getItem(item_id);
	});






	$('.data').dataTable({
		// 'ordering' : false
	});
});
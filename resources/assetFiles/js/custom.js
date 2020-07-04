$(function() {
	$.ajax({
		url: base_url + 'item/get-stock',
		dataType: 'json',
		success: function(response) {
			var data = [{
		        label: "Full",
		        data: response.full,
		        color: "#5eb854",
		    }, {
		        label: "Critical",
		        data: response.critical,
		        color: "#eeae4a",
		    }, {
		        label: "Good",
		        data: response.good,
		        color: "#03586A",
		    }, {
		        label: "Empty",
		        data: response.empty,
		        color: "#e64f46",
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



    

});
<?php
/* @var $this yii\web\View */
$this->params['page'] = 'Statistics';
$this->title = 'Statistics';
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="sale-index"> 
	<div class="ibox float-e-margins">
        <div class="ibox-title">
			<h3>STOCKS</h3>
        </div>
        <div class="ibox-content">
		    <div class="row">
		    	<div class="col-md-6">
					<div class="flot-chart-pie-content" id="flot-pie-chart"></div>
		    	</div>
		    	<div class="col-md-6">
			    	<div class="col-md-6 item-stat" data-key="full">
			            <div class="widget style1 navy-bg" title="click to view item">
			                <div class="row">
			                    <div class="col-xs-4">
			                        <i class="fa fa-cart-plus fa-5x"></i>
			                    </div>
			                    <div class="col-xs-8 text-right">
			                        <span> Full stock items </span>
			                        <h2 class="font-bold">
			                        	<?= Yii::$app->template->getStock('full') ?>
			                        </h2>
			                    </div>
			                </div>
			            </div>
			        </div>

			        <div class="col-md-6 item-stat" data-key="good">
			            <div class="widget style1 blue-bg" title="click to view item">
			                <div class="row">
			                    <div class="col-xs-4 text-center">
			                        <i class="fa fa-shopping-cart fa-5x"></i>
			                    </div>
			                    <div class="col-xs-8 text-right">
			                        <span> Good stock items </span>
			                        <h2 class="font-bold">
			                        	<?= Yii::$app->template->getStock('good') ?>
			                        </h2>
			                    </div>
			                </div>
			            </div>
			        </div>
			        
			        <div class="col-md-6 item-stat" data-key="critical">
			            <div class="widget style1 yellow-bg" title="click to view item">
			                <div class="row">
			                    <div class="col-xs-4">
			                        <i class="fa fa-shopping-cart fa-5x"></i>
			                    </div>
			                    <div class="col-xs-8 text-right">
			                        <span> Critical stock items </span>
			                        <h2 class="font-bold">
			                        	<?= Yii::$app->template->getStock('critical') ?>
			                        </h2>
			                    </div>
			                </div>
			            </div>
			        </div>

			        <div class="col-md-6 item-stat" data-key="empty">
			            <div class="widget style1 red-bg" title="click to view item">
			                <div class="row">
			                    <div class="col-xs-4">
			                        <i class="fa fa-cart-arrow-down fa-5x"></i>
			                    </div>
			                    <div class="col-xs-8 text-right">
			                        <span> Empty stock items </span>
			                        <h2 class="font-bold">
			                        	<?= Yii::$app->template->getStock('empty') ?>
			                        </h2>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </div>
	    </div>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
			<h3>MOVING PRODUCTS</h3>
        </div>
        <div class="ibox-content">
        	<div class="row">
        		<div class="col-md-6">
        			<h2>
		        		<span class="green fastest-product" title="click to view items"></span>
		        		<small>is the fastest moving item recorded</small>
		        	</h2>
		        	<div class="flot-chart">
	                    <canvas id="fast" height="130"></canvas>
	                </div>

        		</div>
        		<div class="col-md-6">
        			<h2>
		        		<span class="green slowest-product" title="click to view items"></span>
		        		<small>is the slowest moving item recorded</small>
		        	</h2>
		        	<div class="flot-chart">
	                    <canvas id="slow" height="130"></canvas>
	                </div>
        		</div> 
        	</div>
        	<br>
        </div>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
			<h3>NOT MOVING PRODUCTS</h3>
        </div>
        <div class="ibox-content">
		    <div class="row">
		    	<div class="flot-chart">
                    <canvas id="not" height="60"></canvas>
                </div>
		    </div>
	    </div>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
			<h3>SUPPLIERS</h3>
        </div>
        <div class="ibox-content">
		    <div class="row">
			    <div class="col-md-12">
			    	<h2>
		        		<span class="green leading-supplier" title="Click to view items"></span>
		        		<small>is the leading supplier.</small>
		        	</h2>
			    	<div class="flot-chart">
	                    <canvas id="supplier-chart" height="60"></canvas>
	                </div>
			    </div>
		    </div>
	    </div> <br>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
			<h3>CATEGORIES</h3>
        </div>
        <div class="ibox-content">
		    <div class="row">
			    <div class="col-md-12">
			    	<h2>
		        		<span class="green leading-category" title="Click to view items"></span>
		        		<small>is the leading category.</small>
		        	</h2>
			    	<div class="flot-chart">
	                    <canvas id="category-chart" height="60"></canvas>
	                </div>
			    </div>
		    </div>
	    </div> <br>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
			<h3>UNIT OF MEASUREMENTS</h3>
        </div>
        <div class="ibox-content">
		    <div class="row">
			    <div class="col-md-12">
			    	<h2>
		        		<span class="green leading-unit" title="Click to view items"></span>
		        		<small>is the leading unit of measurement.</small>
		        	</h2>
			    	<div class="flot-chart">
	                    <canvas id="unit-chart" height="60"></canvas>
	                </div>
			    </div>
		    </div>
	    </div> <br>
    </div>

</div>

<div class="modal inmodal " id="item-list" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-lg">
        
    </div>
</div>
<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ItemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Counter';
// $this->params['create'] = Html::a('Create Item', ['create'], ['class' => 'btn btn-primary']);
$this->title = 'Counter';
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="counter-index" id="app">
	<div class="row spiner-example">
		<div class="spiner-example"><br><br>
            <div class="sk-spinner sk-spinner-three-bounce">
                <div class="sk-bounce1"></div>
                <div class="sk-bounce2"></div>
                <div class="sk-bounce3"></div>
            </div>
        </div>
	</div>  
    <div class="cart" v-show="cart">

    	<div class="row">
	    	<div class="col-md-8">
	    		<div class="ibox float-e-margins ibox-content">  
		    		<h3>Orders <span v-show="orders.length">({{orders.length}})</span></h3>
		    		<div class="table-responsive" style="height: 350px;">
				    	<table class="table table-bordered table-hover">
				    		<thead>
				    			<th>#</th>
				    			<th>NAME</th>
				    			<th>AVAILABLE</th>
				    			<th width="70">PRICE</th>
				    			<th>QUANTITY</th>
				    			<th>UNIT OF MEASUREMENT</th>
				    			<th>SUBTOTAL</th>
				    			<th width="50">REMOVE</th>
				    		</thead>
				    		<tbody>
				    			<tr v-for="(order, index) in orders">
				    				<td>{{ index += 1 }}</td>
				    				<td>{{ order.name }}</td>
				    				<td>{{ order.quantity }}</td>
				    				<td>₱ {{ order.price }}</td>
				    				<td>
				    					<input @input="checkInput(index - 1)" @change="computeTotalCost" type="number" v-model="order.order_quantity" class="form-control">
				    				</td>
				    				<td>{{ order.unit.name }}</td>
				    				<td>₱  {{ order.price * order.order_quantity }}</td>
				    				<td>
				    					<button @click="remove(index - 1)" class="btn btn-danger btn-sm">
				    						<i class="fa fa-minus-square"></i>
				    					</button>
				    				</td>
				    			</tr>
				    		</tbody>
				    	</table>
			    	</div>
		    	</div>
	    	</div>
	    	<div class="col-md-4">
	    		<div class="ibox float-e-margins ibox-content">
		    		<h2>Transaction</h2><hr>
	    			<h3>
	    				TRANSACTION ID : 
	    				<span style="float: right;">{{ transactionID }}</span>
	    			</h3>  

		    		<h3>
		    			PURCHASED ITEM :
		    			<span style="float: right;"> {{ orders.length }}</span>  
		    		</h3>

		    		<h2>
		    			TOTAL :  
		    			<span style="float: right;"> ₱ {{ (total).toFixed(2) }}</span> 
		    		</h2> 

		    		<hr>

		    		<h3>Amount Receive :</h3> 
		    		
		    		<input placeholder="Amount ₱" type="number" class="form-control input-lg" v-model="amountReceived" style="font-size: 24px;"><br>
		    		<label>Change</label><br>
		    		<label style="font-size: 24px;" :class="(amountReceived - total >= 0)? 'green':'red'">
		    		₱ {{ computeChange(amountReceived, total) }}
		    		</label><br><br>
		    		
		    		<button @click="checkOut" class="btn btn-primary btn-lg checkOut">
		    			Done
		    			<i class="fa fa-angle-right"></i>
		    		</button>

		    	</div>
	    	</div>
	    </div>
    </div>
    <div class="ibox-content p-xl" v-show="invoice">
    	<div id="invoice">
	        <div class="row">
	            <div class="col-sm-4 col-xs-4"></div>
	            <div class="col-sm-4 col-xs-4 panel panel-default" style="width: 300px;">
	            	<div class="row text-center">
		            	<div class="col-md-12 col-xs-12 text-center"> <br>
		            		<?= Yii::$app->template->getAbout()->name ?> <br>
		            		<?= Yii::$app->template->getAbout()->address ?> <br> <br>
		            		SALES TRANSACTION <br>
		            	</div>
	            	</div>
	            	<div class="row text-center" v-for="order in orders">
		            	<div class="col-md-4 col-xs-4">
		            		{{ order.name }} 
		            	</div>
		            	<div class="col-md-4 col-xs-4">
		            		
		            	</div>
		            	<div class="col-md-4 col-xs-4">
		            		{{ order.price }}
		            	</div>
	            	</div>
 
            		<div class="row text-center">
            			<div class="col-md-12 col-xs-12">
            				----------------------------------------------------------
            			</div>
            		</div>
        			<div class="col-md-12 col-xs-12">
	            		<table>
	            			<tbody>
	            				<tr>
		            				<td>
		            					(V) Vatable Sale
		            				</td>
		            				<td> .......................... </td>
		            				<td  class="text-right"> 
	            						{{ (total >= 100) ? (total -(total * 0.11)).toFixed(2): '' }} 
		            				</td>
		            			</tr>
		            			<tr>
		            				<td width="300">Vat Amount </td>
		            				<td> .......................... </td>
		            				<td  class="text-right"> 
		            						{{ (total >= 100) ? (total * 0.11).toFixed(2) : '' }}
		            				</td>
		            			</tr>
		            			<tr>
		            				<td colspan="3"> &nbsp;</td>
		            			</tr>
		            			<tr>
		            				<td>Amount Due </td>
		            				<td> .......................... </td>
		            				<td  class="text-right"> {{ (total).toFixed(2) }}</td>
		            			</tr>
		            			<tr>
		            				<td colspan="3">&nbsp; </td>
		            			</tr>
		            			<tr>
		            				<td>Cash </td>
		            				<td> .......................... </td>
		            				<td  class="text-right"> {{ (amountReceived) }}</td>
		            			</tr>
		            			<tr>
		            				<td colspan="3">&nbsp; </td>
		            			</tr>
		            			<tr>
		            				<td colspan="3"> &nbsp;</td>
		            			</tr>
		            			<tr>
		            				<td>Amount Tender </td>
		            				<td> .......................... </td>
		            				<td  class="text-right"> {{ (amountReceived) }}</td>
		            			</tr>
		            			<tr>
		            				<td>Change </td>
		            				<td> .......................... </td>
		            				<td  class="text-right"> {{ (amountReceived - total).toFixed(2) }}</td>
		            			</tr>
		            			<tr>
		            				<td colspan="2">Number of items:  </td>
		            				<td  class="text-right">{{orders.length}} </td>
		            			</tr>
		            			<tr>
		            				<td colspan="2">Transaction no:   </td>
		            				<td  class="text-right">{{ transactionID }} </td>
		            			</tr>
		            			<tr>
		            				<td>Date: <?= date('m/d/Y') ?>   </td>
		            				<td></td>
		            				<td>Time: <?= date('H:i') ?></td>
		            			</tr>
	            			</tbody>
	            		</table>
           
            		</div>
	             
 
 					<br><br>

 					<div class="row text-center">
		            	<div class="col-md-12 col-xs-12">
		            		<?= Yii::$app->template->getAbout()->name ?> <br>
		            		<?= Yii::$app->template->getAbout()->telephone ?> <br> <br>
		            	</div>
	            	</div>
	                
	            </div>
	        </div> 
 
        </div>
        <div class="row text-left">
	        <div class="col-sm-4 col-xs-4"></div>
	        <div class="col-sm-3 col-xs-3">
	            <button @click="printInvoice" class="btn btn-primary">
	            	<i class="fa fa-print"></i> 
	            	Print Invoice
	            </button>
	            <button @click="reset" class="btn btn-success">
	            	<i class="fa fa-check-circle"></i> 
	            	Done
	            </button>
	        </div>
        </div>
    </div>
</div>

<?= $this->render('_mdl_item_search'); ?>
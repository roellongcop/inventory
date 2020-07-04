<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SaleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['page'] = 'Sales';
$this->title = 'Sales';
$this->params['breadcrumbs'][] = $this->title;

$search = (Yii::$app->request->queryParams) ? serialize(Yii::$app->request->queryParams) : '';
$searchModel->sale_date = ($searchModel->sale_date)? $searchModel->sale_date : date('Y');

?>
<div class="sale-index ibox float-e-margins ibox-content">

    <?php echo $this->render('_search', ['model' => $searchModel, 'year' => $searchModel->sale_date]); ?>

    <input type="hidden" id="year_sale" value="<?= $searchModel->sale_date ?>">

    <h1>Sales Performance <em class="green"><?= $searchModel->sale_date ?></em></h1>

    <div class="flot-chart">
        <div class="flot-chart-content" id="flot-line-chart"></div>
        <span> &nbsp; &nbsp; &nbsp; &nbsp;Jan</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Feb</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mar</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Apr</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;May</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jun</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jul</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Aug</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sep</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Oct</span>
        <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nov</span>
        <span> &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dec</span>
    </div> <br><br> <hr>


    <?= Html::a('<i class="fa fa-print"></i> Create Report', 
        ['report', 'search' => $search, 'year' => $searchModel->sale_date], 
        ['class' => 'btn btn-primary']) 
    ?> 

    <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="10">
        <thead>
            <tr>
                <th data-hide="all"></th>  
                <th data-toggle="true">TRANSACTION ID</th>
                <th>TOTAL</th>
                <th>DATE</th>
                <th>INCHARGE</th>
            </tr>
        </thead>
        <tbody>
            <?= ListView::widget([
                'dataProvider' => $dataProvider,
                'itemView' => '_sale'
            ])?> 
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5">
                    <ul class="pagination pull-right"></ul>
                </td>
            </tr>
        </tfoot>
    </table>

</div>

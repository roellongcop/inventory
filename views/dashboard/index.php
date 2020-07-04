<?php
/* @var $this yii\web\View */
$this->params['page'] = 'Dashboard';
$this->title = 'Dashboard';
?>


<div class="row">
    <div class="col-md-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right"><?= date('Y') ?></span>
                <h5>Sales This Year</h5> 
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">₱  <?= Yii::$app->template->getSales('Y') ?></h1>
                <!-- <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i></div> -->
                <small>Total income</small>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-info pull-right"><?= date('M') ?></span>
                <h5>Sales This Month</h5> 
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">₱  <?= Yii::$app->template->getSales('m') ?></h1>
                <!-- <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div> -->
                <small>Total income</small>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-primary pull-right">Week <?= date('W') ?></span>
                <h5>Sales This Week</h5> 
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">₱  <?= Yii::$app->template->getSales('W') ?></h1>
                <!-- <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i></div> -->
                <small>Total income</small>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-danger pull-right"><?= date('D') ?></span>
                <h5>Sales This Day</h5> 
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">₱  <?= Yii::$app->template->getSales('d') ?></h1>
                <!-- <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div> -->
                <small>Total income</small>
            </div>
        </div>
    </div>
</div>

<div class="row"> 
    <div class="col-md-8">
        <div class="ibox float-e-margins">
            <div class="ibox-title"> 
                <h5>Sales Presentation (<?= date('Y') ?>)</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a> 
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="flot-chart">
                    <div class="flot-chart-content" id="flot-line-chart"></div>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp;Jan</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Feb</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp;Mar</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Apr</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;May</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Jun</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Jul</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Aug</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Sep</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Oct</span>
                    <span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Nov</span>
                    <span> &nbsp; &nbsp; &nbsp; Dec</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Stock Status</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                     
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="flot-chart">
                    <div class="flot-chart-pie-content" id="flot-pie-chart"></div>
                </div>
            </div>
        </div>
    </div>
</div> 


<div class="row"> 
    <div class="col-md-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Fast Moving Products</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a> 
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="flot-chart">
                    <canvas id="fast" height="130"></canvas>
                </div>
            </div>
        </div>
    </div> 
    <div class="col-md-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Slow Moving Products</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a> 
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="flot-chart">
                    <canvas id="slow" height="130"></canvas>
                </div>
            </div>
        </div>
    </div> 
</div> 

<div class="row">
    <div class="col-md-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Not Moving Products</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a> 
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="flot-chart">
                    <canvas id="not" height="60"></canvas>
                </div>
            </div>
        </div>
    </div> 
</div>
<?php
use yii\widgets\Breadcrumbs;
use yii\helpers\Html;
?>
<div id="wrapper">
    <?php if(Yii::$app->user->identity->user) : ?>
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <div class="row">
                            <div class="col-md-6">
                                <img alt="image" class="img-circle" src="<?= Yii::$app->urlManager->baseUrl ?>/img/profile_small.png" width="50" height="50">
                            </div>                        
                            <div class="col-md-6 text-center">
                                <span class="block m-t-xs"> 
                                    <strong class="font-bold white">
                                        <?= ucwords(Yii::$app->user->identity->username) ?>
                                    </strong>
                                </span>
                                <span class="text-muted text-xs block">
                                    <?= Yii::$app->user->identity->user ?>
                                </span> 
                            </div>
                        </div> 
                    </div>
                    <div class="logo-element"> SET </div>
                </li>

                <li class="<?= ($this->params['page'] == 'Counter') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-shopping-cart"></i> <span class="nav-label">Counter</span>', ['counter/index']) ?>
                </li>

                <li class="<?= ($this->params['page'] == 'Dashboard') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-dashboard"></i> <span class="nav-label">Dashboard</span>', ['dashboard/index']) ?>
                </li>  

                <?php if(Yii::$app->user->identity->user == 'Administrator') : ?>
                <li class="<?= ($this->params['page'] == 'Sales') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-paypal"></i> <span class="nav-label">Sales</span>', ['sale/index']) ?>
                </li>  
                <?php endif; ?>

                <li class="<?= ($this->params['page'] == 'Statistics') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-bar-chart"></i> <span class="nav-label">Statistics</span>', ['statistics/index']) ?>
                </li>

                <li class="<?= ($this->params['page'] == 'Items') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-dropbox"></i> <span class="nav-label">Items</span>', ['item/index']) ?>
                </li> 

                <li class="<?= ($this->params['page'] == 'Suppliers') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-truck"></i> <span class="nav-label">Suppliers</span>', ['supplier/index']) ?>
                </li> 

                <li class="<?= ($this->params['page'] == 'Categories') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-th-large"></i> <span class="nav-label">Categories</span>', ['category/index']) ?>
                </li> 
                
                <li class="<?= ($this->params['page'] == 'Units') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-wrench"></i> <span class="nav-label">Unit of Measurement</span>', ['unit/index']) ?>
                </li> 
                  
                <li class="<?= ($this->params['page'] == 'Profile') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-user"></i> <span class="nav-label">Profile</span>', ['user/view', 'id' => Yii::$app->user->identity->id]) ?>
                </li> 

                <?php if(Yii::$app->user->identity->user == 'Administrator') : ?>
                <li class="<?= ($this->params['page'] == 'Users') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-group"></i> 
                        <span class="nav-label">Users</span>', 
                        ['user/index']) 
                    ?>
                </li> 
                <li class="<?= ($this->params['page'] == 'Abouts') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-info-circle"></i> <span class="nav-label">About Us</span>', ['about/index']) ?>
                </li> 
                <li class="<?= ($this->params['page'] == 'Logs') ? 'active' : '' ?>">
                    <?= Html::a('<i class="fa fa-book"></i> <span class="nav-label">Logs</span>', ['log/index']) ?>
                </li>
                <?php endif; ?>

              
            </ul>
        </div>
    </nav>
    <?php endif; ?>
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" action="http://webapplayers.com/inspinia_admin-v2.3/search_results.html">
                        <div class="form-group"><br> 
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right"> 
                    <li style="margin-top: 10px;">
                        <?php if(!Yii::$app->user->isGuest) : ?>
                        <?= Html::beginForm(['/site/logout'], 'post') ?>
                            <?= Html::submitButton('<i class="fa fa-power-off"></i> Logout', [
                                'class' => 'btn btn-warning logout'
                            ]) ?>
                        <?= Html::endForm() ?>
                        <?php endif; ?>
                    </li>
                    <!-- <li>
                        <a class="right-sidebar-toggle">
                            <i class="fa fa-tasks"></i>
                        </a>
                    </li> -->
                </ul>
                <br>
            </nav>
        </div>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-7">
                <h2><?= Html::encode($this->title) ?></h2>
                <?= Breadcrumbs::widget([
                	'homeLink' => ['label' => 'Dashboard', 'url' => ['dashboard/index']],
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                ]) ?>
            </div>
            <div class="col-sm-5">
                <div class="title-action">
                    <div class="input-group addToCart"> 
                        <!-- <select class="form-control select2" id="selected" autofocus="true">
                            <option disabled selected>Select Here</option>
                            <option v-for="(item, index) in items" :value="item.serial"> 
                                {{ item.name + ' - ' + item.serial}} 
                            </option>
                        </select> -->
                        <input
                            list="list-itembox" 
                            id="search-barcode" 
                            type="text" 
                            class="form-control" 
                            v-model="search" 
                            placeholder="Scan Barcode" 
                            autofocus="autofocus"> 

                        <datalist id="list-itembox">
                            <option v-for="(item, index) in items" :value="item.serial"> 
                                {{ ' - ' + item.name}} 
                            </option>
                        </datalist> 

                        <span class="input-group-btn"> 
                            <!-- <button class="btn btn-primary" @click="addToCart"> -->
                            <button class="btn btn-primary" data-toggle="modal" data-target="#item-search">
                                Search <i class="fa fa-search"></i>
                            </button> 
                        </span>
                    </div>

                     <?= (isset($this->params['create']))? $this->params['create'] : '' ?>
                </div>
            </div>
        </div>


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <!-- <div class="ibox float-e-margins">
                        <div class="ibox-content"> -->
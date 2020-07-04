<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;

class DashboardController extends \yii\web\Controller
{
	/**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => Yii::$app->params['actions']['index'],
                'rules' => [
                    [
                        'actions' => Yii::$app->params['actions']['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ]
        ];
    }

    public function actionIndex()
    {
        return $this->render('index');
    }

}

<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\PasswordResetForm;
use app\models\NewPasswordForm;
use app\models\User;
use app\models\About;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->redirect(['login']);
        // return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        $this->layout = 'login';

        // if (!Yii::$app->user->isGuest) {
        //     return $this->goHome();
        // }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect(['dashboard/index']);
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
            'about' => About::findOne(1)
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionPasswordResetForm()
    {
        $this->layout = 'login';

        $model = new PasswordResetForm();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {

            return $this->redirect([
                '/new-password-form', 
                'authKey' => $model->authKey
            ]);
        }

        return $this->render('password_reset_form', [
            'model' => $model,
        ]);
    }


    public function actionNewPasswordForm($authKey)
    {
        $this->layout = 'login';

        $model = new NewPasswordForm();
        $user = User::findOne(['authKey' => $authKey]);

        if (! $user) {
            return $this->goHome();
        }
        
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $user->password_confirm = $model->password_confirm;
            $user->password = $model->password;
            $user->save();
            Yii::$app->session->setFlash('success', 'Password Updated.');
            $this->redirect(['/login']);
        }

        return $this->render('new_password_form', [
            'model' => $model,
            'user' => $user
        ]);
    }


    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}

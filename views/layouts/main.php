<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use app\resources\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <script>var base_url = "<?= Yii::$app->urlManager->baseUrl ?>/"</script>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

    <?= $this->render('@app/views/layouts/header'); ?>

        <?= $content ?>

    <?= $this->render('@app/views/layouts/footer'); ?>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

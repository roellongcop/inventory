<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * ContactForm is the model behind the contact form.
 */
class NewPasswordForm extends Model
{
    public $password; 
    public $password_confirm; 

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [ 
            [['password', 'password_confirm'], 'required'], 
            [['password', 'password_confirm'], 'string', 'min' => 6], 
            [['password', 'password_confirm'], 'validatePassword'], 
        ];
    }

    /**
     * @return array customized attribute labels
     */
    public function attributeLabels()
    {
        return [
            'password' => 'New Password',
            'password_confirm' => 'Confirm Password',
        ];
    }

    public function validatePassword($attribute, $params)
    {
        if ($this->password != $this->password_confirm) {
            $this->addError($attribute, 'Password not Match.');
        }
    }
  
}

<?php

class ItemController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/home';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('login'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('index','view','create','update','create2','scanner','scan','qrcode'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Item;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Item']))
		{
			$model->attributes=$_POST['Item'];
			if($model->save())
				$this->redirect(array('index','id'=>$model->id_item));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}
	public function actionCreate2()
	{
		$model=new Item;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Item']))
		{
			$model->attributes=$_POST['Item'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_item));
		}

		$this->render('create2',array(
			'model'=>$model,
		));
	}
	public function actionScanner()
	{
		
			$this->render('scanner');
		

	}


	public function actionScan()
	{
		
			$this->render('scan');
		

	}

	public function actionQrcode()
	{
		
			$this->render('qrcode');
		

	}

	public static function getItemBarcode($valueArray) {
        $elementId = $valueArray['id_item'] . "_bcode"; /*the div element id*/
        $value = $valueArray['barocde'];
        $type = 'code128'; /* you can set the type dynamically if you want valueArray eg - $valueArray['type']*/
        self::getBarcode(array('elementId' => $elementId, 'value' => $value, 'type' => $type)); 
 		return CHtml::tag('div', array('id' => $elementId));
	}
	
	public static function getBarcode($optionsArray) {
 
        Yii::app()->getController()->widget('ext.Yii-Barcode-Generator.Barcode', $optionsArray);
    }

	
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Item']))
		{
			$model->attributes=$_POST['Item'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_item));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}



	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Item');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Item('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Item']))
			$model->attributes=$_GET['Item'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Item the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Item::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Item $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='item-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}

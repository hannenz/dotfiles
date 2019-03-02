<?php
namespace Foo;

use Contentomat\PsrAutoloader;
use Foo\Bar;

class BarController extends ApplicationController {


	/**
	 * @var \Foo\Bar
	 * @access protected
	 */
	protected $Bar;



	/**
	 * Initialization
	 * 
	 * @access public
	 * @return void
	 */
	public function init() {
	}



	/**
	 * Setup actions
	 *
	 * @access public
	 * @param string $action
	 * @return void
	 */
	public function initActions($actions = '') {

		parent::initActions();

		if (!empty($action)) {
			$this->action = $action;
		}
	}



	/**
	 * Default action
	 *
	 * @access public
	 * @return void
	 */
	public function actionDefault() {
	}
}

$autoload = new PsrAutoloader();
$autoload->addNamespace('Foo', PATHTOWEBROOT . "phpincludes/classes");
$autoload->addNamespace('Contentomat', INCLUDEPATHTOADMIN . "classes");

$ctl = new BarController();
$content = $crl->work();

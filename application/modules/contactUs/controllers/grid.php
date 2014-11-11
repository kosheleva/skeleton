<?php
/**
 * Grid of contact us messages
 */
namespace Application;

use Bluz\Proxy\Layout;
use Bluz\Proxy\Request;
use Bluz\Controller;

return
    /**
     * @param string $mark
     * @param int $id
     * @param boolean $value
     * @return void
     */
    function ($mark, $id, $value) use ($view, $module, $controller) {
        /**
         * @var Bootstrap $this
         * @var \Bluz\View\View $view
         */
        Layout::setTemplate('dashboard.phtml');
        Layout::breadCrumbs(
            [
                $view->ahref('Dashboard', ['dashboard', 'index']),
                __('Contact Us')
            ]
        );

        if (Request::isXmlHttpRequest()) {
            if ($mark == 'read') {
                ContactUs\Table::updateRead($id, $value);
            }
            if ($mark == 'answered') {
                ContactUs\Table::updateAnswered($id, $value);
            }
        }

        $grid = new ContactUs\Grid();
        $grid->setModule($module);
        $grid->setController($controller);

        $view->grid = $grid;
    };

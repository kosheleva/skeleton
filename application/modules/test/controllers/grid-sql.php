<?php
/**
 * Example of grid
 *
 * @author   Anton Shevchuk
 * @created  27.08.12 10:08
 */
namespace Application;

use Application\Test;
use Bluz\Proxy\Layout;

return
/**
 * @return \closure
 */
function () use ($view, $module, $controller) {
    /**
     * @var Bootstrap $this
     * @var \Bluz\View\View $view
     */
    Layout::breadCrumbs(
        [
            $view->ahref('Test', ['test', 'index']),
            'Grid with SQL',
        ]
    );
    $grid = new Test\SqlGrid();
    $grid->setModule($module);
    $grid->setController($controller);
    // just example of same custom param for build URL
    $grid->setParams(['id'=>5]);

    $view->grid = $grid;
};

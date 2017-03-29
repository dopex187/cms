<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;


/**
 * Map controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Map extends Controller
{
    /**
     * Index method.
     *
     * Default action to execute.
     *
     * @return string Module content.
     */
    public function index() : string
    {
        $this->_triad->View->render();
    }
}

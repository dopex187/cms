<?php
namespace Application\Module\Controller;

use \Alexya\Foundation\Controller;

/**
 * Start page controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Start extends Controller
{
    /**
     * Renders the module.
     *
     * @return string Page content.
     */
    public function index() : string
    {
        return $this->_triad->View->render();
    }
}

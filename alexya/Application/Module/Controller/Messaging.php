<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

/**
 * Messaging controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Messaging extends Controller
{
    /**
     * Index method.
     *
     * Default action to execute.
     *
     * @return string Response content.
     */
    public function index() : string
    {
        return $this->_triad->View->render();
    }
}

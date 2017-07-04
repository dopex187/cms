<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

/**
 * Trade controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Trade extends Controller
{
    /**
     * Index method.
     *
     * Default action to execute.
     *
     * @return string Response contents.
     */
    public function index() : string
    {
        return $this->_triad->Presenter->render();
    }
}

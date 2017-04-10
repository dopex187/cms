<?php
namespace Application\Module\Presenter;

use Alexya\Foundation\Presenter;

/**
 * Trade presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Trade extends Presenter
{
    /**
     * On instance method.
     *
     * Sets views variables.
     */
    public function onInstance()
    {
        $this->_triad->View->set("items", $this->_triad->Model->items);
    }
}

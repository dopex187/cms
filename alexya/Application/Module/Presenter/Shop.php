<?php
namespace Application\Module\Presenter;

use \Alexya\Database\ORM\Model;
use \Alexya\Foundation\Presenter;
use \Alexya\Http\Response;

/**
 * Shop page presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Shop extends Presenter
{
    /**
     * Sets view's variables.
     */
    public function onInstance()
    {
        $category = $this->_request->uri()[3] ?? "";
        $items    = Model::all([
            "category" => $category
        ], "items");

        if(empty($items)) {
            Response::redirect("/Shop/Ships");
        }

        $this->_triad->View->set("items", $items);
    }
}

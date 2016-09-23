<?php
namespace Application\API\Controller;

use \Alexya\Foundation\Controller;

/**
 * Item's API.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Items extends Controller
{
    /**
     * Default action.
     *
     * @return array Error showing that no action is available.
     */
    public function index() : array
    {
        return [
            "result" => "error",
            "error"  => t("No action is available!")
        ];
    }

    /**
     * Returns an item from the database.
     *
     * @param int id Item id.
     */
    public function item($id) : array
    {
        if(!is_numeric($id)) {
            return $this->index();
        }

        $item = Model::find($id, -1, "items");
        if(empty($item)) {
            return [
                "result" => "error",
                "error"  => t("Item does not exist!")
            ];
        }

        return [
            "result" => "success",
            "item"   => $item->columns()
        ];
    }
}

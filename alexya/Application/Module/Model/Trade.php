<?php
namespace Application\Module\Model;

use Alexya\Container;
use Alexya\Foundation\Model;

use Application\API;

/**
 * Trade model.
 *
 * @property array $items Items from hourly trade.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Trade extends Model
{
    /**
     * On instance method.
     */
    public function onInstance()
    {
        /**
         * API instance.
         *
         * @var API $API
         */
        $API = Container::get("API");

        $items = $API->get("trade_items", [
            "category" => 1
        ]);

        $this->items = [];

        if(!$items->isError) {
            return;
        }

        foreach($items->result as $result) {
            $account = $this->_account($result->accounts_id, $API);
            $item    = $this->_item($result->items_id, $API);

            $i = [
                "account"     => $account,
                "items"       => $item,
                "trade_items" => $result
            ];

            $this->items[] = $i;
        }
    }

    /**
     * Returns the account.
     *
     * @param int $id  Account ID.
     * @param API $API API instance.
     *
     * @return object Account for `$id`.
     */
    private function _account(int $id, API $API) : object
    {
        $ret = json_decode('{"name":"-","id":0}');

        $account = $API->get("accounts", [
            "id" => $id
        ]);

        if($account->isError) {
            return $ret;
        }

        return $account->result[0];
    }

    /**
     * Returns the item.
     *
     * @param int $id  Item ID.
     * @param API $API API instance.
     *
     * @return object Item for `$id`.
     */
    private function _item(int $id, API $API) : object
    {
        $ret = json_decode('{"id":0,"category":"","name":"","type":""}');

        $item = $API->get("items", [
            "id" => $id
        ]);

        if($item->isError) {
            return $ret;
        }

        return $item->result[0];
    }
}

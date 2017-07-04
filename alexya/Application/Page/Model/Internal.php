<?php
namespace Application\Page\Model;

use Alexya\Container;
use Alexya\Foundation\Model;

/**
 * Internal page model.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Internal extends Model
{
    /**
     * On instance method.
     *
     * Adds model variables to the array.
     */
    public function onInstance()
    {
        $this->account = Container::get("Account");
        $this->news    = Container::get("API")->get("news", [
            "sort"  => "-id",
            "limit" => 10
        ])->result;

        $this->translationVars = [
            "SERVER_NAME"           => Container::get("Server")->name,
            "UNREAD_MESSAGES_COUNT" => 0,
            "EXP_FOR_NEXT_LEVEL"    => 0
        ];
    }
}

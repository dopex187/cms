<?php
namespace Application\Module\Model;

use Alexya\Container;
use Alexya\Foundation\Model;
use Application\ORM\Account;

/**
 * Start page model.
 *
 * @property string      serverTime
 * @property string      serverDate
 * @property array|mixed accountsRanking
 * @property array|mixed clansRanking
 * @property array|mixed upcomingEvents
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Start extends Model
{
    /**
     * Sets variables.
     */
    public function onInstance()
    {
        $this->serverTime = "00:00 AM";
        $this->serverDate = "25/12/2000";

        $this->accountsRanking = $this->_getAccountRanking();
        $this->clansRanking    = $this->_getClanRanking();

        $this->upcomingEvents = [];
    }

    /**
     * Returns the account ranking array.
     *
     * @return array Account ranking array.
     */
    private function _getAccountRanking() : array
    {
        $result = Container::get("API")->get("accounts", [
            "sort"         => "-rank_points",
            "limit"        => 8,
            "factions_id!" => "NULL"
        ])->result;
        $ret    = [];

        foreach($result as $val) {
            $ret[] = Account::debug((array)$val);
        }
        $ret[] = Container::get("Account");

        return $ret;
    }

    /**
     * Returns the clan ranking array.
     *
     * @return array Clan ranking array.
     */
    private function _getClanRanking() : array
    {
        $result = Container::get("API")->get("clans", [
            "sort"  => "-rank_points",
            "limit" => 10
        ])->result;

        if(Container::get("Account")->Clan != null) {
            $result[count($result) - 1] = Container::get("Account")->Clan;
        }

        return $result;
    }
}

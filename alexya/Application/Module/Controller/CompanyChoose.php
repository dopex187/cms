<?php
namespace Application\Module\Controller;

use Alexya\Container;
use Alexya\Foundation\Controller;

/**
 * CompanyChoose module controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class CompanyChoose extends Controller
{
    /**
     * Renders and returns the page.
     *
     * @return string Page content.
     */
    public function index() : string
    {
        return $this->_triad->Presenter->render();
    }

    /**
     * Chooses a faction.
     *
     * @param string $id New faction id.
     *
     * @return string API response.
     */
    public function choose(string $id) : string
    {
        /**
         * API Object.
         *
         * @var \Application\API $API
         */
        $API = Container::get("API");

        /**
         * Account object.
         *
         * @var \Application\ORM\Account $Account
         */
        $Account = Container::get("Account");

        $result = [
            "result" => false
        ];

        if(
            !$Account->isLogged() ||
            !is_numeric($id)      ||
            ($id < 1 || $id > 3)
        ) {
            return json_encode($result);
        }

        $result = $API->get("changeFaction", [
            "factions_id" => $id,
            "session_id"  => $Account->session_id
        ]);

        return json_encode($result);
    }
}

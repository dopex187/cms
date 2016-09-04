<?php
namespace Application\ORM;

use \Alexya\Container;
use \Alexya\Database\ORM\Model as ORM;

/**
 * Account object.
 *
 * Represents user's account from database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Account extends ORM
{
    ///////////////////////////////////
    // Static methods and properties //
    ///////////////////////////////////

    /**
     * ORM relations.
     *
     * @var array
     */
    protected static $_relations = [
        "Accounts\\Equipment\\Hangar" => [
            "setRelations" => true
        ],
        "Faction",
        "Rank",
        "Clan" => [
            "condition" => "\\Aplication\\ORM\\Account::canSetClan"
        ]
    ];

    /**
     * Checks if the account can set ORM relation clan.
     *
     * @param array $columns Database columns.
     */
    public static function canSetClan(array $columns) : bool
    {
        return ($columns["clans_id"] > 0);
    }

    ///////////////////////////////////////
    // Non static methods and properties //
    ///////////////////////////////////////

    /**
     * Sount is 100% instantiated (aka user is logged in), `false` if not.
     */
    public function isLogged() : bool
    {
        return !empty($this->_data["id"]);
    }

    /**
     * Checks that the account has successfully verified the
     * invitation code.
     *
     * @return bool `true` if account has verified the invitation code, `false` if not.
     */

    public function hasVerifiedInvitationCode() : bool
    {
        // TODO compare invitation code with database
        return (Container::Session()->invitation["verified"] ?? false);
    }
}

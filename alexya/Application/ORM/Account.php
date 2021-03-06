<?php
namespace Application\ORM;

use Alexya\Container;
use Alexya\Database\ORM\Model;
use Alexya\Tools\Str;
use Httpful\Response;

/**
 * Account class ORM.
 *
 * Can represent a database row, an API result or debug from the config files.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Account extends Model
{
    ///////////////////////////////////
    // Static methods and properties //
    ///////////////////////////////////

    /**
     * Returns an empty Account object.
     *
     * @return \Application\ORM\Account Empty account object.
     */
    public static function empty() : Account
    {
        return new Account();
    }

    /**
     * Returns an Account object from the debug array.
     *
     * @param array $settings Debug settings.
     *
     * @return \Application\ORM\Account Account object.
     */
    public static function debug(array $settings) : Account
    {
        $rows      = [];
        $relations = [];

        foreach($settings as $key => $value) {
            $firstChar        = substr($key, 0, 1);
            $firstCharIsUpper = (strtoupper($firstChar) == $firstChar);

            if(is_array($value) && $firstCharIsUpper) {
                $relations[$key] = $value;

                continue;
            }

            $rows[$key] = $value;
        }

        $account = new Account($rows);

        foreach($relations as $class => $rows) {
            $name = $class;

            if(!Str::startsWith($class, "\\")) {
                $class = "\\Application\\ORM\\{$class}";
            }

            if(!class_exists($class)) {
                $class = "\\Alexya\\Database\\ORM\\Model";
            }

            $exploded = explode("\\", $class);

            if($class != "\\Alexya\\Database\\ORM\\Model") {
                $name = $exploded[count($exploded) - 1];
            }

            $account->{$name} = new $class($rows);
        }

        return $account;
    }

    /**
     * Returns an Account object from an API response.
     *
     * @param mixed $response API response.
     *
     * @return \Application\ORM\Account Account object.
     */
    public static function api($response) : Account
    {
        if($response->isError) {
            return Account::empty();
        }

        return Account::debug((array)$response->result[0]);
    }

    ///////////////////////////////////////
    // Non static methods and properties //
    ///////////////////////////////////////

    /**
     * Checks whether the account is logged or not.
     *
     * @return bool `true` if account is logged in, `false` if not.
     */
    public function isLogged() : bool
    {
        return !empty(($this->id ?? ""));
    }

    /**
     * Dynamically set references.
     *
     * @param string $name Requested property.
     *
     * @return mixed Property value.
     */
    public function __get(string $name)
    {
        if(isset($this->_data[$name])) {
            return $this->_data[$name];
        }

        // Check that first character is uppercase.
        $chr = substr($name, 0, 1);
        if(strtolower($chr) == $chr) {
            return null;
        }

        $command = Str::snake(Str::plural($name));
        $key     = Str::snake([$command, "id"]);

        if(!array_key_exists($key, $this->_data)) {
            return null;
        }

        $value = $this->_data[$key];

        /**
         * API object.
         *
         * @var \Application\API $api
         */
        $api = Container::get("API");
        $response = $api->get($command, [
            "id" => $value
        ]);

        if($response->isError) {
            return null;
        }

        $this->_data[$name] = $response->result[0];

        return $this->_data[$name];
    }
}

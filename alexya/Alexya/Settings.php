<?php
namespace Alexya;

/**
 * Settings class.
 *
 * This class offers an interface for handling configurations.
 *
 * The constructor accepts as parameter an array with the configuration values.
 *
 * To retrieve a value use the method `get` which accepts as parameter the name of the value.
 *
 * Example:
 *
 * ```php
 * $settings = new \Alexya\Settings([
 *     "autologin" => true,
 *     "data"      => [
 *         "username" => "test",
 *         "password" => "test"
 *     ]
 * ]);
 *
 * if($settings->get("autologin")) {
 *     echo "Loggin ". $settings->get("data.username") .":". $settings->get("data.password");
 * }
 * ```
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Settings
{
    /**
     * Settings array.
     *
     * @var array
     */
    private $_settings = [];

    /**
     * Will set up the settings array.
     *
     * @param array $settings Settings to load.
     */
    public function __construct(array $settings)
    {
        $this->_settings = $settings;
    }

    /**
     * Returns the value of an entry.
     *
     * The parameter is a string that represents the name of the settings.
     *
     * @param mixed $name Property to return.
     *
     * @return mixed Property value.
     */
    public function get($name)
    {
        $name  = explode(".", $name);
        $value = $this->_settings;

        $size = sizeof($name);
        for($i = 0; $i < $size; $i++) {
            if(isset($value[$name[$i]])) {
                $value = $value[$name[$i]];
            }
        }

        return $value;
    }

    /**
     * Sets a setting.
     *
     * @param mixed $name  Property to set.
     * @param mixed $value Property value.
     *
     * @return bool Whether it was properly set or not.
     */
    public function set($name, $value)
    {
        $name   =  explode(".", $name);
        $values =& $this->_settings;

        $size = sizeof($name);
        for($i = 0; $i < $size; $i++) {
            if(!is_array($values)) {
                continue;
            }

            if(!isset($values[$name[$i]])) {
                $values[$name[$i]] = $value;

                return true;
            }

            $values = $values[$name[$i]];
        }

        return false;
    }
}

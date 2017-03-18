<?php
namespace Alexya\Tools\Session;

/**
 * Results class.
 *
 * This class offers a powerful way of storing variables and keep them between
 * requests.
 *
 * It saves the variables in the session and deletes them once they're requested.
 *
 * Before using this class you must call the method `initialize` which accepts
 * as parameter an object of type `\Alexya\Session\Session` that will be used
 * to interact with the `$_SESSION` array.
 *
 * There are two types of results:
 *
 *  * Flash results
 *  * Permanent results
 *
 * Flash results only stay in session until they're requested. After that they're deleted.
 * Permanent results stay in session until they're deleted through the method `delete`.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Results
{
    /**
     * Session object.
     *
     * @var Session
     */
    private static $_session;

    /**
     * Sets session object.
     *
     * @param  Session $session Session where results will be saved.
     */
    public static function initialize(Session $session)
    {
        static::$_session = $session;

        if(!static::$_session->exists("_RESULTS")) {
            static::$_session->set("_RESULTS", []);
        }
    }

    /**
     * Adds a permanent result.
     *
     * @param string $name   Result name.
     * @param mixed  $result Result to add.
     */
    public static function permanent(string $name, $result)
    {
        $results = static::$_session->get("_RESULTS");

        $results[$name] = [
            "type"   => "permanent",
            "result" => $result
        ];

        static::$_session->set("_RESULTS", $results);
    }

    /**
     * Adds a flash result.
     *
     * @param string $name   Result name.
     * @param mixed  $result Result to add.
     */
    public static function flash(string $name, $result)
    {
        $results = static::$_session->get("_RESULTS");

        $results[$name] = [
            "type"   => "flash",
            "result" => $result
        ];

        static::$_session->set("_RESULTS", $results);
    }

    /**
     * Deletes a result.
     *
     * @param string $name Result name.
     */
    public static function delete(string $name)
    {
        $results = static::$_session->get("_RESULTS");

        $size = sizeof($results);
        for($i = 0; $i < $size; $i++) {
            if($result[$i]["name"] === $name) {
                unset($results[$i]);
            }
        }

        static::$_session->set("_RESULTS", $results);
    }

    /**
     * Returns the results.
     *
     * @param int|string $length Length of the array to return, if string, the name of the result.
     * @param int        $offset Array offset.
     *
     * @return array Array with `$length` results.
     */
    public static function get($length = -1, int $offset = 0) : array
    {
        $ret     = [];
        $results = static::$_session->get("_RESULTS");

        if(
            !is_numeric($length)     &&
            isset($results[$length])
        ) {
            $ret = $results[$length]["result"];

            if($results[$length]["type"] === "flash") {
                unset($results[$length]);
            }

            static::$_session->set("_RESULTS", $results);

            return $ret;
        }

        $size = sizeof($results);
        for($i = 0; $i < $size; $i++) {
            if(!isset($results[$i])) {
                continue;
            }

            if($offset > 0) {
                $offset--;
                continue;
            }

            $ret[] = $results[$i]["result"];

            if($results[$i]["type"] === "flash") {
                unset($results[$i]);
            }

            if($length === $i) {
                break;
            }
        }

        static::$_session->set("_RESULTS", $results);

        return $ret;
    }
}

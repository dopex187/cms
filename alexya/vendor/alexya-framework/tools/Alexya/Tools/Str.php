<?php
namespace Alexya\Tools;

/**
 * String helpers.
 *
 * This class offers helpers for string manipulation.
 *
 * Method summary:
 *
 * |    Name    |                             Parameters                              |   Return type   |                                                                Description                                                               |
 * |------------|:-------------------------------------------------------------------:|:---------------:|------------------------------------------------------------------------------------------------------------------------------------------|
 * | startsWith |                   `string $base`, `string $starts`                  |     `bool`      | Checks that `$base` starts with `$starts`, returns `true` if so, `false` if not.                                                         |
 * | endsWith   |                    `string $base`, `string $ends`                   |     `bool`      | Checks that `$base` ends with `$ends`, returns `true` if so, `false` if not.                                                             |
 * | contains   |                  `string $base`, `string/array $str                 |     `bool`      | Checks that `$base` contains any of `$str`, returns `true` if so, `false if not`.                                                        |
 * | snake      |                         `string/array $str`                         |    `string`     | Returns `$str` as `snake_case`.                                                                                                          |
 * | camel      |                         `string/array $str`                         |    `string`     | Returns `$str` as `camelCase`.                                                                                                           |
 * | singular   |                         `string/array $str`                         | `string/array`  | Returns the singular form of `$str`.                                                                                                     |
 * | plural     |                         `string/array $str`                         | `string/array`  | Returns the plural form of `$str`.                                                                                                       |
 * | trailing   |           `string $base`, `string $tail`, `bool $required`          |    `string`     | If `$required` is set to `true` (default), returns `$base` with `$tail` (if it's not present), if not, returns `$base` without `$tail`.  |
 * | random     |                `int $length`, `string/array $chars`                 |    `string`     | Returns a random string of `$length` with `$chars`.                                                                                      |
 * | placehold  | `string $format`, `array $placeholders`, `string/array $delimiters` |    `string`     | Returns formatted `$format` with `$placeholders` wrapped in `$delimiters`. |
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Str
{
    /**
     * Checks that `$base` starts with `$starts`.
     *
     * @param string $base   Base string to check.
     * @param string $starts The starting string.
     *
     * @return bool `true` if `$base` starts with `$starts`, `false` if not.
     */
    public static function startsWith(string $base, string $starts) : bool
    {
        if(
            $starts === "" ||
            strrpos($base, $starts, -strlen($base)) !== false
        ) {
            return true;
        }

        return false;
    }

    /**
     * Checks that `$base` ends with `$ends`.
     *
     * @param string $base Base string to check.
     * @param string $ends The ending string.
     *
     * @return bool `true` if `$base` ends with `$ends`, `false` if not.
     */
    public static function endsWith(string $base, string $ends) : bool
    {
        if($ends === "") {
            return true;
        }

        $temp = strlen($base) - strlen($ends);

        if(
            $temp >= 0 &&
            strpos($base, $ends, $temp) !== false
        ) {
            return true;
        }

        return false;
    }

    /**
     * Checks that `$str` contains `$chars`.
     *
     * If `$chars` is an array and `$str` contains, at least,
     * one of them, `true` will be returned.
     *
     * @param string       $str   String to check.
     * @param string|array $chars Chars that `$str` should contain.
     *
     * @return bool `true` if `$str` contains any of `$chars`, `false` if not.
     */
    public static function contains(string $str, $chars) : bool
    {
        if(is_array($chars)) {
            foreach($chars as $char) {
                if(Str::contains($str, $char)) {
                    // Too much indentation, I'll find another way to organize this
                    return true;
                }
            }
        }

        if(!is_string($chars)) {
            // Maybe throw exception?
            return false;
        }

        if(strpos($str, $chars) !== false) {
            return true;
        }

        return false;
    }

    /**
     * Parses `$str` and returns it as `snake_case`.
     *
     * If `$str` is an array it will assume each index is a word,
     * if not, each word will start with a capital letter or they
     * will be separated by one or more spaces:
     *
     * ```php
     * echo Str::snake(["users", "orm"]); // users_orm
     * echo Str::snake("usersORM"); // users_orm
     * echo Str::snake("users     orm"); // users_orm
     * ```
     *
     * @param string|array $str String to parse.
     *
     * @return string `$str` as `snake_case`.
     */
    public static function snake($str) : string
    {
        if(is_array($str)) {
            return strtolower(implode("_", $str));
        }

        if(!is_string($str)) {
            // Maybe throw exception?
            return "";
        }

        if(Str::contains($str, " ")) {
            // Replace various spaces, each one next to other ("users    orm")
            $str = preg_replace("(\ *)", " ", $str);

            // Replace spaces with underscore and lowercase-fy it
            return strtolower(str_replace(" ", "_", $str));
        }

        // See http://stackoverflow.com/questions/1993721/how-to-convert-camelcase-to-camel-case
        // 'cause copy-pasting is the way to go
        preg_match_all('!([A-Z][A-Z0-9]*(?=$|[A-Z][a-z0-9])|[A-Za-z][a-z0-9]+)!', $str, $matches);
        $ret = $matches[0];

        foreach ($ret as &$match) {
            $match = $match == strtoupper($match) ? strtolower($match) : lcfirst($match);
        }

        return Str::snake($ret);
    }

    /**
     * Parses `$str` and returns it as `camelCase`.
     *
     * If `$str` is an array it will assume each index is a word,
     * if not, each word will be separated by one or more underscores (`_`)
     * or spaces (` `)
     *
     * ```php
     * echo Str::camel(["users", "orm"]); // usersOrm
     * echo Str::camel("users_ORM"); // usersORM
     * echo Str::camel("users     orm"); // usersOrm
     * ```
     *
     * @param string|array $str String to parse.
     *
     * @return string `$str` as `camelCase`.
     */
    public static function camel($str) : string
    {
        if(is_array($str)) {
            $ret  = $str[0];
            $size = sizeof($str);

            for($i = 1; $i < $size; $i++) {
                $ret .= ucfirst($str[$i]);
            }

            return $ret;
        }

        if(!is_string($str)) {
            // Maybe throw exception?
            return "";
        }

        $ret = explode(
            "_",
            preg_replace("/(\s|_)+/", "_", $str)
        );

        return Str::camel($ret);
    }

    /**
     * Returns the plural form of `$word`.
     *
     * If `$word` is an array all indexes will be pluralized
     * and returned.
     *
     * @param string|array $word Word(s) to pluralized.
     *
     * @return string|array The pluralized form of `$word`.
     */
    public static function plural($word)
    {
        if(is_array($word)) {
            $ret = [];
            foreach($word as $key => $value) {
                $ret[$key] = Str::plural($value);
            }

            return $ret;
        }

        if(!is_string($word)) {
            // Exception?
            return "";
        }

        return Inflector::plural($word);
    }

    /**
     * Returns the singular form of `$word`.
     *
     * If `$word` is an array all indexes will be singularized
     * and returned.
     *
     * @param string|array $word Word(s) to singularized.
     *
     * @return string|array The singularized form of `$word`.
     */
    public static function singular($word)
    {
        if(is_array($word)) {
            $keys = array_keys($word);
            $size = sizeof($keys);

            for($i = 0; $i < $size; $i++) {
                $word[$keys[$size]] = Str::singular($word);
            }

            return $word;
        }

        if(!is_string($word)) {
            // Exception?
            return "";
        }

        return Inflector::singular($word);
    }

    /**
     * Returns `$base` with trailing `$tail`.
     *
     * If `$required` is set to true (default), `$base` with `$tail` will be returned.
     * If not, `$base` without `$tail` will be returned:
     *
     * ```php
     * Str::trailing("\\Some\\Namespace\\", "\\"); // \Some\Namespace\
     * Str::trailing("\\Some\\Namespace\\", "\\", false); // \Some\Namespace
     * Str::trailing("SlashRequiredAtTheEnd", "\\"); // SlashRequiredAtTheEnd\
     * Str::trailing("SlashRequiredAtTheEnd\", "\\", false); // SlashRequiredAtTheEnd
     * ```
     *
     * @param string $base     Base string.
     * @param string $tail     Trailing string.
     * @param bool   $required True if `$base` must end with `$tail`, `false` if not (default = `true`).
     *
     * @return string `$base` with (or without) `$tail`.
     */
    public static function trailing(string $base, string $tail, bool $required = true) : string
    {
        if(!Str::endsWith($base, $tail) && $required) {
            return $base.$tail;
        }

        if(Str::endsWith($base, $tail) && !$required) {
            return substr($base, -strlen($tail));
        }

        // I think all possible combinations are already listed
        // however, return `$base` by default.
        return $base;
    }

    /**
     * Generates a random string of `$length` length with `$chars` chars.
     *
     * @param int          $length Length of the string to generate.
     * @param string|array $chars  Chars that the generated string should contain (default = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRSTUVWXYZ").
     *
     * @return string `$length` sized random string with `$chars`.
     */
    public static function random(int $length, $chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRSTUVWXYZ") : string
    {
        if(is_array($chars)) {
            $chars = implode("", $chars);
        }

        if(!is_string($chars)) {
            return "";
        }

        $str = "";
        for($i = 0; $i < $length; $i++) {
            $str .= substr($chars, rand(0, strlen($chars) - 1), 1);
        }

        return $str;
    }

    /**
     * Parses the placeholders for `$format`
     *
     * @param string       $format       String to format.
     * @param array        $placeholders Placeholders.
     * @param string|array $delimiters   Delimiters (default = `["{","}"]`).
     *
     * @return string Formatted `$format` with `$placeholders`.
     */
    public static function placehold(string $format, array $placeholders, $delimiters = ["{","}"]) : string
    {
        if(is_string($delimiters)) {
            $delimiters = [$delimiters, $delimiters];
        }

        foreach($placeholders as $key => $value) {
           $search = $delimiters[0] . $value . $delimiters[1];

           $format = str_replace($search, $value, $format);
        }

        return $format;
    }
}

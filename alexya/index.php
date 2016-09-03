<?php
/**
 * Alexya Framework - The intelligent Loli Framework
 *
 * This file will act as front controller, will load
 * bootstrap.php and call router.
 *
 * In this file you can add your custom routes (if you don't want
 * to add them through [the configuration file](config/routes.php)),
 * define constants, add global variables to the view and so on.
 *
 * The last statement of the file is the call to the router, it should
 * stay the last since (by default) Alexya will finnish the execution once
 * the router has finnished.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */

error_reporting(E_ALL);
ini_set("display_errors", true);

/**
 * Load composer.
 */
if(!require_once("vendor/autoload.php")) {
    die("Please, execute `composer update` in order to install dependencies");
}

\Alexya\Container::Logger()->debug("Request URI: ". \Alexya\Http\Request::main()->uri);

foreach(\Alexya\Container::Settings()->get("application.view_vars") as $key => $value) {
    \Alexya\Foundation\View::global($key, $value);
}

// Set language
$lang = ($_GET["lang"] ?? (\Alexya\Container::Session()["lang"] ?? "en"));
if($lang != \Alexya\Container::Session()["lang"]) {
    \Alexya\Container::Session()["lang"] = $lang;
}

// Register translator on container
\Alexya\Container::registerSingleton("Translator", function() {
    $translations = [];
    $defaultLang  = \Alexya\Container::Session()["lang"];
    $directory    = \Alexya\FileSystem\Directory::make(ROOT_DIR."translations".DS, \Alexya\FileSystem\Directory::MAKE_DIRECTORY_EXISTS_OPEN);

    // All files from the `translations` directory are suposed to be PHP scripts
    // that returns an array with the translations, the name of each file is
    // is the language name used by the translator.
    foreach($directory->getFiles() as $file) {
        $translations[$file->getName()] = require($file->getPath());
    }

    return new \Alexya\Localization\Translator($translations, $defaultLang);
});

// Translator shortcut function
function t() : string
{
    return \Alexya\Container::Translator()->translate(... func_get_args());
}

\Alexya\Container::Router()->route();

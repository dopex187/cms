BlackEye CMS
============
The best DarkOrbit private server.

CMS Structure
-------------
The core of the CMS (the installation of Alexya) is located in the folder *blackeye* while the folder *public_html* contains the files interpreted by the browser (css, images, js...).

The file *blackeye/TODO.md* contains a list of the things that needs to be done so you don't forget about what you need to do next from day to day.

The CMS is build on top of the [Alexya Framework](https://github.com/manulaiko/alexya) so you should check it for knowing how it works.
There just two pages (they're located on *Application/Page*):
 * Internal page
 * External page

The external page simply prints external page and registers/logins users.
The internal page will load the requested module (they're located on *Application/Module*) and render it.

ORM Classes
-----------
The ORM classes are under the *\Application\ORM* package and are used to translate the database tables to objects.

Between all the ORM classes, the  class *\Application\ORM\Account* is the most important since it's used everywhere. This class represents the user that is currently visitting the website so take a close look to it.

SocksWork
---------
*SocksWork* is the way the CMS will be linked to the emulator for keeping it updated about the things user does on the website (like bidding on auction, buying items...).

The *SocksWork* object is instanced in *index.php* and takes the configuration values from *config/alexya.php*, by default the client connects to *127.0.0.1:1207*.

The packets *SocksWork* sends are located in *Application/Packets* and their structure is on the documentation of each packet.

Localization
------------
When printing texts always use the *\Alexya\Locale\Localization::translate* function (*t* is a shortcut for the function) so the text can be translated whenever it's possible. Also use the functions *\Alexya\Locale\Localization::formatNumber* (*fNumber* as shortcut) and *\Alexya\Locale\Localization::formatDate* (*fDate* as shortcut) for formatting numbers and dates.

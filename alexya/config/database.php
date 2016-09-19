<?php
/**
 * Alexya Framework - The intelligent Loli Framework.
 *
 * This file contains the configuration for the
 * database access.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */

return [
    /**
     * Whether the database should used or not.
     */
    "enabled"    => true,

    /**
     * Server host.
     */
    "host"       => "127.0.0.1",

    /**
     * Server port.
     */
    "port"       => 3306,

    /**
     * Server type.
     */
    "type"       => "mysql",

    /**
     * Server user name.
     */
    "username"   => "root",

    /**
     * Server password.
     */
    "password"   => "",

    /**
     * Database name.
     */
    "database"   => "blackeye",

    /**
     * Alternative PDO options.
     */
    "options"    => [],

    /**
     * Base namespace where ORM models are stored.
     */
    "namespace"  => "\\Application\\ORM\\"
];

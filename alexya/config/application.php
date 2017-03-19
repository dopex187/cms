<?php
/**
 * Alexya Framework - The intelligent Loli Framework
 *
 * Application specific configuration
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */

return [
    /**
     * Server URL.
     */
    "url" => "http://manulaiko.spacebattles.org/",

    /**
     * API server information.
     */
    "api" => [
        /**
         * Whether the API is in debug or not.
         */
        "debug" => false,

        /**
         * Server host.
         */
        "host" => "api.manulaiko.spacebattles.org",

        /**
         * Mocked responses in case API is in debug.
         */
        "mocks" => [
            /**
             * Login response.
             */
            "login" => [
                "result"     => true,
                "session_id" => "0000000000000000"
            ],

            /**
             * CompanyChoose response.
             */
            "accounts/1/chooseFaction" => [
                "result" => true
            ],

            /**
             * News response.
             */
            "news/latest/10" => [

            ]
        ]
    ],

    /**
     * ORM information.
     */
    "orm" => [
        /**
         * From where are going to be loaded ORM classes.
         *
         * Possible values:
         *  * `database` To load them from the database.
         *  * `debug` To load them from this configuration.
         *  * `default` To load them from API server.
         */
        "load_from" => "default",

        /**
         * Account ORM debug info.
         */
        "account" => [
            "id"          => 1, // 0 to flag the account as not logged ina
            "session_id"  => "0000000000000000",
            "factions_id" => 1,
            "name"        => "manulaiko",
            "credits"     => 0,
            "uridium"     => 1,
            "experience"  => 2,
            "honor"       => 3,
            "jackpot"     => 4,

            "Faction" => [
                "id"   => 1,
                "name" => "Mars Mining Operations",
                "tag"  => "mmo"
            ],

            "Ship" => [
                "id" => 1
            ],

            "Level" => [
                "id" => 1
            ],

            "Clan" => [
                "name" => "foo",
                "tag"  => "bar",

                "Rank" => [
                    "position" => 1,
                    "points"   => 0
                ]
            ],

            "Rank" => [
                "id"       => 21,
                "name"     => "yolo",
                "position" => 1,
                "points"   => "a lot of them"
            ]
        ]
    ],

    /**
     * Server information.
     */
    "server" => [
        "title"           => "SpaceBattles Private Server",
        "tags"            => ["game", "darkorbit", "private server", "spacebattles", "spaceshooter"],
        "author"          => "RetarDev",
        "reply_to"        => "",
        "company"         => "RetarDev",
        "name"            => "SpaceBattles",
        "description"     => "The best DarkOrbit Private Server",
        "locales"         => [],
        "registeredUsers" => 0,
        "host"            => "manulaiko.spacebattles.org"
    ]
];

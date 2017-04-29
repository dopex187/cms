<!DOCTYPE html>
<html lang="{$locale->code}">
    <head>
        <meta charset="utf-8" />
        <title>{$server->name}</title>
        <style>
            body {
                margin: 0;
                padding: 0;

                width: 100%;
                height: 100%;
                background: #000000;
            }

            #container {
                position: fixed;
                width: 100%;
                height: 100%;
            }
        </style>
        <script src="http://cdn.jquerytools.org/1.2.6/full/jquery.tools.min.js"></script>
    </head>
    <body>
        <div id="container"></div>
        
        <script>
            flashembed("container", {
                "src": "{$URL}spacemap/loadingscreen.swf",
                "version": [11, 0],
                "bgcolor": "#000000",
                "wmode": "direct",
                "allowfullscreen": "true",
                "allowFullScreenInteractive": "true"
            }, {
                "fullscreen": "1",
                "lang": "{$locale->code}",

                "userID": "{$account->id}",
                "globalID": "{$account->users_id}",
                "sessionID": "{$account->session_id}",
                "basePath": "../spacemap",
                "cdn": "{$URL}",
                "gameclientPath": "../spacemap",
                "gameclientAllowedInitDelay": "10",
                "useDeviceFonts": "0",

                "autoStartEnabled": "1",
                "host": "{$server->host}",
                "loadingClaim": "{t("LOADING")}",
                "btn_label_start": "{t("START")}",
                "pid": 1,
                "mapID": "1",
                "allowChat": "1",
                "chatHost": "{$server->host}"
            });
        </script>
    </body>
</html>

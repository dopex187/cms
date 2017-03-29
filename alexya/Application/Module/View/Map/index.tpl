<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>{$server->name}</title>
    <style type="text/css" media="screen">@import "{$URL}css/cdn/darkorbit.css";</style>

    <meta http-equiv="Content-Language" content="{implode($server->tags, " , ")}">
    <meta name="language" content="{implode($server->tags, " , ")}">
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>

    <script src="{$URL}js/function.js" type="text/javascript"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="{$URL}js/jQuery/jquery.flashembed.js"></script>
    <script type="text/javascript">jQuery.noConflict();</script>
    <script type="text/javascript" src="{$URL}resources/js/tools.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/tools/text.js"></script>

    <script type="text/javascript">
        var textResourcesTitle = {
            "seo_title_client": "{$server->name}",
            "seo_title_client_blinking": "{$server->title} | {t("Game Client")}",
            "seo_title_no_aid": "{$server->name} | {t("MMO & space shooter")}",
            "seo_tittle_clans": "{$server->name} | {t("Clans")}",
            "seo_tittle_pet": "{$server->name} | {t("PET")}",
            "seo_tittle_ships": "{$server->name} | {t("Ships")}",
            "seo_tittle_uridium": "{$server->name} | {t("Uridium")}",
            "seo_tittle_techfactory": "{$server->name} | {t("Tech Factory")}",
            "seo_tittle_hangar": "{$server->name} | {t("Hangar")}",
            "seo_title_standard": "{$server->name}| {t("MMO & space shooter")}",
            "seo_title_achievements": "{$server->name} | {t("Achievements")}",
            "seo_title_shop": "{$server->name} | {t("Shop")}",
            "seo_title_skylab": "{$server->name} | {t("Skylab")}"
        };

        jQuery.each(textResourcesTitle, function (i, n) {
            Tools.Text.setResource(i, n)
        });

    </script>
    <script type="text/javascript" src="{$URL}resources/js/tools/popup.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/tools/errorHandler.js"></script>
    <script type="text/javascript" src="{$URL}resources/js/library.js"></script>
    <script src="{$URL}resources/js/internalMapRevolution.js" type="text/javascript"></script>
    <script type="text/javascript">
        InternalMapRevolution.Initialize();
    </script>
</head>
<body style="background:#000 none; width: 100%; height: 100%; text-align: left;">
    <div id="container" style="width: 100%; height: 100%; position: fixed"></div>
    <iframe src="{$URL}Internal/Map?dontShow=1" name="reloader" width="0" height="0" scrolling="no" marginheight="0" marginwidth="0" frameborder="0"></iframe>
    <!-- affiliatePopupTag -->

    <script type='text/javascript'>
        function onFailFlashembed() {
            var html =
                '<div class="flashFailHead">{t("Get the Adobe Flash Player")}</div>\n'+
                '<div class="flashFailHeadText">{t("In order to play %SERVER_NAME%, you need the latest version of Flash Player. Just install it to start playing!", $translationVars)}\n' +
                '<div class="flashFailHeadLink" style="cursor: pointer">{t("Download the Flash Player here for free:")} <a href=\"http://www.adobe.com/go/getflashplayer\" style=\"text-decoration: underline; color:#A0A0A0;\">{t("Download Flash Player")}<\/a></div></div>'

            jQuery('#container').html(html);
        }

        function expressInstallCallback(info) {
            // possible values for info: loadTimeOut|Cancelled|Failed
            onFailFlashembed();
        }

        jQuery(document).ready(function () {
            /**
             * Send the Flash client version to the Server side
             */
            var aFlashVersion = flashembed.getVersion();

            /* faster */

            /* Fix IE8 Object.keys */

            if (!Object.keys) Object.keys = function (o) {
                if (o !== Object(o))
                    throw new TypeError('Object.keys called on non-object');
                var ret = [], p;
                for (p in o) if (Object.prototype.hasOwnProperty.call(o, p)) ret.push(p);
                return ret;
            };


            var sParam =
                '[' +
                '"jQuery.flashEmbed"' +
                ',"' + aFlashVersion[0] + "." + aFlashVersion[1] + '"' +
                ',"' + Object.keys(jQuery.browser)[0]
                + '"]';

            var data = {
                "action": "setClientBrowserConfig",
                "params": sParam, //null if empty
                "isEncodeMessage": 0 // 1- encode text  // 0 - plain text
            };

            jQuery.post('/flashAPI/loadingScreen.php', data, function (data) {});


            flashembed("container", {
                "onFail": onFailFlashembed,
                "src": "{$URL}spacemap/preloader.swf",
                "version": [11,0],
                "expressInstall": "{$URL}swf_global/expressInstall.swf",
                "width": "100%",
                "height": "100%",
                "wmode": "gpu",
                "bgcolor": "#000000",
                "id": "preloader",
                "allowfullscreen": "true",
                "allowFullScreenInteractive": "true"
            }, {
                "lang": "{$locale->code}",
                "userID": "{$account->id}",
                "sessionID": "{$account->session_id}",
                "basePath": "spacemap",
                "pid": "22",
                "boardLink": "%2FGameAPI.php%3Faction%3Dportal.redirectToBoard",
                "helpLink": "http%3A%2F%2F{$server->host}%2Fforum%2F",
                "loadingClaim": "{t("Loading...")}",
                "chatHost": "{$server->host}",
                "cdn": "{$URL}",
                "useHash": "1",
                "host": "{$URL}",
                "browser": "Firefox",
                "fullscreen": "1",
                "itemXmlHash": "34da376e319a0a3b5a12d2c3e6644300",
                "resourcesXmlHash": "41d20d2569c818deab3fc837b921fb00",
                "resources3dXmlHash": "c4aa8b743ccf485fafde1d9ee3b99d00",
                "resources3dparticlesXmlHash": "bffdf92d7226b3512d4596307ce14600",
                "profileXmlHash": "d77d1a04740e7a5b23d0602dd1c30300",
                "languageXmlHash": "a8189eee9bbf4283eec47fa0ee74ef00",
                "loadingscreenHash": "99e6deee25ceedb4c8cac0ab39c46400",
                "gameclientHash": "d5a9c2d1864fdd704bf777b4427dca00",
                "gameclientPath": "spacemap",
                "loadingscreenAssetsXmlHash": "1c540d399333ca7cc1755735a6082100",
                "crossdomainHash": "5db78b302291863721ccbe04194e7100",
                "showAdvertisingHint": "",
                "gameclientAllowedInitDelay": "10",
                // "eventStreamContext": "eyJwaWQiOjIyLCJ1aWQiOjE2MDI2MTUwNCwidGlkIjoiMDM0YmMyYTQ4MjJjZWNlNmNjYTMwMWJjNjc3MTczMjUiLCJpaWQiOiJhODExYzVjMjA4YWJkOWUzYTc5ZTI5OWNmODYwMTQ4MSIsInNpZCI6IjI2ODc1NGJkNTA1Mjk0ZThlZWU3M2YwNDk4MzAxMzljIiwiY3RpbWUiOjE0OTA3ODU1MDY1NjR9",
                "requestScheme": "https",
                "sharedImages": "https://sharedimages-ns.bpsecure.com/darkorbit/",
                "useDeviceFonts": "0",
                "display2d": "2",
                "autoStartEnabled": "1",
                // "mapID": "",
                "allowChat": "1"
            });


            // jQuery("p#click1").click(function(){
            //     InternalMapRevolution.referToURL("internalDock", "seo_tittle_ships", "internalDockShips", false, null);
            // });
            //
            // jQuery("p#click2").click(function(){
            //     InternalMapRevolution.referToURL("internalDock", "seo_tittle_uridium", "internalDockShips", false, null);
            // });

        });
    </script>

    <style type="text/css">
        #container {
            color: #FFFFFF;
            background: #000000;
        }
    </style>
</body>
</html>

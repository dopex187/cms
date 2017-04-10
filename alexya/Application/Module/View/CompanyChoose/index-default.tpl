<html lang="en">
<head>
    <title>{$server->name} | {$name}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link href="{$theme->url()}css/stylesheets.css" rel="stylesheet" type="text/css">
</head>
<body class="bg-img-num1">
    <div class="page-container" style="padding-top: 10px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <div class="header">
                            <h2 style="color: #FF8787">Mars Mining Operations</h2>
                        </div>
                        <div class="content">
                            <div class="col-md-6">
                                <h2 style="color: #FF8787">{t("Description")}</h2>
                                {t("I'm not going to blow smoke up your tush, so I'll just get straight to the point. We at Mars Mining Operations want you for two reasons: to mine ore and to eradicate all alien scum infecting our galactic sector. Do this successfully and you'll soon be popping rival pilots for thrills and honor!")}</div>
                            </div>
                            <div class="col-md-6">
                                <h2 style="color: #FF8787">{t("Advantages")}</h2>
                                <table class="table">
                                    <tr>
                                        <td>{t("+10% Honor per NPC destroyed")}</td>
                                    </tr>
                                </table>
                            </div>
                            <center style="clear: both">
                                <a class="btn" href="{$URL}Internal/CompanyChoose/choose/1" style="width: 100%; color: #FF8787">{t("Join MMO")}</a>
                            </center>
                        </div>
                    </div>
                    <div class="block">
                        <div class="header">
                            <h2 style="color: #87FFFF">Earth Industries Corporation</h2>
                        </div>
                        <div class="content">
                            <div class="col-md-6">
                                <h2 style="color: #87FFFF">t{("Description")}</h2>
                                {t("Pilot, these are trying times during which only those made of the purest inner steel can prevail! How tough is your mettle? We reward loyalty and impeccable manners with the best lasers Uridium can buy. Join us in the fight to cleanse our sector of all those cretins that stand in our way. For glory and privilege!")}</div>
                            </div>
                            <div class="col-md-6">
                                <h2 style="color: #87FFFF">{t("Advantages")}</h2>
                                <table class="table">
                                    <tr>
                                        <td>{t("+10% Exp per NPC destroyed")}</td>
                                    </tr>
                                </table>
                            </div>
                            <center style="clear: both">
                                <a class="btn" href="{$URL}Internal/CompanyChoose/choose/2" style="width: 100%; color: #87FFFF">t{("Join EIC")}</a>
                            </center>
                        </div>
                    </div>
                    <div class="block">
                        <div class="header">
                            <h2 style="color: #C3FF87">Venus Resources Unlimited</h2>
                        </div>
                        <div class="content">
                            <div class="col-md-6">
                                <h2 style="color: #C3FF87">{t("Description")}</h2>
                                {t("We pride ourselves in our ability to push the envelope of technological advancement, while retaining a communal atmosphere. Some call us a cult desiring galactic domination, but they simply misunderstand our brilliant recruitment methods. We are always looking for talented pilots to help us destroy our enemies and shape humanity's future!")}</div>
                            </div>
                            <div class="col-md-6">
                                <h2 style="color: #C3FF87">{t("Advantages")}</h2>
                                <table class="table">
                                    <tr>
                                        <td>{t("+10% Credits per NPC destroyed")}</td>
                                    </tr>
                                </table>
                            </div>
                            <center style="clear: both">
                                <a class="btn" href="{$URL}Internal/CompanyChoose/choose/3" style="width: 100%; color: #C3FF87">{t("Join VRU")}</a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

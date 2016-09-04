<!DOCTYPE html>
<html lang="en">
<head>
    <title>BlackEye | Invitation Code</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="icon" type="{$URL}imgage/ico" href="favicon.html"/>

    <link href="{$URL}css/stylesheets.css" rel="stylesheet" type="text/css" />
</head>
<body class="bg-img-num1">
    <div class="container">
        <div class="login-block">
            <div class="block block-transparent">
                <div class="head">
                    <div class="user">
                        <div class="info user-change">
                            <img src="{$URL}img/logob.png" class="img-circle img-thumbnail"/>
                        </div>
                    </div>
                </div>
                <div class="content controls npt">
                    <form method="post" action="{$URL}External/Login">
                        <input type="hidden" name="action" value="doLogin" />
                        <div class="form-row">
                            <div class="col-md-12">
                                <p>{t("Login to your BlackEye account.")}</p>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="icon-user"></span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="{t("Username")}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="icon-key"></span>
                                    </div>
                                    <input type="password" class="form-control" placeholder="{t("Password")}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <input type="submit" class="btn btn-default btn-block btn-clean" value="{t("Login")}" />
                            </div>
                            <div class="col-md-6">
                                <a href="{$URL}External/Register" class="btn btn-default btn-block btn-clean">{t("Register")}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

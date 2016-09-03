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
                            <img src="{$URL}img/logo.png" class="img-circle img-thumbnail"/>
                        </div>
                    </div>
                </div>
                <div class="content controls npt">
                    <p>{t("At the moment BlackEye can only be accessed with an invitation code, if you have one, please, verify it")}</p>
                    <form action="{$URL}External/InvitationCode" method="post">
                        <input type="hidden" name="action" value="verifyInvitationCode" />
                        <div class="form-row">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="icon-key"></span>
                                    </div>
                                    <input type="password" class="form-control" placeholder="{t("Invitation Code")}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12">
                                <input type="submit" class="btn btn-default btn-block btn-clean" value="{t("Verify")}"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

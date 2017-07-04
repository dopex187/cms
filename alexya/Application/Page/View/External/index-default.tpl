<!DOCTYPE html>
<html lang="en">
<head>
    <title>{$server->title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link href="{$theme->url()}css/stylesheets.css" rel="stylesheet" type="text/css"/>
</head>
<body class="bg-img-num1">
<div class="container">
    <div class="login-block">
        <div class="block block-transparent">
            <div class="head">
                <div class="user">
                    <div class="info user-change">
                        <img src="{$theme->url()}img/logob.png" class="img-circle img-thumbnail"/>
                    </div>
                </div>
            </div>
            <div class="content controls npt">
                {foreach from=\Alexya\Tools\Session\Results::get() item=result}
                    <div class="alert alert-{$result["result"]}">
                        {$result["message"]}
                    </div>
                {/foreach}
                <form class="content show" id="login" method="post" action="{$URL}External">
                    <input type="hidden" name="action" value="login"/>

                    <div class="form-row">
                        <div class="col-md-12">
                            <p>{t("Login to your account.")}</p>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="icon-user"></span>
                                </div>
                                <input type="text" class="form-control" name="username" placeholder="{t("Username")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="icon-key"></span>
                                </div>
                                <input type="password" class="form-control" name="password" placeholder="{t("Password")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6">
                            <input type="submit" class="btn btn-default btn-block btn-clean" value="{t("Login")}"/>
                        </div>
                        <div class="col-md-6">
                            <a href="#register" class="btn btn-default btn-block btn-clean link">{t("Register")}</a>
                        </div>
                    </div>
                </form>

                <form class="content hide" id="register" method="post" action="{$URL}External">

                    <input type="hidden" name="action" value="register"/>
                    <div class="form-row">
                        <div class="col-md-12">
                            <p>{t("Register your account.")}</p>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="icon-envelope"></span>
                                </div>
                                <input type="text" class="form-control" name="email" placeholder="{t("Email")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="icon-user"></span>
                                </div>
                                <input type="text" class="form-control" name="username" placeholder="{t("Username")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="icon-key"></span>
                                </div>
                                <input type="password" class="form-control" name="password" placeholder="{t("Password")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="icon-user"></span>
                                </div>
                                <input type="text" class="form-control" name="code" placeholder="{t("Invitation Code")}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <p>{t("By registering you agree to our terms and conditions")}</p>
                        <div class="col-md-6">
                            <input type="submit" class="btn btn-default btn-block btn-clean" value="{t("Register")}"/>
                        </div>
                        <div class="col-md-6">
                            <a href="#login" class="btn btn-default btn-block btn-clean link">{t("Login")}</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="{$theme->url()}js/jquery.min.js"></script>
<script>
    $('.link').on('click', function (e) {
        e.preventDefault();
        var $tab = jQuery(this);
        var href = $tab.attr('href');

        jQuery('.show').removeClass('show')
            .addClass('hide')
            .hide();

        jQuery(href).removeClass('hide')
            .addClass('show')
            .hide()
            .fadeIn(750);
    });
</script>
</body>
</html>

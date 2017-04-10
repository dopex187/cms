<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{$server->title}</title>
    <link rel="stylesheet" href="{$URL}css/style.css" />
</head>

<body>
    <div class="box">
        <img src="{$URL}img/logo.png" class="logo" />
        {foreach from=\Alexya\Tools\Session\Results::get() item=error}
            <div class="error">{$error}</div>
        {/foreach}
        <div class="content show" id="login">
            <form method="post" action="{$URL}External">
                <h1>{t("Login")}</h1>

                <input type="hidden" name="action" value="login" />

                <input name="username" id="username" type="text"     placeholder="{t("Username")}" />
                <input name="password" id="password" type="password" placeholder="{t("Password")}" />

                <button class="btn" type="submit">{t("Login")}</button>

                <p><b>{t("Not a member?")} <a class="link" href="#register">{t("Register")}</a></b></p>
            </form>
        </div>
        <div class="content hide" id="register">
            <form method="post" action="{$URL}External">
                <h1>{t("Register")}</h1>

                <input type="hidden" name="action" value="register" />

                <input name="username" type="text"     placeholder="{t("Username")}"        />
                <input name="password" type="password" placeholder="{t("Password")}"        />
                <input name="email"    type="email"    placeholder="{t("Email")}"           />
                <input name="code"     type="text"     placeholder="{("Invitation code")}" />

                <button class="btn" type="submit">{t("Register")}</button>

                <p><b>{t("Already a member?")} <a class="link" href="#login">{t("Login")}</a></b></p>
            </form>
        </div>
    </div>
    <script src="{$URL}js/jquery.min.js"></script>
    <script>
        jQuery('.link').on('click', function(e) {
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

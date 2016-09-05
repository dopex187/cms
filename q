[1mdiff --git a/alexya/Application/Page/View/Internal/index.tpl b/alexya/Application/Page/View/Internal/index.tpl[m
[1mindex 940727e..488c094 100644[m
[1m--- a/alexya/Application/Page/View/Internal/index.tpl[m
[1m+++ b/alexya/Application/Page/View/Internal/index.tpl[m
[36m@@ -8,20 +8,20 @@[m
 	<link href="{$URL}css/stylesheets.css" rel="stylesheet" type="text/css">[m
 	<link href="{$URL}http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">[m
 [m
[31m-    <script type='text/javascript' src='js/plugins/jquery/jquery.min.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/jquery/jquery-ui.min.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate.min.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/jquery/globalize.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/bootstrap/bootstrap.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/jquery/jquery.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/jquery/jquery-ui.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/jquery/jquery-migrate.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/jquery/globalize.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/bootstrap/bootstrap.min.js'></script>[m
 [m
[31m-    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/uniform/jquery.uniform.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/uniform/jquery.uniform.min.js'></script>[m
 [m
[31m-    <script type='text/javascript' src='js/plugins/sparkline/jquery.sparkline.min.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/flot/jquery.flot.js'></script>[m
[31m-    <script type='text/javascript' src='js/plugins/flot/jquery.flot.resize.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/sparkline/jquery.sparkline.min.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/flot/jquery.flot.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins/flot/jquery.flot.resize.js'></script>[m
 [m
[31m-    <script type='text/javascript' src='js/plugins.js'></script>[m
[32m+[m[32m    <script type='text/javascript' src='{$URL}js/plugins.js'></script>[m
 [m
 	<style type="text/css">[m
 		.jqstooltip {[m
[36m@@ -244,10 +244,7 @@[m
         </div>[m
 		<div class="page-content">[m
 			<div class="container">[m
[31m-[m
[31m-                <div class="row">[m
[31m-[m
[31m-                </div>[m
[32m+[m[32m                {$module->Controller->render()}[m
 			</div>[m
 		</div>[m
 	</div>[m

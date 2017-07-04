<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>BlackEye</title>

		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="{$URL}js/jquery-1.4.4.js"></script>
		<script type="text/javascript" src="{$URL}js/jquery.flashembed.js"></script>
	</head>

	<body style="background : #000000;">
		<div id="container" align="center"></div>
		<script type='text/javascript'>
			function onFailFlashembed() {
				var inner_html = '<div class="flashFailHead">Get the Adobe Flash Player</div>\n\
				<div class="flashFailHeadText">In order to play you need the latest version of Flash Player. Just install it to start playing!\n\
				<div class="flashFailHeadLink" style="cursor: pointer">Download the Flash Player here for free: <a href=\"http://www.adobe.com/go/getflashplayer\" style=\"text-decoration: underline; color:#A0A0A0;\">Download Flash Player<\/a></div></div>';

				document.getElementById('container').innerHTML = inner_html;
			}

			function expressInstallCallback(info) {
				// possible values for info: loadTimeOut|Cancelled|Failed
				onFailFlashembed();
			}

			function expressInstallCallback(info) {
				// possible values for info: loadTimeOut|Cancelled|Failed
				onFailFlashembed();
			}

			jQuery(document).ready(
				function(){
					flashembed("container", {
							"src": "{$URL}swf_global/spacemap.swf",
							"version": [10,0],
							"expressInstall": "{$URL}swf_global/expressInstall.swf",
							"width":820,
							"height":600,
							"wmode": "window",
							"id": "DFlash"
						}, {
							"lang": "{$locale->code}",
							"userID": {$account->id},
							"factionID": {$account->factions_id},
							"g_userName": "{$account->name}",
							"mainMovie": "",
							"cdn":"{$URL}",
							"allowedScriptAccess":"always",
							"allowNetworking" : "true",
							"sid": "{$account->session_id}",
							"mapID": 1
						}
					);
				}
			);
		</script>
		<style>
			#container {
				color: #FFFFFF;
				background : #000000;
			}
		</style>
	</body>
</html>

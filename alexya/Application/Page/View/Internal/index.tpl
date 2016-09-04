<html lang="en">
<head>
	<title>BlackEye | {$name}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<link rel="icon" type="image/ico" href="favicon.html">

	<link href="css/stylesheets.css" rel="stylesheet" type="text/css">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <script type='text/javascript' src='js/plugins/jquery/jquery.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/globalize.js'></script>
    <script type='text/javascript' src='js/plugins/bootstrap/bootstrap.min.js'></script>

    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='js/plugins/uniform/jquery.uniform.min.js'></script>

    <script type='text/javascript' src='js/plugins/sparkline/jquery.sparkline.min.js'></script>
    <script type='text/javascript' src='js/plugins/flot/jquery.flot.js'></script>
    <script type='text/javascript' src='js/plugins/flot/jquery.flot.resize.js'></script>

    <script type='text/javascript' src='js/plugins.js'></script>

	<style type="text/css">
		.jqstooltip {
			position: absolute;
			left: 0px;
			top: 0px;
			visibility: hidden;
			background: rgb(0, 0, 0) transparent;
			background-color: rgba(0,0,0,0.6);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
			-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
			color: white;
			font: 10px arial, san serif;
			text-align: left;
			white-space: nowrap;
			padding: 5px;
			border: 1px solid white;
			z-index: 10000;
		}
		.jqsfield {
			color: white;
			font: 10px arial, san serif;
			text-align: left;
		}
	</style>
</head>
<body class="bg-img-num1">
	<div class="page-container">
		<div class="page-sidebar">
			<div class="page-navigation-panel logo"></div>
			<ul class="page-navigation">
				<li>
					<a href="{$URL}Internal/Start">
						{t("Home")}
						<span class="fa fa-home fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/Dock">
						{t("Dock")}
						<span class="fa fa-fighter-jet fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="#">
						{t("Shop")}
						<span class="fa fa-dollar fa-lg fa-pull-left" style="float: right"></span>
					</a>
					<ul>
						<li><a href="{$URL}Internal/Shop/Ships">{t("Ships")}</a></li>
						<li><a href="{$URL}Internal/Shop/Drones">{t("Drones")}</a></li>
						<li><a href="{$URL}Internal/Shop/Weapons">{t("Weapons")}</a></li>
						<li><a href="{$URL}Internal/Shop/Generators">{t("Generators")}</a></li>
						<li><a href="{$URL}Internal/Shop/Amunition">{t("Amunition")}</a></li>
						<li><a href="{$URL}Internal/Shop/PET">{t("PET")}</a></li>
						<li><a href="{$URL}Internal/Shop/Extras">{t("Extras")}</a></li>
						<li><a href="{$URL}Internal/Shop/Desings">{t("Designs")}</a></li>
					</ul>
				</li>
				<li>
					<a href="{$URL}Internal/Clan">
						{t("Clan")}
						<span class="fa fa-users fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/Laboratory">
						{t("Laboratory")}
						<span class="fa fa-flask fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/Quests">
						{t("Quests")}
						<span class="fa fa-star fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/Bank">
						{t("Bank")}
						<span class="fa fa-bank fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/Messages">
						{t("Messages")}
						<span class="fa fa-envelope-o fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/HallOfFame">
						{t("Hall of Fame")}
						<span class="fa fa-bookmark fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
				<li>
					<a href="{$URL}Internal/Map">
						{t("Spacemap")}
						<span class="fa fa-play fa-lg fa-pull-right" style="float: right;"></span>
					</a>
				</li>
			</ul>
		</div>
        <div class="page-sidebar pull-right">
            <div class="block block-drop-shadow page-navigation-hide" style="margin-top: 94px">
                <div class="head bg-dot20">
                    <div class="side pull-left">
                        <div class="head-panel nm">
                            <div class="hp-info hp-simple pull-left hp-inline">
                                <span class="hp-sm">{t("Experience")}</span>
                                <span class="hp-sm">{t("Level")}</span>
                                <span class="hp-sm">{t("Honor")}</span>
                                <span class="hp-sm">{t("Credits")}</span>
                                <span class="hp-sm">{t("Uridium")}</span>
                                <span class="hp-sm">{t("Jackpot")}</span>
                            </div>
                        </div>
                    </div>
                    <div class="side pull-right">
                        <div class="head-panel nm">
                            <div class="hp-info hp-simple pull-left hp-inline">
                                <span class="hp-sm">{$user->experience}</span>
                                <span class="hp-sm">{$user->level}</span>
                                <span class="hp-sm">{$user->honor}</span>
                                <span class="hp-sm">{$user->credits}</span>
                                <span class="hp-sm">{$user->uridium}</span>
                                <span class="hp-sm">{$user->jackpot}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<div class="page-content">
			<div class="container">
				{$module->render}
			</div>
		</div>
	</div>
</body>
</html>

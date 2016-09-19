<div class="row">
    <div class="col-md-12">
        {foreach from=\Alexya\Database\ORM\Model::all([
            "is_public" => true
        ], "factions") item=faction}
        <div class="block">
            <div class="header">
                <h2 style="color: #{$faction->color}">{$faction->name}</h2>
            </div>
            <div class="content">
                <div class="col-md-6">
                    <h2 style="color: #{$faction->color}">{t("Description")}</h2>
                    {t($faction->description)}
                </div>
                <div class="col-md-6">
                    <h2 style="color: #{$faction->color}">{t("Advantages")}</h2>
                    <table class="table">
                        <tr>
                            <td>Experience for NPC destroyed</td>
                            <td>+5%</td>
                        </tr>
                        <tr>
                            <td>Honor for NPC destroyed</td>
                            <td>+10%</td>
                        </tr>
                        <tr>
                            <td>Credits for NPC destroyed</td>
                            <td>+10%</td>
                        </tr>
                        <tr>
                            <td>Uridium for NPC destroyed</td>
                            <td>+10%</td>
                        </tr>
                    </table>
                </div>
                <center style="clear: both">
                    {$vars = [
                        "FACTION" => strtoupper($faction->abbreviation)
                    ]}
                    <a class="btn" href="{$URL}Internal/CompanyChoose/choose/{$faction->id}" style="width: 100%; color: #{$faction->color}">{t("Join %FACTION%", $vars)}</a>
                </center>
            </div>
        </div>
        {/foreach}
    </div>
</div>

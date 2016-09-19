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
                        {foreach from=json_decode($faction->bonus) item=bonus}
                        <tr>
                            <td>{$bonus->description}</td>
                            <td>{$bonus->effect}{$bonus->amount}{$bonus->type}</td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td>No additional bonuses in this faction.</td>
                        </tr>
                        {/foreach}
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

<div class="row">
    <div class="col-md-6">
        <div class="block">
            <div class="header">
                <h2>{t("Items")}</h2>
            </div>
            <div class="content">
                {foreach from=items item=item}
                <div class="col-md-3 item" onclick="updateDescription({$item->id})">
                    <img src="{$URL}img/items/{$item->category}/{$item->loot_id}.png">
                    <p>{$item->price} / {$item->unity}</p>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="block">
            <div class="header">
                <h2>{t("Description")}</h2>
            </div>
            <div class="content">
                <div class="col-md-6 item" id="preview">
                    <img src="{$URL}img/items/{$items[0]->category}/{$items[0]->loot_id}.png">
                    <p>{$items[0]->price} / {$items[0]->unity}</p>
                </div>
                <div class="col-md-6" id="description">
                    <p>{t($items[0]->description)}</p>
                </div>
                <table class="table table-striped" id="stats">
                    {foreach from=json_decode($items[0]->stats) item=stat}
                    <tr>
                        <td>{t($stat->name)}</td>
                        <td>{$stat->value}</td>
                    </tr>
                    {/foreach}
                </table>
                <a href="#" class="btn btn-default" style="width: 100px;">{t("Buy")}</a>
            </div>
        </div>
    </div>
</div>
<script>
/**
 * Updates description.
 *
 * @param int id Item id.
 */
function updateDescription(id)
{
    jQuery.ajax({
        url: "{$URL}API/Items/item/"+ id,
        success: function(data) {
            if(data.result != "success") {
                console.log(data.error);
            }

            $("#preview").children("img").attr("src", data.item.image);
            $("#preview").children("p").text(data.item.price);
            $("#description").children("p").text(data.item.description);
            $("#stats").empty();
            for(var i = 0; i < data.stats.length; i++) {
                var tr   = $("<tr></tr>");
                var name = $("<td></td>").text(data.item.stats[i].name);
                var desc = $("<td></td>").text(data.item.stats[i].description);

                tr.append(name, desc);

                $("#stats").append(tr);
            }
            $("#buy").attr("href", "{$URL}Internal/Shop/buy/"+ data.item.id);
        }
    });
}
</script>

<?php
namespace Application\Page\Presenter;

use Alexya\Foundation\Presenter;

/**
 * Internal page presenter.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Internal extends Presenter
{
    /**
     * Renders and returns the page.
     *
     * @return string Page content.
     */
    public function render() : string
    {
        $uri  = explode("/", ($_SERVER["PATH_INFO"] ?? "/Internal/Start"));
        $name = ($uri[2] ?? "");

        $this->_triad->View->set("name", $name);
        $this->_setFramesFlag($name);

        $vars = $this->_triad->Model->all();
        if($this->_triad->children->module->hasModel()) {
            $vars = array_merge($vars, $this->_triad->children->module->Model->all());
        }

        foreach($vars as $key => $value) {
            $this->_triad->children->module->View->set($key, $value);
        }

        $module = $this->_triad->children->module->Controller->render();

        // Call the render method here so it redirects now instead of when the view is being rendered.
        $this->_triad->View->set("module", $module);

        if(
            $name == "CompanyChoose" ||
            $name == "Map"
        ) {
            return $module;
        }

        // TODO $this->_triad->View->set("news", Model::latest(10, "id", "news"));

        return $this->_triad->View->render();
    }

    /**
     * Sets the `hasFrames` flag.
     *
     * @param string $name Page name.
     */
    private function _setFramesFlag(string $name)
    {
        $framedPages = [
            "Dock",
            "Shop",
            "Clan",
            "Skylab",
            "PilotSheet",
            "GalaxyGates"
        ];

        $this->_triad->View->set("hasFrames", false);
        if(in_array($name, $framedPages)) {
            $this->_triad->View->set("hasFrames", true);
        }
    }
}

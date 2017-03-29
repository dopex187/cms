<?php
namespace Application\Module\Controller;

use Alexya\Foundation\Controller;

use Alexya\Http\Response;

/**
 * Map controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Map extends Controller
{
    /**
     * Index method.
     *
     * Default action to execute.
     *
     * @return Response Response object.
     */
    public function index() : Response
    {
        $response = new Response([
            "Content-Type" => "text/html"
        ], $this->_triad->View->render());

        return $response;
    }
}

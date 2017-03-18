<?php
namespace Alexya\Foundation;

use Alexya\Http\Request;

/**
 * Base class for the HMV(VM)C components.
 *
 * It contains the reference to the triad and the request.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
abstract class Component
{
    /**
     * Triad reference.
     *
     * @var Triad
     */
    protected $_triad;

    /**
     * Request reference.
     *
     * @var Request
     */
    protected $_request;

    /**
     * Constructor.
     *
     * @param Triad   $triad   Triad reference.
     * @param Request $request Request reference.
     */
    public function __construct(Triad $triad, Request $request)
    {
        $this->_triad   = $triad;
        $this->_request = $request;

        $this->_init();
    }

    /**
     * Initializes the component.
     */
    protected abstract function _init();
}

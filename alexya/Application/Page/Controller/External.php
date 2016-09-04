<?php
namespace Application\Page\Controller;

use \Alexya\Container;
use \Alexya\Foundation\Controller;
use \Alexya\Http\Response;
use \Alexya\Tools\Session\Results;

/**
 * External page controller.
 *
 * Contains the logic of the external page.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class External extends Controller
{
    /**
     * Default action.
     *
     * Finds the home page and renders it.
     *
     * @return string Login page content.
     */
    public function index() : string
    {
        return $this->Login();
    }

    /**
     * Renders and returns the InvitationCode page.
     *
     * @return string Invitation code page content.
     */
    public function InvitationCode() : string
    {
        if(!Container::Settings()->get("application.invitation.enabled")) {
            Response::redirect("/External/Login");
        }

        $this->_triad->View->setName("InvitationCode");

        return $this->_triad->View->render();
    }

    /**
     * Renders and returns the Login page.
     *
     * @return string Login page content.
     */
    public function Login() : string
    {
        $this->_triad->View->setName("Login");

        return $this->_triad->View->render();
    }

    /**
     * Renders and returns the Register page.
     *
     * @return string Register page content.
     */
    public function Register() : string
    {
        $this->_triad->View->setName("Register");

        return $this->_triad->View->render();
    }

    /**
     * Performs the validation of an invitation code.
     *
     * @param string $code Invitation code to verify.
     */
    public function verifyInvitationCode($code)
    {
        if(
            Container::Settings()->get("application.invitation.enabled") ||
            $code != Container::Settings()->get("application.invitation.code")
        ) {
            /*$query = new QueryBuilder(Container::Database());
            $query->select()
                  ->from("invitation_codes")
                  ->where([
                      "code" => $code
                  ])
                  ->execute();*/

            if(true) {
                Results::flash("code_doesnt_exist", [
                    "result"  => "success",
                    "message" => t("The invitation code does not exists!")
                ]);

                Response::redirect("/External/InvitationCode");
            }
        }

        Container::Session()->invitation = [
            "verified" => true,
            "code"     => $code
        ];
        Results::flash("code_verified", [
            "result"  => "success",
            "message" => t("The invitation code has been successfully validated!")
        ]);

        Response::redirect("/External/Login");
    }
}

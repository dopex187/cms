<?php
namespace Application\Page\Controller;

use Alexya\Container;
use Alexya\Foundation\Controller;
use Alexya\Http\Response;
use Alexya\Tools\Session\{
    Session,
    Results
};
use Alexya\Validator\{
    Validator,
    Rulers\StringRuler
};

use Application\API;

/**
 * External page controller.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class External extends Controller
{
    /**
     * Renders and returns the page.
     *
     * @return Response Response object.
     */
    public function index() : Response
    {
        $response = new Response([
            "Content-Type" => "text/html"
        ], $this->_triad->Presenter->render());

        return $response;
    }

    /**
     * Registers an user.
     *
     * @param string $name     Username.
     * @param string $password Password.
     * @param string $email    Email.
     * @param string $code     Invitation code.
     *
     * @return Response Response object.
     */
    public function register(string $name, string $password, string $email, string $code = "") : Response
    {
        $this->validate($name, $password, $email);

        /**
         * API object.
         *
         * @var API $API
         */
        $API = Container::get("API");

        /**
         * Session object.
         *
         * @var Session $Session
         */
        $Session = Container::Session();

        $result = $API->post("register", [
            "username" => $name,
            "password" => $password,
            "email"    => $email,
            "code"     => $code
        ]);

        if(!$result->isError) {
            $Session->id = $result->result[0]->session_id;

            Response::redirect("/Internal/CompanyChoose");
        }

        return $this->_errors($result->errors);
    }

    /**
     * Performs a login.
     *
     * @param string $name     Username.
     * @param string $password Password.
     *
     * @return Response Response object.
     */
    public function login(string $name, string $password) : Response
    {
        $this->validate($name, $password);

        /**
         * API object.
         *
         * @var API $API
         */
        $API = Container::get("API");

        /**
         * Session object.
         *
         * @var Session $Session
         */
        $Session = Container::Session();

        $result = $API->get("login", [
            "username" => $name,
            "password" => $password
        ]);

        if(!$result->isError) {
            $Session->id = $result->result[0]->session_id;

            Response::redirect("/Internal/Start");
        }

        return $this->_errors($result->errors);
    }

    /**
     * Adds errors to the session and returns the response.
     *
     * @param array $errors Errors to add to the session.
     *
     * @return Response Response to send.
     */
    private function _errors(array $errors) : Response
    {
        foreach($errors as $key => $value) {
            Results::flash($key, t($value->message));
        }

        return $this->index();
    }

    /**
     * Performs input validation.
     *
     * @param string $name     Username.
     * @param string $password Password.
     * @param string $email    Email.
     */
    public function validate(string $name, string $password, string $email = null)
    {
        $validator = $this->_getValidator($name, $password, $email);

        if($validator->validate()) {
            return;
        }

        Results::flash("externalPage_results", $validator->getErrors());

        Response::redirect("/External");
    }

    /**
     * Returns the input validator.
     *
     * @param string $name     Username.
     * @param string $password Password.
     * @param string $email    Email.
     *
     * @return Validator Validator object.
     */
    private function _getValidator(string $name, string $password, string $email = null) : Validator
    {
        $validator = new Validator([
            new StringRuler()
        ]);

        $validator->add("username", $name)
                  ->addRule("String::not_empty", t("Please enter your username."))
                  ->addRule("String::min_length", [4], t("This username is too short. Please choose a new username which has between 4 and 20 characters."))
                  ->addRule("String::max_length", [20], t("This username is too long. Please choose a new username which has between 4 and 20 characters."));

        $validator->add("password", $password)
                  ->addRule("String::not_empty", t("Please enter your password."))
                  ->addRule("String::min_length", [4], t("This password is too short. Please choose a new password which has between 4 and 45 characters."))
                  ->addRule("String::max_length", [45], t("This password is too long. Please choose a new password which has between 4 and 45 characters."));

        if($email == null) {
            return $validator;
        }

        $validator->add("email", $email)
                  ->addRule("String::not_empty", t("Please enter your password."))
                  ->addRule("String::is_email", t("Your e-mail address doesn't seem to be correct. Please enter a valid e-mail address."));

        return $validator;
    }
}

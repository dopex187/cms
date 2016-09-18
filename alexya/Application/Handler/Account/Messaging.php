<?php
namespace Application\Handler\Account;

/**
 * Account's messages handler.
 *
 * The constructor accepts as parameter an array with the inbox messages
 * and an array with the outbox messages.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
class Messaging
{
    /**
     * Inbox.
     *
     * @var array
     */
    private $_inbox = [];

    /**
     * Outbox.
     *
     * @var array
     */
    private $_outbox = [];

    /**
     * Constructor.
     *
     * @param array $inbox  Inbox messages.
     * @param array $outbox Outbox messages.
     */
    public function __construct(array $inbox, array $outbox)
    {
        $this->_inbox = [
            "unread" => [],
            "read" => [],
            "deleted" => []
        ];
        $this->_outbox = [
            "unread" => [],
            "read" => [],
            "deleted" => []
        ];

        foreach($inbox as $message) {
            $category = "unread";
            if($message->to_status == 0) {
                $category = "deleted";
            } else if($message->to_status == 1) {
                $category = "read";
            }

            $this->_inbox[$category] = $message;
        }

        foreach($outbox as $message) {
            $category = "unread";
            if($message->from_status == 0) {
                $category = "deleted";
            } else if($message->from_status == 1) {
                $category = "read";
            }

            $this->_outbox[$category] = $message;
        }
    }

    /**
     * Checks that the user has any unread message.
     *
     * @return bool `true` if user has unread messages, `false` if not.
     */
    public function hasUnreadMessages() : bool
    {
        return (count($this->_inbox["unread"]) != 0);
    }

    /**
     * Returns the amount of unread messages.
     *
     * @return int Amount of unread messages.
     */
    public function unreadMessagesCount() : int
    {
        return count($this->_inbox["unread"]);
    }

    /**
     * Returns unread messages.
     *
     * @return array Unread messages.
     */
    public function unreadMessages() : array
    {
        return $this->_inbox["unread"];
    }

    /**
     * Returns read messages.
     *
     * @return array Read messages.
     */
    public function readMessages() : array
    {
        return $this->_inbox["read"];
    }

    /**
     * Returns inbox messages.
     *
     * @return array Inbox messages.
     */
    public function inbox() : array
    {
        return array_merge($this->_inbox["unread"], $this->_inbox["read"]);
    }

    /**
     * Returns outbox messages.
     *
     * @return array Outbox messages.
     */
    public function outbox() : array
    {
        return array_merge($this->_outbox["unread"], $this->_outbox["read"]);
    }
}

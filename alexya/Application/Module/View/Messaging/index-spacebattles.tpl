<div class="content_frame_top">
    <div class="content_frame_top_left"></div>
    <div class="content_frame_top_right"></div>
</div>

<div class="content_frame_middle">
    <div id="domessaging">
        <div class="baseView hidden" id="folderView">
            <div class="header">
                <div class="button-checkbox" id="domsg_messages_checkboxAll">{t("All")}</div>
                <div class="icon-trash" id="domsg_messages_deleteChecked"></div>

                <div id="domsg_messages_dropdown" class="button-dropdown">{t("All")}</div>
                <div id="domsg_messages_dropdownLayer" class="hidden">
                </div>

                <div id="domsg_messages_pageNavigation" style="display: none">
                    <div id="domsg_messages_pageInfo"></div>

                    <div class="button-left button-left-disabled" id="domsg_messages_pageLeft"></div>
                    <div class="button-right button-right-disabled" id="domsg_messages_pageRight"></div>
                </div>

                <div class="button-biggreen" id="domsg_messages_new">{t("New message")}</div>
            </div>

            <div class="gradient-top"></div>
            <div class="gradient-bottom"></div>

            <div class="entryList" id="folderViewEntrys"></div>
        </div>

        <div class="baseView hidden" id="messageWriteView">
            <div class="gradient-top"></div>
            <div class="gradient-bottom"></div>

            <div class="contactSearch">
                <div class="relative">
                    <input type="text" id="domsg_msgwrite_userSearch"/>

                    <div class="icon-add icon-add-disabled" id="domsg_msgwrite_userSearchAddBtn"></div>

                    <div class="contactLabel">{t("Contacts")}</div>
                </div>
            </div>

            <div class="contactList">
                <div id="messageWriteContacts">
                </div>

                <div class="bottom"></div>
            </div>

            <div class="recipients">
                <div class="relative">
                    <div class="label">{t("To:")}</div>

                    <div id="domsg_recipientList">
                    </div>

                    <div class="help icon-info" id="domsg_msgwrite_help"></div>
                </div>
            </div>

            <div class="content">
                <div class="relative">
                    <div class="subjectLabel">{t("Subject:")}</div>
                    <div class="subject"><input type="text" id="domsg_msgwrite_subject" maxlength="50"/></div>

                    <div class="body">
                        <textarea id="domsg_msgwrite_body" maxlength="5000"></textarea>

                        <div class="parent hidden" id="domsg_msgwrite_parent">
                            <div class="separator"></div>

                            <div class="dateUser" id="domsg_msgwrite_parentDateUser"></div>

                            <div class="text" id="domsg_msgwrite_parentText"></div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="reCaptcha" class="baseLayer errorLayer" style="z-index:10; display:none;">
                <div class="header">Recaptcha
                    <div id="cancelReCaptcha" class="closeCaptcha"></div>

                </div>
                <div class="content" style="width:359px;top:0;left:2px;position: relative;margin: auto">
                    <div class="text" style="text-align: left;padding: 0 18px">{t("Please enter in the words displayed
                        below. You are receiving this message because one or more recipients are either not from your
                        contacts or in your clan.")}
                    </div>
                    <div style="margin: 10px 0 0 18px;">
                        <script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=6LfdSMgSAAAAAB447EsrEVUCOVs0_AreY_ZC2jjZ"></script>

                        <noscript>
                            <iframe src="http://www.google.com/recaptcha/api/noscript?k=6LfdSMgSAAAAAB447EsrEVUCOVs0_AreY_ZC2jjZ" height="300" width="500" frameborder="0"></iframe>
                            <br/>
                            <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
                            <input type="hidden" name="recaptcha_response_field" value="manual_challenge"/>
                        </noscript>
                    </div>

                </div>
                <div class="footer" style="left: 2px;">
                    <div id="sendReCaptcha" class="button button-biggreen">{t("OK")}</div>
                </div>
            </div>
            <div class="sendbar">
                <div class="button-cancel" id="domsg_msgwrite_cancelBtn">{t("Cancel")}</div>
                <div id="domsg_msgwrite_txtCounter"></div>
                <div class="button-biggreen" id="domsg_msgwrite_sendMessageBtn">{t("Send message")}</div>
            </div>
        </div>

        <div class="baseView hidden" id="contactsView">
            <div class="header">

                <div id="domsg_contacts_containerBlockAllInvitations">
                    <div id="domsg_contacts_blockAllInvitations" class="button-singleCheckbox"></div>
                    <div id="domsg_contacts_blockAllInvitationsLabel">{t("Block all invites")}</div>
                </div>
                <div class="button-blacklist" id="domsg_contacts_blackListButton">{t("Blacklist")}</div>
            </div>

            <div class="blackList hidden" id="blackListEntrys">
            </div>

            <div class="gradient-top"></div>
            <div class="gradient-bottom"></div>
            <div class="contactList" id="contactsViewEntrys">
            </div>
        </div>

        <div class="baseView hidden" id="notesView">
            <div class="header">
                <div class="button-biggreen" id="domsg_notes_new">{t("New note")}</div>
            </div>

            <div class="gradient-top"></div>
            <div class="gradient-bottom"></div>

            <div class="entryList" id="notesViewEntrys">
            </div>
        </div>

        <div id="domsg_msgwrite_helpLayer" class="helpLayer hidden">
            <div class="title">Help</div>
            <div class="close-help button-close" id="domsg_msgwrite_helpLayerClose"></div>

            <div class="content">
                <font color="#7ecaff">{t("Inbox")}</font><br/><br/>
                {t("The inbox contains all messages that are sent to you. Here you can read, answer or delete them. Use the
                dropdown menu to select the messages you would like to view. Click New Message to send a message to
                another player.
                <br/><br/>Messages can be saved for a maximum of 14 days, after which they are automatically deleted by
                the system. If you would like to save a message for more than 14 days, please save it as a
                note.<br/><br/>")}
                <font color="#7ecaff">{t("Create new message")}</font><br/><br/>
                {t("To send another player a message, simply enter the player's nickname in the field to the upper left. If
                the player is on your server, you may add that player to the recipient list by using the plus button. If
                you have saved friends to your friend list, you can use the list to add them as a recipient.
                <br/><br/>To prevent spamming, only 5 players may receive a message at the same time. An exception to
                this is for clan messages, which can be sent to all clan members.<br/><br/>")}
                <font color="#7ecaff">{t("Sent messages")}</font><br/><br/>
                {t("The outbox contains all the messages that you send to other players. You may delete them here whenever
                you would like. If you would like to keep them, save the message as a note.<br/><br/>")}
                <font color="#7ecaff">{t("Contacts")}</font><br/><br/>
                {t("In 'Contacts', you can save players and friends that you send frequent messages to. This saves you from
                having to search for them each time you would like to write to them. Clan members are automatically
                added to the contact list.<br/><br/>You may add as many contacts as you wish to the contact list. There
                are various options of doing this:<br/><br/>")}
                <ol>
                    <li>{t("View the profile page of a specific player and send them a friend request.")}</li>
                    <li>{t("Enter the nickname in the seach field in the contact tab, and then click the plus symbol to add
                        the player to your contact list.")}
                    </li>
                    <li>{t("When you click a player name, his or her pilot menu opens. Simply click the letter symbol to
                        send the player a message.")}
                    </li>
                </ol>
                <br/><br/>
                <font color="#7ecaff">{t("Notes")}</font><br/><br/>
                {t("Hey you can make notes on other players or important events. Here you may also save messages that would
                like to retain. Messages in your inbox are automatically deleted after 14 days. If you save them as a
                note, you can keep those messages for as long as you wish.<br/><br/>Note: You may only save a maximum of
                10 notes. Premium players may save up to 50.")}<br/><br/>
            </div>
        </div>

        <div id="loader">
        </div>
        <div id="subNav_container">
            <div class="tab tab1 tab-active" id="domsg_tab_inbox">
                <div>{t("INBOX")}<span id="domsg_tab_inbox_info"></span></div>
            </div>
            <div class="tab tab2" id="domsg_tab_outbox">
                <div>{t("OUTBOX")}</div>
            </div>
            <div class="tab tab3" id="domsg_tab_contacts">
                <div>{t("CONTACTS")}</div>
            </div>
            <div class="tab tab4" id="domsg_tab_notes">
                <div>{t("NOTES")}</div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="{$theme->url()}js/jQuery/jquery.textarea-expander.js"></script>
    <script type="text/javascript">
        jQuery.fn.qtip.styles.domsg = {
            background: 'rgba(0, 0, 0, 0.9)',
            'font-size': '11px',
            width: 'auto',
            color: '#bcd3e3',
            border: {
                width: 1,
                radius: 1,
                color: 'rgba(124, 167, 202, 0.75)'
            },
            tip: 'topLeft',
            name: 'dark'
        };
    </script>
    <script type="text/javascript" src="{$theme->url()}js/domsg.min.js"></script>

    <script type="text/javascript">
        //<![CDATA[
        var translations = {
            'messaging_subNav_inbox': '{t("INBOX")}',
            'messaging_subNav_inbox_long': '{t("Inbox")}',
            'messaging_subNav_outbox': '{t("OUTBOX")}',
            'messaging_subNav_outbox_long': '{t("Outbox")}',
            'messaging_subNav_contacts': '{t("CONTACTS")}',
            'messaging_subNav_contacts_long': '{t("Contacts")}',
            'messaging_subNav_notes': '{t("NOTES")}',
            'messaging_subNav_notes_long': '{t("Notes")}',
            'messaging_common_sysMessageSender': '{t("DarkOrbit")}',
            'messaging_common_auctionSender': '{t("Interplanetary Auction")}',
            'messaging_common_clan': '{t("Clan:")}',
            'messaging_common_selectAll': '{t("All")}',
            'messaging_common_newMessage': '{t("New message")}',
            'messaging_common_newMessage_long': '{t("Create new message")}',
            'messaging_common_okayBtn': '{t("OK")}',
            'messaging_common_confirmBtn': '{t("OK")}',
            'messaging_common_abortBtn': '{t("Cancel")}',
            'messaging_common_pageInfo': '{t("%start%-%end% to %total%")}',
            'messaging_common_save': '{t("Save")}',
            'messaging_common_reply': '{t("Reply")}',
            'messaging_common_forward': '{t("Forward")}',
            'messaging_common_replyAll': '{t("Reply to all")}',
            'messaging_common_saveAsNote': '{t("Save as note")}',
            'messaging_common_blacklist': '{t("Blacklist")}',
            'messaging_common_blacklist_long': '{t("Open blacklist")}',
            'messaging_common_newNote': '{t("New note")}',
            'messaging_common_newNote_long': '{t("Create new note")}',
            'messaging_filter_all': '{t("All")}',
            'messaging_filter_unread': '{t("Unread")}',
            'messaging_filter_clan': '{t("Clan")}',
            'messaging_filter_system': '{t("System")}',
            'messaging_filter_auction': '{t("Auction")}',
            'messaging_filter_info': '{t("Info")}',
            'messaging_folderView_recipients': '{t("To:")}',
            'messaging_folderView_userWrote': '{t("%username% wrote:")}',
            'messaging_contacts_sendAnInvite': '{t("sent you a request...")}',
            'messaging_contacts_confirm': '{t("Accept")}',
            'messaging_contacts_decline': '{t("Decline")}',
            'messaging_tooltip_mailStatusAnswered': '{t("Answered messages")}',
            'messaging_tooltip_mailStatusRead': '{t("Read message")}',
            'messaging_tooltip_mailStatusUnread': '{t("Unread message")}',
            'messaging_tooltip_messageDelete': '{t("Delete message")}',
            'messaging_tooltip_addToBlacklist': '{t("Put sender on blacklist")}',
            'messaging_tooltip_selectAll': '{t("Select all")}',
            'messaging_tooltip_deleteSelected': '{t("Delete selected")}',
            'messaging_tooltip_noteForward': '{t("Forward note")}',
            'messaging_tooltip_noteDelete': '{t("Delete note")}',
            'messaging_tooltip_friendCancel': '{t("Delete friend")}',
            'messaging_tooltip_sendMessage': '{t("Send message")}',
            'messaging_tooltip_blockAllNotifications': '{t("Automatically ignores all invites")}',
            'messaging_notes_premiumBlocked': '{t("Cannot be viewed. Note limit exceeded.")}',
            'messaging_msgWrite_replyAcronym': '{t("RE:")}',
            'messaging_msgWrite_search': '{t("Search")}',
            'messaging_msgWrite_contacts': '{t("Contacts")}',
            'messaging_msgWrite_recipients': '{t("To:")}',
            'messaging_msgWrite_subject': '{t("Subject:")}',
            'messaging_msgWrite_sendMessage': '{t("Send message")}',
            'messaging_msgWrite_cancel': '{t("Cancel")}',
            'messaging_msgWrite_messageToClan': '{t("Message to clan")}',
            'messaging_help_title': '{t("Help")}',
            'messaging_help_inbox_h': '{t("Inbox")}',
            'messaging_help_inbox_p': '{t("The inbox contains all messages that are sent to you. Here you can read, answer or delete them. Use the dropdown menu to select the messages you would like to view. Click New Message to send a message to another player.\n\<br /\>\<br /\>Messages can be saved for a maximum of 14 days, after which they are automatically deleted by the system. If you would like to save a message for more than 14 days, please save it as a note.")}',
            'messaging_help_compose_h': '{t("Create new message")}',
            'messaging_help_compose_p': '{t("To send another player a message, simply enter the player\'s nickname in the field to the upper left. If the player is on your server, you may add that player to the recipient list by using the plus button. If you have saved friends to your friend list, you can use the list to add them as a recipient.\n\<br /\>\<br /\>To prevent spamming, only 5 players may receive a message at the same time.  An exception to this is for clan messages, which can be sent to all clan members.")}',
            'messaging_help_sent_h': '{t("Sent messages")}',
            'messaging_help_sent_p': '{t("The outbox contains all the messages that you send to other players. You may delete them here whenever you would like. If you would like to keep them, save the message as a note.")}',
            'messaging_help_contacts_h': '{t("Contacts")}',
            'messaging_help_contacts_p': '{t("In \'Contacts\', you can save players and friends that you send frequent messages to. This saves you from having to search for them each time you would like to write to them. Clan members are automatically added to the contact list.\<br /\>\<br /\>You may add as many contacts as you wish to the contact list. There are various options of doing this:\<br /\>\<br /\>\<ol\>\<li\>View the profile page of a specific player and send them a friend request.\</li\>\n\<li\>Enter the nickname in the seach field in the contact tab, and then click the plus symbol to add the player to your contact list.\</li\>\n\<li\>When you click a player name, his or her pilot menu opens. Simply click the letter symbol to send the player a message.\</li\>\</ol\>")}',
            'messaging_help_notes_h': '{t("Notes")}',
            'messaging_help_notes_p': '{t("Hey you can make notes on other players or important events. Here you may also save messages that would like to retain. Messages in your inbox are automatically deleted after 14 days. If you save them as a note, you can keep those messages for as long as you wish.\<br /\>\<br /\>Note: You may only save a maximum of 10 notes. Premium players may save up to 50.")}',
            'messaging_errorLayer_system_title': '{t("Unknown error")}',
            'messaging_errorLayer_system_text': '{t("An unknown error occurred. Click OK to restart the messaging system.")}',
            'messaging_errorLayer_blocked_title': '{t("Error")}',
            'messaging_errorLayer_blocked_text': '{t("The recipient does not wish to receive any messages.")}',
            'messaging_errorLayer_spam_title': '{t("Spam")}',
            'messaging_errorLayer_spam_text': '{t("Your messaging account has been blocked and therefore cannot send any more messages. To unblock your account, please contact support.")}',
            'messaging_errorLayer_blacklisted_title': '{t("Blacklist")}',
            'messaging_errorLayer_blacklisted_text': '{t("The recipient has blacklisted you, and therefore you cannot send him or her a message.")}',
            'messaging_errorLayer_subjectTooShort_title': '{t("Subject too short")}',
            'messaging_errorLayer_subjectTooShort_text': '{t("The subject entered is too short. It must contain at least 3 characters.")}',
            'messaging_errorLayer_subjectTooLong_title': '{t("Subject too long")}',
            'messaging_errorLayer_subjectTooLong_text': '{t("The subject entered is too long. It may not contain more than 50 characters.")}',
            'messaging_errorLayer_bodyTooShort_title': '{t("Message too short")}',
            'messaging_errorLayer_bodyTooShort_text': '{t("The message entered is too short. It must contain at least 5 characters.")}',
            'messaging_errorLayer_wrongCaptcha_title': '{t("Incorrect code")}',
            'messaging_errorLayer_wrongCaptcha_text': '{t("The Captcha code you entered was incorrect")}',
            'messaging_errorLayer_maxUnknownUser_title': '{t("Too many recipients")}',
            'messaging_errorLayer_maxUnknownUser_text': '{t("This message cannot be sent, as there are more than 10 recipients that are neither from your contacts nor members of your clan.")}',
            'messaging_errorLayer_bodyTooLong_title': '{t("Message too long")}',
            'messaging_errorLayer_bodyTooLong_text': '{t("The message entered is too long. The message limit is 5,000 characters.")}',
            'messaging_errorLayer_noRecipient_title': '{t("No recipient")}',
            'messaging_errorLayer_noRecipient_text': '{t("No recipient was added.")}',
            'messaging_errorLayer_tooManyRecipients_title': '{t("Too many recipients")}',
            'messaging_errorLayer_tooManyRecipients_text': '{t("The maximum number of recipients allowed is five.")}',
            'messaging_errorLayer_addOfClanWhileRecipients_title': '{t("Add recipient")}',
            'messaging_errorLayer_addOfClanWhileRecipients_text': '{t("You have reached the maximum number of recipients allowed. You may only send a message to 5 players OR to the entire clan.")}',
            'messaging_errorLayer_replyNoRecipientSwitch_title': '{t("You may not edit the recipients.")}',
            'messaging_errorLayer_replyNoRecipientSwitch_text': '{t("You may not edit the recipient when replying to a message.")}',
            'messaging_errorLayer_notesLimitReached_title': '{t("Note limit reached")}',
            'messaging_errorLayer_notesLimitReached_text': '{t("You\'ve reached the maximum number of notes allowed (%notesLimit%). Please delete one first before creating a new one.")}',
            'messaging_errorLayer_restrictionUnknownUser_title': '{t("Error")}',
            'messaging_errorLayer_restrictionUnknownUser_text': '{t("This message was not sent! Level %userlevel% players may only send %maxMessages% messages to users that are not in their contacts or clan for a span of 24 hours.")}',
            'messaging_confirmLayer_contactRequestDecline_title': '{t("Decline friend request")}',
            'messaging_confirmLayer_contactRequestDecline_text': '{t("Do you really want to decline the friend request?")}',
            'messaging_confirmLayer_contactCancelInvitation_title': '{t("Withdraw contact request")}',
            'messaging_confirmLayer_contactCancelInvitation_text': '{t("Are you sure you want to withdraw this contact request?")}',
            'messaging_successLayer_deleteDeclinedInvitation_title': '{t("Your contact request")}',
            'messaging_successLayer_deleteDeclinedInvitation_text': '{t("The rejected contact request has been deleted")}',
            'messaging_confirmLayer_contactDelete_title': '{t("Delete friend")}',
            'messaging_confirmLayer_contactDelete_text': '{t("Do you really want to remove this player from your friend list?")}',
            'messaging_confirmLayer_noteDelete_title': '{t("Delete note")}',
            'messaging_confirmLayer_noteDelete_text': '{t("Do you really want to delete the note?")}',
            'messaging_confirmLayer_messageDelete_title': '{t("Delete message")}',
            'messaging_confirmLayer_messageDelete_text': '{t("Do you really want to delete the message?")}',
            'messaging_confirmLayer_addToBlacklist_title': '{t("Add to blacklist")}',
            'messaging_confirmLayer_addToBlacklist_text': '{t("Do you really want to add %username% to your blacklist? He/she won\'t be able to send you any messages anymore.")}',
            'messaging_confirmLayer_blackListDelete_title': '{t("Remove from blacklist")}',
            'messaging_confirmLayer_blackListDelete_text': '{t("Do you really want to remove %username% from your blacklist? He/she will be able to send you messages again.")}',
            'messaging_confirmLayer_messageMultiDelete_title': '{t("Delete messages")}',
            'messaging_confirmLayer_messageMultiDelete_text': '{t("Do you really want to delete the selected messages?")}',
            'messaging_confirmLayer_blockAllInvites_title': '{t("Contact Requests")}',
            'messaging_confirmLayer_blockAllInvites_text': '{t("Are you sure you want to block all contact requests? Any pending requests will be rejected, and all requests you have made will be withdrawn.")}',
            'messaging_successLayer_contactRequestAccepted_title': '{t("Friend request accepted")}',
            'messaging_successLayer_contactRequestAccepted_text': '{t("Your request to become friends has been accepted.")}',
            'messaging_successLayer_noteSaved_title': '{t("Save note")}',
            'messaging_successLayer_noteSaved_text': '{t("The note was successfully saved!")}',
            'messaging_successLayer_messageSavedAsNote_title': '{t("Save as note")}',
            'messaging_successLayer_messageSavedAsNote_text': '{t("The message was successfully saved as a note!")}',
            'messaging_successLayer_messageSent_title': '{t("Message sent")}',
            'messaging_successLayer_messageSent_text': '{t("The message was successfully sent!")}',
            'messaging_successLayer_unblockAllInvites_title': '{t("Contact Requests")}',
            'messaging_successLayer_blockAllInvites_text': '{t("All contact requests will now be blocked.")}',
            'messaging_successLayer_unblockAllInvites_text': '{t("Contact requests can now be received again.")}',
            'messaging_label_blockAllInvitation': '{t("Block all invites")}',
            'messaging_label_yourInviteIsPending': '{t("Your invite is still pending.")}',
            'messaging_label_yourInviteWasDeclined': '{t("Your invite was declined.")}',
            'messaging_label_cancelYourInvite': '{t("Cancel")}',
            'messaging_label_deleteYourInvite': '{t("Delete")}',
            'messaging_follow_us': '{t("FOLLOW US:")}',
            'messaging_informationtag_frauprotection': '{t("DarkOrbit employees will never ask for your password or user data. Nor will they ask that you register on another site.")}',
            'messaging_clanMessage_acceptApply_subject': '{t("Your application for %%CLANTAG%% has been accepted")}',
            'messaging_clanMessage_acceptApply_body': '{t("Hello %%USERNAME%%,\n\<br /\>\<br /\>\nYour application to the %%CLANNAME%% Clan has been accepted.\n\<br /\>\<br /\>\nHere\'s to working together, Pilot!")}',
            'messaging_clanMessage_declineApply_subject': '{t("Your application for %%CLANTAG%% was declined")}',
            'messaging_clanMessage_declineApply_body': '{t("Hello %%USERNAME%%,\n\<br /\>\<br /\>\nYour application for the %%CLANNAME%% clan has been declined.\n\<br /\>\<br /\>\nWe wish you continued success, Pilot!")}',
            'messaging_reCaptcha_msg_headline': '{t("Recaptcha")}',
            'messaging_reCaptcha_msg_infotext': '{t("Please enter in the words displayed below. You are receiving this message because one or more recipients are either not from your contacts or in your clan.")}',
            'messaging_reCaptcha_msg_button_send': '{t("Send")}',
            'messaging_reCaptcha_msg_button_cancel': '{t("Cancel")}',
            'messaging_auctionMessage_1_subject': '{t("You were outbid.")}',
            'messaging_auctionMessage_1_body': '{t("Hi, %USERNAME%,\n\<br\>\<br\>\nYour bid on %ITEMNAME% (%SHORTITEMNAME%) was outbid. The Credits have been credited back to you.\n\<br\>\<br\>\nYour DarkOrbit Team")}',
            'messaging_auctionMessage_2_subject': '{t("Item purchased.")}',
            'messaging_auctionMessage_2_body': '{t("Hi, %USERNAME%,\n\<br\>\<br\>\nCongratulations! Your bid of %AMOUNT% Credits won you the auction for %ITEMNAME% (%SHORTITEMNAME%)!\n\<br\>\<br\>\nYour DarkOrbit Team")}',
        };

        jQuery(document).ready(function () {
            DoMessaging.getInstance().setTranslations(translations);
            DoMessaging.getInstance().init();
        });
        jQuery('#domsg_msgwrite_body').bind('mousedown keyup', function () {
            jQuery('#domsg_msgwrite_txtCounter').html(jQuery(this).val().length + '/' + 5000);
        });
        jQuery('textarea[id$="_open-body"]').live('mousedown keyup', function () {
            jQuery('#' + jQuery(this).attr('id') + '_counter').html(jQuery(this).val().length + '/' + 5000);
        });
        jQuery('.open-closebtn, .closed-clickarea, #domsg_notes_new').live('click', function () {
            if (jQuery(this).attr('id') == 'domsg_notes_new' || !jQuery('#domsg_notes_new').hasClass('button-biggreen-disabled')) {
                jQuery('.domsg_notes_txtCounter').html('');
            }
        });
        jQuery('.tab1, .tab2, .tab3, .tab4').click(function () {
            jQuery('.tab1, .tab2, .tab3, .tab4').removeClass('tab-active');
            jQuery(this).addClass('tab-active');
        });
        //]]>
    </script>

</div>

<div class="content_frame_bottom">
    <div class="content_frame_bottom_left"></div>
    <div class="content_frame_bottom_right"></div>
</div>

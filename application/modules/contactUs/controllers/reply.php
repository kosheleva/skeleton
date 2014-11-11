<?php
/**
 * Reply page
 */
namespace Application;

use Bluz\Proxy\Messages;
use Bluz\Proxy\Request;
use Bluz\Proxy\Mailer;

return
    /**
     * @param int $id
     * @param string $message
     */
    function($id, $message) use ($view) {
        /**
         * @var Bootstrap $this
         * @var View $view
         */
        $row = ContactUs\Table::findRow(['id' => $id]);
        if (empty($row)) {
            throw new Exception('Row not found', 404);
        }
        $row->mark_read = 1;
        $row->save();

        if (Request::isPost()) {
            $mail = Mailer::create();
            $mail->Subject = 'Reply';
            $mail->MsgHTML($message);
            $mail->AddAddress($row['email']);
            if (Mailer::send($mail)) {
                $row->mark_answered = 1;
                $row->save();
                Messages::addSuccess('Message was successfully sent to ' . $row['email']);
                $this->redirectTo('contactUs', 'grid');
            }
        } else {
            $view->row = $row;
        }

    };
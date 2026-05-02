package com.sun.mail.imap;

import korex.mail.Folder;
import korex.mail.Message;
import korex.mail.event.MessageCountEvent;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/MessageVanishedEvent.class */
public class MessageVanishedEvent extends MessageCountEvent {
    private long[] uids;
    private static final Message[] noMessages = new Message[0];
    private static final long serialVersionUID = 2142028010250024922L;

    public MessageVanishedEvent(Folder folder, long[] uids) {
        super(folder, 2, true, noMessages);
        this.uids = uids;
    }

    public long[] getUIDs() {
        return this.uids;
    }
}

package org.jivesoftware.smack;

import org.jivesoftware.smack.packet.Message;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/MessageListener.class */
public interface MessageListener {
    void processMessage(Chat chat, Message message);
}

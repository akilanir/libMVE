package org.jivesoftware.smack;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/ConnectionListener.class */
public interface ConnectionListener {
    void connectionClosed();

    void connectionClosedOnError(Exception exc);

    void reconnectingIn(int i);

    void reconnectionSuccessful();

    void reconnectionFailed(Exception exc);
}

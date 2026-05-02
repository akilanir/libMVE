package org.jivesoftware.smack;

import java.util.Random;
import org.jivesoftware.smack.packet.StreamError;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/ReconnectionManager.class */
public class ReconnectionManager implements ConnectionListener {
    private Connection connection;
    private Thread reconnectionThread;
    private int randomBase;
    boolean done;

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.ReconnectionManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                connection.addConnectionListener(new ReconnectionManager(connection));
            }
        });
    }

    private ReconnectionManager(Connection connection) {
        this.randomBase = new Random().nextInt(11) + 5;
        this.done = false;
        this.connection = connection;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isReconnectionAllowed() {
        return (this.done || this.connection.isConnected() || !this.connection.isReconnectionAllowed()) ? false : true;
    }

    protected synchronized void reconnect() {
        if (isReconnectionAllowed()) {
            if (this.reconnectionThread == null || !this.reconnectionThread.isAlive()) {
                this.reconnectionThread = new Thread() { // from class: org.jivesoftware.smack.ReconnectionManager.2
                    private int attempts = 0;

                    private int timeDelay() {
                        this.attempts++;
                        if (this.attempts > 13) {
                            return ReconnectionManager.this.randomBase * 6 * 5;
                        }
                        return this.attempts > 7 ? ReconnectionManager.this.randomBase * 6 : ReconnectionManager.this.randomBase;
                    }

                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        while (ReconnectionManager.this.isReconnectionAllowed()) {
                            int remainingSeconds = timeDelay();
                            while (ReconnectionManager.this.isReconnectionAllowed() && remainingSeconds > 0) {
                                try {
                                    Thread.sleep(1000L);
                                    remainingSeconds--;
                                    ReconnectionManager.this.notifyAttemptToReconnectIn(remainingSeconds);
                                } catch (InterruptedException e1) {
                                    e1.printStackTrace();
                                    ReconnectionManager.this.notifyReconnectionFailed(e1);
                                }
                            }
                            try {
                                if (ReconnectionManager.this.isReconnectionAllowed()) {
                                    ReconnectionManager.this.connection.connect();
                                }
                            } catch (XMPPException e) {
                                ReconnectionManager.this.notifyReconnectionFailed(e);
                            }
                        }
                    }
                };
                this.reconnectionThread.setName("Smack Reconnection Manager");
                this.reconnectionThread.setDaemon(true);
                this.reconnectionThread.start();
            }
        }
    }

    protected void notifyReconnectionFailed(Exception exception) {
        if (isReconnectionAllowed()) {
            for (ConnectionListener listener : this.connection.connectionListeners) {
                listener.reconnectionFailed(exception);
            }
        }
    }

    protected void notifyAttemptToReconnectIn(int seconds) {
        if (isReconnectionAllowed()) {
            for (ConnectionListener listener : this.connection.connectionListeners) {
                listener.reconnectingIn(seconds);
            }
        }
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void connectionClosed() {
        this.done = true;
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void connectionClosedOnError(Exception e) {
        this.done = false;
        if (e instanceof XMPPException) {
            XMPPException xmppEx = (XMPPException) e;
            StreamError error = xmppEx.getStreamError();
            if (error != null) {
                String reason = error.getCode();
                if ("conflict".equals(reason)) {
                    return;
                }
            }
        }
        if (isReconnectionAllowed()) {
            reconnect();
        }
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectingIn(int seconds) {
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectionFailed(Exception e) {
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectionSuccessful() {
    }
}

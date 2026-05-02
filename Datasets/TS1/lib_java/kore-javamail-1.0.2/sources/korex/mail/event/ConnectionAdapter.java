package korex.mail.event;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/ConnectionAdapter.class */
public abstract class ConnectionAdapter implements ConnectionListener {
    @Override // korex.mail.event.ConnectionListener
    public void opened(ConnectionEvent e) {
    }

    @Override // korex.mail.event.ConnectionListener
    public void disconnected(ConnectionEvent e) {
    }

    @Override // korex.mail.event.ConnectionListener
    public void closed(ConnectionEvent e) {
    }
}

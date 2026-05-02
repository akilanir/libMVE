package korex.mail.event;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/TransportAdapter.class */
public abstract class TransportAdapter implements TransportListener {
    @Override // korex.mail.event.TransportListener
    public void messageDelivered(TransportEvent e) {
    }

    @Override // korex.mail.event.TransportListener
    public void messageNotDelivered(TransportEvent e) {
    }

    @Override // korex.mail.event.TransportListener
    public void messagePartiallyDelivered(TransportEvent e) {
    }
}

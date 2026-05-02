package korex.mail.event;

import korex.mail.Folder;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/MessageCountEvent.class */
public class MessageCountEvent extends MailEvent {
    public static final int ADDED = 1;
    public static final int REMOVED = 2;
    protected int type;
    protected boolean removed;
    protected transient Message[] msgs;
    private static final long serialVersionUID = -7447022340837897369L;

    public MessageCountEvent(Folder folder, int type, boolean removed, Message[] msgs) {
        super(folder);
        this.type = type;
        this.removed = removed;
        this.msgs = msgs;
    }

    public int getType() {
        return this.type;
    }

    public boolean isRemoved() {
        return this.removed;
    }

    public Message[] getMessages() {
        return this.msgs;
    }

    @Override // korex.mail.event.MailEvent
    public void dispatch(Object listener) {
        if (this.type == 1) {
            ((MessageCountListener) listener).messagesAdded(this);
        } else {
            ((MessageCountListener) listener).messagesRemoved(this);
        }
    }
}

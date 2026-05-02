package korex.mail;

import korex.mail.FetchProfile;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/UIDFolder.class */
public interface UIDFolder {
    public static final long LASTUID = -1;

    long getUIDValidity() throws MessagingException;

    Message getMessageByUID(long j) throws MessagingException;

    Message[] getMessagesByUID(long j, long j2) throws MessagingException;

    Message[] getMessagesByUID(long[] jArr) throws MessagingException;

    long getUID(Message message) throws MessagingException;

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/UIDFolder$FetchProfileItem.class */
    public static class FetchProfileItem extends FetchProfile.Item {
        public static final FetchProfileItem UID = new FetchProfileItem("UID");

        protected FetchProfileItem(String name) {
            super(name);
        }
    }
}

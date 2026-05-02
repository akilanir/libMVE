package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/MessagingException.class */
public class MessagingException extends Exception {
    private Exception next;
    private static final long serialVersionUID = -7569192289819959253L;

    public MessagingException() {
        initCause(null);
    }

    public MessagingException(String s) {
        super(s);
        initCause(null);
    }

    public MessagingException(String s, Exception e) {
        super(s);
        this.next = e;
        initCause(null);
    }

    public synchronized Exception getNextException() {
        return this.next;
    }

    @Override // java.lang.Throwable
    public synchronized Throwable getCause() {
        return this.next;
    }

    public synchronized boolean setNextException(Exception ex) {
        Exception theEnd;
        Exception exc = this;
        while (true) {
            theEnd = exc;
            if (!(theEnd instanceof MessagingException) || ((MessagingException) theEnd).next == null) {
                break;
            }
            exc = ((MessagingException) theEnd).next;
        }
        if (theEnd instanceof MessagingException) {
            ((MessagingException) theEnd).next = ex;
            return true;
        }
        return false;
    }

    @Override // java.lang.Throwable
    public synchronized String toString() {
        String s = super.toString();
        Exception n = this.next;
        if (n == null) {
            return s;
        }
        StringBuffer sb = new StringBuffer(s == null ? "" : s);
        while (n != null) {
            sb.append(";\n  nested exception is:\n\t");
            if (n instanceof MessagingException) {
                MessagingException mex = (MessagingException) n;
                sb.append(mex.superToString());
                n = mex.next;
            } else {
                sb.append(n.toString());
                n = null;
            }
        }
        return sb.toString();
    }

    private final String superToString() {
        return super.toString();
    }
}

package korex.mail.internet;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/AddressException.class */
public class AddressException extends ParseException {
    protected String ref;
    protected int pos;
    private static final long serialVersionUID = 9134583443539323120L;

    public AddressException() {
        this.ref = null;
        this.pos = -1;
    }

    public AddressException(String s) {
        super(s);
        this.ref = null;
        this.pos = -1;
    }

    public AddressException(String s, String ref) {
        super(s);
        this.ref = null;
        this.pos = -1;
        this.ref = ref;
    }

    public AddressException(String s, String ref, int pos) {
        super(s);
        this.ref = null;
        this.pos = -1;
        this.ref = ref;
        this.pos = pos;
    }

    public String getRef() {
        return this.ref;
    }

    public int getPos() {
        return this.pos;
    }

    @Override // korex.mail.MessagingException, java.lang.Throwable
    public String toString() {
        String s = super.toString();
        if (this.ref == null) {
            return s;
        }
        String s2 = s + " in string ``" + this.ref + "''";
        if (this.pos < 0) {
            return s2;
        }
        return s2 + " at position " + this.pos;
    }
}

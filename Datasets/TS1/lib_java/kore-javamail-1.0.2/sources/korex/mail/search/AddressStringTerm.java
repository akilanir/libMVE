package korex.mail.search;

import korex.mail.Address;
import korex.mail.internet.InternetAddress;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/AddressStringTerm.class */
public abstract class AddressStringTerm extends StringTerm {
    private static final long serialVersionUID = 3086821234204980368L;

    protected AddressStringTerm(String pattern) {
        super(pattern, true);
    }

    protected boolean match(Address a) {
        if (a instanceof InternetAddress) {
            InternetAddress ia = (InternetAddress) a;
            return super.match(ia.toUnicodeString());
        }
        return super.match(a.toString());
    }

    @Override // korex.mail.search.StringTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof AddressStringTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

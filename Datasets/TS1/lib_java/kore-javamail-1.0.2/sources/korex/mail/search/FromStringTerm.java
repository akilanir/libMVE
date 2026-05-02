package korex.mail.search;

import korex.mail.Address;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/FromStringTerm.class */
public final class FromStringTerm extends AddressStringTerm {
    private static final long serialVersionUID = 5801127523826772788L;

    public FromStringTerm(String pattern) {
        super(pattern);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Address[] from = msg.getFrom();
            if (from == null) {
                return false;
            }
            for (Address address : from) {
                if (super.match(address)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @Override // korex.mail.search.AddressStringTerm, korex.mail.search.StringTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof FromStringTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

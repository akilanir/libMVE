package korex.mail.search;

import korex.mail.Address;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/FromTerm.class */
public final class FromTerm extends AddressTerm {
    private static final long serialVersionUID = 5214730291502658665L;

    public FromTerm(Address address) {
        super(address);
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

    @Override // korex.mail.search.AddressTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof FromTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

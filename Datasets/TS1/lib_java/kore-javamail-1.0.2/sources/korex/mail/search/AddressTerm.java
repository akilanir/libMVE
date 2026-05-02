package korex.mail.search;

import korex.mail.Address;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/AddressTerm.class */
public abstract class AddressTerm extends SearchTerm {
    protected Address address;
    private static final long serialVersionUID = 2005405551929769980L;

    protected AddressTerm(Address address) {
        this.address = address;
    }

    public Address getAddress() {
        return this.address;
    }

    protected boolean match(Address a) {
        return a.equals(this.address);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof AddressTerm)) {
            return false;
        }
        AddressTerm at = (AddressTerm) obj;
        return at.address.equals(this.address);
    }

    public int hashCode() {
        return this.address.hashCode();
    }
}

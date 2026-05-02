package korex.mail.search;

import korex.mail.Address;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/RecipientTerm.class */
public final class RecipientTerm extends AddressTerm {
    private Message.RecipientType type;
    private static final long serialVersionUID = 6548700653122680468L;

    public RecipientTerm(Message.RecipientType type, Address address) {
        super(address);
        this.type = type;
    }

    public Message.RecipientType getRecipientType() {
        return this.type;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Address[] recipients = msg.getRecipients(this.type);
            if (recipients == null) {
                return false;
            }
            for (Address address : recipients) {
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
        if (!(obj instanceof RecipientTerm)) {
            return false;
        }
        RecipientTerm rt = (RecipientTerm) obj;
        return rt.type.equals(this.type) && super.equals(obj);
    }

    @Override // korex.mail.search.AddressTerm
    public int hashCode() {
        return this.type.hashCode() + super.hashCode();
    }
}

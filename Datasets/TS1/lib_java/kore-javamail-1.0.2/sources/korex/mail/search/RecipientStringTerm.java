package korex.mail.search;

import korex.mail.Address;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/RecipientStringTerm.class */
public final class RecipientStringTerm extends AddressStringTerm {
    private Message.RecipientType type;
    private static final long serialVersionUID = -8293562089611618849L;

    public RecipientStringTerm(Message.RecipientType type, String pattern) {
        super(pattern);
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

    @Override // korex.mail.search.AddressStringTerm, korex.mail.search.StringTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof RecipientStringTerm)) {
            return false;
        }
        RecipientStringTerm rst = (RecipientStringTerm) obj;
        return rst.type.equals(this.type) && super.equals(obj);
    }

    @Override // korex.mail.search.StringTerm
    public int hashCode() {
        return this.type.hashCode() + super.hashCode();
    }
}

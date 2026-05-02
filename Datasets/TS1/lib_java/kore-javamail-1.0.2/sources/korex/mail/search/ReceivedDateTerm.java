package korex.mail.search;

import java.util.Date;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/ReceivedDateTerm.class */
public final class ReceivedDateTerm extends DateTerm {
    private static final long serialVersionUID = -2756695246195503170L;

    public ReceivedDateTerm(int comparison, Date date) {
        super(comparison, date);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Date d = msg.getReceivedDate();
            if (d == null) {
                return false;
            }
            return super.match(d);
        } catch (Exception e) {
            return false;
        }
    }

    @Override // korex.mail.search.DateTerm, korex.mail.search.ComparisonTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof ReceivedDateTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

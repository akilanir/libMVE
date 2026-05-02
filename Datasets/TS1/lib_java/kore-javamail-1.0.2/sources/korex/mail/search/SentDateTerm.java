package korex.mail.search;

import java.util.Date;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/SentDateTerm.class */
public final class SentDateTerm extends DateTerm {
    private static final long serialVersionUID = 5647755030530907263L;

    public SentDateTerm(int comparison, Date date) {
        super(comparison, date);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Date d = msg.getSentDate();
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
        if (!(obj instanceof SentDateTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

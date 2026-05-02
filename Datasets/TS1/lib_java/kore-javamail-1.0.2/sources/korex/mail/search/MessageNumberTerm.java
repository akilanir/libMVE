package korex.mail.search;

import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/MessageNumberTerm.class */
public final class MessageNumberTerm extends IntegerComparisonTerm {
    private static final long serialVersionUID = -5379625829658623812L;

    public MessageNumberTerm(int number) {
        super(3, number);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            int msgno = msg.getMessageNumber();
            return super.match(msgno);
        } catch (Exception e) {
            return false;
        }
    }

    @Override // korex.mail.search.IntegerComparisonTerm, korex.mail.search.ComparisonTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof MessageNumberTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

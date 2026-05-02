package korex.mail.search;

import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/SizeTerm.class */
public final class SizeTerm extends IntegerComparisonTerm {
    private static final long serialVersionUID = -2556219451005103709L;

    public SizeTerm(int comparison, int size) {
        super(comparison, size);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            int size = msg.getSize();
            if (size == -1) {
                return false;
            }
            return super.match(size);
        } catch (Exception e) {
            return false;
        }
    }

    @Override // korex.mail.search.IntegerComparisonTerm, korex.mail.search.ComparisonTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof SizeTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

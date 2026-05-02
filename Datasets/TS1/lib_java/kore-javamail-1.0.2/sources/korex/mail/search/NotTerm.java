package korex.mail.search;

import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/NotTerm.class */
public final class NotTerm extends SearchTerm {
    private SearchTerm term;
    private static final long serialVersionUID = 7152293214217310216L;

    public NotTerm(SearchTerm t) {
        this.term = t;
    }

    public SearchTerm getTerm() {
        return this.term;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        return !this.term.match(msg);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof NotTerm)) {
            return false;
        }
        NotTerm nt = (NotTerm) obj;
        return nt.term.equals(this.term);
    }

    public int hashCode() {
        return this.term.hashCode() << 1;
    }
}

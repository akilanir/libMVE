package korex.mail.search;

import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/SubjectTerm.class */
public final class SubjectTerm extends StringTerm {
    private static final long serialVersionUID = 7481568618055573432L;

    public SubjectTerm(String pattern) {
        super(pattern);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            String subj = msg.getSubject();
            if (subj == null) {
                return false;
            }
            return super.match(subj);
        } catch (Exception e) {
            return false;
        }
    }

    @Override // korex.mail.search.StringTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof SubjectTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

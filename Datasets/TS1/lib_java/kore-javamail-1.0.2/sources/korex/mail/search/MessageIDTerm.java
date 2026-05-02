package korex.mail.search;

import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/MessageIDTerm.class */
public final class MessageIDTerm extends StringTerm {
    private static final long serialVersionUID = -2121096296454691963L;

    public MessageIDTerm(String msgid) {
        super(msgid);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            String[] s = msg.getHeader("Message-ID");
            if (s == null) {
                return false;
            }
            for (String str : s) {
                if (super.match(str)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @Override // korex.mail.search.StringTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof MessageIDTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

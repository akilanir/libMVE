package korex.mail.search;

import java.io.IOException;
import korex.mail.Message;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.Part;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/BodyTerm.class */
public final class BodyTerm extends StringTerm {
    private static final long serialVersionUID = -4888862527916911385L;

    public BodyTerm(String pattern) {
        super(pattern);
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        return matchPart(msg);
    }

    private boolean matchPart(Part p) {
        try {
            if (p.isMimeType("text/*")) {
                String s = (String) p.getContent();
                if (s == null) {
                    return false;
                }
                return super.match(s);
            }
            if (!p.isMimeType("multipart/*")) {
                if (p.isMimeType("message/rfc822")) {
                    return matchPart((Part) p.getContent());
                }
                return false;
            }
            Multipart mp = (Multipart) p.getContent();
            int count = mp.getCount();
            for (int i = 0; i < count; i++) {
                if (matchPart(mp.getBodyPart(i))) {
                    return true;
                }
            }
            return false;
        } catch (IOException e) {
            return false;
        } catch (RuntimeException e2) {
            return false;
        } catch (MessagingException e3) {
            return false;
        }
    }

    @Override // korex.mail.search.StringTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof BodyTerm)) {
            return false;
        }
        return super.equals(obj);
    }
}

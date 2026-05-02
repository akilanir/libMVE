package korex.mail.search;

import java.io.Serializable;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/SearchTerm.class */
public abstract class SearchTerm implements Serializable {
    private static final long serialVersionUID = -6652358452205992789L;

    public abstract boolean match(Message message);
}

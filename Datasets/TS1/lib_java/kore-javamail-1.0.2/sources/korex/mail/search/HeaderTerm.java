package korex.mail.search;

import java.util.Locale;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/HeaderTerm.class */
public final class HeaderTerm extends StringTerm {
    private String headerName;
    private static final long serialVersionUID = 8342514650333389122L;

    public HeaderTerm(String headerName, String pattern) {
        super(pattern);
        this.headerName = headerName;
    }

    public String getHeaderName() {
        return this.headerName;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            String[] headers = msg.getHeader(this.headerName);
            if (headers == null) {
                return false;
            }
            for (String str : headers) {
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
        if (!(obj instanceof HeaderTerm)) {
            return false;
        }
        HeaderTerm ht = (HeaderTerm) obj;
        return ht.headerName.equalsIgnoreCase(this.headerName) && super.equals(ht);
    }

    @Override // korex.mail.search.StringTerm
    public int hashCode() {
        return this.headerName.toLowerCase(Locale.ENGLISH).hashCode() + super.hashCode();
    }
}

package korex.mail.internet;

import korex.mail.internet.HeaderTokenizer;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/ContentDisposition.class */
public class ContentDisposition {
    private String disposition;
    private ParameterList list;

    public ContentDisposition() {
    }

    public ContentDisposition(String disposition, ParameterList list) {
        this.disposition = disposition;
        this.list = list;
    }

    public ContentDisposition(String s) throws ParseException {
        HeaderTokenizer h = new HeaderTokenizer(s, HeaderTokenizer.MIME);
        HeaderTokenizer.Token tk = h.next();
        if (tk.getType() != -1) {
            throw new ParseException("Expected disposition, got " + tk.getValue());
        }
        this.disposition = tk.getValue();
        String rem = h.getRemainder();
        if (rem != null) {
            this.list = new ParameterList(rem);
        }
    }

    public String getDisposition() {
        return this.disposition;
    }

    public String getParameter(String name) {
        if (this.list == null) {
            return null;
        }
        return this.list.get(name);
    }

    public ParameterList getParameterList() {
        return this.list;
    }

    public void setDisposition(String disposition) {
        this.disposition = disposition;
    }

    public void setParameter(String name, String value) {
        if (this.list == null) {
            this.list = new ParameterList();
        }
        this.list.set(name, value);
    }

    public void setParameterList(ParameterList list) {
        this.list = list;
    }

    public String toString() {
        if (this.disposition == null) {
            return "";
        }
        if (this.list == null) {
            return this.disposition;
        }
        StringBuffer sb = new StringBuffer(this.disposition);
        sb.append(this.list.toString(sb.length() + 21));
        return sb.toString();
    }
}

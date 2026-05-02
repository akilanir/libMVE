package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/Header.class */
public class Header {
    protected String name;
    protected String value;

    public Header(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }
}

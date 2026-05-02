package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/PasswordAuthentication.class */
public final class PasswordAuthentication {
    private final String userName;
    private final String password;

    public PasswordAuthentication(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getPassword() {
        return this.password;
    }
}

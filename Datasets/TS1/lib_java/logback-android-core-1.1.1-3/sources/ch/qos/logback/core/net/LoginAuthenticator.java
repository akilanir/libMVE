package ch.qos.logback.core.net;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/LoginAuthenticator.class */
public class LoginAuthenticator extends Authenticator {
    String username;
    String password;

    LoginAuthenticator(String str, String str2) {
        this.username = str;
        this.password = str2;
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(this.username, this.password);
    }
}

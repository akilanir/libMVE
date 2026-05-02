package korex.mail;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: kore-javamail-1.0.2.jar:korex/mail/MailSessionDefinitions.class */
public @interface MailSessionDefinitions {
    MailSessionDefinition[] value();
}

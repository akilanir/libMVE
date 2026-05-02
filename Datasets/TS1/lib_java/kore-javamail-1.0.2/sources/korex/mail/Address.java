package korex.mail;

import java.io.Serializable;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/Address.class */
public abstract class Address implements Serializable {
    private static final long serialVersionUID = -5822459626751992278L;

    public abstract String getType();

    public abstract String toString();

    public abstract boolean equals(Object obj);
}

package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/BodyPart.class */
public abstract class BodyPart implements Part {
    protected Multipart parent;

    public Multipart getParent() {
        return this.parent;
    }

    void setParent(Multipart parent) {
        this.parent = parent;
    }
}

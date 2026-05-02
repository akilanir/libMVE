package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/Provider.class */
public class Provider {
    private Type type;
    private String protocol;
    private String className;
    private String vendor;
    private String version;

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/Provider$Type.class */
    public static class Type {
        public static final Type STORE = new Type("STORE");
        public static final Type TRANSPORT = new Type("TRANSPORT");
        private String type;

        private Type(String type) {
            this.type = type;
        }

        public String toString() {
            return this.type;
        }
    }

    public Provider(Type type, String protocol, String classname, String vendor, String version) {
        this.type = type;
        this.protocol = protocol;
        this.className = classname;
        this.vendor = vendor;
        this.version = version;
    }

    public Type getType() {
        return this.type;
    }

    public String getProtocol() {
        return this.protocol;
    }

    public String getClassName() {
        return this.className;
    }

    public String getVendor() {
        return this.vendor;
    }

    public String getVersion() {
        return this.version;
    }

    public String toString() {
        String s = "korex.mail.Provider[" + this.type + "," + this.protocol + "," + this.className;
        if (this.vendor != null) {
            s = s + "," + this.vendor;
        }
        if (this.version != null) {
            s = s + "," + this.version;
        }
        return s + "]";
    }
}

package ezvcard;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/VCardVersion.class */
public enum VCardVersion {
    V2_1("2.1", null),
    V3_0("3.0", null),
    V4_0("4.0", "urn:ietf:params:xml:ns:vcard-4.0");

    private final String version;
    private final String xmlNamespace;

    VCardVersion(String version, String xmlNamespace) {
        this.version = version;
        this.xmlNamespace = xmlNamespace;
    }

    public String getVersion() {
        return this.version;
    }

    public String getXmlNamespace() {
        return this.xmlNamespace;
    }

    public static VCardVersion valueOfByStr(String value) {
        VCardVersion[] arr$ = values();
        for (VCardVersion version : arr$) {
            if (version.getVersion().equals(value)) {
                return version;
            }
        }
        return null;
    }

    public static VCardVersion valueOfByXmlNamespace(String ns) {
        VCardVersion[] arr$ = values();
        for (VCardVersion version : arr$) {
            String versionNs = version.getXmlNamespace();
            if (versionNs != null && versionNs.equals(ns)) {
                return version;
            }
        }
        return null;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.version;
    }
}

package ezvcard.parameter;

import ezvcard.VCardVersion;
import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/EmailType.class */
public class EmailType extends VersionedVCardParameter {
    private static final VCardParameterCaseClasses<EmailType> enums = new VCardParameterCaseClasses<>(EmailType.class);
    public static final EmailType INTERNET = new EmailType("internet", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final EmailType X400 = new EmailType("x400", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final EmailType PREF = new EmailType("pref", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final EmailType AOL = new EmailType("aol", VCardVersion.V2_1);
    public static final EmailType APPLELINK = new EmailType("applelink", VCardVersion.V2_1);
    public static final EmailType ATTMAIL = new EmailType("attmail", VCardVersion.V2_1);
    public static final EmailType CIS = new EmailType("cis", VCardVersion.V2_1);
    public static final EmailType EWORLD = new EmailType("eworld", VCardVersion.V2_1);
    public static final EmailType IBMMAIL = new EmailType("ibmmail", VCardVersion.V2_1);
    public static final EmailType MCIMAIL = new EmailType("mcimail", VCardVersion.V2_1);
    public static final EmailType POWERSHARE = new EmailType("powershare", VCardVersion.V2_1);
    public static final EmailType PRODIGY = new EmailType("prodigy", VCardVersion.V2_1);
    public static final EmailType TLX = new EmailType("tlx", VCardVersion.V2_1);
    public static final EmailType HOME = new EmailType("home", VCardVersion.V4_0);
    public static final EmailType WORK = new EmailType("work", VCardVersion.V4_0);

    private EmailType(String value, VCardVersion... supportedVersions) {
        super(value, supportedVersions);
    }

    public static EmailType find(String value) {
        return enums.find(value);
    }

    public static EmailType get(String value) {
        return enums.get(value);
    }

    public static Collection<EmailType> all() {
        return enums.all();
    }
}

package ezvcard.parameter;

import ezvcard.VCardVersion;
import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/TelephoneType.class */
public class TelephoneType extends VersionedVCardParameter {
    private static final VCardParameterCaseClasses<TelephoneType> enums = new VCardParameterCaseClasses<>(TelephoneType.class);
    public static final TelephoneType BBS = new TelephoneType("bbs", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final TelephoneType CAR = new TelephoneType("car", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final TelephoneType CELL = new TelephoneType("cell", new VCardVersion[0]);
    public static final TelephoneType FAX = new TelephoneType("fax", new VCardVersion[0]);
    public static final TelephoneType HOME = new TelephoneType("home", new VCardVersion[0]);
    public static final TelephoneType ISDN = new TelephoneType("isdn", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final TelephoneType MODEM = new TelephoneType("modem", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final TelephoneType MSG = new TelephoneType("msg", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final TelephoneType PAGER = new TelephoneType("pager", new VCardVersion[0]);
    public static final TelephoneType PCS = new TelephoneType("pcs", VCardVersion.V3_0);
    public static final TelephoneType PREF = new TelephoneType("pref", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final TelephoneType TEXT = new TelephoneType("text", VCardVersion.V4_0);
    public static final TelephoneType TEXTPHONE = new TelephoneType("textphone", VCardVersion.V4_0);
    public static final TelephoneType VIDEO = new TelephoneType("video", new VCardVersion[0]);
    public static final TelephoneType VOICE = new TelephoneType("voice", new VCardVersion[0]);
    public static final TelephoneType WORK = new TelephoneType("work", new VCardVersion[0]);

    private TelephoneType(String value, VCardVersion... supportedVersions) {
        super(value, supportedVersions);
    }

    public static TelephoneType find(String value) {
        return enums.find(value);
    }

    public static TelephoneType get(String value) {
        return enums.get(value);
    }

    public static Collection<TelephoneType> all() {
        return enums.all();
    }
}

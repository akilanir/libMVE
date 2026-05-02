package ezvcard.parameter;

import ezvcard.VCardVersion;
import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/Encoding.class */
public class Encoding extends VersionedVCardParameter {
    private static final VCardParameterCaseClasses<Encoding> enums = new VCardParameterCaseClasses<>(Encoding.class);
    public static final Encoding QUOTED_PRINTABLE = new Encoding("quoted-printable", VCardVersion.V2_1);
    public static final Encoding BASE64 = new Encoding("base64", VCardVersion.V2_1);
    public static final Encoding _8BIT = new Encoding("8bit", VCardVersion.V2_1);
    public static final Encoding _7BIT = new Encoding("7bit", VCardVersion.V2_1);
    public static final Encoding B = new Encoding("b", VCardVersion.V3_0);

    private Encoding(String value, VCardVersion... supportedVersions) {
        super(value, supportedVersions);
    }

    public static Encoding find(String value) {
        return enums.find(value);
    }

    public static Encoding get(String value) {
        return enums.get(value);
    }

    public static Collection<Encoding> all() {
        return enums.all();
    }
}

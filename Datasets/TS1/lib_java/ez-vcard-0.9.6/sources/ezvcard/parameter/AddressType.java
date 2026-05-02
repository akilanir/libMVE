package ezvcard.parameter;

import ezvcard.VCardVersion;
import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/AddressType.class */
public class AddressType extends VersionedVCardParameter {
    private static final VCardParameterCaseClasses<AddressType> enums = new VCardParameterCaseClasses<>(AddressType.class);
    public static final AddressType HOME = new AddressType("home", new VCardVersion[0]);
    public static final AddressType WORK = new AddressType("work", new VCardVersion[0]);
    public static final AddressType DOM = new AddressType("dom", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final AddressType INTL = new AddressType("intl", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final AddressType POSTAL = new AddressType("postal", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final AddressType PARCEL = new AddressType("parcel", VCardVersion.V2_1, VCardVersion.V3_0);
    public static final AddressType PREF = new AddressType("pref", VCardVersion.V2_1, VCardVersion.V3_0);

    private AddressType(String value, VCardVersion... supportedVersions) {
        super(value, supportedVersions);
    }

    public static AddressType find(String value) {
        return enums.find(value);
    }

    public static AddressType get(String value) {
        return enums.get(value);
    }

    public static Collection<AddressType> all() {
        return enums.all();
    }
}

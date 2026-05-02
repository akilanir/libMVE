package ezvcard.property;

import ezvcard.VCardVersion;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Kind.class */
public class Kind extends TextProperty {
    public static final String INDIVIDUAL = "individual";
    public static final String GROUP = "group";
    public static final String ORG = "org";
    public static final String LOCATION = "location";
    public static final String APPLICATION = "application";
    public static final String DEVICE = "device";

    public Kind(String kind) {
        super(kind);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    public boolean isIndividual() {
        return INDIVIDUAL.equals(this.value);
    }

    public boolean isGroup() {
        return GROUP.equals(this.value);
    }

    public boolean isOrg() {
        return ORG.equals(this.value);
    }

    public boolean isLocation() {
        return LOCATION.equals(this.value);
    }

    public boolean isApplication() {
        return APPLICATION.equals(this.value);
    }

    public boolean isDevice() {
        return DEVICE.equals(this.value);
    }

    public static Kind individual() {
        return new Kind(INDIVIDUAL);
    }

    public static Kind group() {
        return new Kind(GROUP);
    }

    public static Kind org() {
        return new Kind(ORG);
    }

    public static Kind location() {
        return new Kind(LOCATION);
    }

    public static Kind application() {
        return new Kind(APPLICATION);
    }

    public static Kind device() {
        return new Kind(DEVICE);
    }
}

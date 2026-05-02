package ezvcard.property;

import ezvcard.VCardVersion;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Classification.class */
public class Classification extends TextProperty {
    public Classification(String classValue) {
        super(classValue);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V3_0);
    }
}

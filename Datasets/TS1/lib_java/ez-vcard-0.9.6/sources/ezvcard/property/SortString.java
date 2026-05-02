package ezvcard.property;

import ezvcard.VCardVersion;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/SortString.class */
public class SortString extends TextProperty {
    public SortString(String sortString) {
        super(sortString);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V3_0);
    }
}

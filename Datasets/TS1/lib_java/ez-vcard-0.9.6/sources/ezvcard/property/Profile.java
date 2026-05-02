package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Profile.class */
public class Profile extends TextProperty {
    public Profile() {
        super("VCARD");
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V3_0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // ezvcard.property.SimpleProperty, ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (!"VCARD".equalsIgnoreCase((String) this.value)) {
            warnings.add(new Warning(18, this.value));
        }
    }
}

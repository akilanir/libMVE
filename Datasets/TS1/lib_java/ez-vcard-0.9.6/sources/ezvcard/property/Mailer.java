package ezvcard.property;

import ezvcard.VCardVersion;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Mailer.class */
public class Mailer extends TextProperty {
    public Mailer(String emailClient) {
        super(emailClient);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V2_1, VCardVersion.V3_0);
    }
}

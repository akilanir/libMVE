package ezvcard.property;

import ezvcard.VCardVersion;
import ezvcard.util.PartialDate;
import java.util.Date;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Anniversary.class */
public class Anniversary extends DateOrTimeProperty {
    public Anniversary(Date date) {
        super(date);
    }

    public Anniversary(Date date, boolean hasTime) {
        super(date, hasTime);
    }

    public Anniversary(PartialDate partialDate) {
        super(partialDate);
    }

    public Anniversary(String text) {
        super(text);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }
}

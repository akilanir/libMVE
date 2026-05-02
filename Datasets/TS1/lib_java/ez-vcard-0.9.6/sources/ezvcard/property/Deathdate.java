package ezvcard.property;

import ezvcard.VCardVersion;
import ezvcard.util.PartialDate;
import java.util.Date;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Deathdate.class */
public class Deathdate extends DateOrTimeProperty {
    public Deathdate(Date date) {
        super(date);
    }

    public Deathdate(Date date, boolean hasTime) {
        super(date, hasTime);
    }

    public Deathdate(PartialDate partialDate) {
        super(partialDate);
    }

    public Deathdate(String text) {
        super(text);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    @Override // ezvcard.property.VCardProperty
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }
}

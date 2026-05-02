package ezvcard.property;

import ezvcard.VCardVersion;
import ezvcard.parameter.InterestLevel;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Interest.class */
public class Interest extends TextProperty implements HasAltId {
    public Interest(String interest) {
        super(interest);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    public InterestLevel getLevel() {
        String value = this.parameters.getLevel();
        if (value == null) {
            return null;
        }
        return InterestLevel.get(value);
    }

    public void setLevel(InterestLevel level) {
        String value = level == null ? null : level.getValue();
        this.parameters.setLevel(value);
    }

    @Override // ezvcard.property.VCardProperty
    public Integer getIndex() {
        return super.getIndex();
    }

    @Override // ezvcard.property.VCardProperty
    public void setIndex(Integer index) {
        super.setIndex(index);
    }

    public String getType() {
        return this.parameters.getType();
    }

    public void setType(String type) {
        this.parameters.setType(type);
    }

    @Override // ezvcard.property.VCardProperty
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }

    @Override // ezvcard.property.VCardProperty
    public Integer getPref() {
        return super.getPref();
    }

    @Override // ezvcard.property.VCardProperty
    public void setPref(Integer pref) {
        super.setPref(pref);
    }

    @Override // ezvcard.property.HasAltId
    public String getAltId() {
        return this.parameters.getAltId();
    }

    @Override // ezvcard.property.HasAltId
    public void setAltId(String altId) {
        this.parameters.setAltId(altId);
    }
}

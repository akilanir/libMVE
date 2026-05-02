package ezvcard.property;

import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Organization.class */
public class Organization extends TextListProperty implements HasAltId {
    @Override // ezvcard.property.VCardProperty
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }

    public String getType() {
        return this.parameters.getType();
    }

    public void setType(String type) {
        this.parameters.setType(type);
    }

    @Override // ezvcard.property.VCardProperty
    public List<Integer[]> getPids() {
        return super.getPids();
    }

    @Override // ezvcard.property.VCardProperty
    public void addPid(int localId, int clientPidMapRef) {
        super.addPid(localId, clientPidMapRef);
    }

    @Override // ezvcard.property.VCardProperty
    public void removePids() {
        super.removePids();
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

    public List<String> getSortAs() {
        return this.parameters.getSortAs();
    }

    public void setSortAs(String... names) {
        this.parameters.setSortAs(names);
    }
}

package ezvcard.property;

import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Url.class */
public class Url extends UriProperty implements HasAltId {
    public Url(String url) {
        super(url);
    }

    public String getMediaType() {
        return this.parameters.getMediaType();
    }

    public void setMediaType(String mediaType) {
        this.parameters.setMediaType(mediaType);
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

    public String getType() {
        return this.parameters.getType();
    }

    public void setType(String type) {
        this.parameters.setType(type);
    }
}

package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.util.TelUri;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Member.class */
public class Member extends UriProperty implements HasAltId {
    public Member(String uri) {
        super(uri);
    }

    public static Member email(String email) {
        return new Member("mailto:" + email);
    }

    public static Member im(String protocol, String handle) {
        return new Member(protocol + ":" + handle);
    }

    public static Member telephone(TelUri telUri) {
        return new Member(telUri.toString());
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    public String getUri() {
        return getValue();
    }

    public void setUri(String uri) {
        setValue(uri);
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

    public String getMediaType() {
        return this.parameters.getMediaType();
    }

    public void setMediaType(String mediaType) {
        this.parameters.setMediaType(mediaType);
    }

    @Override // ezvcard.property.SimpleProperty, ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        super._validate(warnings, version, vcard);
        if (vcard.getKind() == null || !vcard.getKind().isGroup()) {
            warnings.add(new Warning(17, new Object[0]));
        }
    }
}

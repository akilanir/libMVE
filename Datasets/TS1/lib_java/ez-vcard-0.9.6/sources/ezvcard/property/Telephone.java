package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.TelephoneType;
import ezvcard.util.TelUri;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Telephone.class */
public class Telephone extends VCardProperty implements HasAltId {
    private String text;
    private TelUri uri;

    public Telephone(String text) {
        setText(text);
    }

    public Telephone(TelUri uri) {
        setUri(uri);
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
        this.uri = null;
    }

    public TelUri getUri() {
        return this.uri;
    }

    public void setUri(TelUri uri) {
        this.text = null;
        this.uri = uri;
    }

    public Set<TelephoneType> getTypes() {
        Set<String> values = this.parameters.getTypes();
        Set<TelephoneType> types = new HashSet<>(values.size());
        for (String value : values) {
            types.add(TelephoneType.get(value));
        }
        return types;
    }

    public void addType(TelephoneType type) {
        this.parameters.addType(type.getValue());
    }

    public void removeType(TelephoneType type) {
        this.parameters.removeType(type.getValue());
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

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.uri == null && this.text == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
        if (this.uri != null && (version == VCardVersion.V2_1 || version == VCardVersion.V3_0)) {
            warnings.add(new Warning(19, new Object[0]));
        }
        for (TelephoneType type : getTypes()) {
            if (type != TelephoneType.PREF && !type.isSupported(version)) {
                warnings.add(new Warning(9, type.getValue()));
            }
        }
    }
}

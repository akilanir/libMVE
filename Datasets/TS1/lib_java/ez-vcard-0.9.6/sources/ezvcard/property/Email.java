package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.EmailType;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Email.class */
public class Email extends TextProperty implements HasAltId {
    public Email(String email) {
        super(email);
    }

    public Set<EmailType> getTypes() {
        Set<String> values = this.parameters.getTypes();
        Set<EmailType> types = new HashSet<>(values.size());
        for (String value : values) {
            types.add(EmailType.get(value));
        }
        return types;
    }

    public void addType(EmailType type) {
        this.parameters.addType(type.getValue());
    }

    public void removeType(EmailType type) {
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

    @Override // ezvcard.property.SimpleProperty, ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        super._validate(warnings, version, vcard);
        for (EmailType type : getTypes()) {
            if (type != EmailType.PREF && !type.isSupported(version)) {
                warnings.add(new Warning(9, type.getValue()));
            }
        }
    }
}

package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.AddressType;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Address.class */
public class Address extends VCardProperty implements HasAltId {
    private String poBox;
    private String extendedAddress;
    private String streetAddress;
    private String locality;
    private String region;
    private String postalCode;
    private String country;

    public String getPoBox() {
        return this.poBox;
    }

    public void setPoBox(String poBox) {
        this.poBox = poBox;
    }

    public String getExtendedAddress() {
        return this.extendedAddress;
    }

    public void setExtendedAddress(String extendedAddress) {
        this.extendedAddress = extendedAddress;
    }

    public String getStreetAddress() {
        return this.streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getLocality() {
        return this.locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public String getRegion() {
        return this.region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getPostalCode() {
        return this.postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Set<AddressType> getTypes() {
        Set<String> values = this.parameters.getTypes();
        Set<AddressType> types = new HashSet<>(values.size());
        for (String value : values) {
            types.add(AddressType.get(value));
        }
        return types;
    }

    public void addType(AddressType type) {
        this.parameters.addType(type.getValue());
    }

    public void removeType(AddressType type) {
        this.parameters.removeType(type.getValue());
    }

    @Override // ezvcard.property.VCardProperty
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }

    public String getLabel() {
        return this.parameters.getLabel();
    }

    public void setLabel(String label) {
        this.parameters.setLabel(label);
    }

    public double[] getGeo() {
        return this.parameters.getGeo();
    }

    public void setGeo(double latitude, double longitude) {
        this.parameters.setGeo(latitude, longitude);
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

    public String getTimezone() {
        return this.parameters.getTimezone();
    }

    public void setTimezone(String timezone) {
        this.parameters.setTimezone(timezone);
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        for (AddressType type : getTypes()) {
            if (type != AddressType.PREF && !type.isSupported(version)) {
                warnings.add(new Warning(9, type.getValue()));
            }
        }
    }
}

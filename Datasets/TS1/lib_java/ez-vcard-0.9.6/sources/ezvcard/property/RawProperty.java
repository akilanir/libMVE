package ezvcard.property;

import ezvcard.VCardDataType;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/RawProperty.class */
public class RawProperty extends TextProperty {
    private String propertyName;
    private VCardDataType dataType;

    public RawProperty(String propertyName, String value) {
        this(propertyName, value, null);
    }

    public RawProperty(String propertyName, String value, VCardDataType dataType) {
        super(value);
        this.propertyName = propertyName;
        this.dataType = dataType;
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public VCardDataType getDataType() {
        return this.dataType;
    }

    public void setDataType(VCardDataType dataType) {
        this.dataType = dataType;
    }
}

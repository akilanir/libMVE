package ezvcard.property;

import ezvcard.VCardVersion;
import ezvcard.parameter.AddressType;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Label.class */
public class Label extends TextProperty {
    public Label(String label) {
        super(label);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V2_1, VCardVersion.V3_0);
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
}

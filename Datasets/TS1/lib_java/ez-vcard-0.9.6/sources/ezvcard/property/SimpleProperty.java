package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/SimpleProperty.class */
public class SimpleProperty<T> extends VCardProperty {
    protected T value;

    public SimpleProperty(T value) {
        this.value = value;
    }

    public T getValue() {
        return this.value;
    }

    public void setValue(T value) {
        this.value = value;
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.value == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}

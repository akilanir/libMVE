package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import java.util.ArrayList;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/ListProperty.class */
public class ListProperty<T> extends VCardProperty {
    protected List<T> values = new ArrayList();

    public List<T> getValues() {
        return this.values;
    }

    public void addValue(T value) {
        this.values.add(value);
    }

    public void removeValue(T value) {
        this.values.remove(value);
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.values.isEmpty()) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}

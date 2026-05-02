package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.property.TextProperty;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/StringPropertyScribe.class */
public abstract class StringPropertyScribe<T extends TextProperty> extends SimplePropertyScribe<T> {
    public StringPropertyScribe(Class<T> clazz, String propertyName) {
        this(clazz, propertyName, VCardDataType.TEXT);
    }

    public StringPropertyScribe(Class<T> clazz, String propertyName, VCardDataType dataType) {
        super(clazz, propertyName, dataType);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public String _writeValue(T property) {
        return (String) property.getValue();
    }
}

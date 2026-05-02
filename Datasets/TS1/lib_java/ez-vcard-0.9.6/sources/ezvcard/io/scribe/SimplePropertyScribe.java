package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/SimplePropertyScribe.class */
public abstract class SimplePropertyScribe<T extends VCardProperty> extends VCardPropertyScribe<T> {
    protected final VCardDataType dataType;

    protected abstract String _writeValue(T t);

    protected abstract T _parseValue(String str);

    public SimplePropertyScribe(Class<T> clazz, String propertyName, VCardDataType dataType) {
        super(clazz, propertyName);
        this.dataType = dataType;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return this.dataType;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected String _writeText(T property, VCardVersion version) {
        String value = _writeValue(property);
        return value == null ? "" : escape(value);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseText(String str, VCardDataType vCardDataType, VCardVersion vCardVersion, VCardParameters vCardParameters, List<String> list) {
        return (T) _parseValue(unescape(str));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected void _writeXml(T property, XCardElement parent) {
        parent.append(this.dataType, _writeValue(property));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseXml(XCardElement xCardElement, VCardParameters vCardParameters, List<String> list) {
        String first = xCardElement.first(this.dataType);
        if (first != null) {
            return (T) _parseValue(first);
        }
        throw VCardPropertyScribe.missingXmlElements(this.dataType);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseHtml(HCardElement hCardElement, List<String> list) {
        return (T) _parseValue(hCardElement.value());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected JCardValue _writeJson(T property) {
        String value = _writeValue(property);
        if (value == null) {
            value = "";
        }
        return JCardValue.single(value);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseJson(JCardValue jCardValue, VCardDataType vCardDataType, VCardParameters vCardParameters, List<String> list) {
        return (T) _parseValue(jCardValue.asSingle());
    }
}

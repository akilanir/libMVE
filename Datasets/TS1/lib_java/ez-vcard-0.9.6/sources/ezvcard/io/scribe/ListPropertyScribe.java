package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.TextListProperty;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ListPropertyScribe.class */
public abstract class ListPropertyScribe<T extends TextListProperty> extends VCardPropertyScribe<T> {
    protected abstract T _newInstance();

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseJson(JCardValue x0, VCardDataType x1, VCardParameters x2, List x3) {
        return _parseJson(x0, x1, x2, (List<String>) x3);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseXml(XCardElement x0, VCardParameters x1, List x2) {
        return _parseXml(x0, x1, (List<String>) x2);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public ListPropertyScribe(Class<T> clazz, String propertyName) {
        super(clazz, propertyName);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(T property, VCardVersion version) {
        return list(property.getValues());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseText(String str, VCardDataType vCardDataType, VCardVersion vCardVersion, VCardParameters vCardParameters, List<String> list) {
        return (T) parse(list(str));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(T property, XCardElement parent) {
        parent.append(VCardDataType.TEXT.getName().toLowerCase(), property.getValues());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseXml(XCardElement xCardElement, VCardParameters vCardParameters, List<String> list) {
        List<String> all = xCardElement.all(VCardDataType.TEXT);
        if (all.isEmpty()) {
            throw missingXmlElements(VCardDataType.TEXT);
        }
        return (T) parse(all);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(T property) {
        List<String> values = property.getValues();
        if (values.isEmpty()) {
            return JCardValue.single("");
        }
        return JCardValue.multi(values);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseJson(JCardValue jCardValue, VCardDataType vCardDataType, VCardParameters vCardParameters, List<String> list) {
        return (T) parse(jCardValue.asMulti());
    }

    private T parse(List<String> list) {
        T t = (T) _newInstance();
        t.getValues().addAll(list);
        return t;
    }
}

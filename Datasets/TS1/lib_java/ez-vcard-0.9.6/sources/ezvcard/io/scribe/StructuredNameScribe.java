package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Gender;
import ezvcard.property.StructuredName;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/StructuredNameScribe.class */
public class StructuredNameScribe extends VCardPropertyScribe<StructuredName> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseJson(JCardValue x0, VCardDataType x1, VCardParameters x2, List x3) {
        return _parseJson(x0, x1, x2, (List<String>) x3);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseXml(XCardElement x0, VCardParameters x1, List x2) {
        return _parseXml(x0, x1, (List<String>) x2);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public StructuredNameScribe() {
        super(StructuredName.class, Gender.NONE);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(StructuredName property, VCardVersion version) {
        return structured(property.getFamily(), property.getGiven(), property.getAdditional(), property.getPrefixes(), property.getSuffixes());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected StructuredName _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        StructuredName property = new StructuredName();
        VCardPropertyScribe.StructuredIterator it = structured(value);
        property.setFamily(it.nextString());
        property.setGiven(it.nextString());
        property.getAdditional().addAll(it.nextComponent());
        property.getPrefixes().addAll(it.nextComponent());
        property.getSuffixes().addAll(it.nextComponent());
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(StructuredName property, XCardElement parent) {
        parent.append("surname", property.getFamily());
        parent.append("given", property.getGiven());
        parent.append("additional", property.getAdditional());
        parent.append("prefix", property.getPrefixes());
        parent.append("suffix", property.getSuffixes());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected StructuredName _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        StructuredName property = new StructuredName();
        property.setFamily(s(element.first("surname")));
        property.setGiven(s(element.first("given")));
        property.getAdditional().addAll(element.all("additional"));
        property.getPrefixes().addAll(element.all("prefix"));
        property.getSuffixes().addAll(element.all("suffix"));
        return property;
    }

    private String s(String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        return value;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected StructuredName _parseHtml(HCardElement element, List<String> warnings) {
        StructuredName property = new StructuredName();
        property.setFamily(s(element.firstValue("family-name")));
        property.setGiven(s(element.firstValue("given-name")));
        property.getAdditional().addAll(element.allValues("additional-name"));
        property.getPrefixes().addAll(element.allValues("honorific-prefix"));
        property.getSuffixes().addAll(element.allValues("honorific-suffix"));
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(StructuredName property) {
        return JCardValue.structured(property.getFamily(), property.getGiven(), property.getAdditional(), property.getPrefixes(), property.getSuffixes());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected StructuredName _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        StructuredName property = new StructuredName();
        VCardPropertyScribe.StructuredIterator it = structured(value);
        property.setFamily(it.nextString());
        property.setGiven(it.nextString());
        property.getAdditional().addAll(it.nextComponent());
        property.getPrefixes().addAll(it.nextComponent());
        property.getSuffixes().addAll(it.nextComponent());
        return property;
    }
}

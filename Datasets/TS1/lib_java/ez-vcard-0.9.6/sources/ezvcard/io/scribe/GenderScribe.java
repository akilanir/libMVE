package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.json.JCardValue;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Gender;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/GenderScribe.class */
public class GenderScribe extends VCardPropertyScribe<Gender> {
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

    public GenderScribe() {
        super(Gender.class, "GENDER");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Gender property, VCardVersion version) {
        String gender = property.getGender();
        String text = property.getText();
        return text != null ? structured(gender, text) : gender != null ? structured(gender) : "";
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Gender _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        VCardPropertyScribe.SemiStructuredIterator it = semistructured(value, 2);
        String sex = it.next();
        if (sex != null) {
            if (sex.length() == 0) {
                sex = null;
            } else {
                sex = sex.toUpperCase();
            }
        }
        String text = it.next();
        Gender property = new Gender(sex);
        property.setText(text);
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Gender property, XCardElement parent) {
        parent.append("sex", property.getGender());
        String text = property.getText();
        if (text != null) {
            parent.append("identity", text);
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Gender _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String sex = element.first("sex");
        if (sex == null) {
            throw missingXmlElements("sex");
        }
        Gender property = new Gender(sex);
        property.setText(element.first("identity"));
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Gender property) {
        String gender = property.getGender();
        String text = property.getText();
        return text == null ? JCardValue.single(gender) : JCardValue.structured(gender, text);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Gender _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        VCardPropertyScribe.StructuredIterator it = structured(value);
        String sex = it.nextString();
        if (sex != null) {
            sex = sex.toUpperCase();
        }
        String text = it.nextString();
        Gender property = new Gender(sex);
        property.setText(text);
        return property;
    }
}

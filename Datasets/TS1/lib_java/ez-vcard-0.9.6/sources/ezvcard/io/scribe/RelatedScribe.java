package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Related;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/RelatedScribe.class */
public class RelatedScribe extends VCardPropertyScribe<Related> {
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

    public RelatedScribe() {
        super(Related.class, "RELATED");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.URI;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(Related property, VCardVersion version) {
        if (property.getUri() != null) {
            return VCardDataType.URI;
        }
        if (property.getText() != null) {
            return VCardDataType.TEXT;
        }
        return VCardDataType.URI;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Related property, VCardVersion version) {
        String uri = property.getUri();
        if (uri != null) {
            return uri;
        }
        String text = property.getText();
        if (text != null) {
            return escape(text);
        }
        return "";
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Related _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        String value2 = unescape(value);
        Related property = new Related();
        if (dataType == VCardDataType.TEXT) {
            property.setText(value2);
        } else {
            property.setUri(value2);
        }
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Related property, XCardElement parent) {
        String uri = property.getUri();
        if (uri != null) {
            parent.append(VCardDataType.URI, uri);
            return;
        }
        String text = property.getText();
        if (text != null) {
            parent.append(VCardDataType.TEXT, text);
        } else {
            parent.append(VCardDataType.URI, "");
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Related _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String uri = element.first(VCardDataType.URI);
        if (uri != null) {
            Related property = new Related();
            property.setUri(uri);
            return property;
        }
        String text = element.first(VCardDataType.TEXT);
        if (text == null) {
            throw missingXmlElements(VCardDataType.URI, VCardDataType.TEXT);
        }
        Related property2 = new Related();
        property2.setText(text);
        return property2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Related property) {
        String uri = property.getUri();
        if (uri != null) {
            return JCardValue.single(uri);
        }
        String text = property.getText();
        if (text != null) {
            return JCardValue.single(text);
        }
        return JCardValue.single("");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Related _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        String valueStr = value.asSingle();
        Related property = new Related();
        if (dataType == VCardDataType.TEXT) {
            property.setText(valueStr);
        } else {
            property.setUri(valueStr);
        }
        return property;
    }
}

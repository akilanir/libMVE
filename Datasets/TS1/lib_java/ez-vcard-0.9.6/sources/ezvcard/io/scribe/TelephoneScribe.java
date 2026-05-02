package ezvcard.io.scribe;

import ezvcard.Messages;
import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Telephone;
import ezvcard.property.VCardProperty;
import ezvcard.util.TelUri;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/TelephoneScribe.class */
public class TelephoneScribe extends VCardPropertyScribe<Telephone> {
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

    public TelephoneScribe() {
        super(Telephone.class, "TEL");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(Telephone property, VCardVersion version) {
        if (version == VCardVersion.V4_0) {
            if (property.getText() != null) {
                return VCardDataType.TEXT;
            }
            if (property.getUri() != null) {
                return VCardDataType.URI;
            }
        }
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _prepareParameters(Telephone property, VCardParameters copy, VCardVersion version, VCard vcard) {
        handlePrefParam(property, copy, version, vcard);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Telephone property, VCardVersion version) {
        String text = property.getText();
        if (text != null) {
            return escape(text);
        }
        TelUri uri = property.getUri();
        if (uri != null) {
            if (version == VCardVersion.V4_0) {
                return uri.toString();
            }
            String ext = uri.getExtension();
            if (ext == null) {
                return escape(uri.getNumber());
            }
            return escape(uri.getNumber() + " x" + ext);
        }
        return "";
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Telephone _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        return parse(unescape(value), dataType, warnings);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Telephone property, XCardElement parent) {
        String text = property.getText();
        if (text != null) {
            parent.append(VCardDataType.TEXT, text);
            return;
        }
        TelUri uri = property.getUri();
        if (uri != null) {
            parent.append(VCardDataType.URI, uri.toString());
        } else {
            parent.append(VCardDataType.TEXT, "");
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Telephone _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String text = element.first(VCardDataType.TEXT);
        if (text != null) {
            return new Telephone(text);
        }
        String uri = element.first(VCardDataType.URI);
        if (uri == null) {
            throw missingXmlElements(VCardDataType.TEXT, VCardDataType.URI);
        }
        try {
            return new Telephone(TelUri.parse(uri));
        } catch (IllegalArgumentException e) {
            warnings.add(Messages.INSTANCE.getParseMessage(18, new Object[0]));
            return new Telephone(uri);
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Telephone _parseHtml(HCardElement element, List<String> warnings) {
        Telephone property;
        String href = element.attr("href");
        try {
            property = new Telephone(TelUri.parse(href));
        } catch (IllegalArgumentException e) {
            property = new Telephone(element.value());
        }
        List<String> types = element.types();
        for (String type : types) {
            property.getParameters().addType(type);
        }
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Telephone property) {
        String text = property.getText();
        if (text != null) {
            return JCardValue.single(text);
        }
        TelUri uri = property.getUri();
        if (uri != null) {
            return JCardValue.single(uri.toString());
        }
        return JCardValue.single("");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Telephone _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        String valueStr = value.asSingle();
        return parse(valueStr, dataType, warnings);
    }

    private Telephone parse(String value, VCardDataType dataType, List<String> warnings) {
        try {
            return new Telephone(TelUri.parse(value));
        } catch (IllegalArgumentException e) {
            if (dataType == VCardDataType.URI) {
                warnings.add(Messages.INSTANCE.getParseMessage(18, new Object[0]));
            }
            return new Telephone(value);
        }
    }
}

package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.PlaceProperty;
import ezvcard.property.VCardProperty;
import ezvcard.util.GeoUri;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/PlacePropertyScribe.class */
public abstract class PlacePropertyScribe<T extends PlaceProperty> extends VCardPropertyScribe<T> {
    protected abstract T newInstance();

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

    public PlacePropertyScribe(Class<T> clazz, String propertyName) {
        super(clazz, propertyName);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(T property, VCardVersion version) {
        if (property.getText() != null) {
            return VCardDataType.TEXT;
        }
        if (property.getUri() != null || property.getGeoUri() != null) {
            return VCardDataType.URI;
        }
        return _defaultDataType(version);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(T property, VCardVersion version) {
        String text = property.getText();
        if (text != null) {
            return escape(text);
        }
        String uri = property.getUri();
        if (uri != null) {
            return uri;
        }
        GeoUri geoUri = property.getGeoUri();
        if (geoUri != null) {
            return geoUri.toString();
        }
        return "";
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseText(String str, VCardDataType vCardDataType, VCardVersion vCardVersion, VCardParameters vCardParameters, List<String> list) {
        T t = (T) newInstance();
        String unescape = unescape(str);
        if (vCardDataType == VCardDataType.TEXT) {
            t.setText(unescape);
            return t;
        }
        if (vCardDataType == VCardDataType.URI) {
            try {
                t.setGeoUri(GeoUri.parse(unescape));
            } catch (IllegalArgumentException e) {
                t.setUri(unescape);
            }
            return t;
        }
        t.setText(unescape);
        return t;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(T property, XCardElement parent) {
        String text = property.getText();
        if (text != null) {
            parent.append(VCardDataType.TEXT, text);
            return;
        }
        String uri = property.getUri();
        if (uri != null) {
            parent.append(VCardDataType.URI, uri);
            return;
        }
        GeoUri geoUri = property.getGeoUri();
        if (geoUri != null) {
            parent.append(VCardDataType.URI, geoUri.toString());
        } else {
            parent.append(VCardDataType.TEXT, "");
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseXml(XCardElement xCardElement, VCardParameters vCardParameters, List<String> list) {
        T t = (T) newInstance();
        String first = xCardElement.first(VCardDataType.TEXT);
        if (first != null) {
            t.setText(first);
            return t;
        }
        String first2 = xCardElement.first(VCardDataType.URI);
        if (first2 == null) {
            throw missingXmlElements(VCardDataType.TEXT, VCardDataType.URI);
        }
        try {
            t.setGeoUri(GeoUri.parse(first2));
        } catch (IllegalArgumentException e) {
            t.setUri(first2);
        }
        return t;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(T property) {
        String text = property.getText();
        if (text != null) {
            return JCardValue.single(text);
        }
        String uri = property.getUri();
        if (uri != null) {
            return JCardValue.single(uri);
        }
        GeoUri geoUri = property.getGeoUri();
        if (geoUri != null) {
            return JCardValue.single(geoUri.toString());
        }
        return JCardValue.single("");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseJson(JCardValue jCardValue, VCardDataType vCardDataType, VCardParameters vCardParameters, List<String> list) {
        T t = (T) newInstance();
        String asSingle = jCardValue.asSingle();
        if (vCardDataType == VCardDataType.TEXT) {
            t.setText(asSingle);
            return t;
        }
        if (vCardDataType == VCardDataType.URI) {
            try {
                t.setGeoUri(GeoUri.parse(asSingle));
            } catch (IllegalArgumentException e) {
                t.setUri(asSingle);
            }
            return t;
        }
        t.setText(asSingle);
        return t;
    }
}

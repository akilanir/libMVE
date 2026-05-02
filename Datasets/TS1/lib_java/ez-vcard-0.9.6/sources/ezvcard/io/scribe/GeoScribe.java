package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Geo;
import ezvcard.property.VCardProperty;
import ezvcard.util.GeoUri;
import ezvcard.util.VCardFloatFormatter;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/GeoScribe.class */
public class GeoScribe extends VCardPropertyScribe<Geo> {
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

    public GeoScribe() {
        super(Geo.class, VCardParameters.GEO);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        switch (version) {
            case V2_1:
            case V3_0:
                return null;
            case V4_0:
                return VCardDataType.URI;
            default:
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Geo property, VCardVersion version) {
        return write(property, version);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Geo _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        return parse(unescape(value), version, warnings);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Geo property, XCardElement parent) {
        parent.append(VCardDataType.URI, write(property, parent.version()));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Geo _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String value = element.first(VCardDataType.URI);
        if (value != null) {
            return parse(value, element.version(), warnings);
        }
        throw missingXmlElements(VCardDataType.URI);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Geo _parseHtml(HCardElement element, List<String> warnings) {
        String latitudeStr = element.firstValue("latitude");
        if (latitudeStr == null) {
            throw new CannotParseException(7, new Object[0]);
        }
        try {
            Double latitude = Double.valueOf(Double.parseDouble(latitudeStr));
            String longitudeStr = element.firstValue("longitude");
            if (longitudeStr == null) {
                throw new CannotParseException(9, new Object[0]);
            }
            try {
                Double longitude = Double.valueOf(Double.parseDouble(longitudeStr));
                return new Geo(latitude, longitude);
            } catch (NumberFormatException e) {
                throw new CannotParseException(10, longitudeStr);
            }
        } catch (NumberFormatException e2) {
            throw new CannotParseException(8, latitudeStr);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Geo property) {
        return JCardValue.single(write(property, VCardVersion.V4_0));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Geo _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        return parse(value.asSingle(), VCardVersion.V4_0, warnings);
    }

    private Geo parse(String value, VCardVersion version, List<String> warnings) {
        if (value == null || value.length() == 0) {
            return new Geo(null);
        }
        switch (version) {
            case V2_1:
            case V3_0:
                VCardPropertyScribe.SemiStructuredIterator it = semistructured(value);
                String latitudeStr = it.next();
                String longitudeStr = it.next();
                if (latitudeStr == null || longitudeStr == null) {
                    throw new CannotParseException(11, new Object[0]);
                }
                try {
                    Double latitude = Double.valueOf(latitudeStr);
                    try {
                        Double longitude = Double.valueOf(longitudeStr);
                        return new Geo(latitude, longitude);
                    } catch (NumberFormatException e) {
                        throw new CannotParseException(10, longitudeStr);
                    }
                } catch (NumberFormatException e2) {
                    throw new CannotParseException(8, latitudeStr);
                }
            case V4_0:
                try {
                    return new Geo(GeoUri.parse(value));
                } catch (IllegalArgumentException e3) {
                    throw new CannotParseException(12, new Object[0]);
                }
            default:
                return null;
        }
    }

    private String write(Geo property, VCardVersion version) {
        if (property.getGeoUri() == null) {
            return "";
        }
        switch (version) {
            case V2_1:
            case V3_0:
                VCardFloatFormatter formatter = new VCardFloatFormatter(6);
                return structured(formatter.format(property.getLatitude()), formatter.format(property.getLongitude()));
            case V4_0:
                return property.getGeoUri().toString(6);
            default:
                return null;
        }
    }
}

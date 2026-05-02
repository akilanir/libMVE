package ezvcard.io.scribe;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.Encoding;
import ezvcard.parameter.MediaTypeParameter;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.BinaryProperty;
import ezvcard.property.VCardProperty;
import ezvcard.util.DataUri;
import ezvcard.util.org.apache.commons.codec.binary.Base64;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/BinaryPropertyScribe.class */
public abstract class BinaryPropertyScribe<T extends BinaryProperty<U>, U extends MediaTypeParameter> extends VCardPropertyScribe<T> {
    protected abstract U _buildMediaTypeObj(String str);

    protected abstract U _buildTypeObj(String str);

    protected abstract T _newInstance(String str, U u);

    protected abstract T _newInstance(byte[] bArr, U u);

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

    public BinaryPropertyScribe(Class<T> clazz, String propertyName) {
        super(clazz, propertyName);
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
    public VCardDataType _dataType(T property, VCardVersion version) {
        if (property.getUrl() != null) {
            switch (version) {
                case V2_1:
                    return VCardDataType.URL;
                case V3_0:
                case V4_0:
                    return VCardDataType.URI;
            }
        }
        if (property.getData() != null) {
            switch (version) {
                case V2_1:
                case V3_0:
                    return null;
                case V4_0:
                    return VCardDataType.URI;
            }
        }
        return _defaultDataType(version);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _prepareParameters(T property, VCardParameters copy, VCardVersion version, VCard vcard) {
        MediaTypeParameter contentType = property.getContentType();
        if (contentType == null) {
            contentType = new MediaTypeParameter(null, null, null);
        }
        if (property.getUrl() != null) {
            copy.setEncoding(null);
            switch (version) {
                case V2_1:
                    copy.setType(contentType.getValue());
                    copy.setMediaType(null);
                    break;
                case V3_0:
                    copy.setType(contentType.getValue());
                    copy.setMediaType(null);
                    break;
                case V4_0:
                    copy.setMediaType(contentType.getMediaType());
                    break;
            }
        }
        if (property.getData() != null) {
            copy.setMediaType(null);
            switch (version) {
                case V2_1:
                    copy.setEncoding(Encoding.BASE64);
                    copy.setType(contentType.getValue());
                    break;
                case V3_0:
                    copy.setEncoding(Encoding.B);
                    copy.setType(contentType.getValue());
                    break;
                case V4_0:
                    copy.setEncoding(null);
                    break;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(T property, VCardVersion version) {
        return write(property, version);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseText(String str, VCardDataType vCardDataType, VCardVersion vCardVersion, VCardParameters vCardParameters, List<String> list) {
        return (T) parse(unescape(str), vCardDataType, vCardParameters, vCardVersion, list);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(T property, XCardElement parent) {
        parent.append(VCardDataType.URI, write(property, parent.version()));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseXml(XCardElement xCardElement, VCardParameters vCardParameters, List<String> list) {
        String first = xCardElement.first(VCardDataType.URI);
        if (first != null) {
            return (T) parse(first, VCardDataType.URI, vCardParameters, xCardElement.version(), list);
        }
        throw missingXmlElements(VCardDataType.URI);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseHtml(HCardElement hCardElement, List<String> list) {
        String tagName = hCardElement.tagName();
        if (!"object".equals(tagName)) {
            throw new CannotParseException(1, tagName);
        }
        String absUrl = hCardElement.absUrl("data");
        if (absUrl.length() == 0) {
            throw new CannotParseException(2, new Object[0]);
        }
        try {
            DataUri dataUri = new DataUri(absUrl);
            return (T) _newInstance(dataUri.getData(), (byte[]) _buildMediaTypeObj(dataUri.getContentType()));
        } catch (IllegalArgumentException e) {
            MediaTypeParameter mediaTypeParameter = null;
            String attr = hCardElement.attr("type");
            if (attr.length() > 0) {
                mediaTypeParameter = _buildMediaTypeObj(attr);
            }
            return (T) _newInstance(absUrl, (String) mediaTypeParameter);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(T property) {
        return JCardValue.single(write(property, VCardVersion.V4_0));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseJson(JCardValue jCardValue, VCardDataType vCardDataType, VCardParameters vCardParameters, List<String> list) {
        return (T) parse(jCardValue.asSingle(), vCardDataType, vCardParameters, VCardVersion.V4_0, list);
    }

    protected T cannotUnmarshalValue(String str, VCardVersion vCardVersion, List<String> list, U u) {
        switch (vCardVersion) {
            case V2_1:
            case V3_0:
                if (str.startsWith("http")) {
                    return (T) _newInstance(str, (String) u);
                }
                return (T) _newInstance(Base64.decodeBase64(str), (byte[]) u);
            case V4_0:
                return (T) _newInstance(str, (String) u);
            default:
                return null;
        }
    }

    protected U parseContentType(VCardParameters vCardParameters, VCardVersion vCardVersion) {
        switch (vCardVersion) {
            case V2_1:
            case V3_0:
                String type = vCardParameters.getType();
                if (type != null) {
                    return (U) _buildTypeObj(type);
                }
                return null;
            case V4_0:
                String mediaType = vCardParameters.getMediaType();
                if (mediaType != null) {
                    return (U) _buildMediaTypeObj(mediaType);
                }
                return null;
            default:
                return null;
        }
    }

    private T parse(String str, VCardDataType vCardDataType, VCardParameters vCardParameters, VCardVersion vCardVersion, List<String> list) {
        MediaTypeParameter parseContentType = parseContentType(vCardParameters, vCardVersion);
        switch (vCardVersion) {
            case V2_1:
            case V3_0:
                if (vCardDataType == VCardDataType.URL || vCardDataType == VCardDataType.URI) {
                    return (T) _newInstance(str, (String) parseContentType);
                }
                Encoding encoding = vCardParameters.getEncoding();
                if (encoding == Encoding.BASE64 || encoding == Encoding.B) {
                    return (T) _newInstance(Base64.decodeBase64(str), (byte[]) parseContentType);
                }
                break;
            case V4_0:
                try {
                    DataUri dataUri = new DataUri(str);
                    parseContentType = _buildMediaTypeObj(dataUri.getContentType());
                    return (T) _newInstance(dataUri.getData(), (byte[]) parseContentType);
                } catch (IllegalArgumentException e) {
                    break;
                }
        }
        return (T) cannotUnmarshalValue(str, vCardVersion, list, parseContentType);
    }

    private String write(T property, VCardVersion version) {
        String url = property.getUrl();
        if (url != null) {
            return url;
        }
        byte[] data = property.getData();
        if (data != null) {
            switch (version) {
                case V2_1:
                case V3_0:
                    return new String(Base64.encodeBase64(data));
                case V4_0:
                    MediaTypeParameter contentType = property.getContentType();
                    String mediaType = (contentType == null || contentType.getMediaType() == null) ? "application/octet-stream" : contentType.getMediaType();
                    return new DataUri(mediaType, data).toString();
                default:
                    return "";
            }
        }
        return "";
    }
}

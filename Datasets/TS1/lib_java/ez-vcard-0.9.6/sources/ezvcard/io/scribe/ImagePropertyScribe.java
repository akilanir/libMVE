package ezvcard.io.scribe;

import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.parameter.ImageType;
import ezvcard.property.BinaryProperty;
import ezvcard.property.ImageProperty;
import ezvcard.property.VCardProperty;
import ezvcard.util.DataUri;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ImagePropertyScribe.class */
public abstract class ImagePropertyScribe<T extends ImageProperty> extends BinaryPropertyScribe<T, ImageType> {
    @Override // ezvcard.io.scribe.BinaryPropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ BinaryProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    @Override // ezvcard.io.scribe.BinaryPropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public ImagePropertyScribe(Class<T> clazz, String propertyName) {
        super(clazz, propertyName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public ImageType _buildTypeObj(String type) {
        return ImageType.get(type, null, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public ImageType _buildMediaTypeObj(String mediaType) {
        return ImageType.get(null, mediaType, null);
    }

    @Override // ezvcard.io.scribe.BinaryPropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseHtml(HCardElement element, List<String> warnings) {
        String elementName = element.tagName();
        if (!"img".equals(elementName)) {
            return (T) super._parseHtml(element, warnings);
        }
        String src = element.absUrl("src");
        if (src.length() == 0) {
            throw new CannotParseException(13, new Object[0]);
        }
        try {
            DataUri uri = new DataUri(src);
            ImageType mediaType = _buildMediaTypeObj(uri.getContentType());
            return _newInstance(uri.getData(), (byte[]) mediaType);
        } catch (IllegalArgumentException e) {
            return _newInstance(src, (String) null);
        }
    }
}

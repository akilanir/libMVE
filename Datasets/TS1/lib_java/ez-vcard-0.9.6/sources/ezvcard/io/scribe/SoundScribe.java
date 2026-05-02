package ezvcard.io.scribe;

import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.parameter.SoundType;
import ezvcard.property.BinaryProperty;
import ezvcard.property.Sound;
import ezvcard.property.VCardProperty;
import ezvcard.util.DataUri;
import java.util.List;
import org.jsoup.nodes.Element;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/SoundScribe.class */
public class SoundScribe extends BinaryPropertyScribe<Sound, SoundType> {
    @Override // ezvcard.io.scribe.BinaryPropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ BinaryProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    @Override // ezvcard.io.scribe.BinaryPropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public SoundScribe() {
        super(Sound.class, "SOUND");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public SoundType _buildTypeObj(String type) {
        return SoundType.get(type, null, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public SoundType _buildMediaTypeObj(String mediaType) {
        return SoundType.get(null, mediaType, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Sound _newInstance(String uri, SoundType contentType) {
        return new Sound(uri, contentType);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Sound _newInstance(byte[] data, SoundType contentType) {
        return new Sound(data, contentType);
    }

    @Override // ezvcard.io.scribe.BinaryPropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected Sound _parseHtml(HCardElement element, List<String> warnings) {
        String elementName = element.tagName();
        if (!"audio".equals(elementName) && !"source".equals(elementName)) {
            return (Sound) super._parseHtml(element, warnings);
        }
        if ("audio".equals(elementName)) {
            Element source = element.getElement().getElementsByTag("source").first();
            if (source == null) {
                throw new CannotParseException(16, new Object[0]);
            }
            element = new HCardElement(source);
        }
        String src = element.absUrl("src");
        if (src.length() == 0) {
            throw new CannotParseException(17, new Object[0]);
        }
        String type = element.attr("type");
        SoundType _buildMediaTypeObj = type.length() == 0 ? null : _buildMediaTypeObj(type);
        try {
            DataUri uri = new DataUri(src);
            SoundType mediaType = _buildMediaTypeObj(uri.getContentType());
            return new Sound(uri.getData(), mediaType);
        } catch (IllegalArgumentException e) {
            return new Sound(src, (SoundType) null);
        }
    }
}

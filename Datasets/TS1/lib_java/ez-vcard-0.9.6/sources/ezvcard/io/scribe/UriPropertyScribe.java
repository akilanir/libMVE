package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.io.html.HCardElement;
import ezvcard.property.TextProperty;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/UriPropertyScribe.class */
public abstract class UriPropertyScribe<T extends TextProperty> extends StringPropertyScribe<T> {
    @Override // ezvcard.io.scribe.SimplePropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public UriPropertyScribe(Class<T> clazz, String propertyName) {
        super(clazz, propertyName, VCardDataType.URI);
    }

    @Override // ezvcard.io.scribe.SimplePropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseHtml(HCardElement element, List<String> warnings) {
        String href = element.absUrl("href");
        if (href.length() == 0) {
            return (T) super._parseHtml(element, warnings);
        }
        return _parseValue(href);
    }
}

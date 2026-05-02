package ezvcard.io.scribe;

import ezvcard.property.Url;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/UrlScribe.class */
public class UrlScribe extends UriPropertyScribe<Url> {
    public UrlScribe() {
        super(Url.class, "URL");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Url _parseValue(String value) {
        return new Url(value);
    }
}

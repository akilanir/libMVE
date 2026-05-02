package ezvcard.io.scribe;

import ezvcard.property.FreeBusyUrl;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/FreeBusyUrlScribe.class */
public class FreeBusyUrlScribe extends UriPropertyScribe<FreeBusyUrl> {
    public FreeBusyUrlScribe() {
        super(FreeBusyUrl.class, "FBURL");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public FreeBusyUrl _parseValue(String value) {
        return new FreeBusyUrl(value);
    }
}

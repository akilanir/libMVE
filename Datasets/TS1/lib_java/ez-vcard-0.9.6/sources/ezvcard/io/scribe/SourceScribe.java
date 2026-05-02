package ezvcard.io.scribe;

import ezvcard.property.Source;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/SourceScribe.class */
public class SourceScribe extends UriPropertyScribe<Source> {
    public SourceScribe() {
        super(Source.class, "SOURCE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Source _parseValue(String value) {
        return new Source(value);
    }
}

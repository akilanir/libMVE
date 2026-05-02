package ezvcard.io.scribe;

import ezvcard.property.Kind;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/KindScribe.class */
public class KindScribe extends StringPropertyScribe<Kind> {
    public KindScribe() {
        super(Kind.class, "KIND");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Kind _parseValue(String value) {
        return new Kind(value);
    }
}

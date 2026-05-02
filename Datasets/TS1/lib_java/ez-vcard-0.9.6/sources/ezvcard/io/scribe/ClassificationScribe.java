package ezvcard.io.scribe;

import ezvcard.property.Classification;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ClassificationScribe.class */
public class ClassificationScribe extends StringPropertyScribe<Classification> {
    public ClassificationScribe() {
        super(Classification.class, "CLASS");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Classification _parseValue(String value) {
        return new Classification(value);
    }
}

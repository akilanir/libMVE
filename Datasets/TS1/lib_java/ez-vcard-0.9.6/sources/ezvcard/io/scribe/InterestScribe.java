package ezvcard.io.scribe;

import ezvcard.property.Interest;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/InterestScribe.class */
public class InterestScribe extends StringPropertyScribe<Interest> {
    public InterestScribe() {
        super(Interest.class, "INTEREST");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Interest _parseValue(String value) {
        return new Interest(value);
    }
}

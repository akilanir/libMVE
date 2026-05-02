package ezvcard.io.scribe;

import ezvcard.property.Expertise;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ExpertiseScribe.class */
public class ExpertiseScribe extends StringPropertyScribe<Expertise> {
    public ExpertiseScribe() {
        super(Expertise.class, "EXPERTISE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Expertise _parseValue(String value) {
        return new Expertise(value);
    }
}

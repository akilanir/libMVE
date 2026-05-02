package ezvcard.io.scribe;

import ezvcard.property.Hobby;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/HobbyScribe.class */
public class HobbyScribe extends StringPropertyScribe<Hobby> {
    public HobbyScribe() {
        super(Hobby.class, "HOBBY");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Hobby _parseValue(String value) {
        return new Hobby(value);
    }
}

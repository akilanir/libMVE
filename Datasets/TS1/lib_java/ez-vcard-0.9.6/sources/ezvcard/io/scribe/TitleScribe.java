package ezvcard.io.scribe;

import ezvcard.property.Title;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/TitleScribe.class */
public class TitleScribe extends StringPropertyScribe<Title> {
    public TitleScribe() {
        super(Title.class, "TITLE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Title _parseValue(String value) {
        return new Title(value);
    }
}

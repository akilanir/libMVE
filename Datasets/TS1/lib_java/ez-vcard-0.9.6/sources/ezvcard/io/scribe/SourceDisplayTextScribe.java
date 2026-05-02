package ezvcard.io.scribe;

import ezvcard.property.SourceDisplayText;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/SourceDisplayTextScribe.class */
public class SourceDisplayTextScribe extends StringPropertyScribe<SourceDisplayText> {
    public SourceDisplayTextScribe() {
        super(SourceDisplayText.class, "NAME");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public SourceDisplayText _parseValue(String value) {
        return new SourceDisplayText(value);
    }
}

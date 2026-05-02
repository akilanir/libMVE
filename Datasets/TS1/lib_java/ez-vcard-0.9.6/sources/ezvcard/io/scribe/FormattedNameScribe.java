package ezvcard.io.scribe;

import ezvcard.property.FormattedName;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/FormattedNameScribe.class */
public class FormattedNameScribe extends StringPropertyScribe<FormattedName> {
    public FormattedNameScribe() {
        super(FormattedName.class, "FN");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public FormattedName _parseValue(String value) {
        return new FormattedName(value);
    }
}

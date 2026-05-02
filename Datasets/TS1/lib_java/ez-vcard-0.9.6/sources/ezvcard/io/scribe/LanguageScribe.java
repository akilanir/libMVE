package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.property.Language;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/LanguageScribe.class */
public class LanguageScribe extends StringPropertyScribe<Language> {
    public LanguageScribe() {
        super(Language.class, "LANG", VCardDataType.LANGUAGE_TAG);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Language _parseValue(String value) {
        return new Language(value);
    }
}

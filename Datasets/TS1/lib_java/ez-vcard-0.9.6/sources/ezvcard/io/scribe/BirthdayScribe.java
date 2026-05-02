package ezvcard.io.scribe;

import ezvcard.property.Birthday;
import ezvcard.util.PartialDate;
import java.util.Date;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/BirthdayScribe.class */
public class BirthdayScribe extends DateOrTimePropertyScribe<Birthday> {
    public BirthdayScribe() {
        super(Birthday.class, "BDAY");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Birthday newInstance(String text) {
        return new Birthday(text);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Birthday newInstance(Date date, boolean hasTime) {
        return new Birthday(date, hasTime);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Birthday newInstance(PartialDate partialDate) {
        return new Birthday(partialDate);
    }
}

package ezvcard.io.scribe;

import ezvcard.property.Deathdate;
import ezvcard.util.PartialDate;
import java.util.Date;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/DeathdateScribe.class */
public class DeathdateScribe extends DateOrTimePropertyScribe<Deathdate> {
    public DeathdateScribe() {
        super(Deathdate.class, "DEATHDATE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Deathdate newInstance(String text) {
        return new Deathdate(text);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Deathdate newInstance(Date date, boolean hasTime) {
        return new Deathdate(date, hasTime);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Deathdate newInstance(PartialDate partialDate) {
        return new Deathdate(partialDate);
    }
}

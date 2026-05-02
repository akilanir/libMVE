package ezvcard.io.scribe;

import ezvcard.property.Anniversary;
import ezvcard.util.PartialDate;
import java.util.Date;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/AnniversaryScribe.class */
public class AnniversaryScribe extends DateOrTimePropertyScribe<Anniversary> {
    public AnniversaryScribe() {
        super(Anniversary.class, "ANNIVERSARY");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Anniversary newInstance(String text) {
        return new Anniversary(text);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Anniversary newInstance(Date date, boolean hasTime) {
        return new Anniversary(date, hasTime);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.DateOrTimePropertyScribe
    public Anniversary newInstance(PartialDate partialDate) {
        return new Anniversary(partialDate);
    }
}

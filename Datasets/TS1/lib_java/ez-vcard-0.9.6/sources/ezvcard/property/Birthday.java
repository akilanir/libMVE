package ezvcard.property;

import ezvcard.util.PartialDate;
import java.util.Date;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Birthday.class */
public class Birthday extends DateOrTimeProperty {
    public Birthday(Date date) {
        super(date);
    }

    public Birthday(Date date, boolean hasTime) {
        super(date, hasTime);
    }

    public Birthday(PartialDate partialDate) {
        super(partialDate);
    }

    public Birthday(String text) {
        super(text);
    }
}

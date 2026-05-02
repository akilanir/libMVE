package ezvcard.property;

import java.util.Date;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Revision.class */
public class Revision extends SimpleProperty<Date> {
    public Revision(Date date) {
        super(date);
    }

    public static Revision now() {
        return new Revision(new Date());
    }
}

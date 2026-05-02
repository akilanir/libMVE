package ezvcard.property;

import java.util.UUID;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Uid.class */
public class Uid extends UriProperty {
    public Uid(String uid) {
        super(uid);
    }

    public static Uid random() {
        String uuid = UUID.randomUUID().toString();
        return new Uid("urn:uuid:" + uuid);
    }
}

package ezvcard.io.scribe;

import ezvcard.property.Uid;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/UidScribe.class */
public class UidScribe extends UriPropertyScribe<Uid> {
    public UidScribe() {
        super(Uid.class, "UID");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Uid _parseValue(String value) {
        return new Uid(value);
    }
}

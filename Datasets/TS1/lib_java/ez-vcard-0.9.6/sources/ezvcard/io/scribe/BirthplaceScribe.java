package ezvcard.io.scribe;

import ezvcard.property.Birthplace;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/BirthplaceScribe.class */
public class BirthplaceScribe extends PlacePropertyScribe<Birthplace> {
    public BirthplaceScribe() {
        super(Birthplace.class, "BIRTHPLACE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.PlacePropertyScribe
    public Birthplace newInstance() {
        return new Birthplace();
    }
}

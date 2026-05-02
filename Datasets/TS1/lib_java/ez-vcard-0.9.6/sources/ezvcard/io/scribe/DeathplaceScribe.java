package ezvcard.io.scribe;

import ezvcard.property.Deathplace;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/DeathplaceScribe.class */
public class DeathplaceScribe extends PlacePropertyScribe<Deathplace> {
    public DeathplaceScribe() {
        super(Deathplace.class, "DEATHPLACE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.PlacePropertyScribe
    public Deathplace newInstance() {
        return new Deathplace();
    }
}

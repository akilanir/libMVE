package ezvcard.io.scribe;

import ezvcard.property.Profile;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ProfileScribe.class */
public class ProfileScribe extends StringPropertyScribe<Profile> {
    public ProfileScribe() {
        super(Profile.class, "PROFILE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Profile _parseValue(String value) {
        Profile property = new Profile();
        property.setValue(value);
        return property;
    }
}

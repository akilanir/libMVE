package ezvcard.io.scribe;

import ezvcard.property.Role;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/RoleScribe.class */
public class RoleScribe extends StringPropertyScribe<Role> {
    public RoleScribe() {
        super(Role.class, "ROLE");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Role _parseValue(String value) {
        return new Role(value);
    }
}

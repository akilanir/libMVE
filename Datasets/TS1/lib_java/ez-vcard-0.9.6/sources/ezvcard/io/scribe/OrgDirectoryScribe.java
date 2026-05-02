package ezvcard.io.scribe;

import ezvcard.property.OrgDirectory;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/OrgDirectoryScribe.class */
public class OrgDirectoryScribe extends StringPropertyScribe<OrgDirectory> {
    public OrgDirectoryScribe() {
        super(OrgDirectory.class, "ORG-DIRECTORY");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public OrgDirectory _parseValue(String value) {
        return new OrgDirectory(value);
    }
}

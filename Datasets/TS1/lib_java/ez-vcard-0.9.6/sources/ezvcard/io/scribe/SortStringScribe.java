package ezvcard.io.scribe;

import ezvcard.property.SortString;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/SortStringScribe.class */
public class SortStringScribe extends StringPropertyScribe<SortString> {
    public SortStringScribe() {
        super(SortString.class, "SORT-STRING");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public SortString _parseValue(String value) {
        return new SortString(value);
    }
}

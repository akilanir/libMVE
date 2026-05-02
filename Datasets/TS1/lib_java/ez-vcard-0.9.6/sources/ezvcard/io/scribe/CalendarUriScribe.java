package ezvcard.io.scribe;

import ezvcard.property.CalendarUri;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/CalendarUriScribe.class */
public class CalendarUriScribe extends UriPropertyScribe<CalendarUri> {
    public CalendarUriScribe() {
        super(CalendarUri.class, "CALURI");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public CalendarUri _parseValue(String value) {
        return new CalendarUri(value);
    }
}

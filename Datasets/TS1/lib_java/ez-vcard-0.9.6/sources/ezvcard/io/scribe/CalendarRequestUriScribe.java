package ezvcard.io.scribe;

import ezvcard.property.CalendarRequestUri;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/CalendarRequestUriScribe.class */
public class CalendarRequestUriScribe extends UriPropertyScribe<CalendarRequestUri> {
    public CalendarRequestUriScribe() {
        super(CalendarRequestUri.class, "CALADRURI");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public CalendarRequestUri _parseValue(String value) {
        return new CalendarRequestUri(value);
    }
}

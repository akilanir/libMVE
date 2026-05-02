package org.spongycastle.i18n;

import java.io.UnsupportedEncodingException;
import java.util.Locale;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/i18n/LocaleString.class */
public class LocaleString extends LocalizedMessage {
    public LocaleString(String resource, String id) {
        super(resource, id);
    }

    public LocaleString(String resource, String id, String encoding) throws NullPointerException, UnsupportedEncodingException {
        super(resource, id, encoding);
    }

    public LocaleString(String resource, String id, String encoding, Object[] arguments) throws NullPointerException, UnsupportedEncodingException {
        super(resource, id, encoding, arguments);
    }

    public String getLocaleString(Locale locale) {
        return getEntry(null, locale, null);
    }
}

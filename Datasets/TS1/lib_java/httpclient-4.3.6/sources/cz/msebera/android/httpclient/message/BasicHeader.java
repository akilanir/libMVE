package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.Serializable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/BasicHeader.class */
public class BasicHeader implements Header, Cloneable, Serializable {
    private static final long serialVersionUID = -5427236326487562174L;
    private final String name;
    private final String value;

    public BasicHeader(String name, String value) {
        this.name = (String) Args.notNull(name, "Name");
        this.value = value;
    }

    @Override // cz.msebera.android.httpclient.Header
    public String getName() {
        return this.name;
    }

    @Override // cz.msebera.android.httpclient.Header
    public String getValue() {
        return this.value;
    }

    public String toString() {
        return BasicLineFormatter.INSTANCE.formatHeader((CharArrayBuffer) null, this).toString();
    }

    @Override // cz.msebera.android.httpclient.Header
    public HeaderElement[] getElements() throws ParseException {
        if (this.value != null) {
            return BasicHeaderValueParser.parseElements(this.value, (HeaderValueParser) null);
        }
        return new HeaderElement[0];
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}

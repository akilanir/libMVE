package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.message.BasicHeaderElement;
import cz.msebera.android.httpclient.message.BasicNameValuePair;
import cz.msebera.android.httpclient.message.ParserCursor;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.util.ArrayList;
import java.util.List;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/NetscapeDraftHeaderParser.class */
public class NetscapeDraftHeaderParser {
    public static final NetscapeDraftHeaderParser DEFAULT = new NetscapeDraftHeaderParser();

    public HeaderElement parseHeader(CharArrayBuffer buffer, ParserCursor cursor) throws ParseException {
        Args.notNull(buffer, "Char array buffer");
        Args.notNull(cursor, "Parser cursor");
        NameValuePair nvp = parseNameValuePair(buffer, cursor);
        List<NameValuePair> params = new ArrayList<>();
        while (!cursor.atEnd()) {
            NameValuePair param = parseNameValuePair(buffer, cursor);
            params.add(param);
        }
        return new BasicHeaderElement(nvp.getName(), nvp.getValue(), (NameValuePair[]) params.toArray(new NameValuePair[params.size()]));
    }

    private NameValuePair parseNameValuePair(CharArrayBuffer buffer, ParserCursor cursor) {
        String name;
        char ch;
        boolean terminated = false;
        int pos = cursor.getPos();
        int indexFrom = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        while (true) {
            if (pos >= indexTo || (ch = buffer.charAt(pos)) == '=') {
                break;
            }
            if (ch == ';') {
                terminated = true;
                break;
            }
            pos++;
        }
        if (pos == indexTo) {
            terminated = true;
            name = buffer.substringTrimmed(indexFrom, indexTo);
        } else {
            name = buffer.substringTrimmed(indexFrom, pos);
            pos++;
        }
        if (terminated) {
            cursor.updatePos(pos);
            return new BasicNameValuePair(name, null);
        }
        int i1 = pos;
        while (true) {
            if (pos >= indexTo) {
                break;
            }
            if (buffer.charAt(pos) == ';') {
                terminated = true;
                break;
            }
            pos++;
        }
        int i2 = pos;
        while (i1 < i2 && HTTP.isWhitespace(buffer.charAt(i1))) {
            i1++;
        }
        while (i2 > i1 && HTTP.isWhitespace(buffer.charAt(i2 - 1))) {
            i2--;
        }
        String value = buffer.substring(i1, i2);
        if (terminated) {
            pos++;
        }
        cursor.updatePos(pos);
        return new BasicNameValuePair(name, value);
    }
}

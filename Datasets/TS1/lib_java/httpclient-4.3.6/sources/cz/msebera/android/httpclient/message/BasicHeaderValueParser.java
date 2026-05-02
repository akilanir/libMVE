package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.util.ArrayList;
import java.util.List;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/BasicHeaderValueParser.class */
public class BasicHeaderValueParser implements HeaderValueParser {
    private static final char PARAM_DELIMITER = ';';
    private static final char ELEM_DELIMITER = ',';

    @Deprecated
    public static final BasicHeaderValueParser DEFAULT = new BasicHeaderValueParser();
    public static final BasicHeaderValueParser INSTANCE = new BasicHeaderValueParser();
    private static final char[] ALL_DELIMITERS = {';', ','};

    public static HeaderElement[] parseElements(String value, HeaderValueParser parser) throws ParseException {
        Args.notNull(value, "Value");
        CharArrayBuffer buffer = new CharArrayBuffer(value.length());
        buffer.append(value);
        ParserCursor cursor = new ParserCursor(0, value.length());
        return (parser != null ? parser : INSTANCE).parseElements(buffer, cursor);
    }

    @Override // cz.msebera.android.httpclient.message.HeaderValueParser
    public HeaderElement[] parseElements(CharArrayBuffer buffer, ParserCursor cursor) {
        Args.notNull(buffer, "Char array buffer");
        Args.notNull(cursor, "Parser cursor");
        List<HeaderElement> elements = new ArrayList<>();
        while (!cursor.atEnd()) {
            HeaderElement element = parseHeaderElement(buffer, cursor);
            if (element.getName().length() != 0 || element.getValue() != null) {
                elements.add(element);
            }
        }
        return (HeaderElement[]) elements.toArray(new HeaderElement[elements.size()]);
    }

    public static HeaderElement parseHeaderElement(String value, HeaderValueParser parser) throws ParseException {
        Args.notNull(value, "Value");
        CharArrayBuffer buffer = new CharArrayBuffer(value.length());
        buffer.append(value);
        ParserCursor cursor = new ParserCursor(0, value.length());
        return (parser != null ? parser : INSTANCE).parseHeaderElement(buffer, cursor);
    }

    @Override // cz.msebera.android.httpclient.message.HeaderValueParser
    public HeaderElement parseHeaderElement(CharArrayBuffer buffer, ParserCursor cursor) {
        Args.notNull(buffer, "Char array buffer");
        Args.notNull(cursor, "Parser cursor");
        NameValuePair nvp = parseNameValuePair(buffer, cursor);
        NameValuePair[] params = null;
        if (!cursor.atEnd()) {
            char ch = buffer.charAt(cursor.getPos() - 1);
            if (ch != ELEM_DELIMITER) {
                params = parseParameters(buffer, cursor);
            }
        }
        return createHeaderElement(nvp.getName(), nvp.getValue(), params);
    }

    protected HeaderElement createHeaderElement(String name, String value, NameValuePair[] params) {
        return new BasicHeaderElement(name, value, params);
    }

    public static NameValuePair[] parseParameters(String value, HeaderValueParser parser) throws ParseException {
        Args.notNull(value, "Value");
        CharArrayBuffer buffer = new CharArrayBuffer(value.length());
        buffer.append(value);
        ParserCursor cursor = new ParserCursor(0, value.length());
        return (parser != null ? parser : INSTANCE).parseParameters(buffer, cursor);
    }

    @Override // cz.msebera.android.httpclient.message.HeaderValueParser
    public NameValuePair[] parseParameters(CharArrayBuffer buffer, ParserCursor cursor) {
        Args.notNull(buffer, "Char array buffer");
        Args.notNull(cursor, "Parser cursor");
        int pos = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        while (pos < indexTo) {
            char ch = buffer.charAt(pos);
            if (!HTTP.isWhitespace(ch)) {
                break;
            }
            pos++;
        }
        cursor.updatePos(pos);
        if (cursor.atEnd()) {
            return new NameValuePair[0];
        }
        List<NameValuePair> params = new ArrayList<>();
        while (!cursor.atEnd()) {
            NameValuePair param = parseNameValuePair(buffer, cursor);
            params.add(param);
            char ch2 = buffer.charAt(cursor.getPos() - 1);
            if (ch2 == ELEM_DELIMITER) {
                break;
            }
        }
        return (NameValuePair[]) params.toArray(new NameValuePair[params.size()]);
    }

    public static NameValuePair parseNameValuePair(String value, HeaderValueParser parser) throws ParseException {
        Args.notNull(value, "Value");
        CharArrayBuffer buffer = new CharArrayBuffer(value.length());
        buffer.append(value);
        ParserCursor cursor = new ParserCursor(0, value.length());
        return (parser != null ? parser : INSTANCE).parseNameValuePair(buffer, cursor);
    }

    @Override // cz.msebera.android.httpclient.message.HeaderValueParser
    public NameValuePair parseNameValuePair(CharArrayBuffer buffer, ParserCursor cursor) {
        return parseNameValuePair(buffer, cursor, ALL_DELIMITERS);
    }

    private static boolean isOneOf(char ch, char[] chs) {
        if (chs != null) {
            for (char ch2 : chs) {
                if (ch == ch2) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public NameValuePair parseNameValuePair(CharArrayBuffer buffer, ParserCursor cursor, char[] delimiters) {
        String name;
        boolean z;
        char ch;
        Args.notNull(buffer, "Char array buffer");
        Args.notNull(cursor, "Parser cursor");
        boolean terminated = false;
        int pos = cursor.getPos();
        int indexFrom = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        while (true) {
            if (pos >= indexTo || (ch = buffer.charAt(pos)) == '=') {
                break;
            }
            if (isOneOf(ch, delimiters)) {
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
            return createNameValuePair(name, null);
        }
        int i1 = pos;
        boolean qouted = false;
        boolean escaped = false;
        while (true) {
            if (pos < indexTo) {
                char ch2 = buffer.charAt(pos);
                if (ch2 == '\"' && !escaped) {
                    qouted = !qouted;
                }
                if (!qouted && !escaped && isOneOf(ch2, delimiters)) {
                    terminated = true;
                    break;
                }
                if (escaped) {
                    z = false;
                } else {
                    z = qouted && ch2 == '\\';
                }
                escaped = z;
                pos++;
            } else {
                break;
            }
        }
        int i2 = pos;
        while (i1 < i2 && HTTP.isWhitespace(buffer.charAt(i1))) {
            i1++;
        }
        while (i2 > i1 && HTTP.isWhitespace(buffer.charAt(i2 - 1))) {
            i2--;
        }
        if (i2 - i1 >= 2 && buffer.charAt(i1) == '\"' && buffer.charAt(i2 - 1) == '\"') {
            i1++;
            i2--;
        }
        String value = buffer.substring(i1, i2);
        if (terminated) {
            pos++;
        }
        cursor.updatePos(pos);
        return createNameValuePair(name, value);
    }

    protected NameValuePair createNameValuePair(String name, String value) {
        return new BasicNameValuePair(name, value);
    }
}

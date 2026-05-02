package org.apache.james.mime4j.stream;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.util.ByteSequence;
import org.apache.james.mime4j.util.CharsetUtil;
import org.apache.james.mime4j.util.ContentUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/RawFieldParser.class */
public class RawFieldParser {
    static final BitSet COLON = INIT_BITSET(58);
    static final BitSet EQUAL_OR_SEMICOLON = INIT_BITSET(61, 59);
    static final BitSet SEMICOLON = INIT_BITSET(59);
    public static final RawFieldParser DEFAULT = new RawFieldParser();

    public static BitSet INIT_BITSET(int... b) {
        BitSet bitset = new BitSet(b.length);
        for (int i : b) {
            bitset.set(i);
        }
        return bitset;
    }

    public RawField parseField(ByteSequence raw) throws MimeException {
        if (raw == null) {
            return null;
        }
        ParserCursor cursor = new ParserCursor(0, raw.length());
        String name = parseToken(raw, cursor, COLON);
        if (cursor.atEnd()) {
            throw new MimeException("Invalid MIME field: no name/value separator found: " + raw.toString());
        }
        return new RawField(raw, cursor.getPos(), name, null);
    }

    public RawBody parseRawBody(RawField field) {
        ByteSequence buf = field.getRaw();
        int pos = field.getDelimiterIdx() + 1;
        if (buf == null) {
            String body = field.getBody();
            if (body == null) {
                return new RawBody("", null);
            }
            buf = ContentUtil.encode(body);
            pos = 0;
        }
        ParserCursor cursor = new ParserCursor(pos, buf.length());
        return parseRawBody(buf, cursor);
    }

    public RawBody parseRawBody(ByteSequence buf, ParserCursor cursor) {
        String value = parseToken(buf, cursor, SEMICOLON);
        if (cursor.atEnd()) {
            return new RawBody(value, new ArrayList());
        }
        cursor.updatePos(cursor.getPos() + 1);
        List<NameValuePair> params = parseParameters(buf, cursor);
        return new RawBody(value, params);
    }

    public List<NameValuePair> parseParameters(ByteSequence buf, ParserCursor cursor) {
        List<NameValuePair> params = new ArrayList<>();
        skipWhiteSpace(buf, cursor);
        while (!cursor.atEnd()) {
            NameValuePair param = parseParameter(buf, cursor);
            params.add(param);
        }
        return params;
    }

    public NameValuePair parseParameter(ByteSequence buf, ParserCursor cursor) {
        String name = parseToken(buf, cursor, EQUAL_OR_SEMICOLON);
        if (cursor.atEnd()) {
            return new NameValuePair(name, null);
        }
        int delim = buf.byteAt(cursor.getPos());
        cursor.updatePos(cursor.getPos() + 1);
        if (delim == 59) {
            return new NameValuePair(name, null);
        }
        String value = parseValue(buf, cursor, SEMICOLON);
        if (!cursor.atEnd()) {
            cursor.updatePos(cursor.getPos() + 1);
        }
        return new NameValuePair(name, value);
    }

    public String parseToken(ByteSequence buf, ParserCursor cursor, BitSet delimiters) {
        StringBuilder dst = new StringBuilder();
        boolean whitespace = false;
        while (!cursor.atEnd()) {
            char current = (char) (buf.byteAt(cursor.getPos()) & 255);
            if (delimiters != null && delimiters.get(current)) {
                break;
            }
            if (CharsetUtil.isWhitespace(current)) {
                skipWhiteSpace(buf, cursor);
                whitespace = true;
            } else if (current == '(') {
                skipComment(buf, cursor);
            } else {
                if (dst.length() > 0 && whitespace) {
                    dst.append(' ');
                }
                copyContent(buf, cursor, delimiters, dst);
                whitespace = false;
            }
        }
        return dst.toString();
    }

    public String parseValue(ByteSequence buf, ParserCursor cursor, BitSet delimiters) {
        StringBuilder dst = new StringBuilder();
        boolean whitespace = false;
        while (!cursor.atEnd()) {
            char current = (char) (buf.byteAt(cursor.getPos()) & 255);
            if (delimiters != null && delimiters.get(current)) {
                break;
            }
            if (CharsetUtil.isWhitespace(current)) {
                skipWhiteSpace(buf, cursor);
                whitespace = true;
            } else if (current == '(') {
                skipComment(buf, cursor);
            } else if (current == '\"') {
                if (dst.length() > 0 && whitespace) {
                    dst.append(' ');
                }
                copyQuotedContent(buf, cursor, dst);
                whitespace = false;
            } else {
                if (dst.length() > 0 && whitespace) {
                    dst.append(' ');
                }
                copyContent(buf, cursor, delimiters, dst);
                whitespace = false;
            }
        }
        return dst.toString();
    }

    public void skipWhiteSpace(ByteSequence buf, ParserCursor cursor) {
        int pos = cursor.getPos();
        int indexFrom = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        for (int i = indexFrom; i < indexTo; i++) {
            char current = (char) (buf.byteAt(i) & 255);
            if (!CharsetUtil.isWhitespace(current)) {
                break;
            }
            pos++;
        }
        cursor.updatePos(pos);
    }

    public void skipComment(ByteSequence buf, ParserCursor cursor) {
        if (cursor.atEnd()) {
            return;
        }
        int pos = cursor.getPos();
        int indexFrom = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        if (((char) (buf.byteAt(pos) & 255)) != '(') {
            return;
        }
        int pos2 = pos + 1;
        int level = 1;
        boolean escaped = false;
        int i = indexFrom + 1;
        while (true) {
            if (i >= indexTo) {
                break;
            }
            char current = (char) (buf.byteAt(i) & 255);
            if (escaped) {
                escaped = false;
            } else if (current == '\\') {
                escaped = true;
            } else if (current == '(') {
                level++;
            } else if (current == ')') {
                level--;
            }
            if (level > 0) {
                i++;
                pos2++;
            } else {
                pos2++;
                break;
            }
        }
        cursor.updatePos(pos2);
    }

    public void skipAllWhiteSpace(ByteSequence buf, ParserCursor cursor) {
        while (!cursor.atEnd()) {
            char current = (char) (buf.byteAt(cursor.getPos()) & 255);
            if (CharsetUtil.isWhitespace(current)) {
                skipWhiteSpace(buf, cursor);
            } else if (current == '(') {
                skipComment(buf, cursor);
            } else {
                return;
            }
        }
    }

    public void copyContent(ByteSequence buf, ParserCursor cursor, BitSet delimiters, StringBuilder dst) {
        int pos = cursor.getPos();
        int indexFrom = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        for (int i = indexFrom; i < indexTo; i++) {
            char current = (char) (buf.byteAt(i) & 255);
            if ((delimiters != null && delimiters.get(current)) || CharsetUtil.isWhitespace(current) || current == '(') {
                break;
            }
            pos++;
            dst.append(current);
        }
        cursor.updatePos(pos);
    }

    public void copyQuotedContent(ByteSequence buf, ParserCursor cursor, StringBuilder dst) {
        if (cursor.atEnd()) {
            return;
        }
        int pos = cursor.getPos();
        int indexFrom = cursor.getPos();
        int indexTo = cursor.getUpperBound();
        if (((char) (buf.byteAt(pos) & 255)) != '\"') {
            return;
        }
        int pos2 = pos + 1;
        boolean escaped = false;
        int i = indexFrom + 1;
        while (true) {
            if (i >= indexTo) {
                break;
            }
            char current = (char) (buf.byteAt(i) & 255);
            if (escaped) {
                if (current != '\"' && current != '\\') {
                    dst.append('\\');
                }
                dst.append(current);
                escaped = false;
            } else if (current == '\"') {
                pos2++;
                break;
            } else if (current == '\\') {
                escaped = true;
            } else if (current != '\r' && current != '\n') {
                dst.append(current);
            }
            i++;
            pos2++;
        }
        cursor.updatePos(pos2);
    }
}

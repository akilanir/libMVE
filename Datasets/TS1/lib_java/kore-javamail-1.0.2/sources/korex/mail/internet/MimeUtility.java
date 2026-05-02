package korex.mail.internet;

import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.BASE64DecoderStream;
import com.sun.mail.util.BASE64EncoderStream;
import com.sun.mail.util.BEncoderStream;
import com.sun.mail.util.LineInputStream;
import com.sun.mail.util.PropUtil;
import com.sun.mail.util.QDecoderStream;
import com.sun.mail.util.QEncoderStream;
import com.sun.mail.util.QPDecoderStream;
import com.sun.mail.util.QPEncoderStream;
import com.sun.mail.util.UUDecoderStream;
import com.sun.mail.util.UUEncoderStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;
import korex.activation.DataHandler;
import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeUtility.class */
public class MimeUtility {
    public static final int ALL = -1;
    private static String defaultJavaCharset;
    private static String defaultMIMECharset;
    static final int ALL_ASCII = 1;
    static final int MOSTLY_ASCII = 2;
    static final int MOSTLY_NONASCII = 3;
    private static final Map nonAsciiCharsetMap = new HashMap();
    private static final boolean decodeStrict = PropUtil.getBooleanSystemProperty("mail.mime.decodetext.strict", true);
    private static final boolean encodeEolStrict = PropUtil.getBooleanSystemProperty("mail.mime.encodeeol.strict", false);
    private static final boolean ignoreUnknownEncoding = PropUtil.getBooleanSystemProperty("mail.mime.ignoreunknownencoding", false);
    private static final boolean foldEncodedWords = PropUtil.getBooleanSystemProperty("mail.mime.foldencodedwords", false);
    private static final boolean foldText = PropUtil.getBooleanSystemProperty("mail.mime.foldtext", true);
    private static Hashtable java2mime = new Hashtable(40);
    private static Hashtable mime2java = new Hashtable(10);

    private MimeUtility() {
    }

    static {
        try {
            InputStream is = MimeUtility.class.getResourceAsStream("/META-INF/javamail.charset.map");
            if (is != null) {
                try {
                    is = new LineInputStream(is);
                    loadMappings((LineInputStream) is, java2mime);
                    loadMappings((LineInputStream) is, mime2java);
                    try {
                        is.close();
                    } catch (Exception e) {
                    }
                } catch (Throwable th) {
                    try {
                        is.close();
                    } catch (Exception e2) {
                    }
                    throw th;
                }
            }
        } catch (Exception e3) {
        }
        if (java2mime.isEmpty()) {
            java2mime.put("8859_1", "ISO-8859-1");
            java2mime.put("iso8859_1", "ISO-8859-1");
            java2mime.put("iso8859-1", "ISO-8859-1");
            java2mime.put("8859_2", "ISO-8859-2");
            java2mime.put("iso8859_2", "ISO-8859-2");
            java2mime.put("iso8859-2", "ISO-8859-2");
            java2mime.put("8859_3", "ISO-8859-3");
            java2mime.put("iso8859_3", "ISO-8859-3");
            java2mime.put("iso8859-3", "ISO-8859-3");
            java2mime.put("8859_4", "ISO-8859-4");
            java2mime.put("iso8859_4", "ISO-8859-4");
            java2mime.put("iso8859-4", "ISO-8859-4");
            java2mime.put("8859_5", "ISO-8859-5");
            java2mime.put("iso8859_5", "ISO-8859-5");
            java2mime.put("iso8859-5", "ISO-8859-5");
            java2mime.put("8859_6", "ISO-8859-6");
            java2mime.put("iso8859_6", "ISO-8859-6");
            java2mime.put("iso8859-6", "ISO-8859-6");
            java2mime.put("8859_7", "ISO-8859-7");
            java2mime.put("iso8859_7", "ISO-8859-7");
            java2mime.put("iso8859-7", "ISO-8859-7");
            java2mime.put("8859_8", "ISO-8859-8");
            java2mime.put("iso8859_8", "ISO-8859-8");
            java2mime.put("iso8859-8", "ISO-8859-8");
            java2mime.put("8859_9", "ISO-8859-9");
            java2mime.put("iso8859_9", "ISO-8859-9");
            java2mime.put("iso8859-9", "ISO-8859-9");
            java2mime.put("sjis", "Shift_JIS");
            java2mime.put("jis", "ISO-2022-JP");
            java2mime.put("iso2022jp", "ISO-2022-JP");
            java2mime.put("euc_jp", "euc-jp");
            java2mime.put("koi8_r", "koi8-r");
            java2mime.put("euc_cn", "euc-cn");
            java2mime.put("euc_tw", "euc-tw");
            java2mime.put("euc_kr", "euc-kr");
        }
        if (mime2java.isEmpty()) {
            mime2java.put("iso-2022-cn", "ISO2022CN");
            mime2java.put("iso-2022-kr", "ISO2022KR");
            mime2java.put("utf-8", "UTF8");
            mime2java.put("utf8", "UTF8");
            mime2java.put("ja_jp.iso2022-7", "ISO2022JP");
            mime2java.put("ja_jp.eucjp", "EUCJIS");
            mime2java.put("euc-kr", "KSC5601");
            mime2java.put("euckr", "KSC5601");
            mime2java.put("us-ascii", "ISO-8859-1");
            mime2java.put("x-us-ascii", "ISO-8859-1");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String getEncoding(korex.activation.DataSource r4) {
        /*
            r0 = 0
            r5 = r0
            r0 = 0
            r6 = r0
            r0 = 0
            r7 = r0
            r0 = r4
            boolean r0 = r0 instanceof korex.mail.EncodingAware
            if (r0 == 0) goto L1d
            r0 = r4
            korex.mail.EncodingAware r0 = (korex.mail.EncodingAware) r0
            java.lang.String r0 = r0.getEncoding()
            r7 = r0
            r0 = r7
            if (r0 == 0) goto L1d
            r0 = r7
            return r0
        L1d:
            korex.mail.internet.ContentType r0 = new korex.mail.internet.ContentType     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            r1 = r0
            r2 = r4
            java.lang.String r2 = r2.getContentType()     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            r1.<init>(r2)     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            r5 = r0
            r0 = r4
            java.io.InputStream r0 = r0.getInputStream()     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            r6 = r0
            r0 = r5
            java.lang.String r1 = "text/*"
            boolean r0 = r0.match(r1)     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            r8 = r0
            r0 = r6
            r1 = -1
            r2 = r8
            if (r2 != 0) goto L45
            r2 = 1
            goto L46
        L45:
            r2 = 0
        L46:
            int r0 = checkAscii(r0, r1, r2)     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            r9 = r0
            r0 = r9
            switch(r0) {
                case 1: goto L68;
                case 2: goto L6e;
                default: goto L86;
            }     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
        L68:
            java.lang.String r0 = "7bit"
            r7 = r0
            goto L89
        L6e:
            r0 = r8
            if (r0 == 0) goto L80
            r0 = r5
            boolean r0 = nonAsciiCharset(r0)     // Catch: java.lang.Exception -> L99 java.lang.Throwable -> Laf
            if (r0 == 0) goto L80
            java.lang.String r0 = "base64"
            r7 = r0
            goto L89
        L80:
            java.lang.String r0 = "quoted-printable"
            r7 = r0
            goto L89
        L86:
            java.lang.String r0 = "base64"
            r7 = r0
        L89:
            r0 = r6
            if (r0 == 0) goto L91
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> L94
        L91:
            goto Lc1
        L94:
            r8 = move-exception
            goto Lc1
        L99:
            r8 = move-exception
            java.lang.String r0 = "base64"
            r9 = r0
            r0 = r6
            if (r0 == 0) goto La7
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> Laa
        La7:
            goto Lac
        Laa:
            r10 = move-exception
        Lac:
            r0 = r9
            return r0
        Laf:
            r11 = move-exception
            r0 = r6
            if (r0 == 0) goto Lb9
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> Lbc
        Lb9:
            goto Lbe
        Lbc:
            r12 = move-exception
        Lbe:
            r0 = r11
            throw r0
        Lc1:
            r0 = r7
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.MimeUtility.getEncoding(korex.activation.DataSource):java.lang.String");
    }

    private static boolean nonAsciiCharset(ContentType ct) {
        Boolean bool;
        String charset = ct.getParameter("charset");
        if (charset == null) {
            return false;
        }
        String charset2 = charset.toLowerCase(Locale.ENGLISH);
        synchronized (nonAsciiCharsetMap) {
            bool = (Boolean) nonAsciiCharsetMap.get(charset2);
        }
        if (bool == null) {
            try {
                byte[] b = "\r\n".getBytes(charset2);
                bool = Boolean.valueOf((b.length == 2 && b[0] == 13 && b[1] == 10) ? false : true);
            } catch (UnsupportedEncodingException e) {
                bool = Boolean.FALSE;
            } catch (RuntimeException e2) {
                bool = Boolean.TRUE;
            }
            synchronized (nonAsciiCharsetMap) {
                nonAsciiCharsetMap.put(charset2, bool);
            }
        }
        return bool.booleanValue();
    }

    public static String getEncoding(DataHandler dh) {
        String encoding;
        if (dh.getName() != null) {
            return getEncoding(dh.getDataSource());
        }
        try {
            ContentType cType = new ContentType(dh.getContentType());
            if (cType.match("text/*")) {
                AsciiOutputStream aos = new AsciiOutputStream(false, false);
                try {
                    dh.writeTo(aos);
                } catch (IOException e) {
                }
                switch (aos.getAscii()) {
                    case 1:
                        encoding = "7bit";
                        break;
                    case 2:
                        encoding = "quoted-printable";
                        break;
                    default:
                        encoding = "base64";
                        break;
                }
            } else {
                AsciiOutputStream aos2 = new AsciiOutputStream(true, encodeEolStrict);
                try {
                    dh.writeTo(aos2);
                } catch (IOException e2) {
                }
                if (aos2.getAscii() == 1) {
                    encoding = "7bit";
                } else {
                    encoding = "base64";
                }
            }
            return encoding;
        } catch (Exception e3) {
            return "base64";
        }
    }

    public static InputStream decode(InputStream is, String encoding) throws MessagingException {
        if (encoding.equalsIgnoreCase("base64")) {
            return new BASE64DecoderStream(is);
        }
        if (encoding.equalsIgnoreCase("quoted-printable")) {
            return new QPDecoderStream(is);
        }
        if (encoding.equalsIgnoreCase("uuencode") || encoding.equalsIgnoreCase("x-uuencode") || encoding.equalsIgnoreCase("x-uue")) {
            return new UUDecoderStream(is);
        }
        if (encoding.equalsIgnoreCase("binary") || encoding.equalsIgnoreCase("7bit") || encoding.equalsIgnoreCase("8bit")) {
            return is;
        }
        if (!ignoreUnknownEncoding) {
            throw new MessagingException("Unknown encoding: " + encoding);
        }
        return is;
    }

    public static OutputStream encode(OutputStream os, String encoding) throws MessagingException {
        if (encoding == null) {
            return os;
        }
        if (encoding.equalsIgnoreCase("base64")) {
            return new BASE64EncoderStream(os);
        }
        if (encoding.equalsIgnoreCase("quoted-printable")) {
            return new QPEncoderStream(os);
        }
        if (encoding.equalsIgnoreCase("uuencode") || encoding.equalsIgnoreCase("x-uuencode") || encoding.equalsIgnoreCase("x-uue")) {
            return new UUEncoderStream(os);
        }
        if (encoding.equalsIgnoreCase("binary") || encoding.equalsIgnoreCase("7bit") || encoding.equalsIgnoreCase("8bit")) {
            return os;
        }
        throw new MessagingException("Unknown encoding: " + encoding);
    }

    public static OutputStream encode(OutputStream os, String encoding, String filename) throws MessagingException {
        if (encoding == null) {
            return os;
        }
        if (encoding.equalsIgnoreCase("base64")) {
            return new BASE64EncoderStream(os);
        }
        if (encoding.equalsIgnoreCase("quoted-printable")) {
            return new QPEncoderStream(os);
        }
        if (encoding.equalsIgnoreCase("uuencode") || encoding.equalsIgnoreCase("x-uuencode") || encoding.equalsIgnoreCase("x-uue")) {
            return new UUEncoderStream(os, filename);
        }
        if (encoding.equalsIgnoreCase("binary") || encoding.equalsIgnoreCase("7bit") || encoding.equalsIgnoreCase("8bit")) {
            return os;
        }
        throw new MessagingException("Unknown encoding: " + encoding);
    }

    public static String encodeText(String text) throws UnsupportedEncodingException {
        return encodeText(text, null, null);
    }

    public static String encodeText(String text, String charset, String encoding) throws UnsupportedEncodingException {
        return encodeWord(text, charset, encoding, false);
    }

    public static String decodeText(String etext) throws UnsupportedEncodingException {
        String word;
        if (etext.indexOf("=?") == -1) {
            return etext;
        }
        StringTokenizer st = new StringTokenizer(etext, " \t\n\r", true);
        StringBuffer sb = new StringBuffer();
        StringBuffer wsb = new StringBuffer();
        boolean prevWasEncoded = false;
        while (st.hasMoreTokens()) {
            String s = st.nextToken();
            char c = s.charAt(0);
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') {
                wsb.append(c);
            } else {
                try {
                    word = decodeWord(s);
                    if (!prevWasEncoded && wsb.length() > 0) {
                        sb.append(wsb);
                    }
                    prevWasEncoded = true;
                } catch (ParseException e) {
                    word = s;
                    if (!decodeStrict) {
                        String dword = decodeInnerWords(word);
                        if (dword != word) {
                            if ((!prevWasEncoded || !word.startsWith("=?")) && wsb.length() > 0) {
                                sb.append(wsb);
                            }
                            prevWasEncoded = word.endsWith("?=");
                            word = dword;
                        } else {
                            if (wsb.length() > 0) {
                                sb.append(wsb);
                            }
                            prevWasEncoded = false;
                        }
                    } else {
                        if (wsb.length() > 0) {
                            sb.append(wsb);
                        }
                        prevWasEncoded = false;
                    }
                }
                sb.append(word);
                wsb.setLength(0);
            }
        }
        sb.append(wsb);
        return sb.toString();
    }

    public static String encodeWord(String word) throws UnsupportedEncodingException {
        return encodeWord(word, null, null);
    }

    public static String encodeWord(String word, String charset, String encoding) throws UnsupportedEncodingException {
        return encodeWord(word, charset, encoding, true);
    }

    private static String encodeWord(String string, String charset, String encoding, boolean encodingWord) throws UnsupportedEncodingException {
        String jcharset;
        boolean b64;
        int ascii = checkAscii(string);
        if (ascii == 1) {
            return string;
        }
        if (charset == null) {
            jcharset = getDefaultJavaCharset();
            charset = getDefaultMIMECharset();
        } else {
            jcharset = javaCharset(charset);
        }
        if (encoding == null) {
            if (ascii != 3) {
                encoding = "Q";
            } else {
                encoding = "B";
            }
        }
        if (encoding.equalsIgnoreCase("B")) {
            b64 = true;
        } else if (encoding.equalsIgnoreCase("Q")) {
            b64 = false;
        } else {
            throw new UnsupportedEncodingException("Unknown transfer encoding: " + encoding);
        }
        StringBuffer outb = new StringBuffer();
        doEncode(string, b64, jcharset, 68 - charset.length(), "=?" + charset + "?" + encoding + "?", true, encodingWord, outb);
        return outb.toString();
    }

    private static void doEncode(String string, boolean b64, String jcharset, int avail, String prefix, boolean first, boolean encodingWord, StringBuffer buf) throws UnsupportedEncodingException {
        int len;
        OutputStream eos;
        int size;
        byte[] bytes = string.getBytes(jcharset);
        if (b64) {
            len = BEncoderStream.encodedLength(bytes);
        } else {
            len = QEncoderStream.encodedLength(bytes, encodingWord);
        }
        if (len > avail && (size = string.length()) > 1) {
            int split = size / 2;
            if (Character.isHighSurrogate(string.charAt(split - 1))) {
                split--;
            }
            if (split > 0) {
                doEncode(string.substring(0, split), b64, jcharset, avail, prefix, first, encodingWord, buf);
            }
            doEncode(string.substring(split, size), b64, jcharset, avail, prefix, false, encodingWord, buf);
            return;
        }
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        if (b64) {
            eos = new BEncoderStream(os);
        } else {
            eos = new QEncoderStream(os, encodingWord);
        }
        try {
            eos.write(bytes);
            eos.close();
        } catch (IOException e) {
        }
        byte[] encodedBytes = os.toByteArray();
        if (!first) {
            if (foldEncodedWords) {
                buf.append("\r\n ");
            } else {
                buf.append(" ");
            }
        }
        buf.append(prefix);
        for (byte b : encodedBytes) {
            buf.append((char) b);
        }
        buf.append("?=");
    }

    public static String decodeWord(String eword) throws ParseException, UnsupportedEncodingException {
        String decodedWord;
        InputStream is;
        if (!eword.startsWith("=?")) {
            throw new ParseException("encoded word does not start with \"=?\": " + eword);
        }
        int pos = eword.indexOf(63, 2);
        if (pos == -1) {
            throw new ParseException("encoded word does not include charset: " + eword);
        }
        String charset = eword.substring(2, pos);
        int lpos = charset.indexOf(42);
        if (lpos >= 0) {
            charset = charset.substring(0, lpos);
        }
        String charset2 = javaCharset(charset);
        int start = pos + 1;
        int pos2 = eword.indexOf(63, start);
        if (pos2 == -1) {
            throw new ParseException("encoded word does not include encoding: " + eword);
        }
        String encoding = eword.substring(start, pos2);
        int start2 = pos2 + 1;
        int pos3 = eword.indexOf("?=", start2);
        if (pos3 == -1) {
            throw new ParseException("encoded word does not end with \"?=\": " + eword);
        }
        String word = eword.substring(start2, pos3);
        try {
            if (word.length() > 0) {
                ByteArrayInputStream bis = new ByteArrayInputStream(ASCIIUtility.getBytes(word));
                if (encoding.equalsIgnoreCase("B")) {
                    is = new BASE64DecoderStream(bis);
                } else if (encoding.equalsIgnoreCase("Q")) {
                    is = new QDecoderStream(bis);
                } else {
                    throw new UnsupportedEncodingException("unknown encoding: " + encoding);
                }
                int count = bis.available();
                byte[] bytes = new byte[count];
                int count2 = is.read(bytes, 0, count);
                decodedWord = count2 <= 0 ? "" : new String(bytes, 0, count2, charset2);
            } else {
                decodedWord = "";
            }
            if (pos3 + 2 < eword.length()) {
                String rest = eword.substring(pos3 + 2);
                if (!decodeStrict) {
                    rest = decodeInnerWords(rest);
                }
                decodedWord = decodedWord + rest;
            }
            return decodedWord;
        } catch (UnsupportedEncodingException uex) {
            throw uex;
        } catch (IOException ioex) {
            throw new ParseException(ioex.toString());
        } catch (IllegalArgumentException e) {
            throw new UnsupportedEncodingException(charset2);
        }
    }

    private static String decodeInnerWords(String word) throws UnsupportedEncodingException {
        int end;
        int end2;
        int start = 0;
        StringBuffer buf = new StringBuffer();
        while (true) {
            int i = word.indexOf("=?", start);
            if (i < 0) {
                break;
            }
            buf.append(word.substring(start, i));
            int end3 = word.indexOf(63, i + 2);
            if (end3 < 0 || (end = word.indexOf(63, end3 + 1)) < 0 || (end2 = word.indexOf("?=", end + 1)) < 0) {
                break;
            }
            String s = word.substring(i, end2 + 2);
            try {
                s = decodeWord(s);
            } catch (ParseException e) {
            }
            buf.append(s);
            start = end2 + 2;
        }
        if (start == 0) {
            return word;
        }
        if (start < word.length()) {
            buf.append(word.substring(start));
        }
        return buf.toString();
    }

    public static String quote(String word, String specials) {
        int len = word == null ? 0 : word.length();
        if (len == 0) {
            return "\"\"";
        }
        boolean needQuoting = false;
        for (int i = 0; i < len; i++) {
            char c = word.charAt(i);
            if (c == '\"' || c == '\\' || c == '\r' || c == '\n') {
                StringBuffer sb = new StringBuffer(len + 3);
                sb.append('\"');
                sb.append(word.substring(0, i));
                int lastc = 0;
                for (int j = i; j < len; j++) {
                    char cc = word.charAt(j);
                    if ((cc == '\"' || cc == '\\' || cc == '\r' || cc == '\n') && (cc != '\n' || lastc != 13)) {
                        sb.append('\\');
                    }
                    sb.append(cc);
                    lastc = cc;
                }
                sb.append('\"');
                return sb.toString();
            }
            if (c < ' ' || c >= 127 || specials.indexOf(c) >= 0) {
                needQuoting = true;
            }
        }
        if (needQuoting) {
            StringBuffer sb2 = new StringBuffer(len + 2);
            sb2.append('\"').append(word).append('\"');
            return sb2.toString();
        }
        return word;
    }

    public static String fold(int used, String s) {
        char c;
        if (!foldText) {
            return s;
        }
        int end = s.length() - 1;
        while (end >= 0 && ((c = s.charAt(end)) == ' ' || c == '\t' || c == '\r' || c == '\n')) {
            end--;
        }
        if (end != s.length() - 1) {
            s = s.substring(0, end + 1);
        }
        if (used + s.length() <= 76) {
            return s;
        }
        StringBuffer sb = new StringBuffer(s.length() + 4);
        char lastc = 0;
        while (true) {
            if (used + s.length() <= 76) {
                break;
            }
            int lastspace = -1;
            for (int i = 0; i < s.length() && (lastspace == -1 || used + i <= 76); i++) {
                char c2 = s.charAt(i);
                if ((c2 == ' ' || c2 == '\t') && lastc != ' ' && lastc != '\t') {
                    lastspace = i;
                }
                lastc = c2;
            }
            if (lastspace == -1) {
                sb.append(s);
                s = "";
                break;
            }
            sb.append(s.substring(0, lastspace));
            sb.append("\r\n");
            lastc = s.charAt(lastspace);
            sb.append(lastc);
            s = s.substring(lastspace + 1);
            used = 1;
        }
        sb.append(s);
        return sb.toString();
    }

    public static String unfold(String s) {
        char c;
        char c2;
        if (!foldText) {
            return s;
        }
        StringBuffer sb = null;
        while (true) {
            int i = indexOfAny(s, "\r\n");
            if (i < 0) {
                break;
            }
            int l = s.length();
            int i2 = i + 1;
            if (i2 < l && s.charAt(i2 - 1) == '\r' && s.charAt(i2) == '\n') {
                i2++;
            }
            if (i == 0 || s.charAt(i - 1) != '\\') {
                if (i2 < l && ((c = s.charAt(i2)) == ' ' || c == '\t')) {
                    while (true) {
                        i2++;
                        if (i2 >= l || ((c2 = s.charAt(i2)) != ' ' && c2 != '\t')) {
                            break;
                        }
                    }
                    if (sb == null) {
                        sb = new StringBuffer(s.length());
                    }
                    if (i != 0) {
                        sb.append(s.substring(0, i));
                        sb.append(' ');
                    }
                    s = s.substring(i2);
                } else {
                    if (sb == null) {
                        sb = new StringBuffer(s.length());
                    }
                    sb.append(s.substring(0, i2));
                    s = s.substring(i2);
                }
            } else {
                if (sb == null) {
                    sb = new StringBuffer(s.length());
                }
                sb.append(s.substring(0, i - 1));
                sb.append(s.substring(i, i2));
                s = s.substring(i2);
            }
        }
        if (sb != null) {
            sb.append(s);
            return sb.toString();
        }
        return s;
    }

    private static int indexOfAny(String s, String any) {
        return indexOfAny(s, any, 0);
    }

    private static int indexOfAny(String s, String any, int start) {
        try {
            int len = s.length();
            for (int i = start; i < len; i++) {
                if (any.indexOf(s.charAt(i)) >= 0) {
                    return i;
                }
            }
            return -1;
        } catch (StringIndexOutOfBoundsException e) {
            return -1;
        }
    }

    public static String javaCharset(String charset) {
        if (mime2java == null || charset == null) {
            return charset;
        }
        String alias = (String) mime2java.get(charset.toLowerCase(Locale.ENGLISH));
        return alias == null ? charset : alias;
    }

    public static String mimeCharset(String charset) {
        if (java2mime == null || charset == null) {
            return charset;
        }
        String alias = (String) java2mime.get(charset.toLowerCase(Locale.ENGLISH));
        return alias == null ? charset : alias;
    }

    public static String getDefaultJavaCharset() {
        if (defaultJavaCharset == null) {
            String mimecs = null;
            try {
                mimecs = System.getProperty("mail.mime.charset");
            } catch (SecurityException e) {
            }
            if (mimecs != null && mimecs.length() > 0) {
                defaultJavaCharset = javaCharset(mimecs);
                return defaultJavaCharset;
            }
            try {
                defaultJavaCharset = System.getProperty("file.encoding", "8859_1");
            } catch (SecurityException e2) {
                InputStreamReader reader = new InputStreamReader(new InputStream() { // from class: korex.mail.internet.MimeUtility.1NullInputStream
                    @Override // java.io.InputStream
                    public int read() {
                        return 0;
                    }
                });
                defaultJavaCharset = reader.getEncoding();
                if (defaultJavaCharset == null) {
                    defaultJavaCharset = "8859_1";
                }
            }
        }
        return defaultJavaCharset;
    }

    static String getDefaultMIMECharset() {
        if (defaultMIMECharset == null) {
            try {
                defaultMIMECharset = System.getProperty("mail.mime.charset");
            } catch (SecurityException e) {
            }
        }
        if (defaultMIMECharset == null) {
            defaultMIMECharset = mimeCharset(getDefaultJavaCharset());
        }
        return defaultMIMECharset;
    }

    private static void loadMappings(LineInputStream is, Hashtable table) {
        while (true) {
            try {
                String currLine = is.readLine();
                if (currLine != null) {
                    if (!currLine.startsWith("--") || !currLine.endsWith("--")) {
                        if (currLine.trim().length() != 0 && !currLine.startsWith("#")) {
                            StringTokenizer tk = new StringTokenizer(currLine, " \t");
                            try {
                                String key = tk.nextToken();
                                String value = tk.nextToken();
                                table.put(key.toLowerCase(Locale.ENGLISH), value);
                            } catch (NoSuchElementException e) {
                            }
                        }
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            } catch (IOException e2) {
                return;
            }
        }
    }

    static int checkAscii(String s) {
        int ascii = 0;
        int non_ascii = 0;
        int l = s.length();
        for (int i = 0; i < l; i++) {
            if (nonascii(s.charAt(i))) {
                non_ascii++;
            } else {
                ascii++;
            }
        }
        if (non_ascii == 0) {
            return 1;
        }
        if (ascii > non_ascii) {
            return 2;
        }
        return 3;
    }

    static int checkAscii(byte[] b) {
        int ascii = 0;
        int non_ascii = 0;
        for (byte b2 : b) {
            if (nonascii(b2 & 255)) {
                non_ascii++;
            } else {
                ascii++;
            }
        }
        if (non_ascii == 0) {
            return 1;
        }
        if (ascii > non_ascii) {
            return 2;
        }
        return 3;
    }

    static int checkAscii(InputStream is, int max, boolean breakOnNonAscii) {
        int ascii = 0;
        int non_ascii = 0;
        int block = 4096;
        int linelen = 0;
        boolean longLine = false;
        boolean badEOL = false;
        boolean checkEOL = encodeEolStrict && breakOnNonAscii;
        byte[] buf = null;
        if (max != 0) {
            block = max == -1 ? 4096 : Math.min(max, 4096);
            buf = new byte[block];
        }
        while (max != 0) {
            try {
                int len = is.read(buf, 0, block);
                if (len == -1) {
                    break;
                }
                int lastb = 0;
                for (int i = 0; i < len; i++) {
                    int b = buf[i] & 255;
                    if (checkEOL && ((lastb == 13 && b != 10) || (lastb != 13 && b == 10))) {
                        badEOL = true;
                    }
                    if (b == 13 || b == 10) {
                        linelen = 0;
                    } else {
                        linelen++;
                        if (linelen > 998) {
                            longLine = true;
                        }
                    }
                    if (nonascii(b)) {
                        if (breakOnNonAscii) {
                            return 3;
                        }
                        non_ascii++;
                    } else {
                        ascii++;
                    }
                    lastb = b;
                }
                if (max != -1) {
                    max -= len;
                }
            } catch (IOException e) {
            }
        }
        if (max == 0 && breakOnNonAscii) {
            return 3;
        }
        if (non_ascii == 0) {
            if (badEOL) {
                return 3;
            }
            if (longLine) {
                return 2;
            }
            return 1;
        }
        if (ascii > non_ascii) {
            return 2;
        }
        return 3;
    }

    static final boolean nonascii(int b) {
        return b >= 127 || !(b >= 32 || b == 13 || b == 10 || b == 9);
    }
}

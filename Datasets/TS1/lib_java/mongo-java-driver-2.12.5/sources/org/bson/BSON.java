package org.bson;

import com.mongodb.Bytes;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.logging.Logger;
import org.bson.util.ClassMap;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/BSON.class */
public class BSON {
    public static final byte EOO = 0;
    public static final byte NUMBER = 1;
    public static final byte STRING = 2;
    public static final byte OBJECT = 3;
    public static final byte ARRAY = 4;
    public static final byte BINARY = 5;
    public static final byte UNDEFINED = 6;
    public static final byte OID = 7;
    public static final byte BOOLEAN = 8;
    public static final byte DATE = 9;
    public static final byte NULL = 10;
    public static final byte REGEX = 11;
    public static final byte REF = 12;
    public static final byte CODE = 13;
    public static final byte SYMBOL = 14;
    public static final byte CODE_W_SCOPE = 15;
    public static final byte NUMBER_INT = 16;
    public static final byte TIMESTAMP = 17;
    public static final byte NUMBER_LONG = 18;
    public static final byte MINKEY = -1;
    public static final byte MAXKEY = Byte.MAX_VALUE;
    public static final byte B_GENERAL = 0;
    public static final byte B_FUNC = 1;
    public static final byte B_BINARY = 2;
    public static final byte B_UUID = 3;
    private static final int GLOBAL_FLAG = 256;
    static final Logger LOGGER = Logger.getLogger("org.bson.BSON");
    private static boolean _encodeHooks = false;
    private static boolean _decodeHooks = false;
    static ClassMap<List<Transformer>> _encodingHooks = new ClassMap<>();
    static ClassMap<List<Transformer>> _decodingHooks = new ClassMap<>();

    @Deprecated
    protected static Charset _utf8 = Charset.forName("UTF-8");
    static ThreadLocal<BSONEncoder> _staticEncoder = new ThreadLocal<BSONEncoder>() { // from class: org.bson.BSON.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public BSONEncoder initialValue() {
            return new BasicBSONEncoder();
        }
    };
    static ThreadLocal<BSONDecoder> _staticDecoder = new ThreadLocal<BSONDecoder>() { // from class: org.bson.BSON.2
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public BSONDecoder initialValue() {
            return new BasicBSONDecoder();
        }
    };

    public static int regexFlags(String flags) {
        int fint = 0;
        if (flags == null || flags.length() == 0) {
            return 0;
        }
        String flags2 = flags.toLowerCase();
        for (int i = 0; i < flags2.length(); i++) {
            RegexFlag flag = RegexFlag.getByCharacter(flags2.charAt(i));
            if (flag != null) {
                fint |= flag.javaFlag;
                if (flag.unsupported != null) {
                    _warnUnsupportedRegex(flag.unsupported);
                }
            } else {
                throw new IllegalArgumentException("unrecognized flag [" + flags2.charAt(i) + "] " + ((int) flags2.charAt(i)));
            }
        }
        return fint;
    }

    public static int regexFlag(char c) {
        RegexFlag flag = RegexFlag.getByCharacter(c);
        if (flag == null) {
            throw new IllegalArgumentException("unrecognized flag [" + c + "]");
        }
        if (flag.unsupported != null) {
            _warnUnsupportedRegex(flag.unsupported);
            return 0;
        }
        return flag.javaFlag;
    }

    public static String regexFlags(int flags) {
        StringBuilder buf = new StringBuilder();
        RegexFlag[] arr$ = RegexFlag.values();
        for (RegexFlag flag : arr$) {
            if ((flags & flag.javaFlag) > 0) {
                buf.append(flag.flagChar);
                flags -= flag.javaFlag;
            }
        }
        if (flags > 0) {
            throw new IllegalArgumentException("some flags could not be recognized.");
        }
        return buf.toString();
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/BSON$RegexFlag.class */
    private enum RegexFlag {
        CANON_EQ(Bytes.QUERYOPTION_PARTIAL, 'c', "Pattern.CANON_EQ"),
        UNIX_LINES(1, 'd', "Pattern.UNIX_LINES"),
        GLOBAL(BSON.GLOBAL_FLAG, 'g', null),
        CASE_INSENSITIVE(2, 'i', null),
        MULTILINE(8, 'm', null),
        DOTALL(32, 's', "Pattern.DOTALL"),
        LITERAL(16, 't', "Pattern.LITERAL"),
        UNICODE_CASE(64, 'u', "Pattern.UNICODE_CASE"),
        COMMENTS(4, 'x', null);

        private static final Map<Character, RegexFlag> byCharacter = new HashMap();
        public final int javaFlag;
        public final char flagChar;
        public final String unsupported;

        static {
            RegexFlag[] arr$ = values();
            for (RegexFlag flag : arr$) {
                byCharacter.put(Character.valueOf(flag.flagChar), flag);
            }
        }

        public static RegexFlag getByCharacter(char ch) {
            return byCharacter.get(Character.valueOf(ch));
        }

        RegexFlag(int f, char ch, String u) {
            this.javaFlag = f;
            this.flagChar = ch;
            this.unsupported = u;
        }
    }

    private static void _warnUnsupportedRegex(String flag) {
        LOGGER.info("flag " + flag + " not supported by db.");
    }

    public static boolean hasDecodeHooks() {
        return _decodeHooks;
    }

    public static void addEncodingHook(Class c, Transformer t) {
        _encodeHooks = true;
        List<Transformer> l = _encodingHooks.get(c);
        if (l == null) {
            l = new CopyOnWriteArrayList();
            _encodingHooks.put(c, l);
        }
        l.add(t);
    }

    public static void addDecodingHook(Class c, Transformer t) {
        _decodeHooks = true;
        List<Transformer> l = _decodingHooks.get(c);
        if (l == null) {
            l = new CopyOnWriteArrayList();
            _decodingHooks.put(c, l);
        }
        l.add(t);
    }

    public static Object applyEncodingHooks(Object o) {
        if (!_anyHooks()) {
            return o;
        }
        if (_encodingHooks.size() == 0 || o == null) {
            return o;
        }
        List<Transformer> l = _encodingHooks.get(o.getClass());
        if (l != null) {
            for (Transformer t : l) {
                o = t.transform(o);
            }
        }
        return o;
    }

    public static Object applyDecodingHooks(Object o) {
        if (!_anyHooks() || o == null) {
            return o;
        }
        List<Transformer> l = _decodingHooks.get(o.getClass());
        if (l != null) {
            for (Transformer t : l) {
                o = t.transform(o);
            }
        }
        return o;
    }

    public static List<Transformer> getEncodingHooks(Class c) {
        return _encodingHooks.get(c);
    }

    public static void clearEncodingHooks() {
        _encodeHooks = false;
        _encodingHooks.clear();
    }

    public static void removeEncodingHooks(Class c) {
        _encodingHooks.remove(c);
    }

    public static void removeEncodingHook(Class c, Transformer t) {
        getEncodingHooks(c).remove(t);
    }

    public static List<Transformer> getDecodingHooks(Class c) {
        return _decodingHooks.get(c);
    }

    public static void clearDecodingHooks() {
        _decodeHooks = false;
        _decodingHooks.clear();
    }

    public static void removeDecodingHooks(Class c) {
        _decodingHooks.remove(c);
    }

    public static void removeDecodingHook(Class c, Transformer t) {
        getDecodingHooks(c).remove(t);
    }

    public static void clearAllHooks() {
        clearEncodingHooks();
        clearDecodingHooks();
    }

    private static boolean _anyHooks() {
        return _encodeHooks || _decodeHooks;
    }

    public static byte[] encode(BSONObject o) {
        BSONEncoder e = _staticEncoder.get();
        try {
            byte[] encode = e.encode(o);
            e.done();
            return encode;
        } catch (Throwable th) {
            e.done();
            throw th;
        }
    }

    public static BSONObject decode(byte[] b) {
        BSONDecoder d = _staticDecoder.get();
        return d.readObject(b);
    }

    public static int toInt(Object o) {
        if (o == null) {
            throw new NullPointerException("can't be null");
        }
        if (o instanceof Number) {
            return ((Number) o).intValue();
        }
        if (o instanceof Boolean) {
            return ((Boolean) o).booleanValue() ? 1 : 0;
        }
        throw new IllegalArgumentException("can't convert: " + o.getClass().getName() + " to int");
    }
}

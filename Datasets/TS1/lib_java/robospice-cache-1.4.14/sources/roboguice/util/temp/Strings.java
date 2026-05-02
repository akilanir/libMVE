package roboguice.util.temp;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.nio.charset.Charset;
import java.security.InvalidParameterException;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: robospice-cache-1.4.14.jar:roboguice/util/temp/Strings.class */
public final class Strings {
    private static final int DEFAULT_BUFFER_SIZE = 4096;

    private Strings() {
    }

    public static <T> String joinAnd(String delimiter, String lastDelimiter, Collection<T> objs) {
        if (objs == null || objs.isEmpty()) {
            return "";
        }
        Iterator<T> iter = objs.iterator();
        StringBuilder buffer = new StringBuilder(toString(iter.next()));
        int i = 1;
        while (iter.hasNext()) {
            T obj = iter.next();
            if (notEmpty(obj)) {
                i++;
                buffer.append(i == objs.size() ? lastDelimiter : delimiter).append(toString(obj));
            }
        }
        return buffer.toString();
    }

    public static <T> String joinAnd(String delimiter, String lastDelimiter, T... objs) {
        return joinAnd(delimiter, lastDelimiter, Arrays.asList(objs));
    }

    public static <T> String join(String delimiter, Collection<T> objs) {
        if (objs == null || objs.isEmpty()) {
            return "";
        }
        Iterator<T> iter = objs.iterator();
        StringBuilder buffer = new StringBuilder(toString(iter.next()));
        while (iter.hasNext()) {
            T obj = iter.next();
            if (notEmpty(obj)) {
                buffer.append(delimiter).append(toString(obj));
            }
        }
        return buffer.toString();
    }

    public static <T> String join(String delimiter, T... objects) {
        return join(delimiter, Arrays.asList(objects));
    }

    public static String toString(InputStream input) {
        StringWriter sw = new StringWriter();
        copy(new InputStreamReader(input, Charset.forName("UTF-8")), sw);
        return sw.toString();
    }

    public static String toString(Reader input) {
        StringWriter sw = new StringWriter();
        copy(input, sw);
        return sw.toString();
    }

    public static int copy(Reader input, Writer output) {
        long count = copyLarge(input, output);
        if (count > 2147483647L) {
            return -1;
        }
        return (int) count;
    }

    public static long copyLarge(Reader input, Writer output) {
        try {
            char[] buffer = new char[DEFAULT_BUFFER_SIZE];
            long count = 0;
            while (true) {
                int n = input.read(buffer);
                if (-1 != n) {
                    output.write(buffer, 0, n);
                    count += n;
                } else {
                    return count;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String toString(Object o) {
        return toString(o, "");
    }

    public static String toString(Object o, String def) {
        return o == null ? def : o instanceof InputStream ? toString((InputStream) o) : o instanceof Reader ? toString((Reader) o) : o instanceof Object[] ? join(", ", (Object[]) o) : o instanceof Collection ? join(", ", (Collection) o) : o.toString();
    }

    public static boolean isEmpty(Object o) {
        return toString(o).trim().length() == 0;
    }

    public static boolean notEmpty(Object o) {
        return toString(o).trim().length() != 0;
    }

    public static String md5(String s) {
        try {
            byte[] hash = MessageDigest.getInstance("MD5").digest(s.getBytes("UTF-8"));
            StringBuilder hashString = new StringBuilder();
            for (byte aHash : hash) {
                String hex = Integer.toHexString(aHash);
                if (hex.length() == 1) {
                    hashString.append('0');
                    hashString.append(hex.charAt(hex.length() - 1));
                } else {
                    hashString.append(hex.substring(hex.length() - 2));
                }
            }
            return hashString.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String capitalize(String s) {
        String c = toString(s);
        return c.length() >= 2 ? c.substring(0, 1).toUpperCase() + c.substring(1) : c.length() >= 1 ? c.toUpperCase() : c;
    }

    public static boolean equals(Object a, Object b) {
        return toString(a).equals(toString(b));
    }

    public static boolean equalsIgnoreCase(Object a, Object b) {
        return toString(a).toLowerCase().equals(toString(b).toLowerCase());
    }

    public static String[] chunk(String str, int chunkSize) {
        if (isEmpty(str) || chunkSize == 0) {
            return new String[0];
        }
        int len = str.length();
        int arrayLen = ((len - 1) / chunkSize) + 1;
        String[] array = new String[arrayLen];
        for (int i = 0; i < arrayLen; i++) {
            array[i] = str.substring(i * chunkSize, (i * chunkSize) + chunkSize < len ? (i * chunkSize) + chunkSize : len);
        }
        return array;
    }

    public static String namedFormat(String str, Map<String, String> substitutions) {
        for (Map.Entry<String, String> entry : substitutions.entrySet()) {
            str = str.replace('$' + entry.getKey(), entry.getValue());
        }
        return str;
    }

    public static String namedFormat(String str, Object... nameValuePairs) {
        if (nameValuePairs.length % 2 != 0) {
            throw new InvalidParameterException("You must include one value for each parameter");
        }
        HashMap<String, String> map = new HashMap<>(nameValuePairs.length / 2);
        for (int i = 0; i < nameValuePairs.length; i += 2) {
            map.put(toString(nameValuePairs[i]), toString(nameValuePairs[i + 1]));
        }
        return namedFormat(str, map);
    }
}

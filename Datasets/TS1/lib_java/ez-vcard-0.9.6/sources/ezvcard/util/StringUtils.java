package ezvcard.util;

import java.util.Collection;
import java.util.Map;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/StringUtils.class */
public class StringUtils {
    public static final String NEWLINE = System.getProperty("line.separator");

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/StringUtils$JoinCallback.class */
    public interface JoinCallback<T> {
        void handle(StringBuilder sb, T t);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/StringUtils$JoinMapCallback.class */
    public interface JoinMapCallback<K, V> {
        void handle(StringBuilder sb, K k, V v);
    }

    public static String ltrim(String string) {
        if (string == null) {
            return null;
        }
        int i = 0;
        while (i < string.length() && Character.isWhitespace(string.charAt(i))) {
            i++;
        }
        return i == string.length() ? "" : string.substring(i);
    }

    public static String rtrim(String string) {
        if (string == null) {
            return null;
        }
        int i = string.length() - 1;
        while (i >= 0 && Character.isWhitespace(string.charAt(i))) {
            i--;
        }
        return i == 0 ? "" : string.substring(0, i + 1);
    }

    public static <T> String join(Collection<T> collection, String delimiter) {
        StringBuilder sb = new StringBuilder();
        join(collection, delimiter, sb);
        return sb.toString();
    }

    public static <T> void join(Collection<T> collection, String delimiter, StringBuilder sb) {
        join(collection, delimiter, sb, new JoinCallback<T>() { // from class: ezvcard.util.StringUtils.1
            @Override // ezvcard.util.StringUtils.JoinCallback
            public void handle(StringBuilder sb2, T value) {
                sb2.append(value);
            }
        });
    }

    public static <T> String join(Collection<T> collection, String delimiter, JoinCallback<T> join) {
        StringBuilder sb = new StringBuilder();
        join(collection, delimiter, sb, join);
        return sb.toString();
    }

    public static <T> void join(Collection<T> collection, String delimiter, StringBuilder sb, JoinCallback<T> join) {
        boolean first = true;
        for (T element : collection) {
            if (first) {
                first = false;
            } else {
                sb.append(delimiter);
            }
            join.handle(sb, element);
        }
    }

    public static <K, V> String join(Map<K, V> map, String delimiter, final JoinMapCallback<K, V> join) {
        return join(map.entrySet(), delimiter, new JoinCallback<Map.Entry<K, V>>() { // from class: ezvcard.util.StringUtils.2
            @Override // ezvcard.util.StringUtils.JoinCallback
            public void handle(StringBuilder sb, Map.Entry<K, V> entry) {
                join.handle(sb, entry.getKey(), entry.getValue());
            }
        });
    }

    private StringUtils() {
    }
}

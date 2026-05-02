package org.jsoup.nodes;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.CharsetEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.Properties;
import org.jsoup.SerializationException;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

/* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Entities.class */
public class Entities {
    private static final Object[][] xhtmlArray = {new Object[]{"quot", 34}, new Object[]{"amp", 38}, new Object[]{"lt", 60}, new Object[]{"gt", 62}};
    private static final Map<Character, String> xhtmlByVal = new HashMap();
    private static final Map<String, Character> base = loadEntities("entities-base.properties");
    private static final Map<Character, String> baseByVal = toCharacterKey(base);
    private static final Map<String, Character> full = loadEntities("entities-full.properties");
    private static final Map<Character, String> fullByVal = toCharacterKey(full);

    /* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Entities$EscapeMode.class */
    public enum EscapeMode {
        xhtml(Entities.xhtmlByVal),
        base(Entities.baseByVal),
        extended(Entities.fullByVal);

        private Map<Character, String> map;

        EscapeMode(Map map) {
            this.map = map;
        }

        public Map<Character, String> getMap() {
            return this.map;
        }
    }

    private Entities() {
    }

    public static boolean isNamedEntity(String name) {
        return full.containsKey(name);
    }

    public static boolean isBaseNamedEntity(String name) {
        return base.containsKey(name);
    }

    public static Character getCharacterByName(String name) {
        return full.get(name);
    }

    static String escape(String string, Document.OutputSettings out) {
        StringBuilder accum = new StringBuilder(string.length() * 2);
        try {
            escape(accum, string, out, false, false, false);
            return accum.toString();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x01a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void escape(java.lang.Appendable r4, java.lang.String r5, org.jsoup.nodes.Document.OutputSettings r6, boolean r7, boolean r8, boolean r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 499
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jsoup.nodes.Entities.escape(java.lang.Appendable, java.lang.String, org.jsoup.nodes.Document$OutputSettings, boolean, boolean, boolean):void");
    }

    static String unescape(String string) {
        return unescape(string, false);
    }

    static String unescape(String string, boolean strict) {
        return Parser.unescapeEntities(string, strict);
    }

    private static boolean canEncode(CoreCharset charset, char c, CharsetEncoder fallback) {
        switch (charset) {
            case ascii:
                return c < 128;
            case utf:
                return true;
            default:
                return fallback.canEncode(c);
        }
    }

    /* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Entities$CoreCharset.class */
    private enum CoreCharset {
        ascii,
        utf,
        fallback;

        /* JADX INFO: Access modifiers changed from: private */
        public static CoreCharset byName(String name) {
            if (name.equals("US-ASCII")) {
                return ascii;
            }
            if (name.startsWith("UTF-")) {
                return utf;
            }
            return fallback;
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object[], java.lang.Object[][]] */
    static {
        for (Object[] entity : xhtmlArray) {
            Character c = Character.valueOf((char) ((Integer) entity[1]).intValue());
            xhtmlByVal.put(c, (String) entity[0]);
        }
    }

    private static Map<String, Character> loadEntities(String filename) {
        Properties properties = new Properties();
        Map<String, Character> entities = new HashMap<>();
        try {
            InputStream in = Entities.class.getResourceAsStream(filename);
            properties.load(in);
            in.close();
            for (Map.Entry entry : properties.entrySet()) {
                Character val = Character.valueOf((char) Integer.parseInt((String) entry.getValue(), 16));
                String name = (String) entry.getKey();
                entities.put(name, val);
            }
            return entities;
        } catch (IOException e) {
            throw new MissingResourceException("Error loading entities resource: " + e.getMessage(), "Entities", filename);
        }
    }

    private static Map<Character, String> toCharacterKey(Map<String, Character> inMap) {
        Map<Character, String> outMap = new HashMap<>();
        for (Map.Entry<String, Character> entry : inMap.entrySet()) {
            Character character = entry.getValue();
            String name = entry.getKey();
            if (outMap.containsKey(character)) {
                if (name.toLowerCase().equals(name)) {
                    outMap.put(character, name);
                }
            } else {
                outMap.put(character, name);
            }
        }
        return outMap;
    }
}

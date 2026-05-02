package org.jsoup.nodes;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.Properties;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

/* loaded from: jsoup-1.8.1.jar:org/jsoup/nodes/Entities.class */
public class Entities {
    private static final Object[][] xhtmlArray = {new Object[]{"quot", 34}, new Object[]{"amp", 38}, new Object[]{"lt", 60}, new Object[]{"gt", 62}};
    private static final Map<Character, String> xhtmlByVal = new HashMap();
    private static final Map<String, Character> base = loadEntities("entities-base.properties");
    private static final Map<Character, String> baseByVal = toCharacterKey(base);
    private static final Map<String, Character> full = loadEntities("entities-full.properties");
    private static final Map<Character, String> fullByVal = toCharacterKey(full);

    /* loaded from: jsoup-1.8.1.jar:org/jsoup/nodes/Entities$EscapeMode.class */
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
        escape(accum, string, out, false, false, false);
        return accum.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x016d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void escape(java.lang.StringBuilder r4, java.lang.String r5, org.jsoup.nodes.Document.OutputSettings r6, boolean r7, boolean r8, boolean r9) {
        /*
            Method dump skipped, instructions count: 433
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jsoup.nodes.Entities.escape(java.lang.StringBuilder, java.lang.String, org.jsoup.nodes.Document$OutputSettings, boolean, boolean, boolean):void");
    }

    static String unescape(String string) {
        return unescape(string, false);
    }

    static String unescape(String string, boolean strict) {
        return Parser.unescapeEntities(string, strict);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object[], java.lang.Object[][]] */
    static {
        Object[][] arr$ = xhtmlArray;
        for (Object[] entity : arr$) {
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

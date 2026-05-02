package org.markdownj;

import java.util.Collection;
import java.util.Collections;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: markdownj-core-0.4.jar:org/markdownj/CharacterProtector.class */
public class CharacterProtector {
    private static final String GOOD_CHARS = "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
    private final ConcurrentMap<String, String> protectMap = new ConcurrentHashMap();
    private final ConcurrentMap<String, String> unprotectMap = new ConcurrentHashMap();
    private Random rnd = new Random();

    public String encode(String literal) {
        String encoded = this.protectMap.get(literal);
        if (encoded == null) {
            synchronized (this.protectMap) {
                encoded = this.protectMap.get(literal);
                if (encoded == null) {
                    encoded = addToken(literal);
                }
            }
        }
        return encoded;
    }

    public String decode(String coded) {
        return this.unprotectMap.get(coded);
    }

    public Collection<String> getAllEncodedTokens() {
        return Collections.unmodifiableSet(this.unprotectMap.keySet());
    }

    private String addToken(String literal) {
        String encoded = longRandomString();
        this.protectMap.put(literal, encoded);
        this.unprotectMap.put(encoded, literal);
        return encoded;
    }

    private String longRandomString() {
        StringBuilder sb = new StringBuilder();
        int CHAR_MAX = GOOD_CHARS.length();
        for (int i = 0; i < 20; i++) {
            sb.append(GOOD_CHARS.charAt(this.rnd.nextInt(CHAR_MAX)));
        }
        return sb.toString();
    }

    public String toString() {
        return this.protectMap.toString();
    }
}

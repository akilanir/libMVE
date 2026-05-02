package javassist.compiler;

import java.util.HashMap;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/KeywordTable.class */
public final class KeywordTable extends HashMap {
    public int lookup(String name) {
        Object found = get(name);
        if (found == null) {
            return -1;
        }
        return ((Integer) found).intValue();
    }

    public void append(String name, int t) {
        put(name, new Integer(t));
    }
}

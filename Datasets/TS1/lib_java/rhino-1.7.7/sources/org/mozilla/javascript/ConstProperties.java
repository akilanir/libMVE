package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ConstProperties.class */
public interface ConstProperties {
    void putConst(String str, Scriptable scriptable, Object obj);

    void defineConst(String str, Scriptable scriptable);

    boolean isConst(String str);
}

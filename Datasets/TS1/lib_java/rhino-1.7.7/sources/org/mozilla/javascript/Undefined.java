package org.mozilla.javascript;

import java.io.Serializable;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Undefined.class */
public class Undefined implements Serializable {
    static final long serialVersionUID = 9195680630202616767L;
    public static final Object instance = new Undefined();

    private Undefined() {
    }

    public Object readResolve() {
        return instance;
    }
}

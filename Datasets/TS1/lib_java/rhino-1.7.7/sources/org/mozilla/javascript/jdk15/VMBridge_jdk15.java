package org.mozilla.javascript.jdk15;

import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.util.Iterator;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.Wrapper;
import org.mozilla.javascript.jdk13.VMBridge_jdk13;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/jdk15/VMBridge_jdk15.class */
public class VMBridge_jdk15 extends VMBridge_jdk13 {
    public VMBridge_jdk15() throws SecurityException, InstantiationException {
        try {
            Method.class.getMethod("isVarArgs", (Class[]) null);
        } catch (NoSuchMethodException e) {
            throw new InstantiationException(e.getMessage());
        }
    }

    @Override // org.mozilla.javascript.jdk13.VMBridge_jdk13, org.mozilla.javascript.VMBridge
    public boolean isVarArgs(Member member) {
        if (member instanceof Method) {
            return ((Method) member).isVarArgs();
        }
        if (member instanceof Constructor) {
            return ((Constructor) member).isVarArgs();
        }
        return false;
    }

    @Override // org.mozilla.javascript.VMBridge
    public Iterator<?> getJavaIterator(Context cx, Scriptable scope, Object obj) {
        if (obj instanceof Wrapper) {
            Object unwrapped = ((Wrapper) obj).unwrap();
            Iterator<?> iterator = null;
            if (unwrapped instanceof Iterator) {
                iterator = (Iterator) unwrapped;
            }
            if (unwrapped instanceof Iterable) {
                iterator = ((Iterable) unwrapped).iterator();
            }
            return iterator;
        }
        return null;
    }
}

package org.mozilla.javascript.tools.shell;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.List;
import org.mozilla.javascript.Function;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.ScriptableObject;

/* compiled from: ShellConsole.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/FlexibleCompletor.class */
class FlexibleCompletor implements InvocationHandler {
    private Method completeMethod;
    private Scriptable global;

    FlexibleCompletor(Class<?> completorClass, Scriptable global) throws NoSuchMethodException {
        this.global = global;
        this.completeMethod = completorClass.getMethod("complete", String.class, Integer.TYPE, List.class);
    }

    @Override // java.lang.reflect.InvocationHandler
    public Object invoke(Object proxy, Method method, Object[] args) {
        if (method.equals(this.completeMethod)) {
            int result = complete((String) args[0], ((Integer) args[1]).intValue(), (List) args[2]);
            return Integer.valueOf(result);
        }
        throw new NoSuchMethodError(method.toString());
    }

    public int complete(String buffer, int cursor, List<String> candidates) {
        int m = cursor - 1;
        while (m >= 0) {
            char c = buffer.charAt(m);
            if (!Character.isJavaIdentifierPart(c) && c != '.') {
                break;
            }
            m--;
        }
        String namesAndDots = buffer.substring(m + 1, cursor);
        String[] names = namesAndDots.split("\\.", -1);
        Scriptable obj = this.global;
        for (int i = 0; i < names.length - 1; i++) {
            Object val = obj.get(names[i], this.global);
            if (val instanceof Scriptable) {
                obj = (Scriptable) val;
            } else {
                return buffer.length();
            }
        }
        Object[] ids = obj instanceof ScriptableObject ? ((ScriptableObject) obj).getAllIds() : obj.getIds();
        String lastPart = names[names.length - 1];
        for (int i2 = 0; i2 < ids.length; i2++) {
            if (ids[i2] instanceof String) {
                String id = (String) ids[i2];
                if (id.startsWith(lastPart)) {
                    if (obj.get(id, obj) instanceof Function) {
                        id = id + "(";
                    }
                    candidates.add(id);
                }
            }
        }
        return buffer.length() - lastPart.length();
    }
}

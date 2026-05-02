package freemarker.core;

import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.UndeclaredThrowableException;
import java.util.Collections;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_ConcurrentMapFactory.class */
public class _ConcurrentMapFactory {
    private static final Class concurrentMapClass = getConcurrentMapClass();
    private static final Class bestHashMapClass = getBestHashMapClass();
    static Class class$java$util$HashMap;

    public static Map newMaybeConcurrentHashMap() {
        try {
            return (Map) bestHashMapClass.newInstance();
        } catch (Exception e) {
            throw new UndeclaredThrowableException(e);
        }
    }

    public static Map newThreadSafeMap() {
        Map map = newMaybeConcurrentHashMap();
        return isConcurrent(map) ? map : Collections.synchronizedMap(map);
    }

    public static boolean concurrentMapsAvailable() {
        return concurrentMapClass != null;
    }

    public static boolean isConcurrent(Map map) {
        return concurrentMapClass != null && concurrentMapClass.isInstance(map);
    }

    private static Class getConcurrentMapClass() {
        try {
            return ClassUtil.forName("java.util.concurrent.ConcurrentMap");
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    private static Class getBestHashMapClass() {
        try {
            return ClassUtil.forName("java.util.concurrent.ConcurrentHashMap");
        } catch (ClassNotFoundException e) {
            if (class$java$util$HashMap != null) {
                return class$java$util$HashMap;
            }
            Class class$ = class$("java.util.HashMap");
            class$java$util$HashMap = class$;
            return class$;
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}

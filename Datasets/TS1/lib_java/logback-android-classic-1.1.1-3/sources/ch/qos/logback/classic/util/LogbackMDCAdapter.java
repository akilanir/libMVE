package ch.qos.logback.classic.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.slf4j.spi.MDCAdapter;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/LogbackMDCAdapter.class */
public final class LogbackMDCAdapter implements MDCAdapter {
    private static final int WRITE_OPERATION = 1;
    private static final int READ_OPERATION = 2;
    final InheritableThreadLocal<Map<String, String>> copyOnInheritThreadLocal = new InheritableThreadLocal<>();
    final ThreadLocal<Integer> lastOperation = new ThreadLocal<>();

    private Integer getAndSetLastOperation(int i) {
        Integer num = this.lastOperation.get();
        this.lastOperation.set(Integer.valueOf(i));
        return num;
    }

    private boolean wasLastOpReadOrNull(Integer num) {
        return num == null || num.intValue() == READ_OPERATION;
    }

    private Map<String, String> duplicateAndInsertNewMap(Map<String, String> map) {
        Map<String, String> synchronizedMap = Collections.synchronizedMap(new HashMap());
        if (map != null) {
            synchronized (map) {
                synchronizedMap.putAll(map);
            }
        }
        this.copyOnInheritThreadLocal.set(synchronizedMap);
        return synchronizedMap;
    }

    public void put(String str, String str2) throws IllegalArgumentException {
        if (str == null) {
            throw new IllegalArgumentException("key cannot be null");
        }
        Map<String, String> map = this.copyOnInheritThreadLocal.get();
        if (wasLastOpReadOrNull(getAndSetLastOperation(1)) || map == null) {
            duplicateAndInsertNewMap(map).put(str, str2);
        } else {
            map.put(str, str2);
        }
    }

    public void remove(String str) {
        Map<String, String> map;
        if (str == null || (map = this.copyOnInheritThreadLocal.get()) == null) {
            return;
        }
        if (wasLastOpReadOrNull(getAndSetLastOperation(1))) {
            duplicateAndInsertNewMap(map).remove(str);
        } else {
            map.remove(str);
        }
    }

    public void clear() {
        this.lastOperation.set(1);
        this.copyOnInheritThreadLocal.remove();
    }

    public String get(String str) {
        Map<String, String> propertyMap = getPropertyMap();
        if (propertyMap == null || str == null) {
            return null;
        }
        return propertyMap.get(str);
    }

    public Map<String, String> getPropertyMap() {
        this.lastOperation.set(Integer.valueOf(READ_OPERATION));
        return this.copyOnInheritThreadLocal.get();
    }

    public Set<String> getKeys() {
        Map<String, String> propertyMap = getPropertyMap();
        if (propertyMap != null) {
            return propertyMap.keySet();
        }
        return null;
    }

    public Map getCopyOfContextMap() {
        this.lastOperation.set(Integer.valueOf(READ_OPERATION));
        Map<String, String> map = this.copyOnInheritThreadLocal.get();
        if (map == null) {
            return null;
        }
        return new HashMap(map);
    }

    public void setContextMap(Map map) {
        this.lastOperation.set(1);
        Map<String, String> synchronizedMap = Collections.synchronizedMap(new HashMap());
        synchronizedMap.putAll(map);
        this.copyOnInheritThreadLocal.set(synchronizedMap);
    }
}

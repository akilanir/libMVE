package org.slf4j.helpers;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.slf4j.spi.MDCAdapter;

/* loaded from: slf4j-api-1.6.1.jar:org/slf4j/helpers/BasicMDCAdapter.class */
public class BasicMDCAdapter implements MDCAdapter {
    private InheritableThreadLocal inheritableThreadLocal = new InheritableThreadLocal();

    @Override // org.slf4j.spi.MDCAdapter
    public void put(String key, String val) {
        if (key == null) {
            throw new IllegalArgumentException("key cannot be null");
        }
        HashMap map = (HashMap) this.inheritableThreadLocal.get();
        if (map == null) {
            map = new HashMap();
            this.inheritableThreadLocal.set(map);
        }
        map.put(key, val);
    }

    @Override // org.slf4j.spi.MDCAdapter
    public String get(String key) {
        HashMap hashMap = (HashMap) this.inheritableThreadLocal.get();
        if (hashMap != null && key != null) {
            return (String) hashMap.get(key);
        }
        return null;
    }

    @Override // org.slf4j.spi.MDCAdapter
    public void remove(String key) {
        HashMap map = (HashMap) this.inheritableThreadLocal.get();
        if (map != null) {
            map.remove(key);
        }
    }

    @Override // org.slf4j.spi.MDCAdapter
    public void clear() {
        HashMap hashMap = (HashMap) this.inheritableThreadLocal.get();
        if (hashMap != null) {
            hashMap.clear();
            this.inheritableThreadLocal.remove();
        }
    }

    public Set getKeys() {
        HashMap hashMap = (HashMap) this.inheritableThreadLocal.get();
        if (hashMap != null) {
            return hashMap.keySet();
        }
        return null;
    }

    @Override // org.slf4j.spi.MDCAdapter
    public Map getCopyOfContextMap() {
        HashMap hashMap = (HashMap) this.inheritableThreadLocal.get();
        if (hashMap != null) {
            return new HashMap(hashMap);
        }
        return null;
    }

    @Override // org.slf4j.spi.MDCAdapter
    public void setContextMap(Map contextMap) {
        HashMap hashMap = (HashMap) this.inheritableThreadLocal.get();
        if (hashMap != null) {
            hashMap.clear();
            hashMap.putAll(contextMap);
        } else {
            this.inheritableThreadLocal.set(new HashMap(contextMap));
        }
    }
}

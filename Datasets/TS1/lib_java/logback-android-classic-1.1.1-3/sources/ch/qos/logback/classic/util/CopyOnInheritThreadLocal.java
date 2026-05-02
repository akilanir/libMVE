package ch.qos.logback.classic.util;

import java.util.HashMap;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/CopyOnInheritThreadLocal.class */
public class CopyOnInheritThreadLocal extends InheritableThreadLocal<HashMap<String, String>> {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // java.lang.InheritableThreadLocal
    public HashMap<String, String> childValue(HashMap<String, String> hashMap) {
        if (hashMap == null) {
            return null;
        }
        return new HashMap<>(hashMap);
    }
}

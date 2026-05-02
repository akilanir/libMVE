package cz.msebera.android.httpclient.config;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/config/Registry.class */
public final class Registry<I> implements Lookup<I> {
    private final Map<String, I> map;

    Registry(Map<String, I> map) {
        this.map = new ConcurrentHashMap(map);
    }

    @Override // cz.msebera.android.httpclient.config.Lookup
    public I lookup(String key) {
        if (key == null) {
            return null;
        }
        return this.map.get(key.toLowerCase(Locale.ENGLISH));
    }

    public String toString() {
        return this.map.toString();
    }
}

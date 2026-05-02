package com.koushikdutta.async.http.cache;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/cache/Objects.class */
final class Objects {
    private Objects() {
    }

    public static boolean equal(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }

    public static int hashCode(Object o) {
        if (o == null) {
            return 0;
        }
        return o.hashCode();
    }
}

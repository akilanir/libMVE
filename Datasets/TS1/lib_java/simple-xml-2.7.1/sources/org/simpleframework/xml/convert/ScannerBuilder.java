package org.simpleframework.xml.convert;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.util.ConcurrentCache;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/convert/ScannerBuilder.class */
class ScannerBuilder extends ConcurrentCache<Scanner> {
    public Scanner build(Class<?> type) {
        Scanner scanner = (Scanner) get(type);
        if (scanner == null) {
            scanner = new Entry(type);
            put(type, scanner);
        }
        return scanner;
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/convert/ScannerBuilder$Entry.class */
    private static class Entry extends ConcurrentCache<Annotation> implements Scanner {
        private final Class root;

        public Entry(Class root) {
            this.root = root;
        }

        @Override // org.simpleframework.xml.convert.Scanner
        public <T extends Annotation> T scan(Class<T> type) {
            if (!contains(type)) {
                Annotation find = find(type);
                if (type != null && find != null) {
                    put(type, find);
                }
            }
            return (T) get(type);
        }

        private <T extends Annotation> T find(Class<T> cls) {
            Class cls2 = this.root;
            while (true) {
                Class cls3 = cls2;
                if (cls3 != null) {
                    T t = (T) cls3.getAnnotation(cls);
                    if (t != null) {
                        return t;
                    }
                    cls2 = cls3.getSuperclass();
                } else {
                    return null;
                }
            }
        }
    }
}

package freemarker.template.utility;

import java.io.Serializable;
import java.util.AbstractList;
import java.util.AbstractMap;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Collections12.class */
public class Collections12 {
    public static final Map EMPTY_MAP = new EmptyMap(null);

    /* renamed from: freemarker.template.utility.Collections12$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Collections12$1.class */
    static class AnonymousClass1 {
    }

    private Collections12() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Collections12$EmptyMap.class */
    private static final class EmptyMap extends AbstractMap implements Serializable {
        private EmptyMap() {
        }

        EmptyMap(AnonymousClass1 x0) {
            this();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public int size() {
            return 0;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return true;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object key) {
            return false;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object value) {
            return false;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Object get(Object key) {
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set keySet() {
            return Collections.EMPTY_SET;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Collection values() {
            return Collections.EMPTY_SET;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set entrySet() {
            return Collections.EMPTY_SET;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean equals(Object o) {
            return (o instanceof Map) && ((Map) o).size() == 0;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public int hashCode() {
            return 0;
        }
    }

    public static Map singletonMap(Object key, Object value) {
        return new SingletonMap(key, value);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Collections12$SingletonMap.class */
    private static class SingletonMap extends AbstractMap implements Serializable {
        private final Object k;
        private final Object v;
        private transient Set keySet = null;
        private transient Set entrySet = null;
        private transient Collection values = null;

        SingletonMap(Object key, Object value) {
            this.k = key;
            this.v = value;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public int size() {
            return 1;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return false;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object key) {
            return Collections12.eq(key, this.k);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object value) {
            return Collections12.eq(value, this.v);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Object get(Object key) {
            if (Collections12.eq(key, this.k)) {
                return this.v;
            }
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set keySet() {
            if (this.keySet == null) {
                this.keySet = Collections.singleton(this.k);
            }
            return this.keySet;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set entrySet() {
            if (this.entrySet == null) {
                this.entrySet = Collections.singleton(new ImmutableEntry(this.k, this.v));
            }
            return this.entrySet;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Collection values() {
            if (this.values == null) {
                this.values = Collections.singleton(this.v);
            }
            return this.values;
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Collections12$SingletonMap$ImmutableEntry.class */
        private static class ImmutableEntry implements Map.Entry {
            final Object k;
            final Object v;

            ImmutableEntry(Object key, Object value) {
                this.k = key;
                this.v = value;
            }

            @Override // java.util.Map.Entry
            public Object getKey() {
                return this.k;
            }

            @Override // java.util.Map.Entry
            public Object getValue() {
                return this.v;
            }

            @Override // java.util.Map.Entry
            public Object setValue(Object value) {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.Map.Entry
            public boolean equals(Object o) {
                if (!(o instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry e = (Map.Entry) o;
                return Collections12.eq(e.getKey(), this.k) && Collections12.eq(e.getValue(), this.v);
            }

            @Override // java.util.Map.Entry
            public int hashCode() {
                return (this.k == null ? 0 : this.k.hashCode()) ^ (this.v == null ? 0 : this.v.hashCode());
            }

            public String toString() {
                return new StringBuffer().append(this.k).append("=").append(this.v).toString();
            }
        }
    }

    public static List singletonList(Object o) {
        return new SingletonList(o);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Collections12$SingletonList.class */
    private static class SingletonList extends AbstractList implements Serializable {
        private final Object element;

        SingletonList(Object obj) {
            this.element = obj;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return 1;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public boolean contains(Object obj) {
            return Collections12.eq(obj, this.element);
        }

        @Override // java.util.AbstractList, java.util.List
        public Object get(int index) {
            if (index != 0) {
                throw new IndexOutOfBoundsException(new StringBuffer().append("Index: ").append(index).append(", Size: 1").toString());
            }
            return this.element;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean eq(Object o1, Object o2) {
        return o1 == null ? o2 == null : o1.equals(o2);
    }
}

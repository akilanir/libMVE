package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/BeanPropertyMap.class */
public final class BeanPropertyMap implements Iterable<SettableBeanProperty>, Serializable {
    private static final long serialVersionUID = 1;
    private final Bucket[] _buckets;
    private final int _hashMask;
    private final int _size;
    private int _nextBucketIndex;

    public BeanPropertyMap(Collection<SettableBeanProperty> properties) {
        this._nextBucketIndex = 0;
        this._size = properties.size();
        int bucketCount = findSize(this._size);
        this._hashMask = bucketCount - 1;
        Bucket[] buckets = new Bucket[bucketCount];
        for (SettableBeanProperty property : properties) {
            String key = property.getName();
            int index = key.hashCode() & this._hashMask;
            Bucket bucket = buckets[index];
            int i = this._nextBucketIndex;
            this._nextBucketIndex = i + 1;
            buckets[index] = new Bucket(bucket, key, property, i);
        }
        this._buckets = buckets;
    }

    private BeanPropertyMap(Bucket[] buckets, int size, int index) {
        this._nextBucketIndex = 0;
        this._buckets = buckets;
        this._size = size;
        this._hashMask = buckets.length - 1;
        this._nextBucketIndex = index;
    }

    public BeanPropertyMap withProperty(SettableBeanProperty newProperty) {
        int bcount = this._buckets.length;
        Bucket[] newBuckets = new Bucket[bcount];
        System.arraycopy(this._buckets, 0, newBuckets, 0, bcount);
        String propName = newProperty.getName();
        SettableBeanProperty oldProp = find(newProperty.getName());
        if (oldProp == null) {
            int index = propName.hashCode() & this._hashMask;
            Bucket bucket = newBuckets[index];
            int i = this._nextBucketIndex;
            this._nextBucketIndex = i + 1;
            newBuckets[index] = new Bucket(bucket, propName, newProperty, i);
            return new BeanPropertyMap(newBuckets, this._size + 1, this._nextBucketIndex);
        }
        BeanPropertyMap newMap = new BeanPropertyMap(newBuckets, bcount, this._nextBucketIndex);
        newMap.replace(newProperty);
        return newMap;
    }

    public BeanPropertyMap renameAll(NameTransformer transformer) {
        JsonDeserializer<Object> newDeser;
        if (transformer == null || transformer == NameTransformer.NOP) {
            return this;
        }
        Iterator<SettableBeanProperty> it = iterator();
        ArrayList<SettableBeanProperty> newProps = new ArrayList<>();
        while (it.hasNext()) {
            SettableBeanProperty prop = it.next();
            String newName = transformer.transform(prop.getName());
            SettableBeanProperty prop2 = prop.withSimpleName(newName);
            JsonDeserializer<Object> deser = prop2.getValueDeserializer();
            if (deser != null && (newDeser = deser.unwrappingDeserializer(transformer)) != deser) {
                prop2 = prop2.withValueDeserializer(newDeser);
            }
            newProps.add(prop2);
        }
        return new BeanPropertyMap(newProps);
    }

    public BeanPropertyMap assignIndexes() {
        int index = 0;
        Bucket[] arr$ = this._buckets;
        for (Bucket bucket : arr$) {
            while (true) {
                Bucket bucket2 = bucket;
                if (bucket2 != null) {
                    int i = index;
                    index++;
                    bucket2.value.assignIndex(i);
                    bucket = bucket2.next;
                }
            }
        }
        return this;
    }

    private static final int findSize(int size) {
        int needed = size <= 32 ? size + size : size + (size >> 2);
        int i = 2;
        while (true) {
            int result = i;
            if (result < needed) {
                i = result + result;
            } else {
                return result;
            }
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Properties=[");
        int count = 0;
        SettableBeanProperty[] arr$ = getPropertiesInInsertionOrder();
        for (SettableBeanProperty prop : arr$) {
            if (prop != null) {
                int i = count;
                count++;
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(prop.getName());
                sb.append('(');
                sb.append(prop.getType());
                sb.append(')');
            }
        }
        sb.append(']');
        return sb.toString();
    }

    @Override // java.lang.Iterable
    public Iterator<SettableBeanProperty> iterator() {
        return new IteratorImpl(this._buckets);
    }

    public SettableBeanProperty[] getPropertiesInInsertionOrder() {
        int len = this._nextBucketIndex;
        SettableBeanProperty[] result = new SettableBeanProperty[len];
        Bucket[] arr$ = this._buckets;
        for (Bucket root : arr$) {
            Bucket bucket = root;
            while (true) {
                Bucket bucket2 = bucket;
                if (bucket2 != null) {
                    result[bucket2.index] = bucket2.value;
                    bucket = bucket2.next;
                }
            }
        }
        return result;
    }

    public int size() {
        return this._size;
    }

    public SettableBeanProperty find(String key) {
        if (key == null) {
            throw new IllegalArgumentException("Can not pass null property name");
        }
        int index = key.hashCode() & this._hashMask;
        Bucket bucket = this._buckets[index];
        if (bucket == null) {
            return null;
        }
        if (bucket.key == key) {
            return bucket.value;
        }
        do {
            Bucket bucket2 = bucket.next;
            bucket = bucket2;
            if (bucket2 == null) {
                return _findWithEquals(key, index);
            }
        } while (bucket.key != key);
        return bucket.value;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0033, code lost:
    
        r5 = r5 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.fasterxml.jackson.databind.deser.SettableBeanProperty find(int r4) {
        /*
            r3 = this;
            r0 = 0
            r5 = r0
            r0 = r3
            com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap$Bucket[] r0 = r0._buckets
            int r0 = r0.length
            r6 = r0
        L8:
            r0 = r5
            r1 = r6
            if (r0 >= r1) goto L39
            r0 = r3
            com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap$Bucket[] r0 = r0._buckets
            r1 = r5
            r0 = r0[r1]
            r7 = r0
        L15:
            r0 = r7
            if (r0 == 0) goto L33
            r0 = r7
            int r0 = r0.index
            r1 = r4
            if (r0 != r1) goto L29
            r0 = r7
            com.fasterxml.jackson.databind.deser.SettableBeanProperty r0 = r0.value
            return r0
        L29:
            r0 = r7
            com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap$Bucket r0 = r0.next
            r7 = r0
            goto L15
        L33:
            int r5 = r5 + 1
            goto L8
        L39:
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap.find(int):com.fasterxml.jackson.databind.deser.SettableBeanProperty");
    }

    public void replace(SettableBeanProperty property) {
        String name = property.getName();
        int index = name.hashCode() & (this._buckets.length - 1);
        Bucket tail = null;
        int foundIndex = -1;
        Bucket bucket = this._buckets[index];
        while (true) {
            Bucket bucket2 = bucket;
            if (bucket2 == null) {
                break;
            }
            if (foundIndex < 0 && bucket2.key.equals(name)) {
                foundIndex = bucket2.index;
            } else {
                tail = new Bucket(tail, bucket2.key, bucket2.value, bucket2.index);
            }
            bucket = bucket2.next;
        }
        if (foundIndex < 0) {
            throw new NoSuchElementException("No entry '" + property + "' found, can't replace");
        }
        this._buckets[index] = new Bucket(tail, name, property, foundIndex);
    }

    public void remove(SettableBeanProperty property) {
        String name = property.getName();
        int index = name.hashCode() & (this._buckets.length - 1);
        Bucket tail = null;
        boolean found = false;
        Bucket bucket = this._buckets[index];
        while (true) {
            Bucket bucket2 = bucket;
            if (bucket2 == null) {
                break;
            }
            if (!found && bucket2.key.equals(name)) {
                found = true;
            } else {
                tail = new Bucket(tail, bucket2.key, bucket2.value, bucket2.index);
            }
            bucket = bucket2.next;
        }
        if (!found) {
            throw new NoSuchElementException("No entry '" + property + "' found, can't remove");
        }
        this._buckets[index] = tail;
    }

    private SettableBeanProperty _findWithEquals(String key, int index) {
        Bucket bucket = this._buckets[index];
        while (true) {
            Bucket bucket2 = bucket;
            if (bucket2 != null) {
                if (key.equals(bucket2.key)) {
                    return bucket2.value;
                }
                bucket = bucket2.next;
            } else {
                return null;
            }
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket.class */
    private static final class Bucket implements Serializable {
        private static final long serialVersionUID = 1;
        public final Bucket next;
        public final String key;
        public final SettableBeanProperty value;
        public final int index;

        public Bucket(Bucket next, String key, SettableBeanProperty value, int index) {
            this.next = next;
            this.key = key;
            this.value = value;
            this.index = index;
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$IteratorImpl.class */
    private static final class IteratorImpl implements Iterator<SettableBeanProperty> {
        private final Bucket[] _buckets;
        private Bucket _currentBucket;
        private int _nextBucketIndex;

        public IteratorImpl(Bucket[] buckets) {
            this._buckets = buckets;
            int i = 0;
            int len = this._buckets.length;
            while (true) {
                if (i >= len) {
                    break;
                }
                int i2 = i;
                i++;
                Bucket b = this._buckets[i2];
                if (b != null) {
                    this._currentBucket = b;
                    break;
                }
            }
            this._nextBucketIndex = i;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this._currentBucket != null;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        public SettableBeanProperty next() {
            Bucket b;
            Bucket curr = this._currentBucket;
            if (curr == null) {
                throw new NoSuchElementException();
            }
            Bucket bucket = curr.next;
            while (true) {
                b = bucket;
                if (b != null || this._nextBucketIndex >= this._buckets.length) {
                    break;
                }
                Bucket[] bucketArr = this._buckets;
                int i = this._nextBucketIndex;
                this._nextBucketIndex = i + 1;
                bucket = bucketArr[i];
            }
            this._currentBucket = b;
            return curr.value;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }
}

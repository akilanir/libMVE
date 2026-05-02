package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/impl/BeanPropertyMap.class */
public class BeanPropertyMap implements Iterable<SettableBeanProperty>, Serializable {
    private static final long serialVersionUID = 2;
    protected final boolean _caseInsensitive;
    private int _hashMask;
    private int _size;
    private int _spillCount;
    private Object[] _hashArea;
    private SettableBeanProperty[] _propsInOrder;

    public BeanPropertyMap(boolean caseInsensitive, Collection<SettableBeanProperty> props) {
        this._caseInsensitive = caseInsensitive;
        this._propsInOrder = (SettableBeanProperty[]) props.toArray(new SettableBeanProperty[props.size()]);
        init(props);
    }

    protected void init(Collection<SettableBeanProperty> props) {
        this._size = props.size();
        int hashSize = findSize(this._size);
        this._hashMask = hashSize - 1;
        int alloc = (hashSize + (hashSize >> 1)) * 2;
        Object[] hashed = new Object[alloc];
        int spillCount = 0;
        for (SettableBeanProperty prop : props) {
            if (prop != null) {
                String key = getPropertyName(prop);
                int slot = _hashCode(key);
                int ix = slot << 1;
                if (hashed[ix] != null) {
                    ix = (hashSize + (slot >> 1)) << 1;
                    if (hashed[ix] != null) {
                        ix = ((hashSize + (hashSize >> 1)) << 1) + spillCount;
                        spillCount += 2;
                        if (ix >= hashed.length) {
                            hashed = Arrays.copyOf(hashed, hashed.length + 4);
                        }
                    }
                }
                hashed[ix] = key;
                hashed[ix + 1] = prop;
            }
        }
        this._hashArea = hashed;
        this._spillCount = spillCount;
    }

    private static final int findSize(int size) {
        if (size <= 5) {
            return 8;
        }
        if (size <= 12) {
            return 16;
        }
        int needed = size + (size >> 2);
        int i = 32;
        while (true) {
            int result = i;
            if (result < needed) {
                i = result + result;
            } else {
                return result;
            }
        }
    }

    public static BeanPropertyMap construct(Collection<SettableBeanProperty> props, boolean caseInsensitive) {
        return new BeanPropertyMap(caseInsensitive, props);
    }

    public BeanPropertyMap withProperty(SettableBeanProperty newProp) {
        String key = getPropertyName(newProp);
        int end = this._hashArea.length;
        for (int i = 1; i < end; i += 2) {
            SettableBeanProperty prop = (SettableBeanProperty) this._hashArea[i];
            if (prop != null && prop.getName().equals(key)) {
                this._hashArea[i] = newProp;
                this._propsInOrder[_findFromOrdered(prop)] = newProp;
                return this;
            }
        }
        int slot = _hashCode(key);
        int hashSize = this._hashMask + 1;
        int ix = slot << 1;
        if (this._hashArea[ix] != null) {
            ix = (hashSize + (slot >> 1)) << 1;
            if (this._hashArea[ix] != null) {
                ix = ((hashSize + (hashSize >> 1)) << 1) + this._spillCount;
                this._spillCount += 2;
                if (ix >= this._hashArea.length) {
                    this._hashArea = Arrays.copyOf(this._hashArea, this._hashArea.length + 4);
                }
            }
        }
        this._hashArea[ix] = key;
        this._hashArea[ix + 1] = newProp;
        int last = this._propsInOrder.length;
        this._propsInOrder = (SettableBeanProperty[]) Arrays.copyOf(this._propsInOrder, last + 1);
        this._propsInOrder[last] = newProp;
        return this;
    }

    public BeanPropertyMap assignIndexes() {
        int index = 0;
        int end = this._hashArea.length;
        for (int i = 1; i < end; i += 2) {
            SettableBeanProperty prop = (SettableBeanProperty) this._hashArea[i];
            if (prop != null) {
                int i2 = index;
                index++;
                prop.assignIndex(i2);
            }
        }
        return this;
    }

    public BeanPropertyMap renameAll(NameTransformer transformer) {
        if (transformer == null || transformer == NameTransformer.NOP) {
            return this;
        }
        int len = this._propsInOrder.length;
        ArrayList<SettableBeanProperty> newProps = new ArrayList<>(len);
        for (int i = 0; i < len; i++) {
            SettableBeanProperty prop = this._propsInOrder[i];
            if (prop == null) {
                newProps.add(prop);
            } else {
                newProps.add(_rename(prop, transformer));
            }
        }
        return new BeanPropertyMap(this._caseInsensitive, newProps);
    }

    public void replace(SettableBeanProperty newProp) {
        String key = getPropertyName(newProp);
        int end = this._hashArea.length;
        for (int i = 1; i < end; i += 2) {
            SettableBeanProperty prop = (SettableBeanProperty) this._hashArea[i];
            if (prop != null && prop.getName().equals(key)) {
                this._hashArea[i] = newProp;
                this._propsInOrder[_findFromOrdered(prop)] = newProp;
                return;
            }
        }
        throw new NoSuchElementException("No entry '" + newProp.getName() + "' found, can't replace");
    }

    private List<SettableBeanProperty> properties() {
        ArrayList<SettableBeanProperty> p = new ArrayList<>(this._size);
        int end = this._hashArea.length;
        for (int i = 1; i < end; i += 2) {
            SettableBeanProperty prop = (SettableBeanProperty) this._hashArea[i];
            if (prop != null) {
                p.add(prop);
            }
        }
        return p;
    }

    @Override // java.lang.Iterable
    public Iterator<SettableBeanProperty> iterator() {
        return properties().iterator();
    }

    public SettableBeanProperty[] getPropertiesInInsertionOrder() {
        return this._propsInOrder;
    }

    protected final String getPropertyName(SettableBeanProperty prop) {
        return this._caseInsensitive ? prop.getName().toLowerCase() : prop.getName();
    }

    public SettableBeanProperty find(int index) {
        int end = this._hashArea.length;
        for (int i = 1; i < end; i += 2) {
            SettableBeanProperty prop = (SettableBeanProperty) this._hashArea[i];
            if (prop != null && index == prop.getPropertyIndex()) {
                return prop;
            }
        }
        return null;
    }

    public SettableBeanProperty find(String key) {
        if (key == null) {
            throw new IllegalArgumentException("Can not pass null property name");
        }
        if (this._caseInsensitive) {
            key = key.toLowerCase();
        }
        int slot = key.hashCode() & this._hashMask;
        int ix = slot << 1;
        Object match = this._hashArea[ix];
        if (match == key || key.equals(match)) {
            return (SettableBeanProperty) this._hashArea[ix + 1];
        }
        return _find2(key, slot, match);
    }

    private final SettableBeanProperty _find2(String key, int slot, Object match) {
        if (match == null) {
            return null;
        }
        int hashSize = this._hashMask + 1;
        int ix = (hashSize + (slot >> 1)) << 1;
        Object match2 = this._hashArea[ix];
        if (key.equals(match2)) {
            return (SettableBeanProperty) this._hashArea[ix + 1];
        }
        if (match2 != null) {
            int i = (hashSize + (hashSize >> 1)) << 1;
            int end = i + this._spillCount;
            while (i < end) {
                Object match3 = this._hashArea[i];
                if (match3 != key && !key.equals(match3)) {
                    i += 2;
                } else {
                    return (SettableBeanProperty) this._hashArea[i + 1];
                }
            }
            return null;
        }
        return null;
    }

    public int size() {
        return this._size;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x005e A[PHI: r9
      0x005e: PHI (r9v3 'found' boolean) = (r9v1 'found' boolean), (r9v4 'found' boolean) binds: [B:9:0x003c, B:11:0x004c] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void remove(com.fasterxml.jackson.databind.deser.SettableBeanProperty r6) {
        /*
            r5 = this;
            java.util.ArrayList r0 = new java.util.ArrayList
            r1 = r0
            r2 = r5
            int r2 = r2._size
            r1.<init>(r2)
            r7 = r0
            r0 = r5
            r1 = r6
            java.lang.String r0 = r0.getPropertyName(r1)
            r8 = r0
            r0 = 0
            r9 = r0
            r0 = 1
            r10 = r0
            r0 = r5
            java.lang.Object[] r0 = r0._hashArea
            int r0 = r0.length
            r11 = r0
        L1f:
            r0 = r10
            r1 = r11
            if (r0 >= r1) goto L6b
            r0 = r5
            java.lang.Object[] r0 = r0._hashArea
            r1 = r10
            r0 = r0[r1]
            com.fasterxml.jackson.databind.deser.SettableBeanProperty r0 = (com.fasterxml.jackson.databind.deser.SettableBeanProperty) r0
            r12 = r0
            r0 = r12
            if (r0 != 0) goto L3a
            goto L65
        L3a:
            r0 = r9
            if (r0 != 0) goto L5e
            r0 = r8
            r1 = r12
            java.lang.String r1 = r1.getName()
            boolean r0 = r0.equals(r1)
            r9 = r0
            r0 = r9
            if (r0 == 0) goto L5e
            r0 = r5
            com.fasterxml.jackson.databind.deser.SettableBeanProperty[] r0 = r0._propsInOrder
            r1 = r5
            r2 = r12
            int r1 = r1._findFromOrdered(r2)
            r2 = 0
            r0[r1] = r2
            goto L65
        L5e:
            r0 = r7
            r1 = r12
            boolean r0 = r0.add(r1)
        L65:
            int r10 = r10 + 2
            goto L1f
        L6b:
            r0 = r9
            if (r0 != 0) goto L93
            java.util.NoSuchElementException r0 = new java.util.NoSuchElementException
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r3 = r2
            r3.<init>()
            java.lang.String r3 = "No entry '"
            java.lang.StringBuilder r2 = r2.append(r3)
            r3 = r6
            java.lang.String r3 = r3.getName()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r3 = "' found, can't remove"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            r1.<init>(r2)
            throw r0
        L93:
            r0 = r5
            r1 = r7
            r0.init(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap.remove(com.fasterxml.jackson.databind.deser.SettableBeanProperty):void");
    }

    public boolean findDeserializeAndSet(JsonParser p, DeserializationContext ctxt, Object bean, String key) throws IOException {
        SettableBeanProperty prop = find(key);
        if (prop == null) {
            return false;
        }
        try {
            prop.deserializeAndSet(p, ctxt, bean);
            return true;
        } catch (Exception e) {
            wrapAndThrow(e, bean, key, ctxt);
            return true;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Properties=[");
        int count = 0;
        Iterator<SettableBeanProperty> it = iterator();
        while (it.hasNext()) {
            SettableBeanProperty prop = it.next();
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
        sb.append(']');
        return sb.toString();
    }

    protected SettableBeanProperty _rename(SettableBeanProperty prop, NameTransformer xf) {
        JsonDeserializer<Object> newDeser;
        if (prop == null) {
            return prop;
        }
        String newName = xf.transform(prop.getName());
        SettableBeanProperty prop2 = prop.withSimpleName(newName);
        JsonDeserializer<Object> deser = prop2.getValueDeserializer();
        if (deser != null && (newDeser = deser.unwrappingDeserializer(xf)) != deser) {
            prop2 = prop2.withValueDeserializer(newDeser);
        }
        return prop2;
    }

    protected void wrapAndThrow(Throwable t, Object bean, String fieldName, DeserializationContext ctxt) throws IOException {
        while ((t instanceof InvocationTargetException) && t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        boolean wrap = ctxt == null || ctxt.isEnabled(DeserializationFeature.WRAP_EXCEPTIONS);
        if (t instanceof IOException) {
            if (!wrap || !(t instanceof JsonProcessingException)) {
                throw ((IOException) t);
            }
        } else if (!wrap && (t instanceof RuntimeException)) {
            throw ((RuntimeException) t);
        }
        throw JsonMappingException.wrapWithPath(t, bean, fieldName);
    }

    private int _findFromOrdered(SettableBeanProperty prop) {
        int end = this._propsInOrder.length;
        for (int i = 0; i < end; i++) {
            if (this._propsInOrder[i] == prop) {
                return i;
            }
        }
        throw new IllegalStateException("Illegal state: property '" + prop.getName() + "' missing from _propsInOrder");
    }

    private final int _hashCode(String key) {
        return key.hashCode() & this._hashMask;
    }
}

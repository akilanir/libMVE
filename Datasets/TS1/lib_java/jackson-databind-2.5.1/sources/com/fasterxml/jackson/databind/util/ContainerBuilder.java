package com.fasterxml.jackson.databind.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/util/ContainerBuilder.class */
public final class ContainerBuilder {
    private static final int MAX_BUF = 1000;
    private Object[] b;
    private int tail;
    private int start;
    private List<Object> list;
    private Map<String, Object> map;

    public ContainerBuilder(int bufSize) {
        this.b = new Object[bufSize & (-2)];
    }

    public boolean canReuse() {
        return this.list == null && this.map == null;
    }

    public int bufferLength() {
        return this.b.length;
    }

    public int start() {
        if (this.list != null || this.map != null) {
            throw new IllegalStateException();
        }
        int prevStart = this.start;
        this.start = this.tail;
        return prevStart;
    }

    public int startList(Object value) {
        if (this.list != null || this.map != null) {
            throw new IllegalStateException();
        }
        int prevStart = this.start;
        this.start = this.tail;
        add(value);
        return prevStart;
    }

    public int startMap(String key, Object value) {
        if (this.list != null || this.map != null) {
            throw new IllegalStateException();
        }
        int prevStart = this.start;
        this.start = this.tail;
        put(key, value);
        return prevStart;
    }

    public void add(Object value) {
        if (this.list != null) {
            this.list.add(value);
            return;
        }
        if (this.tail >= this.b.length) {
            _expandList(value);
            return;
        }
        Object[] objArr = this.b;
        int i = this.tail;
        this.tail = i + 1;
        objArr[i] = value;
    }

    public void put(String key, Object value) {
        if (this.map != null) {
            this.map.put(key, value);
            return;
        }
        if (this.tail + 2 > this.b.length) {
            _expandMap(key, value);
            return;
        }
        Object[] objArr = this.b;
        int i = this.tail;
        this.tail = i + 1;
        objArr[i] = key;
        Object[] objArr2 = this.b;
        int i2 = this.tail;
        this.tail = i2 + 1;
        objArr2[i2] = value;
    }

    public List<Object> finishList(int prevStart) {
        List<Object> l = this.list;
        if (l == null) {
            l = _buildList(true);
        } else {
            this.list = null;
        }
        this.start = prevStart;
        return l;
    }

    public Object[] finishArray(int prevStart) {
        Object[] result;
        if (this.list == null) {
            result = Arrays.copyOfRange(this.b, this.start, this.tail);
        } else {
            result = this.list.toArray(new Object[this.tail - this.start]);
            this.list = null;
        }
        this.start = prevStart;
        return result;
    }

    public <T> Object[] finishArray(int prevStart, Class<T> elemType) {
        int size = this.tail - this.start;
        Object[] objArr = (Object[]) Array.newInstance((Class<?>) elemType, size);
        if (this.list == null) {
            System.arraycopy(this.b, this.start, objArr, 0, size);
        } else {
            objArr = this.list.toArray(objArr);
            this.list = null;
        }
        this.start = prevStart;
        return objArr;
    }

    public Map<String, Object> finishMap(int prevStart) {
        Map<String, Object> m = this.map;
        if (m == null) {
            m = _buildMap(true);
        } else {
            this.map = null;
        }
        this.start = prevStart;
        return m;
    }

    private void _expandList(Object value) {
        if (this.b.length < MAX_BUF) {
            this.b = Arrays.copyOf(this.b, this.b.length << 1);
            Object[] objArr = this.b;
            int i = this.tail;
            this.tail = i + 1;
            objArr[i] = value;
            return;
        }
        this.list = _buildList(false);
        this.list.add(value);
    }

    private List<Object> _buildList(boolean isComplete) {
        int currLen = this.tail - this.start;
        if (isComplete) {
            if (currLen < 2) {
                currLen = 2;
            }
        } else if (currLen < 20) {
            currLen = 20;
        } else if (currLen < MAX_BUF) {
            currLen += currLen >> 1;
        } else {
            currLen += currLen >> 2;
        }
        List<Object> l = new ArrayList<>(currLen);
        for (int i = this.start; i < this.tail; i++) {
            l.add(this.b[i]);
        }
        this.tail = this.start;
        return l;
    }

    private void _expandMap(String key, Object value) {
        if (this.b.length < MAX_BUF) {
            this.b = Arrays.copyOf(this.b, this.b.length << 1);
            Object[] objArr = this.b;
            int i = this.tail;
            this.tail = i + 1;
            objArr[i] = key;
            Object[] objArr2 = this.b;
            int i2 = this.tail;
            this.tail = i2 + 1;
            objArr2[i2] = value;
            return;
        }
        this.map = _buildMap(false);
        this.map.put(key, value);
    }

    private Map<String, Object> _buildMap(boolean isComplete) {
        int size;
        int size2 = (this.tail - this.start) >> 1;
        if (isComplete) {
            if (size2 <= 3) {
                size = 4;
            } else if (size2 <= 40) {
                size = size2 + (size2 >> 1);
            } else {
                size = size2 + (size2 >> 2) + (size2 >> 4);
            }
        } else if (size2 < 10) {
            size = 16;
        } else if (size2 < MAX_BUF) {
            size = size2 + (size2 >> 1);
        } else {
            size = size2 + (size2 / 3);
        }
        Map<String, Object> m = new LinkedHashMap<>(size, 0.8f);
        for (int i = this.start; i < this.tail; i += 2) {
            m.put((String) this.b[i], this.b[i + 1]);
        }
        this.tail = this.start;
        return m;
    }
}

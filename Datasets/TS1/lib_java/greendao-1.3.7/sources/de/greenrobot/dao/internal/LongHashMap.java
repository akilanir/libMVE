package de.greenrobot.dao.internal;

import de.greenrobot.dao.DaoLog;
import java.util.Arrays;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/internal/LongHashMap.class */
public final class LongHashMap<T> {
    private Entry<T>[] table;
    private int capacity;
    private int threshold;
    private int size;

    /* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/internal/LongHashMap$Entry.class */
    static final class Entry<T> {
        final long key;
        T value;
        Entry<T> next;

        Entry(long key, T value, Entry<T> next) {
            this.key = key;
            this.value = value;
            this.next = next;
        }
    }

    public LongHashMap() {
        this(16);
    }

    public LongHashMap(int capacity) {
        this.capacity = capacity;
        this.threshold = (capacity * 4) / 3;
        this.table = new Entry[capacity];
    }

    public boolean containsKey(long key) {
        int index = ((((int) (key >>> 32)) ^ ((int) key)) & Integer.MAX_VALUE) % this.capacity;
        Entry<T> entry = this.table[index];
        while (true) {
            Entry<T> entry2 = entry;
            if (entry2 == null) {
                return false;
            }
            if (entry2.key != key) {
                entry = entry2.next;
            } else {
                return true;
            }
        }
    }

    public T get(long key) {
        int index = ((((int) (key >>> 32)) ^ ((int) key)) & Integer.MAX_VALUE) % this.capacity;
        Entry<T> entry = this.table[index];
        while (true) {
            Entry<T> entry2 = entry;
            if (entry2 == null) {
                return null;
            }
            if (entry2.key != key) {
                entry = entry2.next;
            } else {
                return entry2.value;
            }
        }
    }

    public T put(long key, T value) {
        int index = ((((int) (key >>> 32)) ^ ((int) key)) & Integer.MAX_VALUE) % this.capacity;
        Entry<T> entryOriginal = this.table[index];
        Entry<T> entry = entryOriginal;
        while (true) {
            Entry<T> entry2 = entry;
            if (entry2 == null) {
                this.table[index] = new Entry<>(key, value, entryOriginal);
                this.size++;
                if (this.size > this.threshold) {
                    setCapacity(2 * this.capacity);
                    return null;
                }
                return null;
            }
            if (entry2.key != key) {
                entry = entry2.next;
            } else {
                T oldValue = entry2.value;
                entry2.value = value;
                return oldValue;
            }
        }
    }

    public T remove(long key) {
        int index = ((((int) (key >>> 32)) ^ ((int) key)) & Integer.MAX_VALUE) % this.capacity;
        Entry<T> previous = null;
        Entry<T> entry = this.table[index];
        while (true) {
            Entry<T> entry2 = entry;
            if (entry2 != null) {
                Entry<T> next = entry2.next;
                if (entry2.key == key) {
                    if (previous == null) {
                        this.table[index] = next;
                    } else {
                        previous.next = next;
                    }
                    this.size--;
                    return entry2.value;
                }
                previous = entry2;
                entry = next;
            } else {
                return null;
            }
        }
    }

    public void clear() {
        this.size = 0;
        Arrays.fill(this.table, (Object) null);
    }

    public int size() {
        return this.size;
    }

    public void setCapacity(int newCapacity) {
        Entry<T>[] newTable = new Entry[newCapacity];
        int length = this.table.length;
        for (int i = 0; i < length; i++) {
            Entry<T> entry = this.table[i];
            while (true) {
                Entry<T> entry2 = entry;
                if (entry2 != null) {
                    long key = entry2.key;
                    int index = ((((int) (key >>> 32)) ^ ((int) key)) & Integer.MAX_VALUE) % newCapacity;
                    Entry<T> originalNext = entry2.next;
                    entry2.next = newTable[index];
                    newTable[index] = entry2;
                    entry = originalNext;
                }
            }
        }
        this.table = newTable;
        this.capacity = newCapacity;
        this.threshold = (newCapacity * 4) / 3;
    }

    public void reserveRoom(int entryCount) {
        setCapacity((entryCount * 5) / 3);
    }

    public void logStats() {
        int collisions = 0;
        Entry<T>[] arr$ = this.table;
        for (Entry<T> entry : arr$) {
            while (true) {
                Entry<T> entry2 = entry;
                if (entry2 == null || entry2.next == null) {
                    break;
                }
                collisions++;
                entry = entry2.next;
            }
        }
        DaoLog.d("load: " + (this.size / this.capacity) + ", size: " + this.size + ", capa: " + this.capacity + ", collisions: " + collisions + ", collision ratio: " + (collisions / this.size));
    }
}

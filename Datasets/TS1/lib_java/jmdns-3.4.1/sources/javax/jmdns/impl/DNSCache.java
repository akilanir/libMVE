package javax.jmdns.impl;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSCache.class */
public class DNSCache extends AbstractMap<String, List<? extends DNSEntry>> {
    private transient Set<Map.Entry<String, List<? extends DNSEntry>>> _entrySet;
    public static final DNSCache EmptyCache = new _EmptyCache();

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSCache$_EmptyCache.class */
    static final class _EmptyCache extends DNSCache {
        _EmptyCache() {
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
        public List<DNSEntry> get(Object key) {
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set<String> keySet() {
            return Collections.emptySet();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Collection<List<? extends DNSEntry>> values() {
            return Collections.emptySet();
        }

        @Override // javax.jmdns.impl.DNSCache, java.util.AbstractMap, java.util.Map
        public Set<Map.Entry<String, List<? extends DNSEntry>>> entrySet() {
            return Collections.emptySet();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean equals(Object o) {
            return (o instanceof Map) && ((Map) o).size() == 0;
        }

        @Override // javax.jmdns.impl.DNSCache, java.util.AbstractMap, java.util.Map
        public List<? extends DNSEntry> put(String key, List<? extends DNSEntry> value) {
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public int hashCode() {
            return 0;
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSCache$_CacheEntry.class */
    protected static class _CacheEntry implements Map.Entry<String, List<? extends DNSEntry>> {
        private List<? extends DNSEntry> _value;
        private String _key;

        protected _CacheEntry(String key, List<? extends DNSEntry> value) {
            this._key = key != null ? key.trim().toLowerCase() : null;
            this._value = value;
        }

        protected _CacheEntry(Map.Entry<String, List<? extends DNSEntry>> entry) {
            if (entry instanceof _CacheEntry) {
                this._key = ((_CacheEntry) entry).getKey();
                this._value = ((_CacheEntry) entry).getValue();
            }
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Map.Entry
        public String getKey() {
            return this._key != null ? this._key : "";
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Map.Entry
        public List<? extends DNSEntry> getValue() {
            return this._value;
        }

        @Override // java.util.Map.Entry
        public List<? extends DNSEntry> setValue(List<? extends DNSEntry> value) {
            List<? extends DNSEntry> oldValue = this._value;
            this._value = value;
            return oldValue;
        }

        public boolean isEmpty() {
            return getValue().isEmpty();
        }

        @Override // java.util.Map.Entry
        public boolean equals(Object entry) {
            return (entry instanceof Map.Entry) && getKey().equals(((Map.Entry) entry).getKey()) && getValue().equals(((Map.Entry) entry).getValue());
        }

        @Override // java.util.Map.Entry
        public int hashCode() {
            if (this._key == null) {
                return 0;
            }
            return this._key.hashCode();
        }

        public synchronized String toString() {
            StringBuffer aLog = new StringBuffer(200);
            aLog.append("\n\t\tname '");
            aLog.append(this._key);
            aLog.append("' ");
            if (this._value != null && !this._value.isEmpty()) {
                for (DNSEntry entry : this._value) {
                    aLog.append("\n\t\t\t");
                    aLog.append(entry.toString());
                }
            } else {
                aLog.append(" no entries");
            }
            return aLog.toString();
        }
    }

    public DNSCache() {
        this(DNSConstants.FLAGS_AA);
    }

    public DNSCache(DNSCache map) {
        this(map != null ? map.size() : DNSConstants.FLAGS_AA);
        if (map != null) {
            putAll(map);
        }
    }

    public DNSCache(int initialCapacity) {
        this._entrySet = null;
        this._entrySet = new HashSet(initialCapacity);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set<Map.Entry<String, List<? extends DNSEntry>>> entrySet() {
        if (this._entrySet == null) {
            this._entrySet = new HashSet();
        }
        return this._entrySet;
    }

    protected Map.Entry<String, List<? extends DNSEntry>> getEntry(String key) {
        String stringKey = key != null ? key.trim().toLowerCase() : null;
        for (Map.Entry<String, List<? extends DNSEntry>> entry : entrySet()) {
            if (stringKey != null) {
                if (stringKey.equals(entry.getKey())) {
                    return entry;
                }
            } else if (entry.getKey() == null) {
                return entry;
            }
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public List<? extends DNSEntry> put(String key, List<? extends DNSEntry> value) {
        List<? extends DNSEntry> list;
        synchronized (this) {
            List<? extends DNSEntry> oldValue = null;
            Map.Entry<String, List<? extends DNSEntry>> oldEntry = getEntry(key);
            if (oldEntry != null) {
                oldValue = oldEntry.setValue(value);
            } else {
                entrySet().add(new _CacheEntry(key, value));
            }
            list = oldValue;
        }
        return list;
    }

    @Override // java.util.AbstractMap
    protected Object clone() throws CloneNotSupportedException {
        return new DNSCache(this);
    }

    public synchronized Collection<DNSEntry> allValues() {
        List<DNSEntry> allValues = new ArrayList<>();
        for (List<? extends DNSEntry> entry : values()) {
            if (entry != null) {
                allValues.addAll(entry);
            }
        }
        return allValues;
    }

    public synchronized Collection<? extends DNSEntry> getDNSEntryList(String name) {
        Collection<? extends DNSEntry> entryList;
        Collection<? extends DNSEntry> entryList2 = _getDNSEntryList(name);
        if (entryList2 != null) {
            entryList = new ArrayList<>(entryList2);
        } else {
            entryList = Collections.emptyList();
        }
        return entryList;
    }

    private Collection<? extends DNSEntry> _getDNSEntryList(String name) {
        return get(name != null ? name.toLowerCase() : null);
    }

    public synchronized DNSEntry getDNSEntry(DNSEntry dnsEntry) {
        Collection<? extends DNSEntry> entryList;
        DNSEntry result = null;
        if (dnsEntry != null && (entryList = _getDNSEntryList(dnsEntry.getKey())) != null) {
            Iterator i$ = entryList.iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                DNSEntry testDNSEntry = i$.next();
                if (testDNSEntry.isSameEntry(dnsEntry)) {
                    result = testDNSEntry;
                    break;
                }
            }
        }
        return result;
    }

    public synchronized DNSEntry getDNSEntry(String name, DNSRecordType type, DNSRecordClass recordClass) {
        DNSEntry result = null;
        Collection<? extends DNSEntry> entryList = _getDNSEntryList(name);
        if (entryList != null) {
            for (DNSEntry testDNSEntry : entryList) {
                if (testDNSEntry.getRecordType().equals(type) && (DNSRecordClass.CLASS_ANY == recordClass || testDNSEntry.getRecordClass().equals(recordClass))) {
                    result = testDNSEntry;
                    break;
                }
            }
        }
        return result;
    }

    public synchronized Collection<? extends DNSEntry> getDNSEntryList(String name, DNSRecordType type, DNSRecordClass recordClass) {
        Collection<? extends DNSEntry> entryList;
        Collection<? extends DNSEntry> entryList2 = _getDNSEntryList(name);
        if (entryList2 != null) {
            entryList = new ArrayList<>(entryList2);
            Iterator<? extends DNSEntry> i = entryList.iterator();
            while (i.hasNext()) {
                DNSEntry testDNSEntry = (DNSEntry) i.next();
                if (!testDNSEntry.getRecordType().equals(type) || (DNSRecordClass.CLASS_ANY != recordClass && !testDNSEntry.getRecordClass().equals(recordClass))) {
                    i.remove();
                }
            }
        } else {
            entryList = Collections.emptyList();
        }
        return entryList;
    }

    public synchronized boolean addDNSEntry(DNSEntry dnsEntry) {
        List<DNSEntry> aNewValue;
        boolean result = false;
        if (dnsEntry != null) {
            Map.Entry<String, List<? extends DNSEntry>> oldEntry = getEntry(dnsEntry.getKey());
            if (oldEntry != null) {
                aNewValue = new ArrayList<>(oldEntry.getValue());
            } else {
                aNewValue = new ArrayList<>();
            }
            aNewValue.add(dnsEntry);
            if (oldEntry != null) {
                oldEntry.setValue(aNewValue);
            } else {
                entrySet().add(new _CacheEntry(dnsEntry.getKey(), aNewValue));
            }
            result = true;
        }
        return result;
    }

    public synchronized boolean removeDNSEntry(DNSEntry dnsEntry) {
        Map.Entry<String, List<? extends DNSEntry>> existingEntry;
        boolean result = false;
        if (dnsEntry != null && (existingEntry = getEntry(dnsEntry.getKey())) != null) {
            result = existingEntry.getValue().remove(dnsEntry);
            if (existingEntry.getValue().isEmpty()) {
                entrySet().remove(existingEntry);
            }
        }
        return result;
    }

    public synchronized boolean replaceDNSEntry(DNSEntry newDNSEntry, DNSEntry existingDNSEntry) {
        List<DNSEntry> aNewValue;
        boolean result = false;
        if (newDNSEntry != null && existingDNSEntry != null && newDNSEntry.getKey().equals(existingDNSEntry.getKey())) {
            Map.Entry<String, List<? extends DNSEntry>> oldEntry = getEntry(newDNSEntry.getKey());
            if (oldEntry != null) {
                aNewValue = new ArrayList<>(oldEntry.getValue());
            } else {
                aNewValue = new ArrayList<>();
            }
            aNewValue.remove(existingDNSEntry);
            aNewValue.add(newDNSEntry);
            if (oldEntry != null) {
                oldEntry.setValue(aNewValue);
            } else {
                entrySet().add(new _CacheEntry(newDNSEntry.getKey(), aNewValue));
            }
            result = true;
        }
        return result;
    }

    @Override // java.util.AbstractMap
    public synchronized String toString() {
        StringBuffer aLog = new StringBuffer(2000);
        aLog.append("\t---- cache ----");
        for (Map.Entry<String, List<? extends DNSEntry>> entry : entrySet()) {
            aLog.append("\n\t\t");
            aLog.append(entry.toString());
        }
        return aLog.toString();
    }
}

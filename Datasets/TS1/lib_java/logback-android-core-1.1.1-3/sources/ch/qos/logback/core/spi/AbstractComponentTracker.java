package ch.qos.logback.core.spi;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/AbstractComponentTracker.class */
public abstract class AbstractComponentTracker<C> implements ComponentTracker<C> {
    private static final boolean ACCESS_ORDERED = true;
    public static final long LINGERING_TIMEOUT = 10000;
    public static final long WAIT_BETWEEN_SUCCESSIVE_REMOVAL_ITERATIONS = 1000;
    protected int maxComponents = ComponentTracker.DEFAULT_MAX_COMPONENTS;
    protected long timeout = 1800000;
    LinkedHashMap<String, Entry<C>> liveMap = new LinkedHashMap<>(32, 0.75f, true);
    LinkedHashMap<String, Entry<C>> lingerersMap = new LinkedHashMap<>(16, 0.75f, true);
    long lastCheck = 0;
    private RemovalPredicator<C> byExcedent = new RemovalPredicator<C>() { // from class: ch.qos.logback.core.spi.AbstractComponentTracker.1
        @Override // ch.qos.logback.core.spi.AbstractComponentTracker.RemovalPredicator
        public boolean isSlatedForRemoval(Entry<C> entry, long j) {
            return AbstractComponentTracker.this.liveMap.size() > AbstractComponentTracker.this.maxComponents;
        }
    };
    private RemovalPredicator<C> byTimeout = new RemovalPredicator<C>() { // from class: ch.qos.logback.core.spi.AbstractComponentTracker.2
        @Override // ch.qos.logback.core.spi.AbstractComponentTracker.RemovalPredicator
        public boolean isSlatedForRemoval(Entry<C> entry, long j) {
            return AbstractComponentTracker.this.isEntryStale(entry, j);
        }
    };
    private RemovalPredicator<C> byLingering = new RemovalPredicator<C>() { // from class: ch.qos.logback.core.spi.AbstractComponentTracker.3
        @Override // ch.qos.logback.core.spi.AbstractComponentTracker.RemovalPredicator
        public boolean isSlatedForRemoval(Entry<C> entry, long j) {
            return AbstractComponentTracker.this.isEntryDoneLingering(entry, j);
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/AbstractComponentTracker$Entry.class */
    static class Entry<C> {
        String key;
        C component;
        long timestamp;

        Entry(String str, C c, long j) {
            this.key = str;
            this.component = c;
            this.timestamp = j;
        }

        public void setTimestamp(long j) {
            this.timestamp = j;
        }

        public int hashCode() {
            return this.key.hashCode();
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            Entry entry = (Entry) obj;
            if (this.key == null) {
                if (entry.key != null) {
                    return false;
                }
            } else if (!this.key.equals(entry.key)) {
                return false;
            }
            return this.component == null ? entry.component == null : this.component.equals(entry.component);
        }

        public String toString() {
            return "(" + this.key + ", " + this.component + ")";
        }
    }

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator.class */
    private interface RemovalPredicator<C> {
        boolean isSlatedForRemoval(Entry<C> entry, long j);
    }

    protected abstract void processPriorToRemoval(C c);

    protected abstract C buildComponent(String str);

    protected abstract boolean isComponentStale(C c);

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public int getComponentCount() {
        return this.liveMap.size() + this.lingerersMap.size();
    }

    private Entry<C> getFromEitherMap(String str) {
        Entry<C> entry = this.liveMap.get(str);
        return entry != null ? entry : this.lingerersMap.get(str);
    }

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public synchronized C find(String str) {
        Entry<C> fromEitherMap = getFromEitherMap(str);
        if (fromEitherMap == null) {
            return null;
        }
        return fromEitherMap.component;
    }

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public synchronized C getOrCreate(String str, long j) {
        Entry<C> fromEitherMap = getFromEitherMap(str);
        if (fromEitherMap == null) {
            fromEitherMap = new Entry<>(str, buildComponent(str), j);
            this.liveMap.put(str, fromEitherMap);
        } else {
            fromEitherMap.setTimestamp(j);
        }
        return fromEitherMap.component;
    }

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public void endOfLife(String str) {
        Entry<C> remove = this.liveMap.remove(str);
        if (remove == null) {
            return;
        }
        this.lingerersMap.put(str, remove);
    }

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public synchronized void removeStaleComponents(long j) {
        if (isTooSoonForRemovalIteration(j)) {
            return;
        }
        removeExcedentComponents();
        removeStaleComponentsFromMainMap(j);
        removeStaleComponentsFromLingerersMap(j);
    }

    private void removeExcedentComponents() {
        genericStaleComponentRemover(this.liveMap, 0L, this.byExcedent);
    }

    private void removeStaleComponentsFromMainMap(long j) {
        genericStaleComponentRemover(this.liveMap, j, this.byTimeout);
    }

    private void removeStaleComponentsFromLingerersMap(long j) {
        genericStaleComponentRemover(this.lingerersMap, j, this.byLingering);
    }

    private void genericStaleComponentRemover(LinkedHashMap<String, Entry<C>> linkedHashMap, long j, RemovalPredicator<C> removalPredicator) {
        Iterator<Map.Entry<String, Entry<C>>> it = linkedHashMap.entrySet().iterator();
        while (it.hasNext()) {
            Entry<C> value = it.next().getValue();
            if (!removalPredicator.isSlatedForRemoval(value, j)) {
                return;
            }
            it.remove();
            processPriorToRemoval(value.component);
        }
    }

    private boolean isTooSoonForRemovalIteration(long j) {
        if (this.lastCheck + 1000 > j) {
            return true;
        }
        this.lastCheck = j;
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isEntryStale(Entry<C> entry, long j) {
        return isComponentStale(entry.component) || entry.timestamp + this.timeout < j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isEntryDoneLingering(Entry entry, long j) {
        return entry.timestamp + LINGERING_TIMEOUT < j;
    }

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public Set<String> allKeys() {
        HashSet hashSet = new HashSet(this.liveMap.keySet());
        hashSet.addAll(this.lingerersMap.keySet());
        return hashSet;
    }

    @Override // ch.qos.logback.core.spi.ComponentTracker
    public Collection<C> allComponents() {
        ArrayList arrayList = new ArrayList();
        Iterator<Entry<C>> it = this.liveMap.values().iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().component);
        }
        Iterator<Entry<C>> it2 = this.lingerersMap.values().iterator();
        while (it2.hasNext()) {
            arrayList.add(it2.next().component);
        }
        return arrayList;
    }

    public long getTimeout() {
        return this.timeout;
    }

    public void setTimeout(long j) {
        this.timeout = j;
    }

    public int getMaxComponents() {
        return this.maxComponents;
    }

    public void setMaxComponents(int i) {
        this.maxComponents = i;
    }
}

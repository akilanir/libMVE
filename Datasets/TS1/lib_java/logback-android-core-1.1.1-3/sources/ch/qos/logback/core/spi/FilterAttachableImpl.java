package ch.qos.logback.core.spi;

import ch.qos.logback.core.filter.Filter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/FilterAttachableImpl.class */
public final class FilterAttachableImpl<E> implements FilterAttachable<E> {
    CopyOnWriteArrayList<Filter<E>> filterList = new CopyOnWriteArrayList<>();

    @Override // ch.qos.logback.core.spi.FilterAttachable
    public void addFilter(Filter<E> filter) {
        this.filterList.add(filter);
    }

    @Override // ch.qos.logback.core.spi.FilterAttachable
    public void clearAllFilters() {
        this.filterList.clear();
    }

    @Override // ch.qos.logback.core.spi.FilterAttachable
    public FilterReply getFilterChainDecision(E e) {
        Iterator<Filter<E>> it = this.filterList.iterator();
        while (it.hasNext()) {
            FilterReply decide = it.next().decide(e);
            if (decide == FilterReply.DENY || decide == FilterReply.ACCEPT) {
                return decide;
            }
        }
        return FilterReply.NEUTRAL;
    }

    @Override // ch.qos.logback.core.spi.FilterAttachable
    public List<Filter<E>> getCopyOfAttachedFiltersList() {
        return new ArrayList(this.filterList);
    }
}

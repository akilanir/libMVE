package org.simpleframework.xml.strategy;

import org.simpleframework.xml.util.WeakCache;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/strategy/WriteState.class */
class WriteState extends WeakCache<WriteGraph> {
    private Contract contract;

    public WriteState(Contract contract) {
        this.contract = contract;
    }

    public WriteGraph find(Object map) {
        WriteGraph write = fetch(map);
        if (write == null) {
            write = new WriteGraph(this.contract);
            cache(map, write);
        }
        return write;
    }
}

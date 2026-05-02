package org.simpleframework.xml.strategy;

import org.simpleframework.xml.util.WeakCache;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/strategy/ReadState.class */
class ReadState extends WeakCache<ReadGraph> {
    private final Contract contract;
    private final Loader loader = new Loader();

    public ReadState(Contract contract) {
        this.contract = contract;
    }

    public ReadGraph find(Object map) throws Exception {
        ReadGraph read = fetch(map);
        if (read != null) {
            return read;
        }
        return create(map);
    }

    private ReadGraph create(Object map) throws Exception {
        ReadGraph read = fetch(map);
        if (read == null) {
            read = new ReadGraph(this.contract, this.loader);
            cache(map, read);
        }
        return read;
    }
}

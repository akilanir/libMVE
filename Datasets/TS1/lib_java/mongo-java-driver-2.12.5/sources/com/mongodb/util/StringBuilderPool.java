package com.mongodb.util;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/StringBuilderPool.class */
public class StringBuilderPool extends SimplePool<StringBuilder> {
    public StringBuilderPool(String name, int maxToKeep) {
        super("StringBuilderPool-" + name, maxToKeep);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mongodb.util.SimplePool
    public StringBuilder createNew() {
        return new StringBuilder();
    }

    public boolean ok(StringBuilder buf) {
        if (buf.length() > getMaxSize()) {
            return false;
        }
        buf.setLength(0);
        return true;
    }

    protected long memSize(StringBuilder buf) {
        return buf.length() * 2;
    }
}

package org.jivesoftware.smack.util.collections;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/EmptyMapIterator.class */
public class EmptyMapIterator extends AbstractEmptyIterator implements MapIterator, ResettableIterator {
    public static final MapIterator INSTANCE = new EmptyMapIterator();

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, org.jivesoftware.smack.util.collections.ResettableIterator
    public /* bridge */ /* synthetic */ void reset() {
        super.reset();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object setValue(Object x0) {
        return super.setValue(x0);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object getValue() {
        return super.getValue();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object getKey() {
        return super.getKey();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, java.util.Iterator
    public /* bridge */ /* synthetic */ void remove() {
        super.remove();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ void set(Object x0) {
        super.set(x0);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ void add(Object x0) {
        super.add(x0);
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ int previousIndex() {
        return super.previousIndex();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ int nextIndex() {
        return super.nextIndex();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ Object previous() {
        return super.previous();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator
    public /* bridge */ /* synthetic */ boolean hasPrevious() {
        return super.hasPrevious();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, java.util.Iterator
    public /* bridge */ /* synthetic */ Object next() {
        return super.next();
    }

    @Override // org.jivesoftware.smack.util.collections.AbstractEmptyIterator, java.util.Iterator
    public /* bridge */ /* synthetic */ boolean hasNext() {
        return super.hasNext();
    }

    protected EmptyMapIterator() {
    }
}

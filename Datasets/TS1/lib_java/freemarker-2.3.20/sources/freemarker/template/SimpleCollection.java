package freemarker.template;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleCollection.class */
public class SimpleCollection extends WrappingTemplateModel implements TemplateCollectionModel, Serializable {
    private boolean iteratorDirty;
    private Iterator iterator;
    private Collection collection;

    public SimpleCollection(Iterator iterator) {
        this.iterator = iterator;
    }

    public SimpleCollection(Collection collection) {
        this.collection = collection;
    }

    public SimpleCollection(Iterator iterator, ObjectWrapper wrapper) {
        super(wrapper);
        this.iterator = iterator;
    }

    public SimpleCollection(Collection collection, ObjectWrapper wrapper) {
        super(wrapper);
        this.collection = collection;
    }

    @Override // freemarker.template.TemplateCollectionModel
    public TemplateModelIterator iterator() {
        SimpleTemplateModelIterator simpleTemplateModelIterator;
        if (this.iterator != null) {
            return new SimpleTemplateModelIterator(this, this.iterator, true);
        }
        synchronized (this.collection) {
            simpleTemplateModelIterator = new SimpleTemplateModelIterator(this, this.collection.iterator(), false);
        }
        return simpleTemplateModelIterator;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleCollection$SimpleTemplateModelIterator.class */
    private class SimpleTemplateModelIterator implements TemplateModelIterator {
        private Iterator iterator;
        private boolean iteratorShared;
        private final SimpleCollection this$0;

        SimpleTemplateModelIterator(SimpleCollection simpleCollection, Iterator iterator, boolean iteratorShared) {
            this.this$0 = simpleCollection;
            this.iterator = iterator;
            this.iteratorShared = iteratorShared;
        }

        @Override // freemarker.template.TemplateModelIterator
        public TemplateModel next() throws TemplateModelException {
            if (this.iteratorShared) {
                makeIteratorDirty();
            }
            if (!this.iterator.hasNext()) {
                throw new TemplateModelException("The collection has no more elements.");
            }
            Object value = this.iterator.next();
            if (value instanceof TemplateModel) {
                return (TemplateModel) value;
            }
            return this.this$0.wrap(value);
        }

        @Override // freemarker.template.TemplateModelIterator
        public boolean hasNext() throws TemplateModelException {
            if (this.iteratorShared) {
                makeIteratorDirty();
            }
            return this.iterator.hasNext();
        }

        private void makeIteratorDirty() throws TemplateModelException {
            synchronized (this.this$0) {
                if (!this.this$0.iteratorDirty) {
                    this.this$0.iteratorDirty = true;
                    this.iteratorShared = false;
                } else {
                    throw new TemplateModelException("This collection variable wraps a java.util.Iterator, thus it can be <list>-ed or <foreach>-ed only once");
                }
            }
        }
    }
}

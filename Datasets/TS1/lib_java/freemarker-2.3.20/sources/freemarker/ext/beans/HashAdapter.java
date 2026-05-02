package freemarker.ext.beans;

import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelAdapter;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.utility.UndeclaredThrowableException;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/HashAdapter.class */
public class HashAdapter extends AbstractMap implements TemplateModelAdapter {
    private final BeansWrapper wrapper;
    private final TemplateHashModel model;
    private Set entrySet;

    HashAdapter(TemplateHashModel model, BeansWrapper wrapper) {
        this.model = model;
        this.wrapper = wrapper;
    }

    @Override // freemarker.template.TemplateModelAdapter
    public TemplateModel getTemplateModel() {
        return this.model;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean isEmpty() {
        try {
            return this.model.isEmpty();
        } catch (TemplateModelException e) {
            throw new UndeclaredThrowableException(e);
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object get(Object key) {
        try {
            return this.wrapper.unwrap(this.model.get(String.valueOf(key)));
        } catch (TemplateModelException e) {
            throw new UndeclaredThrowableException(e);
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object key) {
        if (get(key) != null) {
            return true;
        }
        return super.containsKey(key);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set entrySet() {
        if (this.entrySet != null) {
            return this.entrySet;
        }
        AnonymousClass1 anonymousClass1 = new AnonymousClass1(this);
        this.entrySet = anonymousClass1;
        return anonymousClass1;
    }

    /* renamed from: freemarker.ext.beans.HashAdapter$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/HashAdapter$1.class */
    class AnonymousClass1 extends AbstractSet {
        private final HashAdapter this$0;

        AnonymousClass1(HashAdapter hashAdapter) {
            this.this$0 = hashAdapter;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator iterator() {
            try {
                TemplateModelIterator i = this.this$0.getModelEx().keys().iterator();
                return new C00001(this, i);
            } catch (TemplateModelException e) {
                throw new UndeclaredThrowableException(e);
            }
        }

        /* renamed from: freemarker.ext.beans.HashAdapter$1$1, reason: invalid class name and collision with other inner class name */
        /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/HashAdapter$1$1.class */
        class C00001 implements Iterator {
            private final TemplateModelIterator val$i;
            private final AnonymousClass1 this$1;

            C00001(AnonymousClass1 anonymousClass1, TemplateModelIterator templateModelIterator) {
                this.this$1 = anonymousClass1;
                this.val$i = templateModelIterator;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                try {
                    return this.val$i.hasNext();
                } catch (TemplateModelException e) {
                    throw new UndeclaredThrowableException(e);
                }
            }

            @Override // java.util.Iterator
            public Object next() {
                try {
                    Object key = this.this$1.this$0.wrapper.unwrap(this.val$i.next());
                    return new Map.Entry(this, key) { // from class: freemarker.ext.beans.HashAdapter.1.1.1
                        private final Object val$key;
                        private final C00001 this$2;

                        {
                            this.this$2 = this;
                            this.val$key = key;
                        }

                        @Override // java.util.Map.Entry
                        public Object getKey() {
                            return this.val$key;
                        }

                        @Override // java.util.Map.Entry
                        public Object getValue() {
                            return this.this$2.this$1.this$0.get(this.val$key);
                        }

                        @Override // java.util.Map.Entry
                        public Object setValue(Object value) {
                            throw new UnsupportedOperationException();
                        }

                        @Override // java.util.Map.Entry
                        public boolean equals(Object o) {
                            if (!(o instanceof Map.Entry)) {
                                return false;
                            }
                            Map.Entry e = (Map.Entry) o;
                            Object k1 = getKey();
                            Object k2 = e.getKey();
                            if (k1 == k2 || (k1 != null && k1.equals(k2))) {
                                Object v1 = getValue();
                                Object v2 = e.getValue();
                                if (v1 == v2) {
                                    return true;
                                }
                                if (v1 != null && v1.equals(v2)) {
                                    return true;
                                }
                                return false;
                            }
                            return false;
                        }

                        @Override // java.util.Map.Entry
                        public int hashCode() {
                            Object value = getValue();
                            return (this.val$key == null ? 0 : this.val$key.hashCode()) ^ (value == null ? 0 : value.hashCode());
                        }
                    };
                } catch (TemplateModelException e) {
                    throw new UndeclaredThrowableException(e);
                }
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            try {
                return this.this$0.getModelEx().size();
            } catch (TemplateModelException e) {
                throw new UndeclaredThrowableException(e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public TemplateHashModelEx getModelEx() {
        if (this.model instanceof TemplateHashModelEx) {
            return (TemplateHashModelEx) this.model;
        }
        throw new UnsupportedOperationException(new StringBuffer().append("Operation supported only on TemplateHashModelEx. ").append(this.model.getClass().getName()).append(" does not implement it though.").toString());
    }
}

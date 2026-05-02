package freemarker.template;

import freemarker.ext.beans.BeansWrapper;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleSequence.class */
public class SimpleSequence extends WrappingTemplateModel implements TemplateSequenceModel, Serializable {
    protected final List list;
    private List unwrappedList;

    /* renamed from: freemarker.template.SimpleSequence$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleSequence$1.class */
    static class AnonymousClass1 {
    }

    public SimpleSequence() {
        this((ObjectWrapper) null);
    }

    public SimpleSequence(int capacity) {
        this.list = new ArrayList(capacity);
    }

    public SimpleSequence(Collection collection) {
        this(collection, null);
    }

    public SimpleSequence(TemplateCollectionModel tcm) throws TemplateModelException {
        ArrayList alist = new ArrayList();
        TemplateModelIterator it = tcm.iterator();
        while (it.hasNext()) {
            alist.add(it.next());
        }
        alist.trimToSize();
        this.list = alist;
    }

    public SimpleSequence(ObjectWrapper wrapper) {
        super(wrapper);
        this.list = new ArrayList();
    }

    public SimpleSequence(Collection collection, ObjectWrapper wrapper) {
        super(wrapper);
        this.list = new ArrayList(collection);
    }

    public void add(Object obj) {
        this.list.add(obj);
        this.unwrappedList = null;
    }

    public void add(boolean b) {
        if (b) {
            add(TemplateBooleanModel.TRUE);
        } else {
            add(TemplateBooleanModel.FALSE);
        }
    }

    public List toList() throws TemplateModelException {
        if (this.unwrappedList == null) {
            Class listClass = this.list.getClass();
            try {
                List result = (List) listClass.newInstance();
                BeansWrapper bw = BeansWrapper.getDefaultInstance();
                for (int i = 0; i < this.list.size(); i++) {
                    Object elem = this.list.get(i);
                    if (elem instanceof TemplateModel) {
                        elem = bw.unwrap((TemplateModel) elem);
                    }
                    result.add(elem);
                }
                this.unwrappedList = result;
            } catch (Exception e) {
                throw new TemplateModelException(new StringBuffer().append("Error instantiating an object of type ").append(listClass.getName()).append("\n").append(e.getMessage()).toString());
            }
        }
        return this.unwrappedList;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int i) throws TemplateModelException {
        try {
            Object value = this.list.get(i);
            if (value instanceof TemplateModel) {
                return (TemplateModel) value;
            }
            TemplateModel tm = wrap(value);
            this.list.set(i, tm);
            return tm;
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() {
        return this.list.size();
    }

    public SimpleSequence synchronizedWrapper() {
        return new SynchronizedSequence(this, null);
    }

    public String toString() {
        return this.list.toString();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleSequence$SynchronizedSequence.class */
    private class SynchronizedSequence extends SimpleSequence {
        private final SimpleSequence this$0;

        private SynchronizedSequence(SimpleSequence simpleSequence) {
            this.this$0 = simpleSequence;
        }

        SynchronizedSequence(SimpleSequence x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.template.SimpleSequence
        public void add(Object obj) {
            synchronized (this.this$0) {
                this.this$0.add(obj);
            }
        }

        @Override // freemarker.template.SimpleSequence, freemarker.template.TemplateSequenceModel
        public TemplateModel get(int i) throws TemplateModelException {
            TemplateModel templateModel;
            synchronized (this.this$0) {
                templateModel = this.this$0.get(i);
            }
            return templateModel;
        }

        @Override // freemarker.template.SimpleSequence, freemarker.template.TemplateSequenceModel
        public int size() {
            int size;
            synchronized (this.this$0) {
                size = this.this$0.size();
            }
            return size;
        }

        @Override // freemarker.template.SimpleSequence
        public List toList() throws TemplateModelException {
            List list;
            synchronized (this.this$0) {
                list = this.this$0.toList();
            }
            return list;
        }
    }
}

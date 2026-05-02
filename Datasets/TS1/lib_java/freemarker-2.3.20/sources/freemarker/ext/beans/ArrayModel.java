package freemarker.ext.beans;

import freemarker.ext.util.ModelFactory;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateSequenceModel;
import java.lang.reflect.Array;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/ArrayModel.class */
public class ArrayModel extends BeanModel implements TemplateCollectionModel, TemplateSequenceModel {
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.ArrayModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new ArrayModel(object, (BeansWrapper) wrapper);
        }
    };
    private int length;

    public ArrayModel(Object array, BeansWrapper wrapper) {
        super(array, wrapper);
        Class clazz = array.getClass();
        if (!clazz.isArray()) {
            throw new IllegalArgumentException(new StringBuffer().append("Object is not an array, it's ").append(array.getClass().getName()).toString());
        }
        this.length = Array.getLength(array);
    }

    @Override // freemarker.template.TemplateCollectionModel
    public TemplateModelIterator iterator() {
        return new Iterator(this, null);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) throws TemplateModelException {
        try {
            return wrap(Array.get(this.object, index));
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/ArrayModel$Iterator.class */
    private class Iterator implements TemplateSequenceModel, TemplateModelIterator {
        private int position;
        private final ArrayModel this$0;

        private Iterator(ArrayModel arrayModel) {
            this.this$0 = arrayModel;
            this.position = 0;
        }

        Iterator(ArrayModel x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.template.TemplateModelIterator
        public boolean hasNext() {
            return this.position < this.this$0.length;
        }

        @Override // freemarker.template.TemplateSequenceModel
        public TemplateModel get(int index) throws TemplateModelException {
            return this.this$0.get(index);
        }

        @Override // freemarker.template.TemplateModelIterator
        public TemplateModel next() throws TemplateModelException {
            if (this.position >= this.this$0.length) {
                return null;
            }
            int i = this.position;
            this.position = i + 1;
            return get(i);
        }

        @Override // freemarker.template.TemplateSequenceModel
        public int size() {
            return this.this$0.size();
        }
    }

    @Override // freemarker.ext.beans.BeanModel, freemarker.template.TemplateHashModelEx
    public int size() {
        return this.length;
    }

    @Override // freemarker.ext.beans.BeanModel, freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return this.length == 0;
    }
}

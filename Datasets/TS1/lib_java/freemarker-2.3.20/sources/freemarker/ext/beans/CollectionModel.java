package freemarker.ext.beans;

import freemarker.ext.util.ModelFactory;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateSequenceModel;
import java.util.Collection;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/CollectionModel.class */
public class CollectionModel extends StringModel implements TemplateCollectionModel, TemplateSequenceModel {
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.CollectionModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new CollectionModel((Collection) object, (BeansWrapper) wrapper);
        }
    };

    public CollectionModel(Collection collection, BeansWrapper wrapper) {
        super(collection, wrapper);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) throws TemplateModelException {
        if (this.object instanceof List) {
            try {
                return wrap(((List) this.object).get(index));
            } catch (IndexOutOfBoundsException e) {
                return null;
            }
        }
        throw new TemplateModelException(new StringBuffer().append("Underlying collection is not a list, it's ").append(this.object.getClass().getName()).toString());
    }

    public boolean getSupportsIndexedAccess() {
        return this.object instanceof List;
    }

    @Override // freemarker.template.TemplateCollectionModel
    public TemplateModelIterator iterator() {
        return new IteratorModel(((Collection) this.object).iterator(), this.wrapper);
    }

    @Override // freemarker.ext.beans.BeanModel, freemarker.template.TemplateHashModelEx
    public int size() {
        return ((Collection) this.object).size();
    }
}

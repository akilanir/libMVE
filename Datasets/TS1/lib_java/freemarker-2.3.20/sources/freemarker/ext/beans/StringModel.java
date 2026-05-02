package freemarker.ext.beans;

import freemarker.ext.util.ModelFactory;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateScalarModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/StringModel.class */
public class StringModel extends BeanModel implements TemplateScalarModel {
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.StringModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new StringModel(object, (BeansWrapper) wrapper);
        }
    };

    public StringModel(Object object, BeansWrapper wrapper) {
        super(object, wrapper);
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() {
        return this.object.toString();
    }
}

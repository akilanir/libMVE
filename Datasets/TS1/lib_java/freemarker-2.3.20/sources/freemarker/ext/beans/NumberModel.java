package freemarker.ext.beans;

import freemarker.ext.util.ModelFactory;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateNumberModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/NumberModel.class */
public class NumberModel extends BeanModel implements TemplateNumberModel {
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.NumberModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new NumberModel((Number) object, (BeansWrapper) wrapper);
        }
    };

    public NumberModel(Number number, BeansWrapper wrapper) {
        super(number, wrapper);
    }

    @Override // freemarker.template.TemplateNumberModel
    public Number getAsNumber() {
        return (Number) this.object;
    }
}

package freemarker.ext.beans;

import freemarker.template.TemplateBooleanModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/BooleanModel.class */
public class BooleanModel extends BeanModel implements TemplateBooleanModel {
    private final boolean value;

    public BooleanModel(Boolean bool, BeansWrapper wrapper) {
        super(bool, wrapper);
        this.value = bool.booleanValue();
    }

    @Override // freemarker.template.TemplateBooleanModel
    public boolean getAsBoolean() {
        return this.value;
    }
}

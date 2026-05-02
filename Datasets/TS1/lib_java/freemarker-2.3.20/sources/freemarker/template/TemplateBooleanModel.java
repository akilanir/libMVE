package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateBooleanModel.class */
public interface TemplateBooleanModel extends TemplateModel {
    public static final TemplateBooleanModel FALSE = new TemplateBooleanModel() { // from class: freemarker.template.TemplateBooleanModel.1
        @Override // freemarker.template.TemplateBooleanModel
        public boolean getAsBoolean() {
            return false;
        }

        private Object readResolve() {
            return TemplateBooleanModel.FALSE;
        }
    };
    public static final TemplateBooleanModel TRUE = new TemplateBooleanModel() { // from class: freemarker.template.TemplateBooleanModel.2
        @Override // freemarker.template.TemplateBooleanModel
        public boolean getAsBoolean() {
            return true;
        }

        private Object readResolve() {
            return TemplateBooleanModel.TRUE;
        }
    };

    boolean getAsBoolean() throws TemplateModelException;
}

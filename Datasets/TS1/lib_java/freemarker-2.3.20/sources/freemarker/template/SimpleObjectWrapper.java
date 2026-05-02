package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleObjectWrapper.class */
public class SimpleObjectWrapper extends DefaultObjectWrapper {
    static final SimpleObjectWrapper instance = new SimpleObjectWrapper();

    @Override // freemarker.template.DefaultObjectWrapper
    protected TemplateModel handleUnknownType(Object obj) throws TemplateModelException {
        throw new TemplateModelException(new StringBuffer().append("Don't know how to present an object of this type to a template: ").append(obj.getClass().getName()).toString());
    }
}

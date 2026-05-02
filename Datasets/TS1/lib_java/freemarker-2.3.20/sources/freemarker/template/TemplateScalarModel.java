package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateScalarModel.class */
public interface TemplateScalarModel extends TemplateModel {
    public static final TemplateModel EMPTY_STRING = new SimpleScalar("");

    String getAsString() throws TemplateModelException;
}

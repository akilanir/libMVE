package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateHashModel.class */
public interface TemplateHashModel extends TemplateModel {
    TemplateModel get(String str) throws TemplateModelException;

    boolean isEmpty() throws TemplateModelException;
}

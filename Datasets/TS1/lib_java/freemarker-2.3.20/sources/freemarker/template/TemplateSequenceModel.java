package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateSequenceModel.class */
public interface TemplateSequenceModel extends TemplateModel {
    TemplateModel get(int i) throws TemplateModelException;

    int size() throws TemplateModelException;
}

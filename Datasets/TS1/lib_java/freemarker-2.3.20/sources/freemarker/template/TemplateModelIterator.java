package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateModelIterator.class */
public interface TemplateModelIterator {
    TemplateModel next() throws TemplateModelException;

    boolean hasNext() throws TemplateModelException;
}

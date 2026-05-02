package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateHashModelEx.class */
public interface TemplateHashModelEx extends TemplateHashModel {
    int size() throws TemplateModelException;

    TemplateCollectionModel keys() throws TemplateModelException;

    TemplateCollectionModel values() throws TemplateModelException;
}

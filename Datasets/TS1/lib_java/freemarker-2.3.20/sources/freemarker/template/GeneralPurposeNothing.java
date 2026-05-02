package freemarker.template;

import java.util.ArrayList;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/GeneralPurposeNothing.class */
final class GeneralPurposeNothing implements TemplateBooleanModel, TemplateScalarModel, TemplateSequenceModel, TemplateHashModelEx, TemplateMethodModelEx {
    private static final TemplateModel instance = new GeneralPurposeNothing();
    private static final TemplateCollectionModel EMPTY_COLLECTION = new SimpleCollection(new ArrayList(0));

    private GeneralPurposeNothing() {
    }

    static TemplateModel getInstance() {
        return instance;
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() {
        return "";
    }

    @Override // freemarker.template.TemplateBooleanModel
    public boolean getAsBoolean() {
        return false;
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return true;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() {
        return 0;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int i) throws TemplateModelException {
        throw new TemplateModelException("Empty list");
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) {
        return null;
    }

    @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
    public Object exec(List args) {
        return null;
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel keys() {
        return EMPTY_COLLECTION;
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel values() {
        return EMPTY_COLLECTION;
    }
}

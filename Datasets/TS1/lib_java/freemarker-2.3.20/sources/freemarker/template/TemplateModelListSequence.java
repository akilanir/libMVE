package freemarker.template;

import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateModelListSequence.class */
public class TemplateModelListSequence implements TemplateSequenceModel {
    private List list;

    public TemplateModelListSequence(List list) {
        this.list = list;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) {
        return (TemplateModel) this.list.get(index);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() {
        return this.list.size();
    }

    public Object getWrappedObject() {
        return this.list;
    }
}

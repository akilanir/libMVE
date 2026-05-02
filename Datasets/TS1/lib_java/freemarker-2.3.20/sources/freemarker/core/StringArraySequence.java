package freemarker.core;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/StringArraySequence.class */
public class StringArraySequence implements TemplateSequenceModel {
    private String[] stringArray;
    private TemplateScalarModel[] array;

    public StringArraySequence(String[] stringArray) {
        this.stringArray = stringArray;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) {
        if (this.array == null) {
            this.array = new TemplateScalarModel[this.stringArray.length];
        }
        TemplateScalarModel result = this.array[index];
        if (result == null) {
            result = new SimpleScalar(this.stringArray[index]);
            this.array[index] = result;
        }
        return result;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() {
        return this.stringArray.length;
    }
}

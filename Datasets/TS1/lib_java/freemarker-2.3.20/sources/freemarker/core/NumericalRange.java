package freemarker.core;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;
import java.io.Serializable;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalRange.class */
class NumericalRange implements TemplateSequenceModel, Serializable {
    private int lower;
    private int upper;
    private boolean descending;
    private boolean norhs;

    public NumericalRange(int lower) {
        this.norhs = true;
        this.lower = lower;
    }

    public NumericalRange(int left, int right) {
        this.lower = Math.min(left, right);
        this.upper = Math.max(left, right);
        this.descending = left != this.lower;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int i) throws TemplateModelException {
        int index = this.descending ? this.upper - i : this.lower + i;
        if ((this.norhs && index > this.upper) || index < this.lower) {
            throw new _TemplateModelException(new Object[]{"Range item index ", new Integer(i), " is out of bounds."});
        }
        return new SimpleNumber(index);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() {
        return (1 + this.upper) - this.lower;
    }

    boolean hasRhs() {
        return !this.norhs;
    }
}

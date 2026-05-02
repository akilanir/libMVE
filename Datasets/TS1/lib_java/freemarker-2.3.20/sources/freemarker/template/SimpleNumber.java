package freemarker.template;

import java.io.Serializable;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleNumber.class */
public final class SimpleNumber implements TemplateNumberModel, Serializable {
    private Number value;

    public SimpleNumber(Number value) {
        this.value = value;
    }

    public SimpleNumber(byte val) {
        this.value = new Byte(val);
    }

    public SimpleNumber(short val) {
        this.value = new Short(val);
    }

    public SimpleNumber(int val) {
        this.value = new Integer(val);
    }

    public SimpleNumber(long val) {
        this.value = new Long(val);
    }

    public SimpleNumber(float val) {
        this.value = new Float(val);
    }

    public SimpleNumber(double val) {
        this.value = new Double(val);
    }

    @Override // freemarker.template.TemplateNumberModel
    public Number getAsNumber() {
        return this.value;
    }

    public String toString() {
        return this.value.toString();
    }
}

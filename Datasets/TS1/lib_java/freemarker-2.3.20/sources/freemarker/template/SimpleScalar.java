package freemarker.template;

import java.io.Serializable;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleScalar.class */
public final class SimpleScalar implements TemplateScalarModel, Serializable {
    private String value;

    public SimpleScalar(String value) {
        this.value = value;
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() {
        return this.value == null ? "" : this.value;
    }

    public String toString() {
        return this.value;
    }
}

package org.spongycastle.i18n.filter;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/i18n/filter/UntrustedInput.class */
public class UntrustedInput {
    protected Object input;

    public UntrustedInput(Object input) {
        this.input = input;
    }

    public Object getInput() {
        return this.input;
    }

    public String getString() {
        return this.input.toString();
    }

    public String toString() {
        return this.input.toString();
    }
}

package freemarker.core;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_DelayedConversionToString.class */
public abstract class _DelayedConversionToString {
    private static final String NOT_SET = new String();
    private Object object;
    private String stringValue = NOT_SET;

    protected abstract String doConversion(Object obj);

    public _DelayedConversionToString(Object object) {
        this.object = object;
    }

    public synchronized String toString() {
        if (this.stringValue == NOT_SET) {
            this.stringValue = doConversion(this.object);
            this.object = null;
        }
        return this.stringValue;
    }
}

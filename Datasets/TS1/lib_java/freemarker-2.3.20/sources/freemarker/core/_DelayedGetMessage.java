package freemarker.core;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_DelayedGetMessage.class */
public class _DelayedGetMessage extends _DelayedConversionToString {
    public _DelayedGetMessage(Throwable exception) {
        super(exception);
    }

    @Override // freemarker.core._DelayedConversionToString
    protected String doConversion(Object obj) {
        return ((Throwable) obj).getMessage();
    }
}

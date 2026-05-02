package freemarker.core;

import freemarker.template.TemplateException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_DelayedGetMessageWithoutStackTop.class */
public class _DelayedGetMessageWithoutStackTop extends _DelayedConversionToString {
    public _DelayedGetMessageWithoutStackTop(TemplateException exception) {
        super(exception);
    }

    @Override // freemarker.core._DelayedConversionToString
    protected String doConversion(Object obj) {
        return ((TemplateException) obj).getMessageWithoutStackTop();
    }
}

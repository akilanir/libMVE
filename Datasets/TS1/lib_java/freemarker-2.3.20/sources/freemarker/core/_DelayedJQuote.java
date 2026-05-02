package freemarker.core;

import freemarker.template.utility.StringUtil;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_DelayedJQuote.class */
public class _DelayedJQuote extends _DelayedConversionToString {
    public _DelayedJQuote(Object object) {
        super(object);
    }

    @Override // freemarker.core._DelayedConversionToString
    protected String doConversion(Object obj) {
        return StringUtil.jQuote(obj);
    }
}

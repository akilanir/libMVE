package freemarker.core;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_DelayedAOrAn.class */
public class _DelayedAOrAn extends _DelayedConversionToString {
    public _DelayedAOrAn(Object object) {
        super(object);
    }

    @Override // freemarker.core._DelayedConversionToString
    protected String doConversion(Object obj) {
        String s = obj.toString();
        return new StringBuffer().append(MessageUtil.getAOrAn(s)).append(" ").append(s).toString();
    }
}

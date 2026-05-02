package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalOutput.class */
final class NumericalOutput extends TemplateElement {
    private final Expression expression;
    private final boolean hasFormat;
    private final int minFracDigits;
    private final int maxFracDigits;
    private volatile FormatHolder formatCache;

    NumericalOutput(Expression expression) {
        this.expression = expression;
        this.hasFormat = false;
        this.minFracDigits = 0;
        this.maxFracDigits = 0;
    }

    NumericalOutput(Expression expression, int minFracDigits, int maxFracDigits) {
        this.expression = expression;
        this.hasFormat = true;
        this.minFracDigits = minFracDigits;
        this.maxFracDigits = maxFracDigits;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        Number num = this.expression.evalToNumber(env);
        FormatHolder fmth = this.formatCache;
        if (fmth == null || !fmth.locale.equals(env.getLocale())) {
            synchronized (this) {
                fmth = this.formatCache;
                if (fmth == null || !fmth.locale.equals(env.getLocale())) {
                    NumberFormat fmt = NumberFormat.getNumberInstance(env.getLocale());
                    if (this.hasFormat) {
                        fmt.setMinimumFractionDigits(this.minFracDigits);
                        fmt.setMaximumFractionDigits(this.maxFracDigits);
                    } else {
                        fmt.setMinimumFractionDigits(0);
                        fmt.setMaximumFractionDigits(50);
                    }
                    fmt.setGroupingUsed(false);
                    this.formatCache = new FormatHolder(fmt, env.getLocale());
                    fmth = this.formatCache;
                }
            }
        }
        env.getOut().write(fmth.format.format(num));
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer("#{");
        buf.append(this.expression.getCanonicalForm());
        if (this.hasFormat) {
            buf.append(" ; ");
            buf.append("m");
            buf.append(this.minFracDigits);
            buf.append("M");
            buf.append(this.maxFracDigits);
        }
        buf.append("}");
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#{...}";
    }

    @Override // freemarker.core.TemplateElement
    boolean heedsOpeningWhitespace() {
        return true;
    }

    @Override // freemarker.core.TemplateElement
    boolean heedsTrailingWhitespace() {
        return true;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NumericalOutput$FormatHolder.class */
    private static class FormatHolder {
        final NumberFormat format;
        final Locale locale;

        FormatHolder(NumberFormat format, Locale locale) {
            this.format = format;
            this.locale = locale;
        }
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 3;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.expression;
            case 1:
                return new Integer(this.minFracDigits);
            case 2:
                return new Integer(this.maxFracDigits);
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.CONTENT;
            case 1:
                return ParameterRole.MINIMUM_DECIMALS;
            case 2:
                return ParameterRole.MAXIMUM_DECIMALS;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}

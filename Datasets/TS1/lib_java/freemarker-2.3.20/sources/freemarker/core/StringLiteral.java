package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.utility.StringUtil;
import java.io.IOException;
import java.io.StringReader;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/StringLiteral.class */
final class StringLiteral extends Expression implements TemplateScalarModel {
    private final String value;
    private TemplateElement dynamicValue;

    StringLiteral(String value) {
        this.value = value;
    }

    void checkInterpolation() throws ParseException {
        if (this.value.length() > 3) {
            if (this.value.indexOf("${") >= 0 || this.value.indexOf("#{") >= 0) {
                SimpleCharStream scs = new SimpleCharStream(new StringReader(this.value), this.beginLine, this.beginColumn + 1, this.value.length());
                FMParserTokenManager token_source = new FMParserTokenManager(scs);
                token_source.onlyTextOutput = true;
                FMParser parser = new FMParser(token_source);
                parser.setTemplate(getTemplate());
                try {
                    this.dynamicValue = parser.FreeMarkerText();
                    this.constantValue = null;
                } catch (ParseException e) {
                    e.setTemplateName(getTemplate().getName());
                    throw e;
                }
            }
        }
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        return new SimpleScalar(evalAndCoerceToString(env));
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() {
        return this.value;
    }

    boolean isSingleInterpolationLiteral() {
        return this.dynamicValue != null && this.dynamicValue.getChildCount() == 1 && (this.dynamicValue.getChildAt(0) instanceof DollarVariable);
    }

    @Override // freemarker.core.Expression
    String evalAndCoerceToString(Environment env) throws TemplateException {
        if (this.dynamicValue == null) {
            return this.value;
        }
        TemplateExceptionHandler teh = env.getTemplateExceptionHandler();
        env.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        try {
            try {
                String renderElementToString = env.renderElementToString(this.dynamicValue);
                env.setTemplateExceptionHandler(teh);
                return renderElementToString;
            } catch (IOException ioe) {
                throw new _MiscTemplateException(ioe, env);
            }
        } catch (Throwable th) {
            env.setTemplateExceptionHandler(teh);
            throw th;
        }
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append("\"").append(StringUtil.FTLStringLiteralEnc(this.value)).append("\"").toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return this.dynamicValue == null ? getCanonicalForm() : "dynamic \"...\"";
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.dynamicValue == null;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        StringLiteral cloned = new StringLiteral(this.value);
        cloned.dynamicValue = this.dynamicValue;
        return cloned;
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return this.dynamicValue;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.EMBEDDED_TEMPLATE;
    }
}

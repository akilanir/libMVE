package freemarker.core;

import freemarker.cache.TemplateCache;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.utility.StringUtil;
import freemarker.template.utility.UndeclaredThrowableException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Include.class */
final class Include extends TemplateElement {
    private Expression templateName;
    private Expression encodingExp;
    private Expression parseExp;
    private String encoding;
    private boolean parse;
    private final String templatePath;

    Include(Template template, Expression includedTemplateName, Expression encodingExp, Expression parseExp) throws ParseException {
        String templatePath1 = template.getName();
        templatePath1 = templatePath1 == null ? "" : templatePath1;
        int lastSlash = templatePath1.lastIndexOf(47);
        this.templatePath = lastSlash == -1 ? "" : templatePath1.substring(0, lastSlash + 1);
        this.templateName = includedTemplateName;
        if (encodingExp instanceof StringLiteral) {
            this.encoding = encodingExp.toString();
            this.encoding = this.encoding.substring(1, this.encoding.length() - 1);
        } else {
            this.encodingExp = encodingExp;
        }
        if (parseExp == null) {
            this.parse = true;
            return;
        }
        if (parseExp.isLiteral()) {
            try {
                if (parseExp instanceof StringLiteral) {
                    this.parse = StringUtil.getYesNo(parseExp.evalAndCoerceToString(null));
                } else {
                    try {
                        this.parse = parseExp.evalToBoolean(null);
                    } catch (NonBooleanException e) {
                        throw new ParseException("Expected a boolean or string as the value of the parse attribute", parseExp);
                    }
                }
                return;
            } catch (TemplateException e2) {
                throw new UndeclaredThrowableException(e2);
            }
        }
        this.parseExp = parseExp;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        String templateNameString = this.templateName.evalAndCoerceToString(env);
        String enc = this.encoding;
        if (this.encoding == null && this.encodingExp != null) {
            enc = this.encodingExp.evalAndCoerceToString(env);
        }
        boolean parse = this.parse;
        if (this.parseExp != null) {
            TemplateModel tm = this.parseExp.eval(env);
            if (tm == null && !env.isClassicCompatible()) {
                this.parseExp.assertNonNull(tm, env);
            }
            if (tm instanceof TemplateScalarModel) {
                parse = getYesNo(EvalUtil.modelToString((TemplateScalarModel) tm, this.parseExp, env));
            } else {
                parse = this.parseExp.evalToBoolean(env);
            }
        }
        try {
            templateNameString = TemplateCache.getFullTemplatePath(env, this.templatePath, templateNameString);
            Template includedTemplate = env.getTemplateForInclusion(templateNameString, enc, parse);
            env.include(includedTemplate);
        } catch (ParseException pe) {
            throw new _MiscTemplateException(pe, env, new Object[]{"Error parsing included template ", new _DelayedJQuote(templateNameString), ":\n", new _DelayedGetMessage(pe)});
        } catch (IOException ioe) {
            throw new _MiscTemplateException(ioe, env, new Object[]{"Error reading included file ", new _DelayedJQuote(templateNameString), ":\n", new _DelayedGetMessage(ioe)});
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        if (canonical) {
            buf.append('<');
        }
        buf.append(getNodeTypeSymbol());
        buf.append(' ');
        buf.append(this.templateName.getCanonicalForm());
        if (this.encoding != null) {
            buf.append(" encoding=\"");
            buf.append(this.encodingExp.getCanonicalForm());
            buf.append('\"');
        }
        if (this.parseExp != null) {
            buf.append(new StringBuffer().append(" parse=").append(this.parseExp.getCanonicalForm()).toString());
        } else if (!this.parse) {
            buf.append(" parse=false");
        }
        if (canonical) {
            buf.append("/>");
        }
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#include";
    }

    private boolean getYesNo(String s) throws TemplateException {
        try {
            return StringUtil.getYesNo(s);
        } catch (IllegalArgumentException e) {
            throw new _MiscTemplateException(this.parseExp, new Object[]{"Value of include parse parameter must be boolean (or one of these strings: \"n\", \"no\", \"f\", \"false\", \"y\", \"yes\", \"t\", \"true\"), but it was ", new _DelayedJQuote(s), "."});
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
                return this.templateName;
            case 1:
                return new Boolean(this.parse);
            case 2:
                return this.encoding;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.TEMPLATE_NAME;
            case 1:
                return ParameterRole.PARSE_PARAMETER;
            case 2:
                return ParameterRole.ENCODING_PARAMETER;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}

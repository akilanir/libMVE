package freemarker.core;

import freemarker.core.Expression;
import freemarker.core.Macro;
import freemarker.template.Configuration;
import freemarker.template.SimpleDate;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.util.Date;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/BuiltinVariable.class */
final class BuiltinVariable extends Expression {
    static final String TEMPLATE_NAME = "template_name";
    static final String NAMESPACE = "namespace";
    static final String MAIN = "main";
    static final String GLOBALS = "globals";
    static final String LOCALS = "locals";
    static final String DATA_MODEL = "data_model";
    static final String LANG = "lang";
    static final String LOCALE = "locale";
    static final String CURRENT_NODE = "current_node";
    static final String NODE = "node";
    static final String PASS = "pass";
    static final String VARS = "vars";
    static final String VERSION = "version";
    static final String ERROR = "error";
    static final String OUTPUT_ENCODING = "output_encoding";
    static final String URL_ESCAPING_CHARSET = "url_escaping_charset";
    static final String NOW = "now";
    private final String name;

    BuiltinVariable(String name) throws ParseException {
        String name2 = name.intern();
        this.name = name2;
        if (name2 != TEMPLATE_NAME && name2 != NAMESPACE && name2 != MAIN && name2 != GLOBALS && name2 != LOCALS && name2 != LANG && name2 != "locale" && name2 != DATA_MODEL && name2 != CURRENT_NODE && name2 != NODE && name2 != PASS && name2 != VARS && name2 != VERSION && name2 != "output_encoding" && name2 != "url_escaping_charset" && name2 != ERROR && name2 != NOW) {
            throw new ParseException(new StringBuffer().append("Unknown built-in variable: ").append(name2).toString(), this);
        }
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        if (this.name == NAMESPACE) {
            return env.getCurrentNamespace();
        }
        if (this.name == MAIN) {
            return env.getMainNamespace();
        }
        if (this.name == GLOBALS) {
            return env.getGlobalVariables();
        }
        if (this.name == LOCALS) {
            Macro.Context ctx = env.getCurrentMacroContext();
            if (ctx == null) {
                return null;
            }
            return ctx.getLocals();
        }
        if (this.name == DATA_MODEL) {
            return env.getDataModel();
        }
        if (this.name == VARS) {
            return new VarsHash(env);
        }
        if (this.name == "locale") {
            return new SimpleScalar(env.getLocale().toString());
        }
        if (this.name == LANG) {
            return new SimpleScalar(env.getLocale().getLanguage());
        }
        if (this.name == CURRENT_NODE || this.name == NODE) {
            return env.getCurrentVisitorNode();
        }
        if (this.name == TEMPLATE_NAME) {
            return new SimpleScalar(env.getTemplate().getName());
        }
        if (this.name == PASS) {
            return Macro.DO_NOTHING_MACRO;
        }
        if (this.name == VERSION) {
            return new SimpleScalar(Configuration.getVersionNumber());
        }
        if (this.name == "output_encoding") {
            String s = env.getOutputEncoding();
            if (s != null) {
                return new SimpleScalar(s);
            }
            return null;
        }
        if (this.name == "url_escaping_charset") {
            String s2 = env.getURLEscapingCharset();
            if (s2 != null) {
                return new SimpleScalar(s2);
            }
            return null;
        }
        if (this.name == ERROR) {
            return new SimpleScalar(env.getCurrentRecoveredErrorMessage());
        }
        if (this.name == NOW) {
            return new SimpleDate(new Date(), 3);
        }
        throw new _MiscTemplateException(this, new Object[]{"Invalid built-in variable: ", this.name});
    }

    @Override // freemarker.core.TemplateObject
    public String toString() {
        return new StringBuffer().append(".").append(this.name).toString();
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(".").append(this.name).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return getCanonicalForm();
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return false;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return this;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/BuiltinVariable$VarsHash.class */
    static class VarsHash implements TemplateHashModel {
        Environment env;

        VarsHash(Environment env) {
            this.env = env;
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            return this.env.getVariable(key);
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() {
            return false;
        }
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 0;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        throw new IndexOutOfBoundsException();
    }
}

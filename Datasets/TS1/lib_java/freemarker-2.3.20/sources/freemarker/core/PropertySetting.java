package freemarker.core;

import freemarker.template.Template;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/PropertySetting.class */
final class PropertySetting extends TemplateElement {
    private final String key;
    private final Expression value;

    PropertySetting(String key, Expression value) {
        this.key = key;
        this.value = value;
    }

    @Override // freemarker.core.TemplateObject
    void setLocation(Template template, int beginColumn, int beginLine, int endColumn, int endLine) throws ParseException {
        super.setLocation(template, beginColumn, beginLine, endColumn, endLine);
        if (!this.key.equals(Configurable.LOCALE_KEY) && !this.key.equals(Configurable.NUMBER_FORMAT_KEY) && !this.key.equals(Configurable.TIME_FORMAT_KEY) && !this.key.equals(Configurable.DATE_FORMAT_KEY) && !this.key.equals(Configurable.DATETIME_FORMAT_KEY) && !this.key.equals(Configurable.TIME_ZONE_KEY) && !this.key.equals(Configurable.BOOLEAN_FORMAT_KEY) && !this.key.equals(Configurable.CLASSIC_COMPATIBLE_KEY) && !this.key.equals(Configurable.URL_ESCAPING_CHARSET_KEY)) {
            throw new ParseException(new StringBuffer().append("Invalid setting name, or it's not allowed to change the value of the setting with FTL: ").append(this.key).toString(), template, beginLine, beginColumn);
        }
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException {
        String strval;
        TemplateModel mval = this.value.eval(env);
        if (mval instanceof TemplateScalarModel) {
            strval = ((TemplateScalarModel) mval).getAsString();
        } else if (mval instanceof TemplateBooleanModel) {
            strval = ((TemplateBooleanModel) mval).getAsBoolean() ? "true" : "false";
        } else if (mval instanceof TemplateNumberModel) {
            strval = ((TemplateNumberModel) mval).getAsNumber().toString();
        } else {
            strval = this.value.evalAndCoerceToString(env);
        }
        env.setSetting(this.key, strval);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        sb.append(' ');
        sb.append(this.key);
        sb.append('=');
        sb.append(this.value.getCanonicalForm());
        if (canonical) {
            sb.append("/>");
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#setting";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.key;
            case 1:
                return this.value;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.ITEM_KEY;
            case 1:
                return ParameterRole.ITEM_VALUE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}

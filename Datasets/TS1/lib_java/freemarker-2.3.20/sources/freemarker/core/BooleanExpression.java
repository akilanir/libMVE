package freemarker.core;

import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/BooleanExpression.class */
abstract class BooleanExpression extends Expression {
    BooleanExpression() {
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        return evalToBoolean(env) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
    }
}

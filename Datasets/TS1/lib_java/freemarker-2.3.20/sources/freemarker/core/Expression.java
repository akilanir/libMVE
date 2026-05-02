package freemarker.core;

import freemarker.ext.beans.BeanModel;
import freemarker.template.Template;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Expression.class */
public abstract class Expression extends TemplateObject {
    TemplateModel constantValue;

    abstract TemplateModel _eval(Environment environment) throws TemplateException;

    abstract boolean isLiteral();

    protected abstract Expression deepCloneWithIdentifierReplaced_inner(String str, Expression expression, ReplacemenetState replacemenetState);

    @Override // freemarker.core.TemplateObject
    void setLocation(Template template, int beginColumn, int beginLine, int endColumn, int endLine) throws ParseException {
        super.setLocation(template, beginColumn, beginLine, endColumn, endLine);
        if (isLiteral()) {
            try {
                this.constantValue = _eval(null);
            } catch (Exception e) {
            }
        }
    }

    public final TemplateModel getAsTemplateModel(Environment env) throws TemplateException {
        return eval(env);
    }

    final TemplateModel eval(Environment env) throws TemplateException {
        return this.constantValue != null ? this.constantValue : _eval(env);
    }

    String evalAndCoerceToString(Environment env) throws TemplateException {
        return EvalUtil.coerceModelToString(eval(env), this, null, env);
    }

    String evalAndCoerceToString(Environment env, String seqTip) throws TemplateException {
        return EvalUtil.coerceModelToString(eval(env), this, seqTip, env);
    }

    static String coerceModelToString(TemplateModel tm, Expression exp, Environment env) throws TemplateException {
        return EvalUtil.coerceModelToString(tm, exp, null, env);
    }

    Number evalToNumber(Environment env) throws TemplateException {
        TemplateModel model = eval(env);
        return modelToNumber(model, env);
    }

    Number modelToNumber(TemplateModel model, Environment env) throws TemplateException {
        if (model instanceof TemplateNumberModel) {
            return EvalUtil.modelToNumber((TemplateNumberModel) model, this);
        }
        throw new NonNumericalException(this, model, env);
    }

    boolean evalToBoolean(Environment env) throws TemplateException {
        TemplateModel model = eval(env);
        return modelToBoolean(model, env);
    }

    boolean modelToBoolean(TemplateModel model, Environment env) throws TemplateException {
        if (model instanceof TemplateBooleanModel) {
            return ((TemplateBooleanModel) model).getAsBoolean();
        }
        if (env.isClassicCompatible()) {
            return (model == null || isEmpty(model)) ? false : true;
        }
        throw new NonBooleanException(this, model, env);
    }

    final Expression deepCloneWithIdentifierReplaced(String replacedIdentifier, Expression replacement, ReplacemenetState replacementState) {
        Expression clone = deepCloneWithIdentifierReplaced_inner(replacedIdentifier, replacement, replacementState);
        if (clone.beginLine == 0) {
            clone.copyLocationFrom(this);
        }
        return clone;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Expression$ReplacemenetState.class */
    static class ReplacemenetState {
        boolean replacementAlreadyInUse;

        ReplacemenetState() {
        }
    }

    static boolean isEmpty(TemplateModel model) throws TemplateModelException {
        if (model instanceof BeanModel) {
            return ((BeanModel) model).isEmpty();
        }
        if (model instanceof TemplateSequenceModel) {
            return ((TemplateSequenceModel) model).size() == 0;
        }
        if (model instanceof TemplateScalarModel) {
            String s = ((TemplateScalarModel) model).getAsString();
            return s == null || s.length() == 0;
        }
        if (model == null) {
            return true;
        }
        if (model instanceof TemplateCollectionModel) {
            return !((TemplateCollectionModel) model).iterator().hasNext();
        }
        if (model instanceof TemplateHashModel) {
            return ((TemplateHashModel) model).isEmpty();
        }
        if ((model instanceof TemplateNumberModel) || (model instanceof TemplateDateModel) || (model instanceof TemplateBooleanModel)) {
            return false;
        }
        return true;
    }

    void assertNonNull(TemplateModel model, Environment env) throws InvalidReferenceException {
        if (model == null) {
            throw InvalidReferenceException.getInstance(this, env);
        }
    }
}

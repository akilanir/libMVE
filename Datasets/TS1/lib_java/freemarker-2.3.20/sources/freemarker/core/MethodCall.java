package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.TemplateException;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.utility.NullWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/MethodCall.class */
final class MethodCall extends Expression {
    private final Expression target;
    private final ListLiteral arguments;

    MethodCall(Expression target, ArrayList arguments) {
        this(target, new ListLiteral(arguments));
    }

    private MethodCall(Expression target, ListLiteral arguments) {
        this.target = target;
        this.arguments = arguments;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        TemplateModel targetModel = this.target.eval(env);
        if (targetModel instanceof TemplateMethodModel) {
            TemplateMethodModel targetMethod = (TemplateMethodModel) targetModel;
            List argumentStrings = targetMethod instanceof TemplateMethodModelEx ? this.arguments.getModelList(env) : this.arguments.getValueList(env);
            Object result = targetMethod.exec(argumentStrings);
            return env.getObjectWrapper().wrap(result);
        }
        if (targetModel instanceof Macro) {
            Macro func = (Macro) targetModel;
            env.setLastReturnValue(null);
            if (!func.isFunction) {
                throw new _MiscTemplateException(env, "A macro cannot be called in an expression.");
            }
            Writer prevOut = env.getOut();
            try {
                try {
                    env.setOut(NullWriter.INSTANCE);
                    env.visit(func, null, this.arguments.items, null, null);
                    env.setOut(prevOut);
                    return env.getLastReturnValue();
                } catch (IOException e) {
                    throw new InternalError("This should be impossible.");
                }
            } catch (Throwable th) {
                env.setOut(prevOut);
                throw th;
            }
        }
        throw new UnexpectedTypeException(this.target, targetModel, "method", env);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        StringBuffer buf = new StringBuffer();
        buf.append(this.target.getCanonicalForm());
        buf.append("(");
        String list = this.arguments.getCanonicalForm();
        buf.append(list.substring(1, list.length() - 1));
        buf.append(")");
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "...(...)";
    }

    TemplateModel getConstantValue() {
        return null;
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return false;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new MethodCall(this.target.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), (ListLiteral) this.arguments.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1 + this.arguments.items.size();
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        if (idx == 0) {
            return this.target;
        }
        if (idx < getParameterCount()) {
            return this.arguments.items.get(idx - 1);
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx == 0) {
            return ParameterRole.CALLEE;
        }
        if (idx < getParameterCount()) {
            return ParameterRole.ARGUMENT_VALUE;
        }
        throw new IndexOutOfBoundsException();
    }
}

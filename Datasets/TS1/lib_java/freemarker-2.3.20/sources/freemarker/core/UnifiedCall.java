package freemarker.core;

import freemarker.template.EmptyMap;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateTransformModel;
import java.io.IOException;
import java.lang.ref.Reference;
import java.lang.ref.SoftReference;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/UnifiedCall.class */
final class UnifiedCall extends TemplateElement {
    private Expression nameExp;
    private Map namedArgs;
    private List positionalArgs;
    private List bodyParameterNames;
    boolean legacySyntax;
    private volatile transient SoftReference sortedNamedArgsCache;

    UnifiedCall(Expression nameExp, Map namedArgs, TemplateElement nestedBlock, List bodyParameterNames) {
        this.nameExp = nameExp;
        this.namedArgs = namedArgs;
        this.nestedBlock = nestedBlock;
        this.bodyParameterNames = bodyParameterNames;
    }

    UnifiedCall(Expression nameExp, List positionalArgs, TemplateElement nestedBlock, List bodyParameterNames) {
        this.nameExp = nameExp;
        this.positionalArgs = positionalArgs;
        this.nestedBlock = nestedBlock == TextBlock.EMPTY_BLOCK ? null : nestedBlock;
        this.bodyParameterNames = bodyParameterNames;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        Map args;
        TemplateModel tm = this.nameExp.eval(env);
        if (tm == Macro.DO_NOTHING_MACRO) {
            return;
        }
        if (tm instanceof Macro) {
            Macro macro = (Macro) tm;
            if (macro.isFunction && !this.legacySyntax) {
                throw new _MiscTemplateException(env, new Object[]{"Routine ", new _DelayedJQuote(macro.getName()), " is a function, not a directive. Functions can only be called from expressions, like in ${f()}, ${x + f()} or ", "<@someDirective someParam=f() />", "."});
            }
            env.visit(macro, this.namedArgs, this.positionalArgs, this.bodyParameterNames, this.nestedBlock);
            return;
        }
        boolean isDirectiveModel = tm instanceof TemplateDirectiveModel;
        if (isDirectiveModel || (tm instanceof TemplateTransformModel)) {
            if (this.namedArgs != null && !this.namedArgs.isEmpty()) {
                args = new HashMap();
                for (Map.Entry entry : this.namedArgs.entrySet()) {
                    String key = (String) entry.getKey();
                    Expression valueExp = (Expression) entry.getValue();
                    TemplateModel value = valueExp.eval(env);
                    args.put(key, value);
                }
            } else {
                args = EmptyMap.instance;
            }
            if (isDirectiveModel) {
                env.visit(this.nestedBlock, (TemplateDirectiveModel) tm, args, this.bodyParameterNames);
                return;
            } else {
                env.visitAndTransform(this.nestedBlock, (TemplateTransformModel) tm, args);
                return;
            }
        }
        if (tm == null) {
            throw InvalidReferenceException.getInstance(this.nameExp, env);
        }
        throw new UnexpectedTypeException(this.nameExp, tm, "user-defined directive (macro, etc.)", env);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append('@');
        MessageUtil.appendExpressionAsUntearable(sb, this.nameExp);
        boolean nameIsInParen = sb.charAt(sb.length() - 1) == ')';
        if (this.positionalArgs != null) {
            for (int i = 0; i < this.positionalArgs.size(); i++) {
                Expression argExp = (Expression) this.positionalArgs.get(i);
                if (i != 0) {
                    sb.append(',');
                }
                sb.append(' ');
                sb.append(argExp.getCanonicalForm());
            }
        } else {
            List entries = getSortedNamedArgs();
            for (int i2 = 0; i2 < entries.size(); i2++) {
                Map.Entry entry = (Map.Entry) entries.get(i2);
                Expression argExp2 = (Expression) entry.getValue();
                sb.append(' ');
                sb.append(entry.getKey());
                sb.append('=');
                MessageUtil.appendExpressionAsUntearable(sb, argExp2);
            }
        }
        if (canonical) {
            if (this.nestedBlock == null) {
                sb.append("/>");
            } else {
                sb.append('>');
                sb.append(this.nestedBlock.getCanonicalForm());
                sb.append("</@");
                if (!nameIsInParen && ((this.nameExp instanceof Identifier) || ((this.nameExp instanceof Dot) && ((Dot) this.nameExp).onlyHasIdentifiers()))) {
                    sb.append(this.nameExp.getCanonicalForm());
                }
                sb.append('>');
            }
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "@";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1 + (this.positionalArgs != null ? this.positionalArgs.size() : 0) + (this.namedArgs != null ? this.namedArgs.size() * 2 : 0) + (this.bodyParameterNames != null ? this.bodyParameterNames.size() : 0);
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        if (idx == 0) {
            return this.nameExp;
        }
        int positionalArgsSize = this.positionalArgs != null ? this.positionalArgs.size() : 0;
        if (idx - 1 < positionalArgsSize) {
            return this.positionalArgs.get(idx - 1);
        }
        int base = 1 + positionalArgsSize;
        int namedArgsSize = this.namedArgs != null ? this.namedArgs.size() : 0;
        if (idx - base < namedArgsSize * 2) {
            Map.Entry namedArg = (Map.Entry) getSortedNamedArgs().get((idx - base) / 2);
            return (idx - base) % 2 == 0 ? namedArg.getKey() : namedArg.getValue();
        }
        int base2 = base + (namedArgsSize * 2);
        int bodyParameterNamesSize = this.bodyParameterNames != null ? this.bodyParameterNames.size() : 0;
        if (idx - base2 < bodyParameterNamesSize) {
            return this.bodyParameterNames.get(idx - base2);
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx == 0) {
            return ParameterRole.CALLEE;
        }
        int positionalArgsSize = this.positionalArgs != null ? this.positionalArgs.size() : 0;
        if (idx - 1 < positionalArgsSize) {
            return ParameterRole.ARGUMENT_VALUE;
        }
        int base = 1 + positionalArgsSize;
        int namedArgsSize = this.namedArgs != null ? this.namedArgs.size() : 0;
        if (idx - base < namedArgsSize * 2) {
            return (idx - base) % 2 == 0 ? ParameterRole.ARGUMENT_NAME : ParameterRole.ARGUMENT_VALUE;
        }
        int base2 = base + (namedArgsSize * 2);
        int bodyParameterNamesSize = this.bodyParameterNames != null ? this.bodyParameterNames.size() : 0;
        if (idx - base2 < bodyParameterNamesSize) {
            return ParameterRole.TARGET_LOOP_VARIABLE;
        }
        throw new IndexOutOfBoundsException();
    }

    private List getSortedNamedArgs() {
        List res;
        Reference ref = this.sortedNamedArgsCache;
        if (ref != null && (res = (List) ref.get()) != null) {
            return res;
        }
        List res2 = MiscUtil.sortMapOfExpressions(this.namedArgs);
        this.sortedNamedArgsCache = new SoftReference(res2);
        return res2;
    }
}

package freemarker.core;

import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.utility.Collections12;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Macro.class */
public final class Macro extends TemplateElement implements TemplateModel {
    final int TYPE_MACRO = 0;
    final int TYPE_FUNCTION = 1;
    private final String name;
    private final String[] paramNames;
    private Map paramDefaults;
    private String catchAllParamName;
    boolean isFunction;
    static final Macro DO_NOTHING_MACRO = new Macro(".pass", Collections.EMPTY_LIST, Collections12.EMPTY_MAP, TextBlock.EMPTY_BLOCK);

    Macro(String name, List argumentNames, Map args, TemplateElement nestedBlock) {
        this.name = name;
        this.paramNames = (String[]) argumentNames.toArray(new String[argumentNames.size()]);
        this.paramDefaults = args;
        this.nestedBlock = nestedBlock;
    }

    public String getCatchAll() {
        return this.catchAllParamName;
    }

    public void setCatchAll(String value) {
        this.catchAllParamName = value;
    }

    public String[] getArgumentNames() {
        return (String[]) this.paramNames.clone();
    }

    String[] getArgumentNamesInternal() {
        return this.paramNames;
    }

    boolean hasArgNamed(String name) {
        return this.paramDefaults.containsKey(name);
    }

    public String getName() {
        return this.name;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) {
        env.visitMacroDef(this);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        sb.append(' ');
        sb.append(this.name);
        sb.append(this.isFunction ? '(' : ' ');
        int argCnt = this.paramNames.length;
        for (int i = 0; i < argCnt; i++) {
            if (i != 0) {
                if (this.isFunction) {
                    sb.append(", ");
                } else {
                    sb.append(' ');
                }
            }
            String argName = this.paramNames[i];
            sb.append(argName);
            if (this.paramDefaults != null && this.paramDefaults.get(argName) != null) {
                sb.append('=');
                Expression defaultExpr = (Expression) this.paramDefaults.get(argName);
                if (this.isFunction) {
                    sb.append(defaultExpr.getCanonicalForm());
                } else {
                    MessageUtil.appendExpressionAsUntearable(sb, defaultExpr);
                }
            }
        }
        if (this.catchAllParamName != null) {
            if (argCnt != 0) {
                sb.append(", ");
            }
            sb.append(this.catchAllParamName);
            sb.append("...");
        }
        if (this.isFunction) {
            sb.append(')');
        }
        if (canonical) {
            sb.append('>');
            if (this.nestedBlock != null) {
                sb.append(this.nestedBlock.getCanonicalForm());
            }
            sb.append("</").append(getNodeTypeSymbol()).append('>');
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return this.isFunction ? "#function" : "#macro";
    }

    @Override // freemarker.core.TemplateElement
    boolean isShownInStackTrace() {
        return false;
    }

    public boolean isFunction() {
        return this.isFunction;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Macro$Context.class */
    class Context implements LocalContext {
        Environment.Namespace localVars;
        TemplateElement body;
        Environment.Namespace bodyNamespace;
        List bodyParameterNames;
        Context prevMacroContext;
        ArrayList prevLocalContextStack;
        private final Macro this$0;

        Context(Macro macro, Environment env, TemplateElement body, List bodyParameterNames) {
            this.this$0 = macro;
            env.getClass();
            this.localVars = new Environment.Namespace(env);
            this.prevMacroContext = env.getCurrentMacroContext();
            this.bodyNamespace = env.getCurrentNamespace();
            this.prevLocalContextStack = env.getLocalContextStack();
            this.body = body;
            this.bodyParameterNames = bodyParameterNames;
        }

        Macro getMacro() {
            return this.this$0;
        }

        void runMacro(Environment env) throws TemplateException, IOException {
            sanityCheck(env);
            if (this.this$0.nestedBlock != null) {
                env.visit(this.this$0.nestedBlock);
            }
        }

        void sanityCheck(Environment env) throws TemplateException {
            Expression firstUnresolvedExpression;
            InvalidReferenceException firstReferenceException;
            boolean hasUnresolvedArg;
            do {
                firstUnresolvedExpression = null;
                firstReferenceException = null;
                hasUnresolvedArg = false;
                boolean resolvedAnArg = false;
                for (int i = 0; i < this.this$0.paramNames.length; i++) {
                    String argName = this.this$0.paramNames[i];
                    if (this.localVars.get(argName) == null) {
                        Expression valueExp = (Expression) this.this$0.paramDefaults.get(argName);
                        if (valueExp != null) {
                            try {
                                TemplateModel tm = valueExp.eval(env);
                                if (tm == null) {
                                    if (!hasUnresolvedArg) {
                                        firstUnresolvedExpression = valueExp;
                                        hasUnresolvedArg = true;
                                    }
                                } else {
                                    this.localVars.put(argName, tm);
                                    resolvedAnArg = true;
                                }
                            } catch (InvalidReferenceException e) {
                                if (!hasUnresolvedArg) {
                                    hasUnresolvedArg = true;
                                    firstReferenceException = e;
                                }
                            }
                        } else if (!env.isClassicCompatible()) {
                            boolean argWasSpecified = this.localVars.containsKey(argName);
                            Object[] objArr = new Object[8];
                            objArr[0] = "When calling macro ";
                            objArr[1] = new _DelayedJQuote(this.this$0.name);
                            objArr[2] = ", required parameter ";
                            objArr[3] = new _DelayedJQuote(argName);
                            objArr[4] = " (parameter #";
                            objArr[5] = new Integer(i + 1);
                            objArr[6] = ") was ";
                            objArr[7] = argWasSpecified ? "specified, but had null/missing value." : "not specified.";
                            throw new _MiscTemplateException(env, new _ErrorDescriptionBuilder(objArr).tip(argWasSpecified ? new Object[]{"If the parameter value expression on the caller side is known to be legally null/missing, you may want to specify a default value for it with the \"!\" operator, like paramValue!defaultValue."} : new Object[]{"If the omission was deliberate, you may consider making the parameter optional in the macro by specifying a default value for it, like ", "<#macro macroName paramName=defaultExpr>", ")"}));
                        }
                    }
                }
                if (!resolvedAnArg) {
                    break;
                }
            } while (hasUnresolvedArg);
            if (hasUnresolvedArg) {
                if (firstReferenceException != null) {
                    throw firstReferenceException;
                }
                if (!env.isClassicCompatible()) {
                    throw InvalidReferenceException.getInstance(firstUnresolvedExpression, env);
                }
            }
        }

        @Override // freemarker.core.LocalContext
        public TemplateModel getLocalVariable(String name) throws TemplateModelException {
            return this.localVars.get(name);
        }

        Environment.Namespace getLocals() {
            return this.localVars;
        }

        void setLocalVar(String name, TemplateModel var) {
            this.localVars.put(name, var);
        }

        @Override // freemarker.core.LocalContext
        public Collection getLocalVariableNames() throws TemplateModelException {
            HashSet result = new HashSet();
            TemplateModelIterator it = this.localVars.keys().iterator();
            while (it.hasNext()) {
                result.add(it.next().toString());
            }
            return result;
        }
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1 + (this.paramNames.length * 2) + 1 + 1;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        if (idx == 0) {
            return this.name;
        }
        int argDescsEnd = (this.paramNames.length * 2) + 1;
        if (idx < argDescsEnd) {
            String paramName = this.paramNames[(idx - 1) / 2];
            if (idx % 2 != 0) {
                return paramName;
            }
            return this.paramDefaults.get(paramName);
        }
        if (idx == argDescsEnd) {
            return this.catchAllParamName;
        }
        if (idx == argDescsEnd + 1) {
            return new Integer(this.isFunction ? 1 : 0);
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx == 0) {
            return ParameterRole.ASSIGNMENT_TARGET;
        }
        int argDescsEnd = (this.paramNames.length * 2) + 1;
        if (idx < argDescsEnd) {
            if (idx % 2 != 0) {
                return ParameterRole.PARAMETER_NAME;
            }
            return ParameterRole.PARAMETER_DEFAULT;
        }
        if (idx == argDescsEnd) {
            return ParameterRole.CATCH_ALL_PARAMETER_NAME;
        }
        if (idx == argDescsEnd + 1) {
            return ParameterRole.AST_NODE_SUBTYPE;
        }
        throw new IndexOutOfBoundsException();
    }
}

package freemarker.core;

import freemarker.template.TemplateException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/InvalidReferenceException.class */
public class InvalidReferenceException extends TemplateException {
    static final InvalidReferenceException FAST_INSTANCE = new InvalidReferenceException("Invalid reference. Details are unavilable, as this should have been handled by an FTL construct. If it wasn't, that's problably a bug in FreeMarker.", (Environment) null);
    private static final String[] TIP = {"If the failing expression is known to be legally null/missing, either specify a default value with myOptionalVar!myDefault, or use ", "<#if myOptionalVar??>", "when-present", "<#else>", "when-missing", "</#if>", ". (These only cover the last step of the expression; to cover the whole expression, use parenthessis: (myOptionVar.foo)!myDefault, (myOptionVar.foo)??"};

    public InvalidReferenceException(Environment env) {
        super("Invalid reference", env);
    }

    public InvalidReferenceException(String description, Environment env) {
        super(description, env);
    }

    InvalidReferenceException(_ErrorDescriptionBuilder description, Environment env) {
        super((Throwable) null, env, description, true);
    }

    static InvalidReferenceException getInstance(Expression blame, Environment env) {
        if (env != null && env.getFastInvalidReferenceExceptions()) {
            return FAST_INSTANCE;
        }
        if (blame != null) {
            return new InvalidReferenceException(new _ErrorDescriptionBuilder("The following has evaluated to null or missing:").blame(blame).tip(TIP), env);
        }
        return new InvalidReferenceException(env);
    }
}

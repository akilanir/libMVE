package freemarker.core;

import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NonNumericalException.class */
public class NonNumericalException extends UnexpectedTypeException {
    public NonNumericalException(Environment env) {
        super(env, "Expecting numerical value here");
    }

    public NonNumericalException(String description, Environment env) {
        super(env, description);
    }

    NonNumericalException(_ErrorDescriptionBuilder description, Environment env) {
        super(env, description);
    }

    NonNumericalException(Expression blamed, TemplateModel model, Environment env) throws InvalidReferenceException {
        super(blamed, model, "number", env);
    }

    NonNumericalException(Expression blamed, TemplateModel model, String tip, Environment env) throws InvalidReferenceException {
        super(blamed, model, "number", tip, env);
    }

    NonNumericalException(Expression blamed, TemplateModel model, String[] tips, Environment env) throws InvalidReferenceException {
        super(blamed, model, "number", tips, env);
    }

    static NonNumericalException newMalformedNumberException(Expression blamed, String text, Environment env) {
        return new NonNumericalException(new _ErrorDescriptionBuilder(new Object[]{"Can't convert this string to number: ", new _DelayedJQuote(text)}).blame(blamed), env);
    }
}

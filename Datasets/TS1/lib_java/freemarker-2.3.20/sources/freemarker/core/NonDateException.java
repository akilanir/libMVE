package freemarker.core;

import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NonDateException.class */
public class NonDateException extends UnexpectedTypeException {
    public NonDateException(Environment env) {
        super(env, "Expecting date/time value here");
    }

    public NonDateException(String description, Environment env) {
        super(env, description);
    }

    NonDateException(Environment env, _ErrorDescriptionBuilder description) {
        super(env, description);
    }

    NonDateException(Expression blamed, TemplateModel model, Environment env) throws InvalidReferenceException {
        super(blamed, model, "date", env);
    }

    NonDateException(Expression blamed, TemplateModel model, String tip, Environment env) throws InvalidReferenceException {
        super(blamed, model, "date", tip, env);
    }

    NonDateException(Expression blamed, TemplateModel model, String[] tips, Environment env) throws InvalidReferenceException {
        super(blamed, model, "date", tips, env);
    }
}

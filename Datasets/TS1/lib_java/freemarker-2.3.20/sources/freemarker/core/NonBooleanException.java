package freemarker.core;

import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NonBooleanException.class */
public class NonBooleanException extends UnexpectedTypeException {
    public NonBooleanException(Environment env) {
        super(env, "Expecting boolean value here");
    }

    public NonBooleanException(String description, Environment env) {
        super(env, description);
    }

    NonBooleanException(Environment env, _ErrorDescriptionBuilder description) {
        super(env, description);
    }

    NonBooleanException(Expression blamed, TemplateModel model, Environment env) throws InvalidReferenceException {
        super(blamed, model, "boolean", env);
    }

    NonBooleanException(Expression blamed, TemplateModel model, String tip, Environment env) throws InvalidReferenceException {
        super(blamed, model, "boolean", tip, env);
    }

    NonBooleanException(Expression blamed, TemplateModel model, String[] tips, Environment env) throws InvalidReferenceException {
        super(blamed, model, "boolean", tips, env);
    }
}

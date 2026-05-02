package freemarker.core;

import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NonStringException.class */
public class NonStringException extends UnexpectedTypeException {
    private static final String DEFAULT_DESCRIPTION = "Expecting string or something automatically convertible to string (number, date or boolean) value here";
    static final String TYPES_USABLE_WHERE_STRING_IS_EXPECTED = "string or something automatically convertible to string (number, date or boolean)";

    public NonStringException(Environment env) {
        super(env, DEFAULT_DESCRIPTION);
    }

    public NonStringException(String description, Environment env) {
        super(env, description);
    }

    NonStringException(Environment env, _ErrorDescriptionBuilder description) {
        super(env, description);
    }

    NonStringException(Expression blamed, TemplateModel model, Environment env) throws InvalidReferenceException {
        super(blamed, model, TYPES_USABLE_WHERE_STRING_IS_EXPECTED, env);
    }

    NonStringException(Expression blamed, TemplateModel model, String tip, Environment env) throws InvalidReferenceException {
        super(blamed, model, TYPES_USABLE_WHERE_STRING_IS_EXPECTED, tip, env);
    }

    NonStringException(Expression blamed, TemplateModel model, String[] tips, Environment env) throws InvalidReferenceException {
        super(blamed, model, TYPES_USABLE_WHERE_STRING_IS_EXPECTED, tips, env);
    }
}

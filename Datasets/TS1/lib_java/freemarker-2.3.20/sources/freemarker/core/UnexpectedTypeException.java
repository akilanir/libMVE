package freemarker.core;

import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/UnexpectedTypeException.class */
public class UnexpectedTypeException extends TemplateException {
    public UnexpectedTypeException(Environment env, String description) {
        super(description, env);
    }

    UnexpectedTypeException(Environment env, _ErrorDescriptionBuilder description) {
        super((Throwable) null, env, description, true);
    }

    UnexpectedTypeException(Expression blamed, TemplateModel model, String expectedType, Environment env) throws InvalidReferenceException {
        super((Throwable) null, env, newDesciptionBuilder(blamed, model, expectedType, env), true);
    }

    UnexpectedTypeException(Expression blamed, TemplateModel model, String expectedType, String tip, Environment env) throws InvalidReferenceException {
        super((Throwable) null, env, newDesciptionBuilder(blamed, model, expectedType, env).tip(tip), true);
    }

    UnexpectedTypeException(Expression blamed, TemplateModel model, String expectedType, String[] tips, Environment env) throws InvalidReferenceException {
        super((Throwable) null, env, newDesciptionBuilder(blamed, model, expectedType, env).tips(tips), true);
    }

    private static _ErrorDescriptionBuilder newDesciptionBuilder(Expression blamed, TemplateModel model, String expectedType, Environment env) throws InvalidReferenceException {
        if (model == null) {
            throw InvalidReferenceException.getInstance(blamed, env);
        }
        return new _ErrorDescriptionBuilder(unexpectedTypeErrorDescription(expectedType, model)).blame(blamed).showBlamer(true);
    }

    private static Object[] unexpectedTypeErrorDescription(String expectedType, TemplateModel model) {
        return new Object[]{"Expected ", new _DelayedAOrAn(expectedType), ", but this evaluated to ", new _DelayedAOrAn(new _DelayedFTLTypeDescription(model)), ":"};
    }
}

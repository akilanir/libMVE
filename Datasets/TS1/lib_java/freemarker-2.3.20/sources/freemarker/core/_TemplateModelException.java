package freemarker.core;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.ClassUtil;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_TemplateModelException.class */
public class _TemplateModelException extends TemplateModelException {
    public _TemplateModelException(String description) {
        super(description);
    }

    public _TemplateModelException(Throwable cause, String description) {
        this(cause, (Environment) null, description);
    }

    public _TemplateModelException(Environment env, String description) {
        this((Throwable) null, env, description);
    }

    public _TemplateModelException(Throwable cause, Environment env) {
        this(cause, env, (String) null);
    }

    public _TemplateModelException(Throwable cause) {
        this(cause, (Environment) null, (String) null);
    }

    public _TemplateModelException(Throwable cause, Environment env, String description) {
        super(cause, env, description, true);
    }

    public _TemplateModelException(_ErrorDescriptionBuilder description) {
        this((Environment) null, description);
    }

    public _TemplateModelException(Environment env, _ErrorDescriptionBuilder description) {
        this((Throwable) null, env, description);
    }

    public _TemplateModelException(Throwable cause, Environment env, _ErrorDescriptionBuilder description) {
        super(cause, env, description, true);
    }

    public _TemplateModelException(Object[] descriptionParts) {
        this((Environment) null, descriptionParts);
    }

    public _TemplateModelException(Environment env, Object[] descriptionParts) {
        this((Throwable) null, env, descriptionParts);
    }

    public _TemplateModelException(Throwable cause, Object[] descriptionParts) {
        this(cause, (Environment) null, descriptionParts);
    }

    public _TemplateModelException(Throwable cause, Environment env, Object[] descriptionParts) {
        super(cause, env, new _ErrorDescriptionBuilder(descriptionParts), true);
    }

    public _TemplateModelException(Expression blamed, Object[] descriptionParts) {
        this(blamed, (Environment) null, descriptionParts);
    }

    public _TemplateModelException(Expression blamed, Environment env, Object[] descriptionParts) {
        this(blamed, (Throwable) null, env, descriptionParts);
    }

    public _TemplateModelException(Expression blamed, Throwable cause, Environment env, Object[] descriptionParts) {
        super(cause, env, new _ErrorDescriptionBuilder(descriptionParts).blame(blamed), true);
    }

    public _TemplateModelException(Expression blamed, String description) {
        this(blamed, (Environment) null, description);
    }

    public _TemplateModelException(Expression blamed, Environment env, String description) {
        this(blamed, (Throwable) null, env, description);
    }

    public _TemplateModelException(Expression blamed, Throwable cause, Environment env, String description) {
        super(cause, env, new _ErrorDescriptionBuilder(description).blame(blamed), true);
    }

    static Object[] modelHasStoredNullDescription(Class expected, TemplateModel model) {
        return new Object[]{"The FreeMarker value exists, but has nothing inside it; the TemplateModel object (class: ", model.getClass().getName(), ") has returned a null instead of a ", ClassUtil.getShortClassName(expected), ". ", "This is possibly a bug in the non-FreeMarker code that builds the data-model."};
    }
}

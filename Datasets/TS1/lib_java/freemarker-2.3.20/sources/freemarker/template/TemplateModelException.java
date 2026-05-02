package freemarker.template;

import freemarker.core.Environment;
import freemarker.core._ErrorDescriptionBuilder;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateModelException.class */
public class TemplateModelException extends TemplateException {
    public TemplateModelException() {
        this((String) null, (Exception) null);
    }

    public TemplateModelException(String description) {
        this(description, (Exception) null);
    }

    public TemplateModelException(Exception cause) {
        this((String) null, cause);
    }

    public TemplateModelException(Throwable cause) {
        this((String) null, cause);
    }

    public TemplateModelException(String description, Exception cause) {
        super(description, cause, (Environment) null);
    }

    public TemplateModelException(String description, Throwable cause) {
        super(description, cause, (Environment) null);
    }

    protected TemplateModelException(Throwable cause, Environment env, String description, boolean preventAmbiguity) {
        super(description, cause, env);
    }

    protected TemplateModelException(Throwable cause, Environment env, _ErrorDescriptionBuilder descriptionBuilder, boolean preventAmbiguity) {
        super(cause, env, descriptionBuilder, true);
    }
}

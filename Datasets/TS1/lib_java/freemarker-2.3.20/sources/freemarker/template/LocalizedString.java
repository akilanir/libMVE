package freemarker.template;

import freemarker.core.Environment;
import java.util.Locale;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/LocalizedString.class */
public abstract class LocalizedString implements TemplateScalarModel {
    public abstract String getLocalizedString(Locale locale) throws TemplateModelException;

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() throws TemplateModelException {
        Environment env = Environment.getCurrentEnvironment();
        Locale locale = env.getLocale();
        return getLocalizedString(locale);
    }
}

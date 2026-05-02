package freemarker.core;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/LibraryLoad.class */
public final class LibraryLoad extends TemplateElement {
    private Expression templateName;
    private String namespace;
    private final String templatePath;

    LibraryLoad(Template template, Expression templateName, String namespace) {
        this.namespace = namespace;
        String templatePath1 = template.getName();
        templatePath1 = templatePath1 == null ? "" : templatePath1;
        int lastSlash = templatePath1.lastIndexOf(47);
        this.templatePath = lastSlash == -1 ? "" : templatePath1.substring(0, lastSlash + 1);
        this.templateName = templateName;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        String templateNameString = this.templateName.evalAndCoerceToString(env);
        try {
            if (!env.isClassicCompatible() && templateNameString.indexOf("://") <= 0) {
                if (templateNameString.length() > 0 && templateNameString.charAt(0) == '/') {
                    int protIndex = this.templatePath.indexOf("://");
                    if (protIndex > 0) {
                        templateNameString = new StringBuffer().append(this.templatePath.substring(0, protIndex + 2)).append(templateNameString).toString();
                    } else {
                        templateNameString = templateNameString.substring(1);
                    }
                } else {
                    templateNameString = new StringBuffer().append(this.templatePath).append(templateNameString).toString();
                }
            }
            Template importedTemplate = env.getTemplateForImporting(templateNameString);
            env.importLib(importedTemplate, this.namespace);
        } catch (ParseException pe) {
            throw new _MiscTemplateException(pe, env, new Object[]{"Error parsing imported template ", templateNameString});
        } catch (IOException ioe) {
            throw new _MiscTemplateException(ioe, env, new Object[]{"Error reading imported template ", templateNameString});
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        if (canonical) {
            buf.append('<');
        }
        buf.append(getNodeTypeSymbol());
        buf.append(' ');
        buf.append(this.templateName);
        buf.append(" as ");
        buf.append(this.namespace);
        if (canonical) {
            buf.append("/>");
        }
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#import";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.templateName;
            case 1:
                return this.namespace;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.TEMPLATE_NAME;
            case 1:
                return ParameterRole.NAMESPACE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    public String getTemplateName() {
        return this.templateName.toString();
    }
}

package freemarker.ext.dom;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/XPathSupport.class */
public interface XPathSupport {
    TemplateModel executeQuery(Object obj, String str) throws TemplateModelException;
}

package freemarker.core;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.util.Collection;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/LocalContext.class */
public interface LocalContext {
    TemplateModel getLocalVariable(String str) throws TemplateModelException;

    Collection getLocalVariableNames() throws TemplateModelException;
}

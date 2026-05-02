package freemarker.template;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateTransformModel.class */
public interface TemplateTransformModel extends TemplateModel {
    Writer getWriter(Writer writer, Map map) throws TemplateModelException, IOException;
}

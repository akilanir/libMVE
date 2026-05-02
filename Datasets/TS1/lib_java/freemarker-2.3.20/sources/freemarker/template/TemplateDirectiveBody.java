package freemarker.template;

import java.io.IOException;
import java.io.Writer;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateDirectiveBody.class */
public interface TemplateDirectiveBody {
    void render(Writer writer) throws TemplateException, IOException;
}

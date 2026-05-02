package freemarker.template;

import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateMethodModel.class */
public interface TemplateMethodModel extends TemplateModel {
    Object exec(List list) throws TemplateModelException;
}

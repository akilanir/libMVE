package freemarker.template.utility;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/ObjectConstructor.class */
public class ObjectConstructor implements TemplateMethodModelEx {
    @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
    public Object exec(List args) throws TemplateModelException {
        if (args.isEmpty()) {
            throw new TemplateModelException("This method must have at least one argument, the name of the class to instantiate.");
        }
        String classname = args.get(0).toString();
        try {
            Class cl = ClassUtil.forName(classname);
            BeansWrapper bw = BeansWrapper.getDefaultInstance();
            Object obj = bw.newInstance(cl, args.subList(1, args.size()));
            return bw.wrap(obj);
        } catch (Exception e) {
            throw new TemplateModelException(e.getMessage());
        }
    }
}

package freemarker.ext.servlet;

import freemarker.template.ObjectWrapper;
import freemarker.template.SimpleHash;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/servlet/AllHttpScopesHashModel.class */
public class AllHttpScopesHashModel extends SimpleHash {
    private final ServletContext context;
    private final HttpServletRequest request;
    private final Map unlistedModels = new HashMap();

    public AllHttpScopesHashModel(ObjectWrapper wrapper, ServletContext context, HttpServletRequest request) {
        setObjectWrapper(wrapper);
        this.context = context;
        this.request = request;
    }

    public void putUnlistedModel(String key, TemplateModel model) {
        this.unlistedModels.put(key, model);
    }

    @Override // freemarker.template.SimpleHash, freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        Object obj;
        TemplateModel model = super.get(key);
        if (model != null) {
            return model;
        }
        TemplateModel model2 = (TemplateModel) this.unlistedModels.get(key);
        if (model2 != null) {
            return model2;
        }
        Object obj2 = this.request.getAttribute(key);
        if (obj2 != null) {
            return wrap(obj2);
        }
        HttpSession session = this.request.getSession(false);
        if (session != null && (obj = session.getAttribute(key)) != null) {
            return wrap(obj);
        }
        Object obj3 = this.context.getAttribute(key);
        if (obj3 != null) {
            return wrap(obj3);
        }
        return wrap(null);
    }
}

package freemarker.template.utility;

import freemarker.core.Environment;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import java.util.ArrayList;
import java.util.HashMap;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/DeepUnwrap.class */
public class DeepUnwrap {
    private static final Class OBJECT_CLASS;
    static Class class$java$lang$Object;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        OBJECT_CLASS = cls;
    }

    public static Object unwrap(TemplateModel model) throws TemplateModelException {
        return unwrap(model, false);
    }

    public static Object permissiveUnwrap(TemplateModel model) throws TemplateModelException {
        return unwrap(model, true);
    }

    public static Object premissiveUnwrap(TemplateModel model) throws TemplateModelException {
        return unwrap(model, true);
    }

    private static Object unwrap(TemplateModel model, boolean permissive) throws TemplateModelException {
        ObjectWrapper wrapper;
        Environment env = Environment.getCurrentEnvironment();
        TemplateModel nullModel = null;
        if (env != null && (wrapper = env.getObjectWrapper()) != null) {
            nullModel = wrapper.wrap(null);
        }
        return unwrap(model, nullModel, permissive);
    }

    private static Object unwrap(TemplateModel model, TemplateModel nullModel, boolean permissive) throws TemplateModelException {
        if (model instanceof AdapterTemplateModel) {
            return ((AdapterTemplateModel) model).getAdaptedObject(OBJECT_CLASS);
        }
        if (model instanceof WrapperTemplateModel) {
            return ((WrapperTemplateModel) model).getWrappedObject();
        }
        if (model == nullModel) {
            return null;
        }
        if (model instanceof TemplateScalarModel) {
            return ((TemplateScalarModel) model).getAsString();
        }
        if (model instanceof TemplateNumberModel) {
            return ((TemplateNumberModel) model).getAsNumber();
        }
        if (model instanceof TemplateDateModel) {
            return ((TemplateDateModel) model).getAsDate();
        }
        if (model instanceof TemplateBooleanModel) {
            return ((TemplateBooleanModel) model).getAsBoolean() ? Boolean.TRUE : Boolean.FALSE;
        }
        if (model instanceof TemplateSequenceModel) {
            TemplateSequenceModel seq = (TemplateSequenceModel) model;
            ArrayList list = new ArrayList(seq.size());
            for (int i = 0; i < seq.size(); i++) {
                list.add(unwrap(seq.get(i), nullModel, permissive));
            }
            return list;
        }
        if (model instanceof TemplateCollectionModel) {
            TemplateCollectionModel coll = (TemplateCollectionModel) model;
            ArrayList list2 = new ArrayList();
            TemplateModelIterator it = coll.iterator();
            while (it.hasNext()) {
                list2.add(unwrap(it.next(), nullModel, permissive));
            }
            return list2;
        }
        if (model instanceof TemplateHashModelEx) {
            TemplateHashModelEx hash = (TemplateHashModelEx) model;
            HashMap map = new HashMap();
            TemplateModelIterator keys = hash.keys().iterator();
            while (keys.hasNext()) {
                String key = (String) unwrap(keys.next(), nullModel, permissive);
                map.put(key, unwrap(hash.get(key), nullModel, permissive));
            }
            return map;
        }
        if (permissive) {
            return model;
        }
        throw new TemplateModelException(new StringBuffer().append("Cannot deep-unwrap model of type ").append(model.getClass().getName()).toString());
    }
}

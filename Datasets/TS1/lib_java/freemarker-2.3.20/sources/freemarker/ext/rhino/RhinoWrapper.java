package freemarker.ext.rhino;

import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.util.ModelFactory;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.UndeclaredThrowableException;
import java.security.AccessController;
import java.security.PrivilegedExceptionAction;
import org.mozilla.javascript.UniqueTag;
import org.mozilla.javascript.Wrapper;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/rhino/RhinoWrapper.class */
public class RhinoWrapper extends BeansWrapper {
    private static final Object UNDEFINED_INSTANCE;
    static Class class$org$mozilla$javascript$Undefined;
    static Class class$org$mozilla$javascript$Scriptable;

    static {
        try {
            UNDEFINED_INSTANCE = AccessController.doPrivileged(new PrivilegedExceptionAction() { // from class: freemarker.ext.rhino.RhinoWrapper.1
                @Override // java.security.PrivilegedExceptionAction
                public Object run() throws Exception {
                    Class cls;
                    if (RhinoWrapper.class$org$mozilla$javascript$Undefined == null) {
                        cls = RhinoWrapper.class$("org.mozilla.javascript.Undefined");
                        RhinoWrapper.class$org$mozilla$javascript$Undefined = cls;
                    } else {
                        cls = RhinoWrapper.class$org$mozilla$javascript$Undefined;
                    }
                    return cls.getField("instance").get(null);
                }
            });
        } catch (RuntimeException e) {
            throw e;
        } catch (Exception e2) {
            throw new UndeclaredThrowableException(e2);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // freemarker.ext.beans.BeansWrapper, freemarker.template.ObjectWrapper
    public TemplateModel wrap(Object obj) throws TemplateModelException {
        if (obj == UNDEFINED_INSTANCE || obj == UniqueTag.NOT_FOUND) {
            return null;
        }
        if (obj == UniqueTag.NULL_VALUE) {
            return super.wrap(null);
        }
        if (obj instanceof Wrapper) {
            obj = ((Wrapper) obj).unwrap();
        }
        return super.wrap(obj);
    }

    @Override // freemarker.ext.beans.BeansWrapper
    protected ModelFactory getModelFactory(Class clazz) {
        Class cls;
        if (class$org$mozilla$javascript$Scriptable == null) {
            cls = class$("org.mozilla.javascript.Scriptable");
            class$org$mozilla$javascript$Scriptable = cls;
        } else {
            cls = class$org$mozilla$javascript$Scriptable;
        }
        if (cls.isAssignableFrom(clazz)) {
            return RhinoScriptableModel.FACTORY;
        }
        return super.getModelFactory(clazz);
    }
}

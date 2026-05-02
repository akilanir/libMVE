package freemarker.template;

import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.dom.NodeModel;
import java.lang.reflect.Array;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import org.w3c.dom.Node;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/DefaultObjectWrapper.class */
public class DefaultObjectWrapper extends BeansWrapper {
    static final DefaultObjectWrapper instance = new DefaultObjectWrapper();
    private static Class W3C_DOM_NODE_CLASS;
    private static Class JYTHON_OBJ_CLASS;
    private static ObjectWrapper JYTHON_WRAPPER;

    static {
        try {
            W3C_DOM_NODE_CLASS = Class.forName("org.w3c.dom.Node");
        } catch (Exception e) {
        }
        try {
            JYTHON_OBJ_CLASS = Class.forName("org.python.core.PyObject");
            JYTHON_WRAPPER = (ObjectWrapper) Class.forName("freemarker.ext.jython.JythonWrapper").getField("INSTANCE").get(null);
        } catch (Exception e2) {
        }
    }

    @Override // freemarker.ext.beans.BeansWrapper, freemarker.template.ObjectWrapper
    public TemplateModel wrap(Object obj) throws TemplateModelException {
        if (obj == null) {
            return super.wrap(null);
        }
        if (obj instanceof TemplateModel) {
            return (TemplateModel) obj;
        }
        if (obj instanceof String) {
            return new SimpleScalar((String) obj);
        }
        if (obj instanceof Number) {
            return new SimpleNumber((Number) obj);
        }
        if (obj instanceof Date) {
            if (obj instanceof java.sql.Date) {
                return new SimpleDate((java.sql.Date) obj);
            }
            if (obj instanceof Time) {
                return new SimpleDate((Time) obj);
            }
            if (obj instanceof Timestamp) {
                return new SimpleDate((Timestamp) obj);
            }
            return new SimpleDate((Date) obj, getDefaultDateType());
        }
        if (obj.getClass().isArray()) {
            obj = convertArray(obj);
        }
        if (obj instanceof Collection) {
            return new SimpleSequence((Collection) obj, this);
        }
        if (obj instanceof Map) {
            return new SimpleHash((Map) obj, this);
        }
        if (obj instanceof Boolean) {
            return obj.equals(Boolean.TRUE) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
        }
        if (obj instanceof Iterator) {
            return new SimpleCollection((Iterator) obj, this);
        }
        return handleUnknownType(obj);
    }

    protected TemplateModel handleUnknownType(Object obj) throws TemplateModelException {
        if (W3C_DOM_NODE_CLASS != null && W3C_DOM_NODE_CLASS.isInstance(obj)) {
            return wrapDomNode(obj);
        }
        if (JYTHON_WRAPPER != null && JYTHON_OBJ_CLASS.isInstance(obj)) {
            return JYTHON_WRAPPER.wrap(obj);
        }
        return super.wrap(obj);
    }

    public TemplateModel wrapDomNode(Object obj) {
        return NodeModel.wrap((Node) obj);
    }

    protected Object convertArray(Object arr) {
        int size = Array.getLength(arr);
        ArrayList list = new ArrayList(size);
        for (int i = 0; i < size; i++) {
            list.add(Array.get(arr, i));
        }
        return list;
    }
}

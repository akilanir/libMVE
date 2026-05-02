package freemarker.ext.jython;

import freemarker.ext.util.ModelCache;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelAdapter;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.OptimizerUtil;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import org.python.core.Py;
import org.python.core.PyInteger;
import org.python.core.PyLong;
import org.python.core.PyObject;
import org.python.core.PyString;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonWrapper.class */
public class JythonWrapper implements ObjectWrapper {
    private static final Class PYOBJECT_CLASS;
    public static final JythonWrapper INSTANCE;
    private final ModelCache modelCache = new JythonModelCache(this);
    private boolean attributesShadowItems = true;
    static Class class$org$python$core$PyObject;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        if (class$org$python$core$PyObject == null) {
            cls = class$("org.python.core.PyObject");
            class$org$python$core$PyObject = cls;
        } else {
            cls = class$org$python$core$PyObject;
        }
        PYOBJECT_CLASS = cls;
        INSTANCE = new JythonWrapper();
    }

    public void setUseCache(boolean useCache) {
        this.modelCache.setUseCache(useCache);
    }

    public synchronized void setAttributesShadowItems(boolean attributesShadowItems) {
        this.attributesShadowItems = attributesShadowItems;
    }

    boolean isAttributesShadowItems() {
        return this.attributesShadowItems;
    }

    @Override // freemarker.template.ObjectWrapper
    public TemplateModel wrap(Object obj) {
        if (obj == null) {
            return null;
        }
        return this.modelCache.getInstance(obj);
    }

    public PyObject unwrap(TemplateModel model) throws TemplateModelException {
        if (model instanceof AdapterTemplateModel) {
            return Py.java2py(((AdapterTemplateModel) model).getAdaptedObject(PYOBJECT_CLASS));
        }
        if (model instanceof WrapperTemplateModel) {
            return Py.java2py(((WrapperTemplateModel) model).getWrappedObject());
        }
        if (model instanceof TemplateScalarModel) {
            return new PyString(((TemplateScalarModel) model).getAsString());
        }
        if (model instanceof TemplateNumberModel) {
            Number number = ((TemplateNumberModel) model).getAsNumber();
            if (number instanceof BigDecimal) {
                number = OptimizerUtil.optimizeNumberRepresentation(number);
            }
            if (number instanceof BigInteger) {
                return new PyLong((BigInteger) number);
            }
            return Py.java2py(number);
        }
        return new TemplateModelToJythonAdapter(this, model);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter.class */
    private class TemplateModelToJythonAdapter extends PyObject implements TemplateModelAdapter {
        private final TemplateModel model;
        private final JythonWrapper this$0;

        TemplateModelToJythonAdapter(JythonWrapper jythonWrapper, TemplateModel model) {
            this.this$0 = jythonWrapper;
            this.model = model;
        }

        @Override // freemarker.template.TemplateModelAdapter
        public TemplateModel getTemplateModel() {
            return this.model;
        }

        public PyObject __finditem__(PyObject key) {
            if (key instanceof PyInteger) {
                return __finditem__(((PyInteger) key).getValue());
            }
            return __finditem__(key.toString());
        }

        public PyObject __finditem__(String key) {
            if (this.model instanceof TemplateHashModel) {
                try {
                    return this.this$0.unwrap(((TemplateHashModel) this.model).get(key));
                } catch (TemplateModelException e) {
                    throw Py.JavaError(e);
                }
            }
            throw Py.TypeError(new StringBuffer().append("item lookup on non-hash model (").append(getModelClass()).append(")").toString());
        }

        public PyObject __finditem__(int index) {
            if (this.model instanceof TemplateSequenceModel) {
                try {
                    return this.this$0.unwrap(((TemplateSequenceModel) this.model).get(index));
                } catch (TemplateModelException e) {
                    throw Py.JavaError(e);
                }
            }
            throw Py.TypeError(new StringBuffer().append("item lookup on non-sequence model (").append(getModelClass()).append(")").toString());
        }

        public PyObject __call__(PyObject[] args, String[] keywords) {
            if (this.model instanceof TemplateMethodModel) {
                boolean isEx = this.model instanceof TemplateMethodModelEx;
                List list = new ArrayList(args.length);
                for (int i = 0; i < args.length; i++) {
                    try {
                        list.add(isEx ? this.this$0.wrap(args[i]) : args[i] == null ? null : args[i].toString());
                    } catch (TemplateModelException e) {
                        throw Py.JavaError(e);
                    }
                }
                return this.this$0.unwrap((TemplateModel) ((TemplateMethodModelEx) this.model).exec(list));
            }
            throw Py.TypeError(new StringBuffer().append("call of non-method model (").append(getModelClass()).append(")").toString());
        }

        public int __len__() {
            try {
                if (this.model instanceof TemplateSequenceModel) {
                    return ((TemplateSequenceModel) this.model).size();
                }
                if (this.model instanceof TemplateHashModelEx) {
                    return ((TemplateHashModelEx) this.model).size();
                }
                return 0;
            } catch (TemplateModelException e) {
                throw Py.JavaError(e);
            }
        }

        public boolean __nonzero__() {
            try {
                if (this.model instanceof TemplateBooleanModel) {
                    return ((TemplateBooleanModel) this.model).getAsBoolean();
                }
                return this.model instanceof TemplateSequenceModel ? ((TemplateSequenceModel) this.model).size() > 0 : (this.model instanceof TemplateHashModel) && !((TemplateHashModelEx) this.model).isEmpty();
            } catch (TemplateModelException e) {
                throw Py.JavaError(e);
            }
        }

        private String getModelClass() {
            return this.model == null ? "null" : this.model.getClass().getName();
        }
    }
}

package freemarker.ext.jython;

import freemarker.ext.util.ModelFactory;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import java.util.Iterator;
import java.util.List;
import org.python.core.Py;
import org.python.core.PyException;
import org.python.core.PyObject;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonModel.class */
public class JythonModel implements TemplateBooleanModel, TemplateScalarModel, TemplateHashModel, TemplateMethodModelEx, AdapterTemplateModel, WrapperTemplateModel {
    protected final PyObject object;
    protected final JythonWrapper wrapper;
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.jython.JythonModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new JythonModel((PyObject) object, (JythonWrapper) wrapper);
        }
    };
    static Class class$java$lang$Object;

    public JythonModel(PyObject object, JythonWrapper wrapper) {
        this.object = object;
        this.wrapper = wrapper;
    }

    @Override // freemarker.template.TemplateBooleanModel
    public boolean getAsBoolean() throws TemplateModelException {
        try {
            return this.object.__nonzero__();
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() throws TemplateModelException {
        try {
            return this.object.toString();
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        PyObject obj;
        if (key != null) {
            key = key.intern();
        }
        try {
            if (this.wrapper.isAttributesShadowItems()) {
                obj = this.object.__findattr__(key);
                if (obj == null) {
                    obj = this.object.__finditem__(key);
                }
            } else {
                obj = this.object.__finditem__(key);
                if (obj == null) {
                    obj = this.object.__findattr__(key);
                }
            }
            return this.wrapper.wrap(obj);
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() throws TemplateModelException {
        try {
            return this.object.__len__() == 0;
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
    public Object exec(List arguments) throws TemplateModelException {
        int size = arguments.size();
        try {
            switch (size) {
                case 0:
                    return this.wrapper.wrap(this.object.__call__());
                case 1:
                    return this.wrapper.wrap(this.object.__call__(this.wrapper.unwrap((TemplateModel) arguments.get(0))));
                default:
                    PyObject[] pyargs = new PyObject[size];
                    int i = 0;
                    Iterator arg = arguments.iterator();
                    while (arg.hasNext()) {
                        int i2 = i;
                        i++;
                        pyargs[i2] = this.wrapper.unwrap((TemplateModel) arg.next());
                    }
                    return this.wrapper.wrap(this.object.__call__(pyargs));
            }
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.AdapterTemplateModel
    public Object getAdaptedObject(Class hint) {
        Class cls;
        if (this.object == null) {
            return null;
        }
        Object view = this.object.__tojava__(hint);
        if (view == Py.NoConversion) {
            PyObject pyObject = this.object;
            if (class$java$lang$Object == null) {
                cls = class$("java.lang.Object");
                class$java$lang$Object = cls;
            } else {
                cls = class$java$lang$Object;
            }
            view = pyObject.__tojava__(cls);
        }
        return view;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // freemarker.ext.util.WrapperTemplateModel
    public Object getWrappedObject() {
        Class cls;
        if (this.object == null) {
            return null;
        }
        PyObject pyObject = this.object;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        return pyObject.__tojava__(cls);
    }
}

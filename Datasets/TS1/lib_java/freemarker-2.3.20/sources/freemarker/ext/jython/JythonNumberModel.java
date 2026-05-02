package freemarker.ext.jython;

import freemarker.ext.util.ModelFactory;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import org.python.core.Py;
import org.python.core.PyException;
import org.python.core.PyObject;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonNumberModel.class */
public class JythonNumberModel extends JythonModel implements TemplateNumberModel {
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.jython.JythonNumberModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new JythonNumberModel((PyObject) object, (JythonWrapper) wrapper);
        }
    };
    static Class class$java$lang$Number;

    public JythonNumberModel(PyObject object, JythonWrapper wrapper) {
        super(object, wrapper);
    }

    @Override // freemarker.template.TemplateNumberModel
    public Number getAsNumber() throws TemplateModelException {
        Class cls;
        try {
            PyObject pyObject = this.object;
            if (class$java$lang$Number == null) {
                cls = class$("java.lang.Number");
                class$java$lang$Number = cls;
            } else {
                cls = class$java$lang$Number;
            }
            Object value = pyObject.__tojava__(cls);
            if (value == null || value == Py.NoConversion) {
                return new Double(this.object.__float__().getValue());
            }
            return (Number) value;
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}

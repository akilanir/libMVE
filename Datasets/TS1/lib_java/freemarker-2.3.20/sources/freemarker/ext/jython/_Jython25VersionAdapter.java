package freemarker.ext.jython;

import org.python.core.PyInstance;
import org.python.core.PyObject;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/_Jython25VersionAdapter.class */
public class _Jython25VersionAdapter extends JythonVersionAdapter {
    static Class class$java$lang$Object;

    @Override // freemarker.ext.jython.JythonVersionAdapter
    public boolean isPyInstance(Object obj) {
        return obj instanceof PyInstance;
    }

    @Override // freemarker.ext.jython.JythonVersionAdapter
    public Object pyInstanceToJava(Object pyInstance) {
        Class cls;
        PyInstance pyInstance2 = (PyInstance) pyInstance;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        return pyInstance2.__tojava__(cls);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // freemarker.ext.jython.JythonVersionAdapter
    public String getPythonClassName(PyObject pyObject) {
        return pyObject.getType().getName();
    }
}

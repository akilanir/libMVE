package freemarker.ext.jython;

import org.python.core.PyObject;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonVersionAdapter.class */
public abstract class JythonVersionAdapter {
    public abstract boolean isPyInstance(Object obj);

    public abstract Object pyInstanceToJava(Object obj);

    public abstract String getPythonClassName(PyObject pyObject);
}

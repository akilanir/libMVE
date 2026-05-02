package freemarker.ext.jython;

import freemarker.template.utility.StringUtil;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonVersionAdapterHolder.class */
class JythonVersionAdapterHolder {
    static final JythonVersionAdapter INSTANCE;
    static Class class$org$python$core$PySystemState;
    static Class class$freemarker$ext$jython$JythonVersionAdapter;

    JythonVersionAdapterHolder() {
    }

    static {
        Class cls;
        Class cls2;
        try {
            if (class$org$python$core$PySystemState == null) {
                cls = class$("org.python.core.PySystemState");
                class$org$python$core$PySystemState = cls;
            } else {
                cls = class$org$python$core$PySystemState;
            }
            int version = StringUtil.versionStringToInt(cls.getField("version").get(null).toString());
            if (class$freemarker$ext$jython$JythonVersionAdapter == null) {
                cls2 = class$("freemarker.ext.jython.JythonVersionAdapter");
                class$freemarker$ext$jython$JythonVersionAdapter = cls2;
            } else {
                cls2 = class$freemarker$ext$jython$JythonVersionAdapter;
            }
            ClassLoader cl = cls2.getClassLoader();
            try {
                if (version >= 2005000) {
                    INSTANCE = (JythonVersionAdapter) cl.loadClass("freemarker.ext.jython._Jython25VersionAdapter").newInstance();
                } else if (version >= 2002000) {
                    INSTANCE = (JythonVersionAdapter) cl.loadClass("freemarker.ext.jython._Jython22VersionAdapter").newInstance();
                } else {
                    INSTANCE = (JythonVersionAdapter) cl.loadClass("freemarker.ext.jython._Jython20And21VersionAdapter").newInstance();
                }
            } catch (ClassNotFoundException e) {
                throw adapterCreationException(e);
            } catch (IllegalAccessException e2) {
                throw adapterCreationException(e2);
            } catch (InstantiationException e3) {
                throw adapterCreationException(e3);
            }
        } catch (Exception e4) {
            throw new RuntimeException(new StringBuffer().append("Failed to get Jython version: ").append(e4).toString());
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private static RuntimeException adapterCreationException(Exception e) {
        return new RuntimeException(new StringBuffer().append("Unexpected exception when creating JythonVersionAdapter: ").append(e).toString());
    }
}

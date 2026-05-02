package ch.qos.logback.classic.spi;

import java.net.URL;
import java.security.CodeSource;
import java.util.HashMap;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/PackagingDataCalculator.class */
public class PackagingDataCalculator {
    static final StackTraceElementProxy[] STEP_ARRAY_TEMPLATE = new StackTraceElementProxy[0];
    HashMap<String, ClassPackagingData> cache = new HashMap<>();

    public void calculate(IThrowableProxy iThrowableProxy) {
        while (iThrowableProxy != null) {
            populateFrames(iThrowableProxy.getStackTraceElementProxyArray());
            IThrowableProxy[] suppressed = iThrowableProxy.getSuppressed();
            if (suppressed != null) {
                for (IThrowableProxy iThrowableProxy2 : suppressed) {
                    populateFrames(iThrowableProxy2.getStackTraceElementProxyArray());
                }
            }
            iThrowableProxy = iThrowableProxy.getCause();
        }
    }

    void populateFrames(StackTraceElementProxy[] stackTraceElementProxyArr) {
        int findNumberOfCommonFrames = STEUtil.findNumberOfCommonFrames(new Throwable("local stack reference").getStackTrace(), stackTraceElementProxyArr);
        int length = stackTraceElementProxyArr.length - findNumberOfCommonFrames;
        for (int i = 0; i < findNumberOfCommonFrames; i++) {
            StackTraceElementProxy stackTraceElementProxy = stackTraceElementProxyArr[length + i];
            stackTraceElementProxy.setClassPackagingData(computeBySTEP(stackTraceElementProxy, null));
        }
        populateUncommonFrames(findNumberOfCommonFrames, stackTraceElementProxyArr, null);
    }

    void populateUncommonFrames(int i, StackTraceElementProxy[] stackTraceElementProxyArr, ClassLoader classLoader) {
        int length = stackTraceElementProxyArr.length - i;
        for (int i2 = 0; i2 < length; i2++) {
            StackTraceElementProxy stackTraceElementProxy = stackTraceElementProxyArr[i2];
            stackTraceElementProxy.setClassPackagingData(computeBySTEP(stackTraceElementProxy, classLoader));
        }
    }

    private ClassPackagingData computeBySTEP(StackTraceElementProxy stackTraceElementProxy, ClassLoader classLoader) {
        String className = stackTraceElementProxy.ste.getClassName();
        ClassPackagingData classPackagingData = this.cache.get(className);
        if (classPackagingData != null) {
            return classPackagingData;
        }
        Class bestEffortLoadClass = bestEffortLoadClass(classLoader, className);
        ClassPackagingData classPackagingData2 = new ClassPackagingData(getCodeLocation(bestEffortLoadClass), getImplementationVersion(bestEffortLoadClass), false);
        this.cache.put(className, classPackagingData2);
        return classPackagingData2;
    }

    String getImplementationVersion(Class cls) {
        Package r0;
        String implementationVersion;
        return (cls == null || (r0 = cls.getPackage()) == null || (implementationVersion = r0.getImplementationVersion()) == null) ? "na" : implementationVersion;
    }

    String getCodeLocation(Class cls) {
        URL location;
        if (cls == null) {
            return "na";
        }
        try {
            CodeSource codeSource = cls.getProtectionDomain().getCodeSource();
            if (codeSource == null || (location = codeSource.getLocation()) == null) {
                return "na";
            }
            String url = location.toString();
            String codeLocation = getCodeLocation(url, '/');
            return codeLocation != null ? codeLocation : getCodeLocation(url, '\\');
        } catch (Exception e) {
            return "na";
        }
    }

    private String getCodeLocation(String str, char c) {
        int lastIndexOf = str.lastIndexOf(c);
        if (isFolder(lastIndexOf, str)) {
            return str.substring(str.lastIndexOf(c, lastIndexOf - 1) + 1);
        }
        if (lastIndexOf > 0) {
            return str.substring(lastIndexOf + 1);
        }
        return null;
    }

    private boolean isFolder(int i, String str) {
        return i != -1 && i + 1 == str.length();
    }

    private Class loadClass(ClassLoader classLoader, String str) {
        if (classLoader == null) {
            return null;
        }
        try {
            return classLoader.loadClass(str);
        } catch (ClassNotFoundException e) {
            return null;
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        } catch (NoClassDefFoundError e3) {
            return null;
        }
    }

    private Class bestEffortLoadClass(ClassLoader classLoader, String str) {
        Class loadClass = loadClass(classLoader, str);
        if (loadClass != null) {
            return loadClass;
        }
        ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
        if (contextClassLoader != classLoader) {
            loadClass = loadClass(contextClassLoader, str);
        }
        if (loadClass != null) {
            return loadClass;
        }
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            return null;
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        } catch (NoClassDefFoundError e3) {
            return null;
        }
    }
}

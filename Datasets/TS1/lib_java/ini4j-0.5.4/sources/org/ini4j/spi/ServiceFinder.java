package org.ini4j.spi;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.GenericDeclaration;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/ServiceFinder.class */
final class ServiceFinder {
    private static final String SERVICES_PATH = "META-INF/services/";

    private ServiceFinder() {
    }

    static <T> T findService(Class<T> clazz) {
        try {
            return clazz.cast(findServiceClass(clazz).newInstance());
        } catch (Exception x) {
            throw ((IllegalArgumentException) new IllegalArgumentException("Provider " + clazz.getName() + " could not be instantiated: " + x).initCause(x));
        }
    }

    static <T> Class<? extends T> findServiceClass(Class<T> cls) throws IllegalArgumentException {
        ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
        String findServiceClassName = findServiceClassName(cls.getName());
        GenericDeclaration genericDeclaration = cls;
        if (findServiceClassName != null) {
            try {
                genericDeclaration = contextClassLoader == null ? Class.forName(findServiceClassName) : contextClassLoader.loadClass(findServiceClassName);
            } catch (ClassNotFoundException e) {
                throw ((IllegalArgumentException) new IllegalArgumentException("Provider " + findServiceClassName + " not found").initCause(e));
            }
        }
        return (Class<? extends T>) genericDeclaration;
    }

    static String findServiceClassName(String serviceId) throws IllegalArgumentException {
        String serviceClassName = null;
        try {
            String systemProp = System.getProperty(serviceId);
            if (systemProp != null) {
                serviceClassName = systemProp;
            }
        } catch (SecurityException e) {
        }
        if (serviceClassName == null) {
            serviceClassName = loadLine(SERVICES_PATH + serviceId);
        }
        return serviceClassName;
    }

    private static String loadLine(String servicePath) {
        InputStream is;
        String ret = null;
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            if (classLoader == null) {
                is = ClassLoader.getSystemResourceAsStream(servicePath);
            } else {
                is = classLoader.getResourceAsStream(servicePath);
            }
            if (is != null) {
                BufferedReader rd = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                String line = rd.readLine();
                rd.close();
                if (line != null) {
                    String line2 = line.trim();
                    if (line2.length() != 0) {
                        ret = line2.split("\\s|#")[0];
                    }
                }
            }
        } catch (Exception e) {
        }
        return ret;
    }
}

package org.acra.util;

/* loaded from: acra-4.6.2.jar:org/acra/util/ReflectionHelper.class */
public final class ReflectionHelper {
    public Object create(String className) throws ReflectionException {
        try {
            Class clazz = Class.forName(className);
            return clazz.newInstance();
        } catch (ClassNotFoundException e) {
            throw new ReflectionException("Could not find class : " + className, e);
        } catch (IllegalAccessException e2) {
            throw new ReflectionException("Could not access class : " + className, e2);
        } catch (InstantiationException e3) {
            throw new ReflectionException("Could not instantiate class : " + className, e3);
        }
    }
}

package com.alibaba.fastjson.util;

import com.alibaba.fastjson.JSON;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.security.ProtectionDomain;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/util/ASMClassLoader.class */
public class ASMClassLoader extends ClassLoader {
    private static ProtectionDomain DOMAIN = (ProtectionDomain) AccessController.doPrivileged(new PrivilegedAction<Object>() { // from class: com.alibaba.fastjson.util.ASMClassLoader.1
        @Override // java.security.PrivilegedAction
        public Object run() {
            return ASMClassLoader.class.getProtectionDomain();
        }
    });

    public ASMClassLoader() {
        super(getParentClassLoader());
    }

    public ASMClassLoader(ClassLoader parent) {
        super(parent);
    }

    static ClassLoader getParentClassLoader() {
        ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
        if (contextClassLoader != null) {
            try {
                contextClassLoader.loadClass(JSON.class.getName());
                return contextClassLoader;
            } catch (ClassNotFoundException e) {
            }
        }
        return JSON.class.getClassLoader();
    }

    public Class<?> defineClassPublic(String name, byte[] b, int off, int len) throws ClassFormatError {
        Class<?> clazz = defineClass(name, b, off, len, DOMAIN);
        return clazz;
    }

    public boolean isExternalClass(Class<?> clazz) {
        ClassLoader classLoader = clazz.getClassLoader();
        if (classLoader == null) {
            return false;
        }
        ClassLoader classLoader2 = this;
        while (true) {
            ClassLoader current = classLoader2;
            if (current != null) {
                if (current == classLoader) {
                    return false;
                }
                classLoader2 = current.getParent();
            } else {
                return true;
            }
        }
    }
}

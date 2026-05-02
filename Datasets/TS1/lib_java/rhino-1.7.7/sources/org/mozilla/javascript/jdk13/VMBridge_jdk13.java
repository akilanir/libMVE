package org.mozilla.javascript.jdk13;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextFactory;
import org.mozilla.javascript.InterfaceAdapter;
import org.mozilla.javascript.Kit;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.VMBridge;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/jdk13/VMBridge_jdk13.class */
public class VMBridge_jdk13 extends VMBridge {
    private ThreadLocal<Object[]> contextLocal = new ThreadLocal<>();

    @Override // org.mozilla.javascript.VMBridge
    protected Object getThreadContextHelper() {
        Object[] storage = this.contextLocal.get();
        if (storage == null) {
            storage = new Object[1];
            this.contextLocal.set(storage);
        }
        return storage;
    }

    @Override // org.mozilla.javascript.VMBridge
    protected Context getContext(Object contextHelper) {
        Object[] storage = (Object[]) contextHelper;
        return (Context) storage[0];
    }

    @Override // org.mozilla.javascript.VMBridge
    protected void setContext(Object contextHelper, Context cx) {
        Object[] storage = (Object[]) contextHelper;
        storage[0] = cx;
    }

    @Override // org.mozilla.javascript.VMBridge
    protected ClassLoader getCurrentThreadClassLoader() {
        return Thread.currentThread().getContextClassLoader();
    }

    @Override // org.mozilla.javascript.VMBridge
    protected boolean tryToMakeAccessible(Object accessibleObject) {
        if (!(accessibleObject instanceof AccessibleObject)) {
            return false;
        }
        AccessibleObject accessible = (AccessibleObject) accessibleObject;
        if (accessible.isAccessible()) {
            return true;
        }
        try {
            accessible.setAccessible(true);
        } catch (Exception e) {
        }
        return accessible.isAccessible();
    }

    @Override // org.mozilla.javascript.VMBridge
    protected Object getInterfaceProxyHelper(ContextFactory cf, Class<?>[] interfaces) {
        ClassLoader loader = interfaces[0].getClassLoader();
        Class<?> cl = Proxy.getProxyClass(loader, interfaces);
        try {
            Constructor<?> c = cl.getConstructor(InvocationHandler.class);
            return c;
        } catch (NoSuchMethodException ex) {
            throw Kit.initCause(new IllegalStateException(), ex);
        }
    }

    @Override // org.mozilla.javascript.VMBridge
    protected Object newInterfaceProxy(Object proxyHelper, final ContextFactory cf, final InterfaceAdapter adapter, final Object target, final Scriptable topScope) {
        Constructor<?> c = (Constructor) proxyHelper;
        InvocationHandler handler = new InvocationHandler() { // from class: org.mozilla.javascript.jdk13.VMBridge_jdk13.1
            @Override // java.lang.reflect.InvocationHandler
            public Object invoke(Object proxy, Method method, Object[] args) {
                if (method.getDeclaringClass() == Object.class) {
                    String methodName = method.getName();
                    if (methodName.equals("equals")) {
                        Object other = args[0];
                        return Boolean.valueOf(proxy == other);
                    }
                    if (methodName.equals("hashCode")) {
                        return Integer.valueOf(target.hashCode());
                    }
                    if (methodName.equals("toString")) {
                        return "Proxy[" + target.toString() + "]";
                    }
                }
                return adapter.invoke(cf, target, topScope, proxy, method, args);
            }
        };
        try {
            Object proxy = c.newInstance(handler);
            return proxy;
        } catch (IllegalAccessException ex) {
            throw Kit.initCause(new IllegalStateException(), ex);
        } catch (InstantiationException ex2) {
            throw Kit.initCause(new IllegalStateException(), ex2);
        } catch (InvocationTargetException ex3) {
            throw Context.throwAsScriptRuntimeEx(ex3);
        }
    }

    @Override // org.mozilla.javascript.VMBridge
    protected boolean isVarArgs(Member member) {
        return false;
    }
}

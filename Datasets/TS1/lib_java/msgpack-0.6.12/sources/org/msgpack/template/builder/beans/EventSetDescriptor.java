package org.msgpack.template.builder.beans;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TooManyListenersException;
import org.apache.harmony.beans.BeansUtils;
import org.apache.harmony.beans.internal.nls.Messages;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/EventSetDescriptor.class */
public class EventSetDescriptor extends FeatureDescriptor {
    private Class<?> listenerType;
    private ArrayList<MethodDescriptor> listenerMethodDescriptors;
    private Method[] listenerMethods;
    private Method getListenerMethod;
    private Method addListenerMethod;
    private Method removeListenerMethod;
    private boolean unicast;
    private boolean inDefaultEventSet;

    public EventSetDescriptor(Class<?> sourceClass, String eventSetName, Class<?> listenerType, String listenerMethodName) throws IntrospectionException {
        this.inDefaultEventSet = true;
        checkNotNull(sourceClass, eventSetName, listenerType, listenerMethodName);
        setName(eventSetName);
        this.listenerType = listenerType;
        Method method = findListenerMethodByName(listenerMethodName);
        checkEventType(eventSetName, method);
        this.listenerMethodDescriptors = new ArrayList<>();
        this.listenerMethodDescriptors.add(new MethodDescriptor(method));
        this.addListenerMethod = findMethodByPrefix(sourceClass, BeansUtils.ADD, "");
        this.removeListenerMethod = findMethodByPrefix(sourceClass, "remove", "");
        if (this.addListenerMethod == null || this.removeListenerMethod == null) {
            throw new IntrospectionException(Messages.getString("custom.beans.38"));
        }
        this.getListenerMethod = findMethodByPrefix(sourceClass, BeansUtils.GET, "s");
        this.unicast = isUnicastByDefault(this.addListenerMethod);
    }

    public EventSetDescriptor(Class<?> sourceClass, String eventSetName, Class<?> listenerType, String[] listenerMethodNames, String addListenerMethodName, String removeListenerMethodName) throws IntrospectionException {
        this(sourceClass, eventSetName, listenerType, listenerMethodNames, addListenerMethodName, removeListenerMethodName, null);
    }

    public EventSetDescriptor(Class<?> sourceClass, String eventSetName, Class<?> listenerType, String[] listenerMethodNames, String addListenerMethodName, String removeListenerMethodName, String getListenerMethodName) throws IntrospectionException {
        this.inDefaultEventSet = true;
        checkNotNull(sourceClass, eventSetName, listenerType, listenerMethodNames);
        setName(eventSetName);
        this.listenerType = listenerType;
        this.listenerMethodDescriptors = new ArrayList<>();
        for (String element : listenerMethodNames) {
            Method m = findListenerMethodByName(element);
            this.listenerMethodDescriptors.add(new MethodDescriptor(m));
        }
        if (addListenerMethodName != null) {
            this.addListenerMethod = findAddRemoveListenerMethod(sourceClass, addListenerMethodName);
        }
        if (removeListenerMethodName != null) {
            this.removeListenerMethod = findAddRemoveListenerMethod(sourceClass, removeListenerMethodName);
        }
        if (getListenerMethodName != null) {
            this.getListenerMethod = findGetListenerMethod(sourceClass, getListenerMethodName);
        }
        this.unicast = isUnicastByDefault(this.addListenerMethod);
    }

    private Method findListenerMethodByName(String listenerMethodName) throws IntrospectionException {
        Method result = null;
        Method[] methods = this.listenerType.getMethods();
        int len$ = methods.length;
        int i$ = 0;
        while (true) {
            if (i$ >= len$) {
                break;
            }
            Method method = methods[i$];
            if (listenerMethodName.equals(method.getName())) {
                Class<?>[] paramTypes = method.getParameterTypes();
                if (paramTypes.length == 1 && paramTypes[0].getName().endsWith("Event")) {
                    result = method;
                    break;
                }
            }
            i$++;
        }
        if (null == result) {
            throw new IntrospectionException(Messages.getString("custom.beans.31", listenerMethodName, this.listenerType.getName()));
        }
        return result;
    }

    public EventSetDescriptor(String eventSetName, Class<?> listenerType, Method[] listenerMethods, Method addListenerMethod, Method removeListenerMethod) throws IntrospectionException {
        this(eventSetName, listenerType, listenerMethods, addListenerMethod, removeListenerMethod, (Method) null);
    }

    public EventSetDescriptor(String eventSetName, Class<?> listenerType, Method[] listenerMethods, Method addListenerMethod, Method removeListenerMethod, Method getListenerMethod) throws IntrospectionException {
        this.inDefaultEventSet = true;
        setName(eventSetName);
        this.listenerType = listenerType;
        this.listenerMethods = listenerMethods;
        if (listenerMethods != null) {
            this.listenerMethodDescriptors = new ArrayList<>();
            for (Method element : listenerMethods) {
                this.listenerMethodDescriptors.add(new MethodDescriptor(element));
            }
        }
        this.addListenerMethod = addListenerMethod;
        this.removeListenerMethod = removeListenerMethod;
        this.getListenerMethod = getListenerMethod;
        this.unicast = isUnicastByDefault(addListenerMethod);
    }

    public EventSetDescriptor(String eventSetName, Class<?> listenerType, MethodDescriptor[] listenerMethodDescriptors, Method addListenerMethod, Method removeListenerMethod) throws IntrospectionException {
        this(eventSetName, listenerType, (Method[]) null, addListenerMethod, removeListenerMethod, (Method) null);
        if (listenerMethodDescriptors != null) {
            this.listenerMethodDescriptors = new ArrayList<>();
            for (MethodDescriptor element : listenerMethodDescriptors) {
                this.listenerMethodDescriptors.add(element);
            }
        }
    }

    private void checkNotNull(Object sourceClass, Object eventSetName, Object alistenerType, Object listenerMethodName) {
        if (sourceClass == null) {
            throw new NullPointerException(Messages.getString("custom.beans.0C"));
        }
        if (eventSetName == null) {
            throw new NullPointerException(Messages.getString("custom.beans.53"));
        }
        if (alistenerType == null) {
            throw new NullPointerException(Messages.getString("custom.beans.54"));
        }
        if (listenerMethodName == null) {
            throw new NullPointerException(Messages.getString("custom.beans.52"));
        }
    }

    private static void checkEventType(String eventSetName, Method listenerMethod) throws IntrospectionException {
        Class<?>[] params = listenerMethod.getParameterTypes();
        String firstParamTypeName = null;
        String eventTypeName = prepareEventTypeName(eventSetName);
        if (params.length > 0) {
            firstParamTypeName = extractShortClassName(params[0].getName());
        }
        if (firstParamTypeName == null || !firstParamTypeName.equals(eventTypeName)) {
            throw new IntrospectionException(Messages.getString("custom.beans.51", listenerMethod.getName(), eventTypeName));
        }
    }

    private static String extractShortClassName(String fullClassName) {
        int k = fullClassName.lastIndexOf(36);
        return fullClassName.substring((k == -1 ? fullClassName.lastIndexOf(46) : k) + 1);
    }

    private static String prepareEventTypeName(String eventSetName) {
        StringBuilder sb = new StringBuilder();
        if (eventSetName != null && eventSetName.length() > 0) {
            sb.append(Character.toUpperCase(eventSetName.charAt(0)));
            if (eventSetName.length() > 1) {
                sb.append(eventSetName.substring(1));
            }
        }
        sb.append("Event");
        return sb.toString();
    }

    public Method[] getListenerMethods() {
        if (this.listenerMethods != null) {
            return this.listenerMethods;
        }
        if (this.listenerMethodDescriptors != null) {
            this.listenerMethods = new Method[this.listenerMethodDescriptors.size()];
            int index = 0;
            Iterator i$ = this.listenerMethodDescriptors.iterator();
            while (i$.hasNext()) {
                MethodDescriptor md = i$.next();
                int i = index;
                index++;
                this.listenerMethods[i] = md.getMethod();
            }
            return this.listenerMethods;
        }
        return null;
    }

    public MethodDescriptor[] getListenerMethodDescriptors() {
        if (this.listenerMethodDescriptors == null) {
            return null;
        }
        return (MethodDescriptor[]) this.listenerMethodDescriptors.toArray(new MethodDescriptor[0]);
    }

    public Method getRemoveListenerMethod() {
        return this.removeListenerMethod;
    }

    public Method getGetListenerMethod() {
        return this.getListenerMethod;
    }

    public Method getAddListenerMethod() {
        return this.addListenerMethod;
    }

    public Class<?> getListenerType() {
        return this.listenerType;
    }

    public void setUnicast(boolean unicast) {
        this.unicast = unicast;
    }

    public void setInDefaultEventSet(boolean inDefaultEventSet) {
        this.inDefaultEventSet = inDefaultEventSet;
    }

    public boolean isUnicast() {
        return this.unicast;
    }

    public boolean isInDefaultEventSet() {
        return this.inDefaultEventSet;
    }

    private Method findAddRemoveListenerMethod(Class<?> sourceClass, String methodName) throws IntrospectionException {
        try {
            return sourceClass.getMethod(methodName, this.listenerType);
        } catch (NoSuchMethodException e) {
            return findAddRemoveListnerMethodWithLessCheck(sourceClass, methodName);
        } catch (Exception e2) {
            throw new IntrospectionException(Messages.getString("custom.beans.31", methodName, this.listenerType.getName()));
        }
    }

    private Method findAddRemoveListnerMethodWithLessCheck(Class<?> sourceClass, String methodName) throws IntrospectionException {
        Method[] methods = sourceClass.getMethods();
        Method result = null;
        int len$ = methods.length;
        int i$ = 0;
        while (true) {
            if (i$ >= len$) {
                break;
            }
            Method method = methods[i$];
            if (method.getName().equals(methodName)) {
                Class<?>[] paramTypes = method.getParameterTypes();
                if (paramTypes.length == 1) {
                    result = method;
                    break;
                }
            }
            i$++;
        }
        if (null == result) {
            throw new IntrospectionException(Messages.getString("custom.beans.31", methodName, this.listenerType.getName()));
        }
        return result;
    }

    private Method findGetListenerMethod(Class<?> sourceClass, String methodName) {
        try {
            return sourceClass.getMethod(methodName, new Class[0]);
        } catch (Exception e) {
            return null;
        }
    }

    private Method findMethodByPrefix(Class<?> sourceClass, String prefix, String postfix) {
        String shortName = this.listenerType.getName();
        if (this.listenerType.getPackage() != null) {
            shortName = shortName.substring(this.listenerType.getPackage().getName().length() + 1);
        }
        String methodName = prefix + shortName + postfix;
        try {
            if (BeansUtils.GET.equals(prefix)) {
                return sourceClass.getMethod(methodName, new Class[0]);
            }
            Method[] methods = sourceClass.getMethods();
            for (int i = 0; i < methods.length; i++) {
                if (methods[i].getName().equals(methodName)) {
                    Class<?>[] paramTypes = methods[i].getParameterTypes();
                    if (paramTypes.length == 1) {
                        return methods[i];
                    }
                }
            }
            return null;
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    private static boolean isUnicastByDefault(Method addMethod) {
        if (addMethod != null) {
            Class<?>[] exceptionTypes = addMethod.getExceptionTypes();
            for (Class<?> element : exceptionTypes) {
                if (element.equals(TooManyListenersException.class)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    void merge(EventSetDescriptor event) {
        super.merge((FeatureDescriptor) event);
        if (this.addListenerMethod == null) {
            this.addListenerMethod = event.addListenerMethod;
        }
        if (this.getListenerMethod == null) {
            this.getListenerMethod = event.getListenerMethod;
        }
        if (this.listenerMethodDescriptors == null) {
            this.listenerMethodDescriptors = event.listenerMethodDescriptors;
        }
        if (this.listenerMethods == null) {
            this.listenerMethods = event.listenerMethods;
        }
        if (this.listenerType == null) {
            this.listenerType = event.listenerType;
        }
        if (this.removeListenerMethod == null) {
            this.removeListenerMethod = event.removeListenerMethod;
        }
        this.inDefaultEventSet &= event.inDefaultEventSet;
    }
}

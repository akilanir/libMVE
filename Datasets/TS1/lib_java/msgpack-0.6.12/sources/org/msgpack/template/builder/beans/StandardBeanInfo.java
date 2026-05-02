package org.msgpack.template.builder.beans;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.EventListener;
import java.util.EventObject;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TooManyListenersException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/StandardBeanInfo.class */
class StandardBeanInfo extends SimpleBeanInfo {
    private static final String PREFIX_IS = "is";
    private static final String PREFIX_GET = "get";
    private static final String PREFIX_SET = "set";
    private static final String PREFIX_ADD = "add";
    private static final String PREFIX_REMOVE = "remove";
    private static final String SUFFIX_LISTEN = "Listener";
    private static final String STR_NORMAL = "normal";
    private static final String STR_INDEXED = "indexed";
    private static final String STR_VALID = "valid";
    private static final String STR_INVALID = "invalid";
    private static final String STR_PROPERTY_TYPE = "PropertyType";
    private static final String STR_IS_CONSTRAINED = "isConstrained";
    private static final String STR_SETTERS = "setters";
    private static final String STR_GETTERS = "getters";
    private boolean explicitMethods;
    private boolean explicitProperties;
    private boolean explicitEvents;
    private BeanInfo explicitBeanInfo;
    private EventSetDescriptor[] events;
    private MethodDescriptor[] methods;
    private PropertyDescriptor[] properties;
    private BeanDescriptor beanDescriptor = null;
    BeanInfo[] additionalBeanInfo;
    private Class<?> beanClass;
    private int defaultEventIndex;
    private int defaultPropertyIndex;
    private static PropertyComparator comparator = new PropertyComparator();
    private boolean canAddPropertyChangeListener;
    private boolean canRemovePropertyChangeListener;

    StandardBeanInfo(Class<?> beanClass, BeanInfo explicitBeanInfo, Class<?> stopClass) throws IntrospectionException {
        this.explicitMethods = false;
        this.explicitProperties = false;
        this.explicitEvents = false;
        this.explicitBeanInfo = null;
        this.events = null;
        this.methods = null;
        this.properties = null;
        this.additionalBeanInfo = null;
        this.defaultEventIndex = -1;
        this.defaultPropertyIndex = -1;
        this.beanClass = beanClass;
        if (explicitBeanInfo != null) {
            this.explicitBeanInfo = explicitBeanInfo;
            this.events = explicitBeanInfo.getEventSetDescriptors();
            this.methods = explicitBeanInfo.getMethodDescriptors();
            this.properties = explicitBeanInfo.getPropertyDescriptors();
            this.defaultEventIndex = explicitBeanInfo.getDefaultEventIndex();
            if (this.defaultEventIndex < 0 || this.defaultEventIndex >= this.events.length) {
                this.defaultEventIndex = -1;
            }
            this.defaultPropertyIndex = explicitBeanInfo.getDefaultPropertyIndex();
            if (this.defaultPropertyIndex < 0 || this.defaultPropertyIndex >= this.properties.length) {
                this.defaultPropertyIndex = -1;
            }
            this.additionalBeanInfo = explicitBeanInfo.getAdditionalBeanInfo();
            if (this.events != null) {
                this.explicitEvents = true;
            }
            if (this.methods != null) {
                this.explicitMethods = true;
            }
            if (this.properties != null) {
                this.explicitProperties = true;
            }
        }
        if (this.methods == null) {
            this.methods = introspectMethods();
        }
        if (this.properties == null) {
            this.properties = introspectProperties(stopClass);
        }
        if (this.events == null) {
            this.events = introspectEvents();
        }
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public BeanInfo[] getAdditionalBeanInfo() {
        return null;
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public EventSetDescriptor[] getEventSetDescriptors() {
        return this.events;
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public MethodDescriptor[] getMethodDescriptors() {
        return this.methods;
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public PropertyDescriptor[] getPropertyDescriptors() {
        return this.properties;
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public BeanDescriptor getBeanDescriptor() {
        if (this.beanDescriptor == null) {
            if (this.explicitBeanInfo != null) {
                this.beanDescriptor = this.explicitBeanInfo.getBeanDescriptor();
            }
            if (this.beanDescriptor == null) {
                this.beanDescriptor = new BeanDescriptor(this.beanClass);
            }
        }
        return this.beanDescriptor;
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public int getDefaultEventIndex() {
        return this.defaultEventIndex;
    }

    @Override // org.msgpack.template.builder.beans.SimpleBeanInfo, org.msgpack.template.builder.beans.BeanInfo
    public int getDefaultPropertyIndex() {
        return this.defaultPropertyIndex;
    }

    void mergeBeanInfo(BeanInfo beanInfo, boolean force) throws IntrospectionException {
        PropertyDescriptor[] superDescs;
        MethodDescriptor[] superMethods;
        EventSetDescriptor[] superEvents;
        if ((force || !this.explicitProperties) && (superDescs = beanInfo.getPropertyDescriptors()) != null) {
            if (getPropertyDescriptors() != null) {
                this.properties = mergeProps(superDescs, beanInfo.getDefaultPropertyIndex());
            } else {
                this.properties = superDescs;
                this.defaultPropertyIndex = beanInfo.getDefaultPropertyIndex();
            }
        }
        if ((force || !this.explicitMethods) && (superMethods = beanInfo.getMethodDescriptors()) != null) {
            if (this.methods != null) {
                this.methods = mergeMethods(superMethods);
            } else {
                this.methods = superMethods;
            }
        }
        if ((force || !this.explicitEvents) && (superEvents = beanInfo.getEventSetDescriptors()) != null) {
            if (this.events != null) {
                this.events = mergeEvents(superEvents, beanInfo.getDefaultEventIndex());
            } else {
                this.events = superEvents;
                this.defaultEventIndex = beanInfo.getDefaultEventIndex();
            }
        }
    }

    private PropertyDescriptor[] mergeProps(PropertyDescriptor[] superDescs, int superDefaultIndex) throws IntrospectionException {
        HashMap<String, PropertyDescriptor> subMap = internalAsMap(this.properties);
        String defaultPropertyName = null;
        if (this.defaultPropertyIndex >= 0 && this.defaultPropertyIndex < this.properties.length) {
            defaultPropertyName = this.properties[this.defaultPropertyIndex].getName();
        } else if (superDefaultIndex >= 0 && superDefaultIndex < superDescs.length) {
            defaultPropertyName = superDescs[superDefaultIndex].getName();
        }
        for (PropertyDescriptor superDesc : superDescs) {
            String propertyName = superDesc.getName();
            if (!subMap.containsKey(propertyName)) {
                subMap.put(propertyName, superDesc);
            } else {
                Object value = subMap.get(propertyName);
                Method subGet = ((PropertyDescriptor) value).getReadMethod();
                Method subSet = ((PropertyDescriptor) value).getWriteMethod();
                Method superGet = superDesc.getReadMethod();
                Method superSet = superDesc.getWriteMethod();
                Class<?> superType = superDesc.getPropertyType();
                Class<?> superIndexedType = null;
                Class<?> subType = ((PropertyDescriptor) value).getPropertyType();
                Class<?> subIndexedType = null;
                if (value instanceof IndexedPropertyDescriptor) {
                    subIndexedType = ((IndexedPropertyDescriptor) value).getIndexedPropertyType();
                }
                if (superDesc instanceof IndexedPropertyDescriptor) {
                    superIndexedType = ((IndexedPropertyDescriptor) superDesc).getIndexedPropertyType();
                }
                if (superIndexedType == null) {
                    PropertyDescriptor subDesc = (PropertyDescriptor) value;
                    if (subIndexedType == null) {
                        if (subType != null && superType != null && subType.getName() != null && subType.getName().equals(superType.getName())) {
                            if (superGet != null && (subGet == null || superGet.equals(subGet))) {
                                subDesc.setReadMethod(superGet);
                            }
                            if (superSet != null && (subSet == null || superSet.equals(subSet))) {
                                subDesc.setWriteMethod(superSet);
                            }
                            if (subType == Boolean.TYPE && subGet != null && superGet != null && superGet.getName().startsWith("is")) {
                                subDesc.setReadMethod(superGet);
                            }
                        } else if ((subGet == null || subSet == null) && superGet != null) {
                            subDesc = new PropertyDescriptor(propertyName, superGet, superSet);
                            if (subGet != null) {
                                String subGetName = subGet.getName();
                                MethodDescriptor[] introspectMethods = introspectMethods();
                                int len$ = introspectMethods.length;
                                int i$ = 0;
                                while (true) {
                                    if (i$ >= len$) {
                                        break;
                                    }
                                    MethodDescriptor methodDesc = introspectMethods[i$];
                                    Method method = methodDesc.getMethod();
                                    if (method == subGet || !subGetName.equals(method.getName()) || method.getParameterTypes().length != 0 || method.getReturnType() != superType) {
                                        i$++;
                                    } else {
                                        subDesc.setReadMethod(method);
                                        break;
                                    }
                                }
                            }
                        }
                    } else {
                        if (superType != null && superType.isArray() && superType.getComponentType().getName().equals(subIndexedType.getName())) {
                            if (subGet == null && superGet != null) {
                                subDesc.setReadMethod(superGet);
                            }
                            if (subSet == null && superSet != null) {
                                subDesc.setWriteMethod(superSet);
                            }
                        }
                        if (subIndexedType == Boolean.TYPE && superType == Boolean.TYPE) {
                            Method subIndexedSet = ((IndexedPropertyDescriptor) subDesc).getIndexedWriteMethod();
                            if (subGet == null && subSet == null && subIndexedSet != null && superGet != null) {
                                try {
                                    subSet = this.beanClass.getDeclaredMethod(subIndexedSet.getName(), Boolean.TYPE);
                                } catch (Exception e) {
                                }
                                if (subSet != null) {
                                    subDesc = new PropertyDescriptor(propertyName, superGet, subSet);
                                }
                            }
                        }
                    }
                    subMap.put(propertyName, subDesc);
                } else if (subIndexedType == null) {
                    if (subType != null && subType.isArray() && subType.getComponentType().getName().equals(superIndexedType.getName())) {
                        if (subGet != null) {
                            superDesc.setReadMethod(subGet);
                        }
                        if (subSet != null) {
                            superDesc.setWriteMethod(subSet);
                        }
                        subMap.put(propertyName, superDesc);
                    } else {
                        if (subGet == null || subSet == null) {
                            Class<?> beanSuperClass = this.beanClass.getSuperclass();
                            String methodSuffix = capitalize(propertyName);
                            Method method2 = null;
                            if (subGet == null) {
                                if (subType == Boolean.TYPE) {
                                    try {
                                        method2 = beanSuperClass.getDeclaredMethod("is" + methodSuffix, new Class[0]);
                                    } catch (Exception e2) {
                                    }
                                } else {
                                    try {
                                        method2 = beanSuperClass.getDeclaredMethod("get" + methodSuffix, new Class[0]);
                                    } catch (Exception e3) {
                                    }
                                }
                                if (method2 != null && !Modifier.isStatic(method2.getModifiers()) && method2.getReturnType() == subType) {
                                    ((PropertyDescriptor) value).setReadMethod(method2);
                                }
                            } else {
                                try {
                                    method2 = beanSuperClass.getDeclaredMethod("set" + methodSuffix, subType);
                                } catch (Exception e4) {
                                }
                                if (method2 != null && !Modifier.isStatic(method2.getModifiers()) && method2.getReturnType() == Void.TYPE) {
                                    ((PropertyDescriptor) value).setWriteMethod(method2);
                                }
                            }
                        }
                        subMap.put(propertyName, (PropertyDescriptor) value);
                    }
                } else if (subIndexedType.getName().equals(superIndexedType.getName())) {
                    IndexedPropertyDescriptor subDesc2 = (IndexedPropertyDescriptor) value;
                    if (subGet == null && superGet != null) {
                        subDesc2.setReadMethod(superGet);
                    }
                    if (subSet == null && superSet != null) {
                        subDesc2.setWriteMethod(superSet);
                    }
                    IndexedPropertyDescriptor superIndexedDesc = (IndexedPropertyDescriptor) superDesc;
                    if (subDesc2.getIndexedReadMethod() == null && superIndexedDesc.getIndexedReadMethod() != null) {
                        subDesc2.setIndexedReadMethod(superIndexedDesc.getIndexedReadMethod());
                    }
                    if (subDesc2.getIndexedWriteMethod() == null && superIndexedDesc.getIndexedWriteMethod() != null) {
                        subDesc2.setIndexedWriteMethod(superIndexedDesc.getIndexedWriteMethod());
                    }
                    subMap.put(propertyName, subDesc2);
                }
                mergeAttributes((PropertyDescriptor) value, superDesc);
            }
        }
        PropertyDescriptor[] theDescs = new PropertyDescriptor[subMap.size()];
        subMap.values().toArray(theDescs);
        if (defaultPropertyName != null && !this.explicitProperties) {
            int i = 0;
            while (true) {
                if (i >= theDescs.length) {
                    break;
                }
                if (!defaultPropertyName.equals(theDescs[i].getName())) {
                    i++;
                } else {
                    this.defaultPropertyIndex = i;
                    break;
                }
            }
        }
        return theDescs;
    }

    private String capitalize(String name) {
        if (name == null) {
            return null;
        }
        if (name.length() == 0 || (name.length() > 1 && Character.isUpperCase(name.charAt(1)))) {
            return name;
        }
        char[] chars = name.toCharArray();
        chars[0] = Character.toUpperCase(chars[0]);
        return new String(chars);
    }

    private static void mergeAttributes(PropertyDescriptor subDesc, PropertyDescriptor superDesc) {
        subDesc.hidden |= superDesc.hidden;
        subDesc.expert |= superDesc.expert;
        subDesc.preferred |= superDesc.preferred;
        subDesc.bound |= superDesc.bound;
        subDesc.constrained |= superDesc.constrained;
        subDesc.name = superDesc.name;
        if (subDesc.shortDescription == null && superDesc.shortDescription != null) {
            subDesc.shortDescription = superDesc.shortDescription;
        }
        if (subDesc.displayName == null && superDesc.displayName != null) {
            subDesc.displayName = superDesc.displayName;
        }
    }

    private MethodDescriptor[] mergeMethods(MethodDescriptor[] superDescs) {
        HashMap<String, MethodDescriptor> subMap = internalAsMap(this.methods);
        for (MethodDescriptor superMethod : superDescs) {
            String methodName = getQualifiedName(superMethod.getMethod());
            MethodDescriptor method = subMap.get(methodName);
            if (method == null) {
                subMap.put(methodName, superMethod);
            } else {
                method.merge(superMethod);
            }
        }
        MethodDescriptor[] theMethods = new MethodDescriptor[subMap.size()];
        subMap.values().toArray(theMethods);
        return theMethods;
    }

    private EventSetDescriptor[] mergeEvents(EventSetDescriptor[] otherEvents, int otherDefaultIndex) {
        HashMap<String, EventSetDescriptor> subMap = internalAsMap(this.events);
        String defaultEventName = null;
        if (this.defaultEventIndex >= 0 && this.defaultEventIndex < this.events.length) {
            defaultEventName = this.events[this.defaultEventIndex].getName();
        } else if (otherDefaultIndex >= 0 && otherDefaultIndex < otherEvents.length) {
            defaultEventName = otherEvents[otherDefaultIndex].getName();
        }
        for (EventSetDescriptor event : otherEvents) {
            String eventName = event.getName();
            EventSetDescriptor subEvent = subMap.get(eventName);
            if (subEvent == null) {
                subMap.put(eventName, event);
            } else {
                subEvent.merge(event);
            }
        }
        EventSetDescriptor[] theEvents = new EventSetDescriptor[subMap.size()];
        subMap.values().toArray(theEvents);
        if (defaultEventName != null && !this.explicitEvents) {
            int i = 0;
            while (true) {
                if (i >= theEvents.length) {
                    break;
                }
                if (!defaultEventName.equals(theEvents[i].getName())) {
                    i++;
                } else {
                    this.defaultEventIndex = i;
                    break;
                }
            }
        }
        return theEvents;
    }

    private static HashMap<String, PropertyDescriptor> internalAsMap(PropertyDescriptor[] propertyDescs) {
        HashMap<String, PropertyDescriptor> map = new HashMap<>();
        for (int i = 0; i < propertyDescs.length; i++) {
            map.put(propertyDescs[i].getName(), propertyDescs[i]);
        }
        return map;
    }

    private static HashMap<String, MethodDescriptor> internalAsMap(MethodDescriptor[] theDescs) {
        HashMap<String, MethodDescriptor> map = new HashMap<>();
        for (int i = 0; i < theDescs.length; i++) {
            String qualifiedName = getQualifiedName(theDescs[i].getMethod());
            map.put(qualifiedName, theDescs[i]);
        }
        return map;
    }

    private static HashMap<String, EventSetDescriptor> internalAsMap(EventSetDescriptor[] theDescs) {
        HashMap<String, EventSetDescriptor> map = new HashMap<>();
        for (int i = 0; i < theDescs.length; i++) {
            map.put(theDescs[i].getName(), theDescs[i]);
        }
        return map;
    }

    private static String getQualifiedName(Method method) {
        String qualifiedName = method.getName();
        Class<?>[] paramTypes = method.getParameterTypes();
        if (paramTypes != null) {
            for (Class<?> cls : paramTypes) {
                qualifiedName = qualifiedName + "_" + cls.getName();
            }
        }
        return qualifiedName;
    }

    private MethodDescriptor[] introspectMethods() {
        return introspectMethods(false, this.beanClass);
    }

    private MethodDescriptor[] introspectMethods(boolean includeSuper) {
        return introspectMethods(includeSuper, this.beanClass);
    }

    private MethodDescriptor[] introspectMethods(boolean includeSuper, Class<?> introspectorClass) {
        Method[] basicMethods = includeSuper ? introspectorClass.getMethods() : introspectorClass.getDeclaredMethods();
        if (basicMethods == null || basicMethods.length == 0) {
            return null;
        }
        ArrayList<MethodDescriptor> methodList = new ArrayList<>(basicMethods.length);
        for (int i = 0; i < basicMethods.length; i++) {
            int modifiers = basicMethods[i].getModifiers();
            if (Modifier.isPublic(modifiers)) {
                MethodDescriptor theDescriptor = new MethodDescriptor(basicMethods[i]);
                methodList.add(theDescriptor);
            }
        }
        int methodCount = methodList.size();
        MethodDescriptor[] theMethods = null;
        if (methodCount > 0) {
            MethodDescriptor[] theMethods2 = new MethodDescriptor[methodCount];
            theMethods = (MethodDescriptor[]) methodList.toArray(theMethods2);
        }
        return theMethods;
    }

    private PropertyDescriptor[] introspectProperties(Class<?> stopClass) throws IntrospectionException {
        PropertyDescriptor propertyDesc;
        MethodDescriptor[] excludeMethods;
        MethodDescriptor[] methodDescriptors = introspectMethods();
        if (methodDescriptors == null) {
            return null;
        }
        ArrayList<MethodDescriptor> methodList = new ArrayList<>();
        for (int index = 0; index < methodDescriptors.length; index++) {
            int modifiers = methodDescriptors[index].getMethod().getModifiers();
            if (!Modifier.isStatic(modifiers)) {
                methodList.add(methodDescriptors[index]);
            }
        }
        int methodCount = methodList.size();
        MethodDescriptor[] theMethods = null;
        if (methodCount > 0) {
            MethodDescriptor[] theMethods2 = new MethodDescriptor[methodCount];
            theMethods = (MethodDescriptor[]) methodList.toArray(theMethods2);
        }
        if (theMethods == null) {
            return null;
        }
        HashMap<String, HashMap> propertyTable = new HashMap<>(theMethods.length);
        for (int i = 0; i < theMethods.length; i++) {
            introspectGet(theMethods[i].getMethod(), propertyTable);
            introspectSet(theMethods[i].getMethod(), propertyTable);
        }
        fixGetSet(propertyTable);
        MethodDescriptor[] allMethods = introspectMethods(true);
        if (stopClass != null && (excludeMethods = introspectMethods(true, stopClass)) != null) {
            ArrayList<MethodDescriptor> tempMethods = new ArrayList<>();
            for (MethodDescriptor method : allMethods) {
                if (!isInSuper(method, excludeMethods)) {
                    tempMethods.add(method);
                }
            }
            allMethods = (MethodDescriptor[]) tempMethods.toArray(new MethodDescriptor[0]);
        }
        for (MethodDescriptor methodDescriptor : allMethods) {
            introspectPropertyListener(methodDescriptor.getMethod());
        }
        ArrayList<PropertyDescriptor> propertyList = new ArrayList<>();
        for (Map.Entry<String, HashMap> entry : propertyTable.entrySet()) {
            String propertyName = entry.getKey();
            HashMap table = entry.getValue();
            if (table != null) {
                String normalTag = (String) table.get(STR_NORMAL);
                String indexedTag = (String) table.get(STR_INDEXED);
                if (normalTag != null || indexedTag != null) {
                    Method get = (Method) table.get("normalget");
                    Method set = (Method) table.get("normalset");
                    Method indexedGet = (Method) table.get("indexedget");
                    Method indexedSet = (Method) table.get("indexedset");
                    if (indexedTag == null) {
                        propertyDesc = new PropertyDescriptor(propertyName, get, set);
                    } else {
                        try {
                            propertyDesc = new IndexedPropertyDescriptor(propertyName, get, set, indexedGet, indexedSet);
                        } catch (IntrospectionException e) {
                            propertyDesc = new IndexedPropertyDescriptor(propertyName, null, null, indexedGet, indexedSet);
                        }
                    }
                    if (this.canAddPropertyChangeListener && this.canRemovePropertyChangeListener) {
                        propertyDesc.setBound(true);
                    } else {
                        propertyDesc.setBound(false);
                    }
                    if (table.get(STR_IS_CONSTRAINED) == Boolean.TRUE) {
                        propertyDesc.setConstrained(true);
                    }
                    propertyList.add(propertyDesc);
                }
            }
        }
        PropertyDescriptor[] theProperties = new PropertyDescriptor[propertyList.size()];
        propertyList.toArray(theProperties);
        return theProperties;
    }

    private boolean isInSuper(MethodDescriptor method, MethodDescriptor[] excludeMethods) {
        for (MethodDescriptor m : excludeMethods) {
            if (method.getMethod().equals(m.getMethod())) {
                return true;
            }
        }
        return false;
    }

    private void introspectPropertyListener(Method theMethod) {
        String methodName = theMethod.getName();
        Class<?>[] param = theMethod.getParameterTypes();
        if (param.length != 1) {
            return;
        }
        if (methodName.equals("addPropertyChangeListener") && param[0].equals(PropertyChangeListener.class)) {
            this.canAddPropertyChangeListener = true;
        }
        if (methodName.equals("removePropertyChangeListener") && param[0].equals(PropertyChangeListener.class)) {
            this.canRemovePropertyChangeListener = true;
        }
    }

    private static void introspectGet(Method theMethod, HashMap<String, HashMap> propertyTable) {
        Class propertyType;
        String methodName = theMethod.getName();
        int prefixLength = 0;
        if (methodName == null) {
            return;
        }
        if (methodName.startsWith("get")) {
            prefixLength = "get".length();
        }
        if (methodName.startsWith("is")) {
            prefixLength = "is".length();
        }
        if (prefixLength == 0) {
            return;
        }
        String propertyName = Introspector.decapitalize(methodName.substring(prefixLength));
        if (!isValidProperty(propertyName) || (propertyType = theMethod.getReturnType()) == null || propertyType == Void.TYPE) {
            return;
        }
        if (prefixLength == 2 && propertyType != Boolean.TYPE) {
            return;
        }
        Class[] paramTypes = theMethod.getParameterTypes();
        if (paramTypes.length <= 1) {
            if (paramTypes.length == 1 && paramTypes[0] != Integer.TYPE) {
                return;
            }
            HashMap table = propertyTable.get(propertyName);
            if (table == null) {
                table = new HashMap();
                propertyTable.put(propertyName, table);
            }
            ArrayList<Method> getters = (ArrayList) table.get(STR_GETTERS);
            if (getters == null) {
                getters = new ArrayList<>();
                table.put(STR_GETTERS, getters);
            }
            getters.add(theMethod);
        }
    }

    private static void introspectSet(Method theMethod, HashMap<String, HashMap> propertyTable) {
        String methodName = theMethod.getName();
        if (methodName == null) {
            return;
        }
        Class returnType = theMethod.getReturnType();
        if (returnType != Void.TYPE || methodName == null || !methodName.startsWith("set")) {
            return;
        }
        String propertyName = Introspector.decapitalize(methodName.substring("set".length()));
        if (!isValidProperty(propertyName)) {
            return;
        }
        Class[] paramTypes = theMethod.getParameterTypes();
        if (paramTypes.length == 0 || paramTypes.length > 2) {
            return;
        }
        if (paramTypes.length == 2 && paramTypes[0] != Integer.TYPE) {
            return;
        }
        HashMap table = propertyTable.get(propertyName);
        if (table == null) {
            table = new HashMap();
            propertyTable.put(propertyName, table);
        }
        ArrayList<Method> setters = (ArrayList) table.get(STR_SETTERS);
        if (setters == null) {
            setters = new ArrayList<>();
            table.put(STR_SETTERS, setters);
        }
        Class[] exceptions = theMethod.getExceptionTypes();
        for (Class e : exceptions) {
            if (e.equals(PropertyVetoException.class)) {
                table.put(STR_IS_CONSTRAINED, Boolean.TRUE);
            }
        }
        setters.add(theMethod);
    }

    private void fixGetSet(HashMap<String, HashMap> propertyTable) throws IntrospectionException {
        if (propertyTable == null) {
            return;
        }
        for (Map.Entry<String, HashMap> entry : propertyTable.entrySet()) {
            HashMap<String, Object> table = entry.getValue();
            ArrayList<Method> getters = (ArrayList) table.get(STR_GETTERS);
            ArrayList<Method> setters = (ArrayList) table.get(STR_SETTERS);
            Method normalGetter = null;
            Method indexedGetter = null;
            Method normalSetter = null;
            Method indexedSetter = null;
            Class<?> normalPropType = null;
            Class<?> indexedPropType = null;
            if (getters == null) {
                getters = new ArrayList<>();
            }
            if (setters == null) {
                setters = new ArrayList<>();
            }
            Iterator i$ = getters.iterator();
            while (i$.hasNext()) {
                Method getter = i$.next();
                Class<?>[] paramTypes = getter.getParameterTypes();
                String methodName = getter.getName();
                if ((paramTypes == null || paramTypes.length == 0) && (normalGetter == null || methodName.startsWith("is"))) {
                    normalGetter = getter;
                }
                if (paramTypes != null && paramTypes.length == 1 && paramTypes[0] == Integer.TYPE && (indexedGetter == null || methodName.startsWith("get") || (methodName.startsWith("is") && !indexedGetter.getName().startsWith("get")))) {
                    indexedGetter = getter;
                }
            }
            if (normalGetter != null) {
                Class<?> propertyType = normalGetter.getReturnType();
                Iterator i$2 = setters.iterator();
                while (true) {
                    if (!i$2.hasNext()) {
                        break;
                    }
                    Method setter = i$2.next();
                    if (setter.getParameterTypes().length == 1 && propertyType.equals(setter.getParameterTypes()[0])) {
                        normalSetter = setter;
                        break;
                    }
                }
            } else {
                Iterator i$3 = setters.iterator();
                while (i$3.hasNext()) {
                    Method setter2 = i$3.next();
                    if (setter2.getParameterTypes().length == 1) {
                        normalSetter = setter2;
                    }
                }
            }
            if (indexedGetter != null) {
                Class<?> propertyType2 = indexedGetter.getReturnType();
                Iterator i$4 = setters.iterator();
                while (true) {
                    if (!i$4.hasNext()) {
                        break;
                    }
                    Method setter3 = i$4.next();
                    if (setter3.getParameterTypes().length == 2 && setter3.getParameterTypes()[0] == Integer.TYPE && propertyType2.equals(setter3.getParameterTypes()[1])) {
                        indexedSetter = setter3;
                        break;
                    }
                }
            } else {
                Iterator i$5 = setters.iterator();
                while (i$5.hasNext()) {
                    Method setter4 = i$5.next();
                    if (setter4.getParameterTypes().length == 2 && setter4.getParameterTypes()[0] == Integer.TYPE) {
                        indexedSetter = setter4;
                    }
                }
            }
            if (normalGetter != null) {
                normalPropType = normalGetter.getReturnType();
            } else if (normalSetter != null) {
                normalPropType = normalSetter.getParameterTypes()[0];
            }
            if (indexedGetter != null) {
                indexedPropType = indexedGetter.getReturnType();
            } else if (indexedSetter != null) {
                indexedPropType = indexedSetter.getParameterTypes()[1];
            }
            if (normalGetter == null || normalGetter.getReturnType().isArray()) {
            }
            if (normalGetter != null && normalSetter != null && (indexedGetter == null || indexedSetter == null)) {
                table.put(STR_NORMAL, STR_VALID);
                table.put("normalget", normalGetter);
                table.put("normalset", normalSetter);
                table.put("normalPropertyType", normalPropType);
            } else if ((normalGetter != null || normalSetter != null) && indexedGetter == null && indexedSetter == null) {
                table.put(STR_NORMAL, STR_VALID);
                table.put("normalget", normalGetter);
                table.put("normalset", normalSetter);
                table.put("normalPropertyType", normalPropType);
            } else {
                if ((normalGetter != null || normalSetter != null) && (indexedGetter != null || indexedSetter != null)) {
                    if (normalGetter != null && normalSetter != null && indexedGetter != null && indexedSetter != null) {
                        if (indexedGetter.getName().startsWith("get")) {
                            table.put(STR_NORMAL, STR_VALID);
                            table.put("normalget", normalGetter);
                            table.put("normalset", normalSetter);
                            table.put("normalPropertyType", normalPropType);
                            table.put(STR_INDEXED, STR_VALID);
                            table.put("indexedget", indexedGetter);
                            table.put("indexedset", indexedSetter);
                            table.put("indexedPropertyType", indexedPropType);
                        } else if (normalPropType != Boolean.TYPE && normalGetter.getName().startsWith("is")) {
                            table.put(STR_INDEXED, STR_VALID);
                            table.put("indexedset", indexedSetter);
                            table.put("indexedPropertyType", indexedPropType);
                        } else {
                            table.put(STR_NORMAL, STR_VALID);
                            table.put("normalget", normalGetter);
                            table.put("normalset", normalSetter);
                            table.put("normalPropertyType", normalPropType);
                        }
                    } else if (normalGetter != null && normalSetter == null && indexedGetter != null && indexedSetter != null) {
                        table.put(STR_NORMAL, STR_VALID);
                        table.put("normalget", normalGetter);
                        table.put("normalset", normalSetter);
                        table.put("normalPropertyType", normalPropType);
                        table.put(STR_INDEXED, STR_VALID);
                        if (indexedGetter.getName().startsWith("get")) {
                            table.put("indexedget", indexedGetter);
                        }
                        table.put("indexedset", indexedSetter);
                        table.put("indexedPropertyType", indexedPropType);
                    } else if (normalGetter == null && normalSetter != null && indexedGetter != null && indexedSetter != null) {
                        table.put(STR_INDEXED, STR_VALID);
                        if (indexedGetter.getName().startsWith("get")) {
                            table.put("indexedget", indexedGetter);
                        }
                        table.put("indexedset", indexedSetter);
                        table.put("indexedPropertyType", indexedPropType);
                    } else if (normalGetter != null && normalSetter == null && indexedGetter != null && indexedSetter == null) {
                        if (indexedGetter.getName().startsWith("get")) {
                            table.put(STR_NORMAL, STR_VALID);
                            table.put("normalget", normalGetter);
                            table.put("normalset", normalSetter);
                            table.put("normalPropertyType", normalPropType);
                            table.put(STR_INDEXED, STR_VALID);
                            table.put("indexedget", indexedGetter);
                            table.put("indexedset", indexedSetter);
                            table.put("indexedPropertyType", indexedPropType);
                        } else {
                            table.put(STR_NORMAL, STR_VALID);
                            table.put("normalget", normalGetter);
                            table.put("normalset", normalSetter);
                            table.put("normalPropertyType", normalPropType);
                        }
                    } else if (normalGetter == null && normalSetter != null && indexedGetter != null && indexedSetter == null) {
                        if (indexedGetter.getName().startsWith("get")) {
                            table.put(STR_NORMAL, STR_VALID);
                            table.put("normalget", normalGetter);
                            table.put("normalset", normalSetter);
                            table.put("normalPropertyType", normalPropType);
                            table.put(STR_INDEXED, STR_VALID);
                            table.put("indexedget", indexedGetter);
                            table.put("indexedset", indexedSetter);
                            table.put("indexedPropertyType", indexedPropType);
                        } else {
                            table.put(STR_NORMAL, STR_VALID);
                            table.put("normalget", normalGetter);
                            table.put("normalset", normalSetter);
                            table.put("normalPropertyType", normalPropType);
                        }
                    } else if (normalGetter != null && normalSetter == null && indexedGetter == null && indexedSetter != null) {
                        table.put(STR_INDEXED, STR_VALID);
                        table.put("indexedget", indexedGetter);
                        table.put("indexedset", indexedSetter);
                        table.put("indexedPropertyType", indexedPropType);
                    } else if (normalGetter == null && normalSetter != null && indexedGetter == null && indexedSetter != null) {
                        table.put(STR_INDEXED, STR_VALID);
                        table.put("indexedget", indexedGetter);
                        table.put("indexedset", indexedSetter);
                        table.put("indexedPropertyType", indexedPropType);
                    }
                }
                if (normalSetter == null && normalGetter == null && (indexedGetter != null || indexedSetter != null)) {
                    if (indexedGetter != null && indexedGetter.getName().startsWith("is")) {
                        if (indexedSetter != null) {
                            table.put(STR_INDEXED, STR_VALID);
                            table.put("indexedset", indexedSetter);
                            table.put("indexedPropertyType", indexedPropType);
                        }
                    } else {
                        table.put(STR_INDEXED, STR_VALID);
                        table.put("indexedget", indexedGetter);
                        table.put("indexedset", indexedSetter);
                        table.put("indexedPropertyType", indexedPropType);
                    }
                } else if ((normalSetter != null || normalGetter != null) && indexedGetter != null && indexedSetter != null) {
                    table.put(STR_INDEXED, STR_VALID);
                    table.put("indexedget", indexedGetter);
                    table.put("indexedset", indexedSetter);
                    table.put("indexedPropertyType", indexedPropType);
                } else {
                    table.put(STR_NORMAL, STR_INVALID);
                    table.put(STR_INDEXED, STR_INVALID);
                }
            }
        }
    }

    private EventSetDescriptor[] introspectEvents() throws IntrospectionException {
        MethodDescriptor[] theMethods = introspectMethods();
        if (theMethods == null) {
            return null;
        }
        HashMap<String, HashMap> eventTable = new HashMap<>(theMethods.length);
        for (int i = 0; i < theMethods.length; i++) {
            introspectListenerMethods("add", theMethods[i].getMethod(), eventTable);
            introspectListenerMethods(PREFIX_REMOVE, theMethods[i].getMethod(), eventTable);
            introspectGetListenerMethods(theMethods[i].getMethod(), eventTable);
        }
        ArrayList<EventSetDescriptor> eventList = new ArrayList<>();
        for (Map.Entry<String, HashMap> entry : eventTable.entrySet()) {
            HashMap table = entry.getValue();
            Method add = (Method) table.get("add");
            Method remove = (Method) table.get(PREFIX_REMOVE);
            if (add != null && remove != null) {
                Method get = (Method) table.get("get");
                Class<?> listenerType = (Class) table.get("listenerType");
                Method[] listenerMethods = (Method[]) table.get("listenerMethods");
                EventSetDescriptor eventSetDescriptor = new EventSetDescriptor(Introspector.decapitalize(entry.getKey()), listenerType, listenerMethods, add, remove, get);
                eventSetDescriptor.setUnicast(table.get("isUnicast") != null);
                eventList.add(eventSetDescriptor);
            }
        }
        EventSetDescriptor[] theEvents = new EventSetDescriptor[eventList.size()];
        eventList.toArray(theEvents);
        return theEvents;
    }

    private static void introspectListenerMethods(String type, Method theMethod, HashMap<String, HashMap> methodsTable) {
        String listenerName;
        String eventName;
        Class<?>[] paramTypes;
        Class[] exceptionTypes;
        String methodName = theMethod.getName();
        if (methodName == null || !methodName.startsWith(type) || !methodName.endsWith(SUFFIX_LISTEN) || (eventName = (listenerName = methodName.substring(type.length())).substring(0, listenerName.lastIndexOf(SUFFIX_LISTEN))) == null || eventName.length() == 0 || (paramTypes = theMethod.getParameterTypes()) == null || paramTypes.length != 1) {
            return;
        }
        Class<?> listenerType = paramTypes[0];
        if (!EventListener.class.isAssignableFrom(listenerType) || !listenerType.getName().endsWith(listenerName)) {
            return;
        }
        HashMap table = methodsTable.get(eventName);
        if (table == null) {
            table = new HashMap();
        }
        if (table.get("listenerType") == null) {
            table.put("listenerType", listenerType);
            table.put("listenerMethods", introspectListenerMethods(listenerType));
        }
        table.put(type, theMethod);
        if (type.equals("add") && (exceptionTypes = theMethod.getExceptionTypes()) != null) {
            int i = 0;
            while (true) {
                if (i >= exceptionTypes.length) {
                    break;
                }
                if (!exceptionTypes[i].getName().equals(TooManyListenersException.class.getName())) {
                    i++;
                } else {
                    table.put("isUnicast", "true");
                    break;
                }
            }
        }
        methodsTable.put(eventName, table);
    }

    private static Method[] introspectListenerMethods(Class<?> listenerType) {
        Method[] methods = listenerType.getDeclaredMethods();
        ArrayList<Method> list = new ArrayList<>();
        for (int i = 0; i < methods.length; i++) {
            Class<?>[] paramTypes = methods[i].getParameterTypes();
            if (paramTypes.length == 1 && EventObject.class.isAssignableFrom(paramTypes[0])) {
                list.add(methods[i]);
            }
        }
        Method[] matchedMethods = new Method[list.size()];
        list.toArray(matchedMethods);
        return matchedMethods;
    }

    private static void introspectGetListenerMethods(Method theMethod, HashMap<String, HashMap> methodsTable) {
        String listenerName;
        String eventName;
        Class[] paramTypes;
        String methodName = theMethod.getName();
        if (methodName == null || !methodName.startsWith("get") || !methodName.endsWith("Listeners") || (eventName = (listenerName = methodName.substring("get".length(), methodName.length() - 1)).substring(0, listenerName.lastIndexOf(SUFFIX_LISTEN))) == null || eventName.length() == 0 || (paramTypes = theMethod.getParameterTypes()) == null || paramTypes.length != 0) {
            return;
        }
        Class returnType = theMethod.getReturnType();
        if (returnType.getComponentType() == null || !returnType.getComponentType().getName().endsWith(listenerName)) {
            return;
        }
        HashMap table = methodsTable.get(eventName);
        if (table == null) {
            table = new HashMap();
        }
        table.put("get", theMethod);
        methodsTable.put(eventName, table);
    }

    private static boolean isValidProperty(String propertyName) {
        return (propertyName == null || propertyName.length() == 0) ? false : true;
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator.class */
    private static class PropertyComparator implements Comparator<PropertyDescriptor> {
        private PropertyComparator() {
        }

        @Override // java.util.Comparator
        public int compare(PropertyDescriptor object1, PropertyDescriptor object2) {
            return object1.getName().compareTo(object2.getName());
        }
    }

    void init() {
        if (this.events == null) {
            this.events = new EventSetDescriptor[0];
        }
        if (this.properties == null) {
            this.properties = new PropertyDescriptor[0];
        }
        if (this.properties != null) {
            String defaultPropertyName = this.defaultPropertyIndex != -1 ? this.properties[this.defaultPropertyIndex].getName() : null;
            Arrays.sort(this.properties, comparator);
            if (null != defaultPropertyName) {
                for (int i = 0; i < this.properties.length; i++) {
                    if (defaultPropertyName.equals(this.properties[i].getName())) {
                        this.defaultPropertyIndex = i;
                        return;
                    }
                }
            }
        }
    }
}

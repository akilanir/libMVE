package org.apache.commons.beanutils;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/LazyDynaList.class */
public class LazyDynaList extends ArrayList {
    private DynaClass elementDynaClass;
    private transient WrapDynaClass wrapDynaClass;
    private Class elementType;
    private Class elementDynaBeanType;
    static Class class$java$util$Map;
    static Class class$org$apache$commons$beanutils$DynaBean;
    static Class class$org$apache$commons$beanutils$WrapDynaBean;
    static Class class$org$apache$commons$beanutils$LazyDynaMap;

    public LazyDynaList() {
    }

    public LazyDynaList(int capacity) {
        super(capacity);
    }

    public LazyDynaList(DynaClass elementDynaClass) {
        setElementDynaClass(elementDynaClass);
    }

    public LazyDynaList(Class elementType) {
        setElementType(elementType);
    }

    public LazyDynaList(Collection collection) {
        super(collection.size());
        addAll(collection);
    }

    public LazyDynaList(Object[] array) {
        super(array.length);
        for (Object obj : array) {
            add(obj);
        }
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public void add(int index, Object element) {
        DynaBean dynaBean = transform(element);
        growList(index);
        super.add(index, dynaBean);
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean add(Object element) {
        DynaBean dynaBean = transform(element);
        return super.add(dynaBean);
    }

    @Override // java.util.ArrayList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean addAll(Collection collection) {
        if (collection == null || collection.size() == 0) {
            return false;
        }
        ensureCapacity(size() + collection.size());
        Iterator iterator = collection.iterator();
        while (iterator.hasNext()) {
            add(iterator.next());
        }
        return true;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public boolean addAll(int index, Collection collection) {
        if (collection == null || collection.size() == 0) {
            return false;
        }
        ensureCapacity((index > size() ? index : size()) + collection.size());
        if (size() == 0) {
            transform(collection.iterator().next());
        }
        growList(index);
        Iterator iterator = collection.iterator();
        while (iterator.hasNext()) {
            int i = index;
            index++;
            add(i, iterator.next());
        }
        return true;
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public Object get(int index) {
        growList(index + 1);
        return super.get(index);
    }

    @Override // java.util.ArrayList, java.util.AbstractList, java.util.List
    public Object set(int index, Object element) {
        DynaBean dynaBean = transform(element);
        growList(index + 1);
        return super.set(index, dynaBean);
    }

    @Override // java.util.ArrayList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public Object[] toArray() {
        Class cls;
        Class cls2;
        if (size() == 0 && this.elementType == null) {
            return new LazyDynaBean[0];
        }
        Object[] array = (Object[]) Array.newInstance((Class<?>) this.elementType, size());
        for (int i = 0; i < size(); i++) {
            if (class$java$util$Map == null) {
                cls = class$("java.util.Map");
                class$java$util$Map = cls;
            } else {
                cls = class$java$util$Map;
            }
            if (cls.isAssignableFrom(this.elementType)) {
                array[i] = ((LazyDynaMap) get(i)).getMap();
            } else {
                if (class$org$apache$commons$beanutils$DynaBean == null) {
                    cls2 = class$("org.apache.commons.beanutils.DynaBean");
                    class$org$apache$commons$beanutils$DynaBean = cls2;
                } else {
                    cls2 = class$org$apache$commons$beanutils$DynaBean;
                }
                if (cls2.isAssignableFrom(this.elementType)) {
                    array[i] = get(i);
                } else {
                    array[i] = ((WrapDynaBean) get(i)).getInstance();
                }
            }
        }
        return array;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // java.util.ArrayList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public Object[] toArray(Object[] model) {
        Class cls;
        Class cls2;
        Class cls3;
        Class arrayType = model.getClass().getComponentType();
        Object[] array = (Object[]) Array.newInstance((Class<?>) arrayType, size());
        if (size() == 0 && this.elementType == null) {
            return new LazyDynaBean[0];
        }
        if (class$org$apache$commons$beanutils$DynaBean == null) {
            cls = class$("org.apache.commons.beanutils.DynaBean");
            class$org$apache$commons$beanutils$DynaBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$DynaBean;
        }
        if (cls.isAssignableFrom(arrayType)) {
            for (int i = 0; i < size(); i++) {
                array[i] = get(i);
            }
            return array;
        }
        if (arrayType.isAssignableFrom(this.elementType)) {
            for (int i2 = 0; i2 < size(); i2++) {
                if (class$java$util$Map == null) {
                    cls2 = class$("java.util.Map");
                    class$java$util$Map = cls2;
                } else {
                    cls2 = class$java$util$Map;
                }
                if (cls2.isAssignableFrom(this.elementType)) {
                    array[i2] = ((LazyDynaMap) get(i2)).getMap();
                } else {
                    if (class$org$apache$commons$beanutils$DynaBean == null) {
                        cls3 = class$("org.apache.commons.beanutils.DynaBean");
                        class$org$apache$commons$beanutils$DynaBean = cls3;
                    } else {
                        cls3 = class$org$apache$commons$beanutils$DynaBean;
                    }
                    if (cls3.isAssignableFrom(this.elementType)) {
                        array[i2] = get(i2);
                    } else {
                        array[i2] = ((WrapDynaBean) get(i2)).getInstance();
                    }
                }
            }
            return array;
        }
        throw new IllegalArgumentException(new StringBuffer().append("Invalid array type: ").append(arrayType.getName()).append(" - not compatible with '").append(this.elementType.getName()).toString());
    }

    public DynaBean[] toDynaBeanArray() {
        if (size() == 0 && this.elementDynaBeanType == null) {
            return new LazyDynaBean[0];
        }
        DynaBean[] array = (DynaBean[]) Array.newInstance((Class<?>) this.elementDynaBeanType, size());
        for (int i = 0; i < size(); i++) {
            array[i] = (DynaBean) get(i);
        }
        return array;
    }

    public void setElementType(Class elementType) {
        Class cls;
        Class cls2;
        DynaBean dynaBean;
        Class cls3;
        Class cls4;
        if (elementType == null) {
            throw new IllegalArgumentException("Element Type is missing");
        }
        boolean changeType = (this.elementType == null || this.elementType.equals(elementType)) ? false : true;
        if (changeType && size() > 0) {
            throw new IllegalStateException("Element Type cannot be reset");
        }
        this.elementType = elementType;
        try {
            Object object = elementType.newInstance();
            if (class$java$util$Map == null) {
                cls = class$("java.util.Map");
                class$java$util$Map = cls;
            } else {
                cls = class$java$util$Map;
            }
            if (cls.isAssignableFrom(elementType)) {
                dynaBean = new LazyDynaMap((Map) object);
                this.elementDynaClass = dynaBean.getDynaClass();
            } else {
                if (class$org$apache$commons$beanutils$DynaBean == null) {
                    cls2 = class$("org.apache.commons.beanutils.DynaBean");
                    class$org$apache$commons$beanutils$DynaBean = cls2;
                } else {
                    cls2 = class$org$apache$commons$beanutils$DynaBean;
                }
                if (cls2.isAssignableFrom(elementType)) {
                    dynaBean = (DynaBean) object;
                    this.elementDynaClass = dynaBean.getDynaClass();
                } else {
                    dynaBean = new WrapDynaBean(object);
                    this.wrapDynaClass = (WrapDynaClass) dynaBean.getDynaClass();
                }
            }
            this.elementDynaBeanType = dynaBean.getClass();
            if (class$org$apache$commons$beanutils$WrapDynaBean == null) {
                cls3 = class$("org.apache.commons.beanutils.WrapDynaBean");
                class$org$apache$commons$beanutils$WrapDynaBean = cls3;
            } else {
                cls3 = class$org$apache$commons$beanutils$WrapDynaBean;
            }
            if (cls3.isAssignableFrom(this.elementDynaBeanType)) {
                this.elementType = ((WrapDynaBean) dynaBean).getInstance().getClass();
                return;
            }
            if (class$org$apache$commons$beanutils$LazyDynaMap == null) {
                cls4 = class$("org.apache.commons.beanutils.LazyDynaMap");
                class$org$apache$commons$beanutils$LazyDynaMap = cls4;
            } else {
                cls4 = class$org$apache$commons$beanutils$LazyDynaMap;
            }
            if (cls4.isAssignableFrom(this.elementDynaBeanType)) {
                this.elementType = ((LazyDynaMap) dynaBean).getMap().getClass();
            }
        } catch (Exception e) {
            throw new IllegalArgumentException(new StringBuffer().append("Error creating type: ").append(elementType.getName()).append(" - ").append(e).toString());
        }
    }

    public void setElementDynaClass(DynaClass elementDynaClass) {
        Class cls;
        Class cls2;
        if (elementDynaClass == null) {
            throw new IllegalArgumentException("Element DynaClass is missing");
        }
        if (size() > 0) {
            throw new IllegalStateException("Element DynaClass cannot be reset");
        }
        try {
            DynaBean dynaBean = elementDynaClass.newInstance();
            this.elementDynaBeanType = dynaBean.getClass();
            if (class$org$apache$commons$beanutils$WrapDynaBean == null) {
                cls = class$("org.apache.commons.beanutils.WrapDynaBean");
                class$org$apache$commons$beanutils$WrapDynaBean = cls;
            } else {
                cls = class$org$apache$commons$beanutils$WrapDynaBean;
            }
            if (cls.isAssignableFrom(this.elementDynaBeanType)) {
                this.elementType = ((WrapDynaBean) dynaBean).getInstance().getClass();
                this.wrapDynaClass = (WrapDynaClass) elementDynaClass;
            } else {
                if (class$org$apache$commons$beanutils$LazyDynaMap == null) {
                    cls2 = class$("org.apache.commons.beanutils.LazyDynaMap");
                    class$org$apache$commons$beanutils$LazyDynaMap = cls2;
                } else {
                    cls2 = class$org$apache$commons$beanutils$LazyDynaMap;
                }
                if (cls2.isAssignableFrom(this.elementDynaBeanType)) {
                    this.elementType = ((LazyDynaMap) dynaBean).getMap().getClass();
                    this.elementDynaClass = elementDynaClass;
                } else {
                    this.elementType = dynaBean.getClass();
                    this.elementDynaClass = elementDynaClass;
                }
            }
        } catch (Exception e) {
            throw new IllegalArgumentException(new StringBuffer().append("Error creating DynaBean from ").append(elementDynaClass.getClass().getName()).append(" - ").append(e).toString());
        }
    }

    private void growList(int requiredSize) {
        if (requiredSize < size()) {
            return;
        }
        ensureCapacity(requiredSize + 1);
        for (int i = size(); i < requiredSize; i++) {
            DynaBean dynaBean = transform(null);
            super.add(dynaBean);
        }
    }

    private DynaBean transform(Object element) {
        Class cls;
        Class cls2;
        DynaBean dynaBean;
        Class newDynaBeanType;
        Class cls3;
        Class cls4;
        if (element == null) {
            if (this.elementType == null) {
                setElementDynaClass(new LazyDynaClass());
            }
            if (getDynaClass() == null) {
                setElementType(this.elementType);
            }
            try {
                dynaBean = getDynaClass().newInstance();
                newDynaBeanType = dynaBean.getClass();
            } catch (Exception e) {
                throw new IllegalArgumentException(new StringBuffer().append("Error creating DynaBean: ").append(getDynaClass().getClass().getName()).append(" - ").append(e).toString());
            }
        } else {
            element.getClass();
            if (class$java$util$Map == null) {
                cls = class$("java.util.Map");
                class$java$util$Map = cls;
            } else {
                cls = class$java$util$Map;
            }
            if (cls.isAssignableFrom(element.getClass())) {
                dynaBean = new LazyDynaMap((Map) element);
            } else {
                if (class$org$apache$commons$beanutils$DynaBean == null) {
                    cls2 = class$("org.apache.commons.beanutils.DynaBean");
                    class$org$apache$commons$beanutils$DynaBean = cls2;
                } else {
                    cls2 = class$org$apache$commons$beanutils$DynaBean;
                }
                if (cls2.isAssignableFrom(element.getClass())) {
                    dynaBean = (DynaBean) element;
                } else {
                    dynaBean = new WrapDynaBean(element);
                }
            }
            newDynaBeanType = dynaBean.getClass();
        }
        Class newElementType = dynaBean.getClass();
        if (class$org$apache$commons$beanutils$WrapDynaBean == null) {
            cls3 = class$("org.apache.commons.beanutils.WrapDynaBean");
            class$org$apache$commons$beanutils$WrapDynaBean = cls3;
        } else {
            cls3 = class$org$apache$commons$beanutils$WrapDynaBean;
        }
        if (cls3.isAssignableFrom(newDynaBeanType)) {
            newElementType = ((WrapDynaBean) dynaBean).getInstance().getClass();
        } else {
            if (class$org$apache$commons$beanutils$LazyDynaMap == null) {
                cls4 = class$("org.apache.commons.beanutils.LazyDynaMap");
                class$org$apache$commons$beanutils$LazyDynaMap = cls4;
            } else {
                cls4 = class$org$apache$commons$beanutils$LazyDynaMap;
            }
            if (cls4.isAssignableFrom(newDynaBeanType)) {
                newElementType = ((LazyDynaMap) dynaBean).getMap().getClass();
            }
        }
        if (this.elementType != null && !newElementType.equals(this.elementType)) {
            throw new IllegalArgumentException(new StringBuffer().append("Element Type ").append(newElementType).append(" doesn't match other elements ").append(this.elementType).toString());
        }
        return dynaBean;
    }

    private DynaClass getDynaClass() {
        return this.elementDynaClass == null ? this.wrapDynaClass : this.elementDynaClass;
    }
}

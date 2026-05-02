package ezvcard.util;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/CaseClasses.class */
public abstract class CaseClasses<T, V> {
    protected final Class<T> clazz;
    private volatile Collection<T> preDefined = null;
    private Collection<T> runtimeDefined = null;

    protected abstract T create(V v);

    protected abstract boolean matches(T t, V v);

    public CaseClasses(Class<T> clazz) {
        this.clazz = clazz;
    }

    public T find(V value) {
        checkInit();
        for (T obj : this.preDefined) {
            if (matches(obj, value)) {
                return obj;
            }
        }
        return null;
    }

    public T get(V v) {
        T find = find(v);
        if (find != null) {
            return find;
        }
        synchronized (this.runtimeDefined) {
            for (T t : this.runtimeDefined) {
                if (matches(t, v)) {
                    return t;
                }
            }
            T create = create(v);
            this.runtimeDefined.add(create);
            return create;
        }
    }

    public Collection<T> all() {
        checkInit();
        return this.preDefined;
    }

    private void checkInit() {
        if (this.preDefined == null) {
            synchronized (this) {
                if (this.preDefined == null) {
                    init();
                }
            }
        }
    }

    private void init() {
        Collection<T> preDefined = new ArrayList<>();
        Field[] arr$ = this.clazz.getFields();
        for (Field field : arr$) {
            int modifiers = field.getModifiers();
            if (Modifier.isStatic(modifiers) && Modifier.isPublic(modifiers) && field.getDeclaringClass() == this.clazz && field.getType() == this.clazz) {
                try {
                    Object obj = field.get(null);
                    if (obj != null) {
                        T c = this.clazz.cast(obj);
                        preDefined.add(c);
                    }
                } catch (Exception ex) {
                    throw new RuntimeException(ex);
                }
            }
        }
        this.runtimeDefined = new ArrayList(0);
        this.preDefined = Collections.unmodifiableCollection(preDefined);
    }
}

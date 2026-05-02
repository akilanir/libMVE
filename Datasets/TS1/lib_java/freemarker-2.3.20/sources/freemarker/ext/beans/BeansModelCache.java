package freemarker.ext.beans;

import freemarker.core._ConcurrentMapFactory;
import freemarker.ext.util.ModelCache;
import freemarker.ext.util.ModelFactory;
import freemarker.template.TemplateModel;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/BeansModelCache.class */
public class BeansModelCache extends ModelCache {
    private final Map classToFactory = _ConcurrentMapFactory.newMaybeConcurrentHashMap();
    private final boolean classToFactoryIsConcurrent = _ConcurrentMapFactory.isConcurrent(this.classToFactory);
    private final Set mappedClassNames = new HashSet();
    private final BeansWrapper wrapper;
    static Class class$java$lang$Boolean;

    BeansModelCache(BeansWrapper wrapper) {
        this.wrapper = wrapper;
    }

    @Override // freemarker.ext.util.ModelCache
    protected boolean isCacheable(Object object) {
        Class<?> cls;
        Class<?> cls2 = object.getClass();
        if (class$java$lang$Boolean == null) {
            cls = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls;
        } else {
            cls = class$java$lang$Boolean;
        }
        return cls2 != cls;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // freemarker.ext.util.ModelCache
    protected TemplateModel create(Object object) {
        Class clazz = object.getClass();
        ModelFactory factory = null;
        if (this.classToFactoryIsConcurrent) {
            factory = (ModelFactory) this.classToFactory.get(clazz);
        }
        if (factory == null) {
            synchronized (this.classToFactory) {
                factory = (ModelFactory) this.classToFactory.get(clazz);
                if (factory == null) {
                    String className = clazz.getName();
                    if (!this.mappedClassNames.add(className)) {
                        this.classToFactory.clear();
                        this.mappedClassNames.clear();
                        this.mappedClassNames.add(className);
                    }
                    factory = this.wrapper.getModelFactory(clazz);
                    this.classToFactory.put(clazz, factory);
                }
            }
        }
        return factory.create(object, this.wrapper);
    }
}

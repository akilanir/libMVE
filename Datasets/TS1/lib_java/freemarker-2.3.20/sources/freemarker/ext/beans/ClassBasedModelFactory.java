package freemarker.ext.beans;

import freemarker.core._ConcurrentMapFactory;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.ClassUtil;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/ClassBasedModelFactory.class */
abstract class ClassBasedModelFactory implements TemplateHashModel {
    private final BeansWrapper wrapper;
    private final Map cache = _ConcurrentMapFactory.newMaybeConcurrentHashMap();
    private final boolean isCacheConcurrentMap = _ConcurrentMapFactory.isConcurrent(this.cache);
    private final Set classIntrospectionsInProgress = new HashSet();

    protected abstract TemplateModel createModel(Class cls) throws TemplateModelException;

    protected ClassBasedModelFactory(BeansWrapper wrapper) {
        this.wrapper = wrapper;
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        try {
            return getInternal(key);
        } catch (Exception e) {
            if (e instanceof TemplateModelException) {
                throw ((TemplateModelException) e);
            }
            throw new TemplateModelException(e);
        }
    }

    private TemplateModel getInternal(String key) throws TemplateModelException, ClassNotFoundException {
        TemplateModel model;
        if (this.isCacheConcurrentMap && (model = (TemplateModel) this.cache.get(key)) != null) {
            return model;
        }
        Object sharedLock = this.wrapper.getSharedClassIntrospectionCacheLock();
        synchronized (sharedLock) {
            TemplateModel model2 = (TemplateModel) this.cache.get(key);
            if (model2 != null) {
                return model2;
            }
            while (model2 == null && this.classIntrospectionsInProgress.contains(key)) {
                try {
                    sharedLock.wait();
                    model2 = (TemplateModel) this.cache.get(key);
                } catch (InterruptedException e) {
                    throw new RuntimeException(new StringBuffer().append("Class inrospection data lookup aborded: ").append(e).toString());
                }
            }
            if (model2 != null) {
                return model2;
            }
            this.classIntrospectionsInProgress.add(key);
            try {
                Class clazz = ClassUtil.forName(key);
                this.wrapper.getClassIntrospectionData(clazz);
                TemplateModel model3 = createModel(clazz);
                if (model3 != null) {
                    synchronized (sharedLock) {
                        this.cache.put(key, model3);
                    }
                }
                synchronized (sharedLock) {
                    this.classIntrospectionsInProgress.remove(key);
                    sharedLock.notifyAll();
                }
                return model3;
            } catch (Throwable th) {
                synchronized (sharedLock) {
                    this.classIntrospectionsInProgress.remove(key);
                    sharedLock.notifyAll();
                    throw th;
                }
            }
        }
    }

    void clearCache() {
        synchronized (this.wrapper.getSharedClassIntrospectionCacheLock()) {
            this.cache.clear();
        }
    }

    void removeFromCache(Class clazz) {
        synchronized (this.wrapper.getSharedClassIntrospectionCacheLock()) {
            this.cache.remove(clazz.getName());
        }
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return false;
    }

    protected BeansWrapper getWrapper() {
        return this.wrapper;
    }
}

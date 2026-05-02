package freemarker.ext.util;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelAdapter;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/util/ModelCache.class */
public abstract class ModelCache {
    private boolean useCache = false;
    private Map modelCache = null;
    private ReferenceQueue refQueue = null;

    protected abstract TemplateModel create(Object obj);

    protected abstract boolean isCacheable(Object obj);

    protected ModelCache() {
    }

    public synchronized void setUseCache(boolean useCache) {
        this.useCache = useCache;
        if (useCache) {
            this.modelCache = new IdentityHashMap();
            this.refQueue = new ReferenceQueue();
        } else {
            this.modelCache = null;
            this.refQueue = null;
        }
    }

    public TemplateModel getInstance(Object object) {
        if (object instanceof TemplateModel) {
            return (TemplateModel) object;
        }
        if (object instanceof TemplateModelAdapter) {
            return ((TemplateModelAdapter) object).getTemplateModel();
        }
        if (this.useCache && isCacheable(object)) {
            TemplateModel model = lookup(object);
            if (model == null) {
                model = create(object);
                register(model, object);
            }
            return model;
        }
        return create(object);
    }

    public void clearCache() {
        if (this.modelCache != null) {
            synchronized (this.modelCache) {
                this.modelCache.clear();
            }
        }
    }

    private final TemplateModel lookup(Object object) {
        ModelReference ref;
        synchronized (this.modelCache) {
            ref = (ModelReference) this.modelCache.get(object);
        }
        if (ref != null) {
            return ref.getModel();
        }
        return null;
    }

    private final void register(TemplateModel model, Object object) {
        synchronized (this.modelCache) {
            while (true) {
                ModelReference queuedRef = (ModelReference) this.refQueue.poll();
                if (queuedRef != null) {
                    this.modelCache.remove(queuedRef.object);
                } else {
                    this.modelCache.put(object, new ModelReference(model, object, this.refQueue));
                }
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/util/ModelCache$ModelReference.class */
    private static final class ModelReference extends SoftReference {
        Object object;

        ModelReference(TemplateModel ref, Object object, ReferenceQueue refQueue) {
            super(ref, refQueue);
            this.object = object;
        }

        TemplateModel getModel() {
            return (TemplateModel) get();
        }
    }
}

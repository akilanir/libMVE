package javassist.scopedpool;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
import javassist.ClassPool;
import javassist.LoaderClassPath;

/* loaded from: javassist-3.18.1-GA.jar:javassist/scopedpool/ScopedClassPoolRepositoryImpl.class */
public class ScopedClassPoolRepositoryImpl implements ScopedClassPoolRepository {
    private static final ScopedClassPoolRepositoryImpl instance = new ScopedClassPoolRepositoryImpl();
    boolean pruneWhenCached;
    private boolean prune = true;
    protected Map registeredCLs = Collections.synchronizedMap(new WeakHashMap());
    protected ScopedClassPoolFactory factory = new ScopedClassPoolFactoryImpl();
    protected ClassPool classpool = ClassPool.getDefault();

    public static ScopedClassPoolRepository getInstance() {
        return instance;
    }

    private ScopedClassPoolRepositoryImpl() {
        ClassLoader cl = Thread.currentThread().getContextClassLoader();
        this.classpool.insertClassPath(new LoaderClassPath(cl));
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public boolean isPrune() {
        return this.prune;
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public void setPrune(boolean prune) {
        this.prune = prune;
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public ScopedClassPool createScopedClassPool(ClassLoader cl, ClassPool src) {
        return this.factory.create(cl, src, this);
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public ClassPool findClassPool(ClassLoader cl) {
        if (cl == null) {
            return registerClassLoader(ClassLoader.getSystemClassLoader());
        }
        return registerClassLoader(cl);
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public ClassPool registerClassLoader(ClassLoader ucl) {
        synchronized (this.registeredCLs) {
            if (this.registeredCLs.containsKey(ucl)) {
                return (ClassPool) this.registeredCLs.get(ucl);
            }
            ScopedClassPool pool = createScopedClassPool(ucl, this.classpool);
            this.registeredCLs.put(ucl, pool);
            return pool;
        }
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public Map getRegisteredCLs() {
        clearUnregisteredClassLoaders();
        return this.registeredCLs;
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public void clearUnregisteredClassLoaders() {
        ArrayList toUnregister = null;
        synchronized (this.registeredCLs) {
            Iterator it = this.registeredCLs.values().iterator();
            while (it.hasNext()) {
                ScopedClassPool pool = (ScopedClassPool) it.next();
                if (pool.isUnloadedClassLoader()) {
                    it.remove();
                    ClassLoader cl = pool.getClassLoader();
                    if (cl != null) {
                        if (toUnregister == null) {
                            toUnregister = new ArrayList();
                        }
                        toUnregister.add(cl);
                    }
                }
            }
            if (toUnregister != null) {
                for (int i = 0; i < toUnregister.size(); i++) {
                    unregisterClassLoader((ClassLoader) toUnregister.get(i));
                }
            }
        }
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public void unregisterClassLoader(ClassLoader cl) {
        synchronized (this.registeredCLs) {
            ScopedClassPool pool = (ScopedClassPool) this.registeredCLs.remove(cl);
            if (pool != null) {
                pool.close();
            }
        }
    }

    public void insertDelegate(ScopedClassPoolRepository delegate) {
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public void setClassPoolFactory(ScopedClassPoolFactory factory) {
        this.factory = factory;
    }

    @Override // javassist.scopedpool.ScopedClassPoolRepository
    public ScopedClassPoolFactory getClassPoolFactory() {
        return this.factory;
    }
}

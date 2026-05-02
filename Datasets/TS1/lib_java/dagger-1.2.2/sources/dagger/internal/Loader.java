package dagger.internal;

/* loaded from: dagger-1.2.2.jar:dagger/internal/Loader.class */
public abstract class Loader {
    private final Memoizer<ClassLoader, Memoizer<String, Class<?>>> caches = new Memoizer<ClassLoader, Memoizer<String, Class<?>>>() { // from class: dagger.internal.Loader.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // dagger.internal.Memoizer
        public Memoizer<String, Class<?>> create(final ClassLoader classLoader) {
            return new Memoizer<String, Class<?>>() { // from class: dagger.internal.Loader.1.1
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // dagger.internal.Memoizer
                public Class<?> create(String className) {
                    try {
                        return classLoader.loadClass(className);
                    } catch (ClassNotFoundException e) {
                        return Void.class;
                    }
                }
            };
        }
    };

    public abstract Binding<?> getAtInjectBinding(String str, String str2, ClassLoader classLoader, boolean z);

    public abstract <T> ModuleAdapter<T> getModuleAdapter(Class<T> cls);

    public abstract StaticInjection getStaticInjection(Class<?> cls);

    protected Class<?> loadClass(ClassLoader classLoader, String name) {
        return this.caches.get(classLoader != null ? classLoader : ClassLoader.getSystemClassLoader()).get(name);
    }

    protected <T> T instantiate(String str, ClassLoader classLoader) {
        try {
            Class<?> loadClass = loadClass(classLoader, str);
            if (loadClass == Void.class) {
                return null;
            }
            return (T) loadClass.newInstance();
        } catch (IllegalAccessException e) {
            throw new RuntimeException("Failed to initialize " + str, e);
        } catch (InstantiationException e2) {
            throw new RuntimeException("Failed to initialize " + str, e2);
        }
    }
}

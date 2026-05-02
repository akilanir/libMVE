package dagger.internal;

/* loaded from: dagger-1.2.2.jar:dagger/internal/ModuleAdapter.class */
public abstract class ModuleAdapter<T> {
    public final Class<T> moduleClass;
    public final String[] injectableTypes;
    public final Class<?>[] staticInjections;
    public final boolean overrides;
    public final Class<?>[] includes;
    public final boolean complete;
    public final boolean library;

    protected ModuleAdapter(Class<T> moduleClass, String[] injectableTypes, Class<?>[] staticInjections, boolean overrides, Class<?>[] includes, boolean complete, boolean library) {
        this.moduleClass = moduleClass;
        this.injectableTypes = injectableTypes;
        this.staticInjections = staticInjections;
        this.overrides = overrides;
        this.includes = includes;
        this.complete = complete;
        this.library = library;
    }

    public void getBindings(BindingsGroup map, T module) {
    }

    protected T newModule() {
        throw new UnsupportedOperationException("No no-args constructor on " + getClass().getName());
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof ModuleAdapter) {
            ModuleAdapter<?> that = (ModuleAdapter) obj;
            return this.moduleClass.equals(that.moduleClass);
        }
        return false;
    }

    public final int hashCode() {
        return this.moduleClass.hashCode();
    }
}

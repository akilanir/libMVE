package dagger.internal;

/* loaded from: dagger-1.2.2.jar:dagger/internal/ProvidesBinding.class */
public abstract class ProvidesBinding<T> extends Binding<T> {
    protected final String moduleClass;
    protected final String methodName;

    @Override // dagger.internal.Binding
    public abstract T get();

    public ProvidesBinding(String key, boolean singleton, String moduleClass, String methodName) {
        super(key, null, singleton, moduleClass + "." + methodName + "()");
        this.moduleClass = moduleClass;
        this.methodName = methodName;
    }

    @Override // dagger.internal.Binding
    public String toString() {
        return getClass().getName() + "[key=" + this.provideKey + " method=" + this.moduleClass + "." + this.methodName + "()]";
    }
}

package dagger.internal;

import dagger.MembersInjector;
import java.util.Set;
import javax.inject.Provider;

/* loaded from: dagger-1.2.2.jar:dagger/internal/Binding.class */
public abstract class Binding<T> implements Provider<T>, MembersInjector<T> {
    public static final Binding<Object> UNRESOLVED = new Binding<Object>(null, null, false, null) { // from class: dagger.internal.Binding.1
        @Override // dagger.internal.Binding
        public Object get() {
            throw new AssertionError("Unresolved binding should never be called to inject.");
        }

        @Override // dagger.internal.Binding, dagger.MembersInjector
        public void injectMembers(Object t) {
            throw new AssertionError("Unresolved binding should never be called to inject.");
        }
    };
    protected static final boolean IS_SINGLETON = true;
    protected static final boolean NOT_SINGLETON = false;
    private static final int SINGLETON = 1;
    private static final int LINKED = 2;
    private static final int VISITING = 4;
    private static final int CYCLE_FREE = 8;
    private static final int DEPENDED_ON = 16;
    private static final int LIBRARY = 32;
    public final String provideKey;
    public final String membersKey;
    private int bits;
    public final Object requiredBy;

    protected Binding(String provideKey, String membersKey, boolean singleton, Object requiredBy) {
        if (singleton && provideKey == null) {
            throw new InvalidBindingException(Keys.getClassName(membersKey), "is exclusively members injected and therefore cannot be scoped");
        }
        this.provideKey = provideKey;
        this.membersKey = membersKey;
        this.requiredBy = requiredBy;
        this.bits = singleton ? 1 : NOT_SINGLETON;
    }

    public void attach(Linker linker) {
    }

    @Override // dagger.MembersInjector
    public void injectMembers(T t) {
    }

    public T get() {
        throw new UnsupportedOperationException("No injectable constructor on " + getClass().getName());
    }

    public void getDependencies(Set<Binding<?>> getBindings, Set<Binding<?>> injectMembersBindings) {
    }

    void setLinked() {
        this.bits |= LINKED;
    }

    public boolean isLinked() {
        return (this.bits & LINKED) != 0;
    }

    boolean isSingleton() {
        return (this.bits & 1) != 0;
    }

    public boolean isVisiting() {
        return (this.bits & VISITING) != 0;
    }

    public void setVisiting(boolean visiting) {
        this.bits = visiting ? this.bits | VISITING : this.bits & (-5);
    }

    public boolean isCycleFree() {
        return (this.bits & CYCLE_FREE) != 0;
    }

    public void setCycleFree(boolean cycleFree) {
        this.bits = cycleFree ? this.bits | CYCLE_FREE : this.bits & (-9);
    }

    public void setLibrary(boolean library) {
        this.bits = library ? this.bits | LIBRARY : this.bits & (-33);
    }

    public boolean library() {
        return (this.bits & LIBRARY) != 0;
    }

    public void setDependedOn(boolean dependedOn) {
        this.bits = dependedOn ? this.bits | DEPENDED_ON : this.bits & (-17);
    }

    public boolean dependedOn() {
        return (this.bits & DEPENDED_ON) != 0;
    }

    public String toString() {
        return getClass().getSimpleName() + "[provideKey=\"" + this.provideKey + "\", memberskey=\"" + this.membersKey + "\"]";
    }

    /* loaded from: dagger-1.2.2.jar:dagger/internal/Binding$InvalidBindingException.class */
    public static class InvalidBindingException extends RuntimeException {
        public final String type;

        public InvalidBindingException(String type, String error) {
            super(error);
            this.type = type;
        }

        public InvalidBindingException(String type, String error, Throwable cause) {
            super("Binding for " + type + " was invalid: " + error, cause);
            this.type = type;
        }
    }
}

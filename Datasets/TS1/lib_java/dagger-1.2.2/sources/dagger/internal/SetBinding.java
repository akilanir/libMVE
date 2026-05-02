package dagger.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* loaded from: dagger-1.2.2.jar:dagger/internal/SetBinding.class */
public final class SetBinding<T> extends Binding<Set<T>> {
    private final SetBinding<T> parent;
    private final List<Binding<?>> contributors;

    public static <T> void add(BindingsGroup bindings, String setKey, Binding<?> binding) {
        prepareSetBinding(bindings, setKey, binding).contributors.add(Linker.scope(binding));
    }

    private static <T> SetBinding<T> prepareSetBinding(BindingsGroup bindings, String setKey, Binding<?> binding) {
        Binding<?> previous = bindings.get(setKey);
        if (previous instanceof SetBinding) {
            SetBinding<T> setBinding = (SetBinding) previous;
            setBinding.setLibrary(setBinding.library() && binding.library());
            return setBinding;
        }
        if (previous != null) {
            throw new IllegalArgumentException("Duplicate:\n    " + previous + "\n    " + binding);
        }
        SetBinding<?> setBinding2 = new SetBinding<>(setKey, binding.requiredBy);
        setBinding2.setLibrary(binding.library());
        bindings.contributeSetBinding(setKey, setBinding2);
        return (SetBinding) bindings.get(setKey);
    }

    public SetBinding(String key, Object requiredBy) {
        super(key, null, false, requiredBy);
        this.parent = null;
        this.contributors = new ArrayList();
    }

    public SetBinding(SetBinding<T> original) {
        super(original.provideKey, null, false, original.requiredBy);
        this.parent = original;
        setLibrary(original.library());
        setDependedOn(original.dependedOn());
        this.contributors = new ArrayList();
    }

    @Override // dagger.internal.Binding
    public void attach(Linker linker) {
        for (Binding<?> contributor : this.contributors) {
            contributor.attach(linker);
        }
    }

    public int size() {
        int size = 0;
        SetBinding<T> setBinding = this;
        while (true) {
            SetBinding<T> binding = setBinding;
            if (binding != null) {
                size += binding.contributors.size();
                setBinding = binding.parent;
            } else {
                return size;
            }
        }
    }

    @Override // dagger.internal.Binding
    public Set<T> get() {
        ArrayList arrayList = new ArrayList();
        SetBinding<T> setBinding = this;
        while (true) {
            SetBinding<T> setBinding2 = setBinding;
            if (setBinding2 != null) {
                int size = setBinding2.contributors.size();
                for (int i = 0; i < size; i++) {
                    Binding<?> contributor = setBinding2.contributors.get(i);
                    Object contribution = contributor.get();
                    if (contributor.provideKey.equals(this.provideKey)) {
                        arrayList.addAll((Set) contribution);
                    } else {
                        arrayList.add(contribution);
                    }
                }
                setBinding = setBinding2.parent;
            } else {
                return Collections.unmodifiableSet(new LinkedHashSet(arrayList));
            }
        }
    }

    @Override // dagger.internal.Binding
    public void getDependencies(Set<Binding<?>> getBindings, Set<Binding<?>> injectMembersBindings) {
        SetBinding<T> setBinding = this;
        while (true) {
            SetBinding<T> binding = setBinding;
            if (binding != null) {
                getBindings.addAll(binding.contributors);
                setBinding = binding.parent;
            } else {
                return;
            }
        }
    }

    @Override // dagger.internal.Binding, dagger.MembersInjector
    public void injectMembers(Set<T> t) {
        throw new UnsupportedOperationException("Cannot inject members on a contributed Set<T>.");
    }

    @Override // dagger.internal.Binding
    public String toString() {
        boolean first = true;
        StringBuilder builder = new StringBuilder("SetBinding[");
        SetBinding<T> setBinding = this;
        while (true) {
            SetBinding<T> setBinding2 = setBinding;
            if (setBinding2 != null) {
                int size = setBinding2.contributors.size();
                for (int i = 0; i < size; i++) {
                    if (!first) {
                        builder.append(",");
                    }
                    builder.append(setBinding2.contributors.get(i));
                    first = false;
                }
                setBinding = setBinding2.parent;
            } else {
                builder.append("]");
                return builder.toString();
            }
        }
    }
}

package dagger.internal;

import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* loaded from: dagger-1.2.2.jar:dagger/internal/ProblemDetector.class */
public final class ProblemDetector {
    public void detectCircularDependencies(Collection<Binding<?>> bindings) {
        detectCircularDependencies(bindings, new ArrayList());
    }

    public void detectUnusedBinding(Collection<Binding<?>> bindings) {
        List<Binding> unusedBindings = new ArrayList<>();
        for (Binding binding : bindings) {
            if (!binding.library() && !binding.dependedOn()) {
                unusedBindings.add(binding);
            }
        }
        if (!unusedBindings.isEmpty()) {
            StringBuilder builder = new StringBuilder();
            builder.append("You have these unused @Provider methods:");
            for (int i = 0; i < unusedBindings.size(); i++) {
                builder.append("\n    ").append(i + 1).append(". ").append(unusedBindings.get(i).requiredBy);
            }
            builder.append("\n    Set library=true in your module to disable this check.");
            throw new IllegalStateException(builder.toString());
        }
    }

    private static void detectCircularDependencies(Collection<Binding<?>> bindings, List<Binding<?>> path) {
        for (Binding<?> binding : bindings) {
            if (!binding.isCycleFree()) {
                if (binding.isVisiting()) {
                    int index = path.indexOf(binding);
                    StringBuilder message = new StringBuilder().append("Dependency cycle:");
                    for (int i = index; i < path.size(); i++) {
                        message.append("\n    ").append(i - index).append(". ").append(path.get(i).provideKey).append(" bound by ").append(path.get(i));
                    }
                    message.append("\n    ").append(0).append(". ").append(binding.provideKey);
                    throw new IllegalStateException(message.toString());
                }
                binding.setVisiting(true);
                path.add(binding);
                try {
                    ArraySet<Binding<?>> dependencies = new ArraySet<>();
                    binding.getDependencies(dependencies, dependencies);
                    detectCircularDependencies(dependencies, path);
                    binding.setCycleFree(true);
                    path.remove(path.size() - 1);
                    binding.setVisiting(false);
                } catch (Throwable th) {
                    path.remove(path.size() - 1);
                    binding.setVisiting(false);
                    throw th;
                }
            }
        }
    }

    public void detectProblems(Collection<Binding<?>> values) {
        detectCircularDependencies(values);
        detectUnusedBinding(values);
    }

    /* loaded from: dagger-1.2.2.jar:dagger/internal/ProblemDetector$ArraySet.class */
    static class ArraySet<T> extends AbstractSet<T> {
        private final ArrayList<T> list = new ArrayList<>();

        ArraySet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean add(T t) {
            this.list.add(t);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<T> iterator() {
            return this.list.iterator();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            throw new UnsupportedOperationException();
        }
    }
}

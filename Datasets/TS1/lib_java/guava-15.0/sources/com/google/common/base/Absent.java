package com.google.common.base;

import com.google.common.annotations.GwtCompatible;
import java.util.Collections;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
/* loaded from: guava-15.0.jar:com/google/common/base/Absent.class */
final class Absent extends Optional<Object> {
    static final Absent INSTANCE = new Absent();
    private static final long serialVersionUID = 0;

    private Absent() {
    }

    @Override // com.google.common.base.Optional
    public boolean isPresent() {
        return false;
    }

    @Override // com.google.common.base.Optional
    public Object get() {
        throw new IllegalStateException("Optional.get() cannot be called on an absent value");
    }

    @Override // com.google.common.base.Optional
    public Object or(Object defaultValue) {
        return Preconditions.checkNotNull(defaultValue, "use Optional.orNull() instead of Optional.or(null)");
    }

    @Override // com.google.common.base.Optional
    public Optional<Object> or(Optional<? extends Object> optional) {
        return (Optional) Preconditions.checkNotNull(optional);
    }

    @Override // com.google.common.base.Optional
    public Object or(Supplier<? extends Object> supplier) {
        return Preconditions.checkNotNull(supplier.get(), "use Optional.orNull() instead of a Supplier that returns null");
    }

    @Override // com.google.common.base.Optional
    @Nullable
    public Object orNull() {
        return null;
    }

    @Override // com.google.common.base.Optional
    public Set<Object> asSet() {
        return Collections.emptySet();
    }

    @Override // com.google.common.base.Optional
    public <V> Optional<V> transform(Function<Object, V> function) {
        Preconditions.checkNotNull(function);
        return Optional.absent();
    }

    @Override // com.google.common.base.Optional
    public boolean equals(@Nullable Object object) {
        return object == this;
    }

    @Override // com.google.common.base.Optional
    public int hashCode() {
        return 1502476572;
    }

    @Override // com.google.common.base.Optional
    public String toString() {
        return "Optional.absent()";
    }

    private Object readResolve() {
        return INSTANCE;
    }
}

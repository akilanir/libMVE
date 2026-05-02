package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import java.lang.reflect.Field;
import javax.annotation.Nullable;

@Beta
@GwtCompatible(emulated = true)
/* loaded from: guava-15.0.jar:com/google/common/base/Enums.class */
public final class Enums {
    private Enums() {
    }

    @GwtIncompatible("reflection")
    public static Field getField(Enum<?> enumValue) {
        try {
            return enumValue.getDeclaringClass().getDeclaredField(enumValue.name());
        } catch (NoSuchFieldException impossible) {
            throw new AssertionError(impossible);
        }
    }

    public static <T extends Enum<T>> Function<String, T> valueOfFunction(Class<T> enumClass) {
        return new ValueOfFunction(enumClass);
    }

    /* loaded from: guava-15.0.jar:com/google/common/base/Enums$ValueOfFunction.class */
    private static final class ValueOfFunction<T extends Enum<T>> implements Function<String, T>, Serializable {
        private final Class<T> enumClass;
        private static final long serialVersionUID = 0;

        private ValueOfFunction(Class<T> enumClass) {
            this.enumClass = (Class) Preconditions.checkNotNull(enumClass);
        }

        @Override // com.google.common.base.Function
        public T apply(String str) {
            try {
                return (T) Enum.valueOf(this.enumClass, str);
            } catch (IllegalArgumentException e) {
                return null;
            }
        }

        @Override // com.google.common.base.Function
        public boolean equals(@Nullable Object obj) {
            return (obj instanceof ValueOfFunction) && this.enumClass.equals(((ValueOfFunction) obj).enumClass);
        }

        public int hashCode() {
            return this.enumClass.hashCode();
        }

        public String toString() {
            return "Enums.valueOf(" + this.enumClass + ")";
        }
    }

    public static <T extends Enum<T>> Optional<T> getIfPresent(Class<T> enumClass, String value) {
        Preconditions.checkNotNull(enumClass);
        Preconditions.checkNotNull(value);
        try {
            return Optional.of(Enum.valueOf(enumClass, value));
        } catch (IllegalArgumentException e) {
            return Optional.absent();
        }
    }
}

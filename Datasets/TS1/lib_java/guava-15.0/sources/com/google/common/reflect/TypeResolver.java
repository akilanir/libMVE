package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.google.common.reflect.Types;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nullable;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/reflect/TypeResolver.class */
public final class TypeResolver {
    private final TypeTable typeTable;

    public TypeResolver() {
        this.typeTable = new TypeTable();
    }

    private TypeResolver(TypeTable typeTable) {
        this.typeTable = typeTable;
    }

    static TypeResolver accordingTo(Type type) {
        return new TypeResolver().where(TypeMappingIntrospector.getTypeMappings(type));
    }

    public TypeResolver where(Type formal, Type actual) {
        Map<TypeVariable<?>, Type> mappings = Maps.newHashMap();
        populateTypeMappings(mappings, (Type) Preconditions.checkNotNull(formal), (Type) Preconditions.checkNotNull(actual));
        return where(mappings);
    }

    TypeResolver where(Map<? extends TypeVariable<?>, ? extends Type> mappings) {
        return new TypeResolver(this.typeTable.where(mappings));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void populateTypeMappings(final Map<TypeVariable<?>, Type> mappings, Type from, final Type to) {
        if (from.equals(to)) {
            return;
        }
        new TypeVisitor() { // from class: com.google.common.reflect.TypeResolver.1
            @Override // com.google.common.reflect.TypeVisitor
            void visitTypeVariable(TypeVariable<?> typeVariable) {
                mappings.put(typeVariable, to);
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitWildcardType(WildcardType fromWildcardType) {
                WildcardType toWildcardType = (WildcardType) TypeResolver.expectArgument(WildcardType.class, to);
                Type[] fromUpperBounds = fromWildcardType.getUpperBounds();
                Type[] toUpperBounds = toWildcardType.getUpperBounds();
                Type[] fromLowerBounds = fromWildcardType.getLowerBounds();
                Type[] toLowerBounds = toWildcardType.getLowerBounds();
                Preconditions.checkArgument(fromUpperBounds.length == toUpperBounds.length && fromLowerBounds.length == toLowerBounds.length, "Incompatible type: %s vs. %s", fromWildcardType, to);
                for (int i = 0; i < fromUpperBounds.length; i++) {
                    TypeResolver.populateTypeMappings(mappings, fromUpperBounds[i], toUpperBounds[i]);
                }
                for (int i2 = 0; i2 < fromLowerBounds.length; i2++) {
                    TypeResolver.populateTypeMappings(mappings, fromLowerBounds[i2], toLowerBounds[i2]);
                }
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitParameterizedType(ParameterizedType fromParameterizedType) {
                ParameterizedType toParameterizedType = (ParameterizedType) TypeResolver.expectArgument(ParameterizedType.class, to);
                Preconditions.checkArgument(fromParameterizedType.getRawType().equals(toParameterizedType.getRawType()), "Inconsistent raw type: %s vs. %s", fromParameterizedType, to);
                Type[] fromArgs = fromParameterizedType.getActualTypeArguments();
                Type[] toArgs = toParameterizedType.getActualTypeArguments();
                Preconditions.checkArgument(fromArgs.length == toArgs.length, "%s not compatible with %s", fromParameterizedType, toParameterizedType);
                for (int i = 0; i < fromArgs.length; i++) {
                    TypeResolver.populateTypeMappings(mappings, fromArgs[i], toArgs[i]);
                }
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitGenericArrayType(GenericArrayType fromArrayType) {
                Type componentType = Types.getComponentType(to);
                Preconditions.checkArgument(componentType != null, "%s is not an array type.", to);
                TypeResolver.populateTypeMappings(mappings, fromArrayType.getGenericComponentType(), componentType);
            }

            @Override // com.google.common.reflect.TypeVisitor
            void visitClass(Class<?> fromClass) {
                throw new IllegalArgumentException("No type mapping from " + fromClass);
            }
        }.visit(from);
    }

    public Type resolveType(Type type) {
        Preconditions.checkNotNull(type);
        if (type instanceof TypeVariable) {
            return this.typeTable.resolve((TypeVariable) type);
        }
        if (type instanceof ParameterizedType) {
            return resolveParameterizedType((ParameterizedType) type);
        }
        if (type instanceof GenericArrayType) {
            return resolveGenericArrayType((GenericArrayType) type);
        }
        if (type instanceof WildcardType) {
            WildcardType wildcardType = (WildcardType) type;
            return new Types.WildcardTypeImpl(resolveTypes(wildcardType.getLowerBounds()), resolveTypes(wildcardType.getUpperBounds()));
        }
        return type;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Type[] resolveTypes(Type[] types) {
        Type[] result = new Type[types.length];
        for (int i = 0; i < types.length; i++) {
            result[i] = resolveType(types[i]);
        }
        return result;
    }

    private Type resolveGenericArrayType(GenericArrayType type) {
        Type componentType = resolveType(type.getGenericComponentType());
        return Types.newArrayType(componentType);
    }

    private ParameterizedType resolveParameterizedType(ParameterizedType type) {
        Type owner = type.getOwnerType();
        Type resolvedOwner = owner == null ? null : resolveType(owner);
        Type resolvedRawType = resolveType(type.getRawType());
        Type[] vars = type.getActualTypeArguments();
        Type[] resolvedArgs = new Type[vars.length];
        for (int i = 0; i < vars.length; i++) {
            resolvedArgs[i] = resolveType(vars[i]);
        }
        return Types.newParameterizedTypeWithOwner(resolvedOwner, (Class) resolvedRawType, resolvedArgs);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <T> T expectArgument(Class<T> type, Object arg) {
        try {
            return type.cast(arg);
        } catch (ClassCastException e) {
            throw new IllegalArgumentException(arg + " is not a " + type.getSimpleName());
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/reflect/TypeResolver$TypeTable.class */
    private static class TypeTable {
        private final ImmutableMap<TypeVariable<?>, Type> map;

        TypeTable() {
            this.map = ImmutableMap.of();
        }

        private TypeTable(ImmutableMap<TypeVariable<?>, Type> map) {
            this.map = map;
        }

        final TypeTable where(Map<? extends TypeVariable<?>, ? extends Type> mappings) {
            ImmutableMap.Builder<TypeVariable<?>, Type> builder = ImmutableMap.builder();
            builder.putAll(this.map);
            for (Map.Entry<? extends TypeVariable<?>, ? extends Type> mapping : mappings.entrySet()) {
                TypeVariable<?> variable = mapping.getKey();
                Type type = mapping.getValue();
                Preconditions.checkArgument(!variable.equals(type), "Type variable %s bound to itself", variable);
                builder.put(variable, type);
            }
            return new TypeTable(builder.build());
        }

        final Type resolve(final TypeVariable<?> var) {
            TypeTable guarded = new TypeTable() { // from class: com.google.common.reflect.TypeResolver.TypeTable.1
                @Override // com.google.common.reflect.TypeResolver.TypeTable
                public Type resolveInternal(TypeVariable<?> intermediateVar, TypeTable forDependent) {
                    if (intermediateVar.getGenericDeclaration().equals(var.getGenericDeclaration())) {
                        return intermediateVar;
                    }
                    return this.resolveInternal(intermediateVar, forDependent);
                }
            };
            return resolveInternal(var, guarded);
        }

        Type resolveInternal(TypeVariable<?> var, TypeTable forDependants) {
            Type type = this.map.get(var);
            if (type == null) {
                Type[] bounds = var.getBounds();
                if (bounds.length != 0) {
                    return Types.newTypeVariable(var.getGenericDeclaration(), var.getName(), new TypeResolver(forDependants).resolveTypes(bounds));
                }
                return var;
            }
            return new TypeResolver(forDependants).resolveType(type);
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/reflect/TypeResolver$TypeMappingIntrospector.class */
    private static final class TypeMappingIntrospector extends TypeVisitor {
        private static final WildcardCapturer wildcardCapturer = new WildcardCapturer();
        private final Map<TypeVariable<?>, Type> mappings = Maps.newHashMap();

        private TypeMappingIntrospector() {
        }

        static ImmutableMap<TypeVariable<?>, Type> getTypeMappings(Type contextType) {
            TypeMappingIntrospector introspector = new TypeMappingIntrospector();
            introspector.visit(wildcardCapturer.capture(contextType));
            return ImmutableMap.copyOf((Map) introspector.mappings);
        }

        @Override // com.google.common.reflect.TypeVisitor
        void visitClass(Class<?> clazz) {
            visit(clazz.getGenericSuperclass());
            visit(clazz.getGenericInterfaces());
        }

        @Override // com.google.common.reflect.TypeVisitor
        void visitParameterizedType(ParameterizedType parameterizedType) {
            Class<?> rawClass = (Class) parameterizedType.getRawType();
            TypeVariable<?>[] vars = rawClass.getTypeParameters();
            Type[] typeArgs = parameterizedType.getActualTypeArguments();
            Preconditions.checkState(vars.length == typeArgs.length);
            for (int i = 0; i < vars.length; i++) {
                map(vars[i], typeArgs[i]);
            }
            visit(rawClass);
            visit(parameterizedType.getOwnerType());
        }

        @Override // com.google.common.reflect.TypeVisitor
        void visitTypeVariable(TypeVariable<?> t) {
            visit(t.getBounds());
        }

        @Override // com.google.common.reflect.TypeVisitor
        void visitWildcardType(WildcardType t) {
            visit(t.getUpperBounds());
        }

        private void map(TypeVariable<?> var, Type arg) {
            if (this.mappings.containsKey(var)) {
                return;
            }
            Type type = arg;
            while (true) {
                Type t = type;
                if (t != null) {
                    if (!var.equals(t)) {
                        type = this.mappings.get(t);
                    } else {
                        Type type2 = arg;
                        while (true) {
                            Type x = type2;
                            if (x == null) {
                                return;
                            } else {
                                type2 = this.mappings.remove(x);
                            }
                        }
                    }
                } else {
                    this.mappings.put(var, arg);
                    return;
                }
            }
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/reflect/TypeResolver$WildcardCapturer.class */
    private static final class WildcardCapturer {
        private final AtomicInteger id;

        private WildcardCapturer() {
            this.id = new AtomicInteger();
        }

        Type capture(Type type) {
            Preconditions.checkNotNull(type);
            if (type instanceof Class) {
                return type;
            }
            if (type instanceof TypeVariable) {
                return type;
            }
            if (type instanceof GenericArrayType) {
                GenericArrayType arrayType = (GenericArrayType) type;
                return Types.newArrayType(capture(arrayType.getGenericComponentType()));
            }
            if (type instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) type;
                return Types.newParameterizedTypeWithOwner(captureNullable(parameterizedType.getOwnerType()), (Class) parameterizedType.getRawType(), capture(parameterizedType.getActualTypeArguments()));
            }
            if (type instanceof WildcardType) {
                WildcardType wildcardType = (WildcardType) type;
                Type[] lowerBounds = wildcardType.getLowerBounds();
                if (lowerBounds.length == 0) {
                    Type[] upperBounds = wildcardType.getUpperBounds();
                    String name = "capture#" + this.id.incrementAndGet() + "-of ? extends " + Joiner.on('&').join(upperBounds);
                    return Types.newTypeVariable(WildcardCapturer.class, name, wildcardType.getUpperBounds());
                }
                return type;
            }
            throw new AssertionError("must have been one of the known types");
        }

        private Type captureNullable(@Nullable Type type) {
            if (type == null) {
                return null;
            }
            return capture(type);
        }

        private Type[] capture(Type[] types) {
            Type[] result = new Type[types.length];
            for (int i = 0; i < types.length; i++) {
                result[i] = capture(types[i]);
            }
            return result;
        }
    }
}

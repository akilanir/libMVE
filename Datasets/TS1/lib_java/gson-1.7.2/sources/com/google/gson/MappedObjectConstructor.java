package com.google.gson;

import com.google.gson.internal.C$Gson$Types;
import java.lang.reflect.Array;
import java.lang.reflect.Type;

/* loaded from: gson-1.7.2.jar:com/google/gson/MappedObjectConstructor.class */
final class MappedObjectConstructor implements ObjectConstructor {
    private static final UnsafeAllocator unsafeAllocator = UnsafeAllocator.create();
    private static final DefaultConstructorAllocator defaultConstructorAllocator = new DefaultConstructorAllocator(500);
    private final ParameterizedTypeHandlerMap<InstanceCreator<?>> instanceCreatorMap;

    public MappedObjectConstructor(ParameterizedTypeHandlerMap<InstanceCreator<?>> instanceCreators) {
        this.instanceCreatorMap = instanceCreators;
    }

    @Override // com.google.gson.ObjectConstructor
    public <T> T construct(Type type) {
        InstanceCreator<?> handlerFor = this.instanceCreatorMap.getHandlerFor(type);
        if (handlerFor != null) {
            return (T) handlerFor.createInstance(type);
        }
        return (T) constructWithAllocators(type);
    }

    @Override // com.google.gson.ObjectConstructor
    public Object constructArray(Type type, int length) {
        return Array.newInstance(C$Gson$Types.getRawType(type), length);
    }

    private <T> T constructWithAllocators(Type type) {
        try {
            Class<?> rawType = C$Gson$Types.getRawType(type);
            T t = (T) defaultConstructorAllocator.newInstance(rawType);
            return t == null ? (T) unsafeAllocator.newInstance(rawType) : t;
        } catch (Exception e) {
            throw new RuntimeException("Unable to invoke no-args constructor for " + type + ". Register an InstanceCreator with Gson for this type may fix this problem.", e);
        }
    }

    public String toString() {
        return this.instanceCreatorMap.toString();
    }
}

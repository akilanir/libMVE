package com.nineoldandroids.util;

/* loaded from: library-2.4.0.jar:com/nineoldandroids/util/IntProperty.class */
public abstract class IntProperty<T> extends Property<T, Integer> {
    public abstract void setValue(T t, int i);

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.nineoldandroids.util.Property
    public /* bridge */ /* synthetic */ void set(Object obj, Integer num) {
        set2((IntProperty<T>) obj, num);
    }

    public IntProperty(String name) {
        super(Integer.class, name);
    }

    /* renamed from: set, reason: avoid collision after fix types in other method */
    public final void set2(T object, Integer value) {
        set2((IntProperty<T>) object, Integer.valueOf(value.intValue()));
    }
}

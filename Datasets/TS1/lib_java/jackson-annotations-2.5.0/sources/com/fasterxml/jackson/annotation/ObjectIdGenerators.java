package com.fasterxml.jackson.annotation;

import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import java.util.UUID;

/* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerators.class */
public class ObjectIdGenerators {

    /* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerators$None.class */
    public static abstract class None extends ObjectIdGenerator<Object> {
    }

    /* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerators$Base.class */
    private static abstract class Base<T> extends ObjectIdGenerator<T> {
        protected final Class<?> _scope;

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public abstract T generateId(Object obj);

        protected Base(Class<?> scope) {
            this._scope = scope;
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public final Class<?> getScope() {
            return this._scope;
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public boolean canUseFor(ObjectIdGenerator<?> gen) {
            return gen.getClass() == getClass() && gen.getScope() == this._scope;
        }
    }

    /* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerators$PropertyGenerator.class */
    public static abstract class PropertyGenerator extends Base<Object> {
        private static final long serialVersionUID = 1;

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerators.Base, com.fasterxml.jackson.annotation.ObjectIdGenerator
        public /* bridge */ /* synthetic */ boolean canUseFor(ObjectIdGenerator x0) {
            return super.canUseFor(x0);
        }

        protected PropertyGenerator(Class<?> scope) {
            super(scope);
        }
    }

    /* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerators$IntSequenceGenerator.class */
    public static final class IntSequenceGenerator extends Base<Integer> {
        private static final long serialVersionUID = 1;
        protected transient int _nextValue;

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerators.Base, com.fasterxml.jackson.annotation.ObjectIdGenerator
        public /* bridge */ /* synthetic */ boolean canUseFor(ObjectIdGenerator x0) {
            return super.canUseFor(x0);
        }

        public IntSequenceGenerator() {
            this(Object.class, -1);
        }

        public IntSequenceGenerator(Class<?> scope, int fv) {
            super(scope);
            this._nextValue = fv;
        }

        protected int initialValue() {
            return 1;
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public ObjectIdGenerator<Integer> forScope(Class<?> scope) {
            return this._scope == scope ? this : new IntSequenceGenerator(scope, this._nextValue);
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public ObjectIdGenerator<Integer> newForSerialization(Object context) {
            return new IntSequenceGenerator(this._scope, initialValue());
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public ObjectIdGenerator.IdKey key(Object key) {
            return new ObjectIdGenerator.IdKey(getClass(), this._scope, key);
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerators.Base, com.fasterxml.jackson.annotation.ObjectIdGenerator
        public Integer generateId(Object forPojo) {
            int id = this._nextValue;
            this._nextValue++;
            return Integer.valueOf(id);
        }
    }

    /* loaded from: jackson-annotations-2.5.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerators$UUIDGenerator.class */
    public static final class UUIDGenerator extends Base<UUID> {
        private static final long serialVersionUID = 1;

        public UUIDGenerator() {
            this(Object.class);
        }

        private UUIDGenerator(Class<?> scope) {
            super(Object.class);
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public ObjectIdGenerator<UUID> forScope(Class<?> scope) {
            return this;
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public ObjectIdGenerator<UUID> newForSerialization(Object context) {
            return this;
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerators.Base, com.fasterxml.jackson.annotation.ObjectIdGenerator
        public UUID generateId(Object forPojo) {
            return UUID.randomUUID();
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerator
        public ObjectIdGenerator.IdKey key(Object key) {
            return new ObjectIdGenerator.IdKey(getClass(), null, key);
        }

        @Override // com.fasterxml.jackson.annotation.ObjectIdGenerators.Base, com.fasterxml.jackson.annotation.ObjectIdGenerator
        public boolean canUseFor(ObjectIdGenerator<?> gen) {
            return gen.getClass() == getClass();
        }
    }
}

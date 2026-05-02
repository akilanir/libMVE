package com.actionbarsherlock.internal.nineoldandroids.animation;

import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/animation/PropertyValuesHolder.class */
public class PropertyValuesHolder implements Cloneable {
    String mPropertyName;
    Method mSetter;
    private Method mGetter;
    Class mValueType;
    KeyframeSet mKeyframeSet;
    private static final TypeEvaluator sIntEvaluator = new IntEvaluator();
    private static final TypeEvaluator sFloatEvaluator = new FloatEvaluator();
    private static Class[] FLOAT_VARIANTS = {Float.TYPE, Float.class, Double.TYPE, Integer.TYPE, Double.class, Integer.class};
    private static Class[] INTEGER_VARIANTS = {Integer.TYPE, Integer.class, Float.TYPE, Double.TYPE, Float.class, Double.class};
    private static Class[] DOUBLE_VARIANTS = {Double.TYPE, Double.class, Float.TYPE, Integer.TYPE, Float.class, Integer.class};
    private static final HashMap<Class, HashMap<String, Method>> sSetterPropertyMap = new HashMap<>();
    private static final HashMap<Class, HashMap<String, Method>> sGetterPropertyMap = new HashMap<>();
    final ReentrantReadWriteLock mPropertyMapLock;
    final Object[] mTmpValueArray;
    private TypeEvaluator mEvaluator;
    private Object mAnimatedValue;

    private PropertyValuesHolder(String propertyName) {
        this.mSetter = null;
        this.mGetter = null;
        this.mKeyframeSet = null;
        this.mPropertyMapLock = new ReentrantReadWriteLock();
        this.mTmpValueArray = new Object[1];
        this.mPropertyName = propertyName;
    }

    public static PropertyValuesHolder ofInt(String propertyName, int... values) {
        return new IntPropertyValuesHolder(propertyName, values);
    }

    public static PropertyValuesHolder ofFloat(String propertyName, float... values) {
        return new FloatPropertyValuesHolder(propertyName, values);
    }

    public static PropertyValuesHolder ofObject(String propertyName, TypeEvaluator evaluator, Object... values) {
        PropertyValuesHolder pvh = new PropertyValuesHolder(propertyName);
        pvh.setObjectValues(values);
        pvh.setEvaluator(evaluator);
        return pvh;
    }

    public static PropertyValuesHolder ofKeyframe(String propertyName, Keyframe... values) {
        KeyframeSet keyframeSet = KeyframeSet.ofKeyframe(values);
        if (keyframeSet instanceof IntKeyframeSet) {
            return new IntPropertyValuesHolder(propertyName, (IntKeyframeSet) keyframeSet);
        }
        if (keyframeSet instanceof FloatKeyframeSet) {
            return new FloatPropertyValuesHolder(propertyName, (FloatKeyframeSet) keyframeSet);
        }
        PropertyValuesHolder pvh = new PropertyValuesHolder(propertyName);
        pvh.mKeyframeSet = keyframeSet;
        pvh.mValueType = values[0].getType();
        return pvh;
    }

    public void setIntValues(int... values) {
        this.mValueType = Integer.TYPE;
        this.mKeyframeSet = KeyframeSet.ofInt(values);
    }

    public void setFloatValues(float... values) {
        this.mValueType = Float.TYPE;
        this.mKeyframeSet = KeyframeSet.ofFloat(values);
    }

    public void setKeyframes(Keyframe... values) {
        int numKeyframes = values.length;
        Keyframe[] keyframes = new Keyframe[Math.max(numKeyframes, 2)];
        this.mValueType = values[0].getType();
        for (int i = 0; i < numKeyframes; i++) {
            keyframes[i] = values[i];
        }
        this.mKeyframeSet = new KeyframeSet(keyframes);
    }

    public void setObjectValues(Object... values) {
        this.mValueType = values[0].getClass();
        this.mKeyframeSet = KeyframeSet.ofObject(values);
    }

    private Method getPropertyFunction(Class targetClass, String prefix, Class valueType) {
        Class[] typeVariants;
        Method returnVal = null;
        String methodName = getMethodName(prefix, this.mPropertyName);
        if (valueType == null) {
            try {
                returnVal = targetClass.getMethod(methodName, null);
            } catch (NoSuchMethodException e) {
                Log.e("PropertyValuesHolder", targetClass.getSimpleName() + " - Couldn't find no-arg method for property " + this.mPropertyName + ": " + e);
            }
        } else {
            Class[] args = new Class[1];
            if (this.mValueType.equals(Float.class)) {
                typeVariants = FLOAT_VARIANTS;
            } else if (this.mValueType.equals(Integer.class)) {
                typeVariants = INTEGER_VARIANTS;
            } else if (this.mValueType.equals(Double.class)) {
                typeVariants = DOUBLE_VARIANTS;
            } else {
                typeVariants = new Class[]{this.mValueType};
            }
            Class[] arr$ = typeVariants;
            for (Class typeVariant : arr$) {
                args[0] = typeVariant;
                try {
                    returnVal = targetClass.getMethod(methodName, args);
                    this.mValueType = typeVariant;
                    return returnVal;
                } catch (NoSuchMethodException e2) {
                }
            }
            Log.e("PropertyValuesHolder", "Couldn't find " + prefix + "ter property " + this.mPropertyName + " for " + targetClass.getSimpleName() + " with value type " + this.mValueType);
        }
        return returnVal;
    }

    private Method setupSetterOrGetter(Class targetClass, HashMap<Class, HashMap<String, Method>> propertyMapMap, String prefix, Class valueType) {
        Method setterOrGetter = null;
        try {
            this.mPropertyMapLock.writeLock().lock();
            HashMap<String, Method> propertyMap = propertyMapMap.get(targetClass);
            if (propertyMap != null) {
                setterOrGetter = propertyMap.get(this.mPropertyName);
            }
            if (setterOrGetter == null) {
                setterOrGetter = getPropertyFunction(targetClass, prefix, valueType);
                if (propertyMap == null) {
                    propertyMap = new HashMap<>();
                    propertyMapMap.put(targetClass, propertyMap);
                }
                propertyMap.put(this.mPropertyName, setterOrGetter);
            }
            return setterOrGetter;
        } finally {
            this.mPropertyMapLock.writeLock().unlock();
        }
    }

    void setupSetter(Class targetClass) {
        this.mSetter = setupSetterOrGetter(targetClass, sSetterPropertyMap, "set", this.mValueType);
    }

    private void setupGetter(Class targetClass) {
        this.mGetter = setupSetterOrGetter(targetClass, sGetterPropertyMap, "get", null);
    }

    void setupSetterAndGetter(Object target) {
        Class targetClass = target.getClass();
        if (this.mSetter == null) {
            setupSetter(targetClass);
        }
        Iterator i$ = this.mKeyframeSet.mKeyframes.iterator();
        while (i$.hasNext()) {
            Keyframe kf = i$.next();
            if (!kf.hasValue()) {
                if (this.mGetter == null) {
                    setupGetter(targetClass);
                }
                try {
                    kf.setValue(this.mGetter.invoke(target, new Object[0]));
                } catch (IllegalAccessException e) {
                    Log.e("PropertyValuesHolder", e.toString());
                } catch (InvocationTargetException e2) {
                    Log.e("PropertyValuesHolder", e2.toString());
                }
            }
        }
    }

    private void setupValue(Object target, Keyframe kf) {
        try {
            if (this.mGetter == null) {
                Class targetClass = target.getClass();
                setupGetter(targetClass);
            }
            kf.setValue(this.mGetter.invoke(target, new Object[0]));
        } catch (IllegalAccessException e) {
            Log.e("PropertyValuesHolder", e.toString());
        } catch (InvocationTargetException e2) {
            Log.e("PropertyValuesHolder", e2.toString());
        }
    }

    void setupStartValue(Object target) {
        setupValue(target, this.mKeyframeSet.mKeyframes.get(0));
    }

    void setupEndValue(Object target) {
        setupValue(target, this.mKeyframeSet.mKeyframes.get(this.mKeyframeSet.mKeyframes.size() - 1));
    }

    @Override // 
    /* renamed from: clone */
    public PropertyValuesHolder mo7clone() {
        try {
            PropertyValuesHolder newPVH = (PropertyValuesHolder) super.clone();
            newPVH.mPropertyName = this.mPropertyName;
            newPVH.mKeyframeSet = this.mKeyframeSet.mo4clone();
            newPVH.mEvaluator = this.mEvaluator;
            return newPVH;
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }

    void setAnimatedValue(Object target) {
        if (this.mSetter != null) {
            try {
                this.mTmpValueArray[0] = getAnimatedValue();
                this.mSetter.invoke(target, this.mTmpValueArray);
            } catch (IllegalAccessException e) {
                Log.e("PropertyValuesHolder", e.toString());
            } catch (InvocationTargetException e2) {
                Log.e("PropertyValuesHolder", e2.toString());
            }
        }
    }

    void init() {
        if (this.mEvaluator == null) {
            this.mEvaluator = this.mValueType == Integer.class ? sIntEvaluator : this.mValueType == Float.class ? sFloatEvaluator : null;
        }
        if (this.mEvaluator != null) {
            this.mKeyframeSet.setEvaluator(this.mEvaluator);
        }
    }

    public void setEvaluator(TypeEvaluator evaluator) {
        this.mEvaluator = evaluator;
        this.mKeyframeSet.setEvaluator(evaluator);
    }

    void calculateValue(float fraction) {
        this.mAnimatedValue = this.mKeyframeSet.getValue(fraction);
    }

    public void setPropertyName(String propertyName) {
        this.mPropertyName = propertyName;
    }

    public String getPropertyName() {
        return this.mPropertyName;
    }

    Object getAnimatedValue() {
        return this.mAnimatedValue;
    }

    public String toString() {
        return this.mPropertyName + ": " + this.mKeyframeSet.toString();
    }

    static String getMethodName(String prefix, String propertyName) {
        if (propertyName == null || propertyName.length() == 0) {
            return prefix;
        }
        char firstLetter = Character.toUpperCase(propertyName.charAt(0));
        String theRest = propertyName.substring(1);
        return prefix + firstLetter + theRest;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/animation/PropertyValuesHolder$IntPropertyValuesHolder.class */
    static class IntPropertyValuesHolder extends PropertyValuesHolder {
        IntKeyframeSet mIntKeyframeSet;
        int mIntAnimatedValue;

        public IntPropertyValuesHolder(String propertyName, IntKeyframeSet keyframeSet) {
            super(propertyName);
            this.mValueType = Integer.TYPE;
            this.mKeyframeSet = keyframeSet;
            this.mIntKeyframeSet = (IntKeyframeSet) this.mKeyframeSet;
        }

        public IntPropertyValuesHolder(String propertyName, int... values) {
            super(propertyName);
            setIntValues(values);
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        public void setIntValues(int... values) {
            super.setIntValues(values);
            this.mIntKeyframeSet = (IntKeyframeSet) this.mKeyframeSet;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        void calculateValue(float fraction) {
            this.mIntAnimatedValue = this.mIntKeyframeSet.getIntValue(fraction);
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        Object getAnimatedValue() {
            return Integer.valueOf(this.mIntAnimatedValue);
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        /* renamed from: clone */
        public IntPropertyValuesHolder mo7clone() {
            IntPropertyValuesHolder newPVH = (IntPropertyValuesHolder) super.mo7clone();
            newPVH.mIntKeyframeSet = (IntKeyframeSet) newPVH.mKeyframeSet;
            return newPVH;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        void setAnimatedValue(Object target) {
            if (this.mSetter != null) {
                try {
                    this.mTmpValueArray[0] = Integer.valueOf(this.mIntAnimatedValue);
                    this.mSetter.invoke(target, this.mTmpValueArray);
                } catch (IllegalAccessException e) {
                    Log.e("PropertyValuesHolder", e.toString());
                } catch (InvocationTargetException e2) {
                    Log.e("PropertyValuesHolder", e2.toString());
                }
            }
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        void setupSetter(Class targetClass) {
            super.setupSetter(targetClass);
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/animation/PropertyValuesHolder$FloatPropertyValuesHolder.class */
    static class FloatPropertyValuesHolder extends PropertyValuesHolder {
        FloatKeyframeSet mFloatKeyframeSet;
        float mFloatAnimatedValue;

        public FloatPropertyValuesHolder(String propertyName, FloatKeyframeSet keyframeSet) {
            super(propertyName);
            this.mValueType = Float.TYPE;
            this.mKeyframeSet = keyframeSet;
            this.mFloatKeyframeSet = (FloatKeyframeSet) this.mKeyframeSet;
        }

        public FloatPropertyValuesHolder(String propertyName, float... values) {
            super(propertyName);
            setFloatValues(values);
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        public void setFloatValues(float... values) {
            super.setFloatValues(values);
            this.mFloatKeyframeSet = (FloatKeyframeSet) this.mKeyframeSet;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        void calculateValue(float fraction) {
            this.mFloatAnimatedValue = this.mFloatKeyframeSet.getFloatValue(fraction);
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        Object getAnimatedValue() {
            return Float.valueOf(this.mFloatAnimatedValue);
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        /* renamed from: clone, reason: merged with bridge method [inline-methods] */
        public FloatPropertyValuesHolder mo7clone() {
            FloatPropertyValuesHolder newPVH = (FloatPropertyValuesHolder) super.mo7clone();
            newPVH.mFloatKeyframeSet = (FloatKeyframeSet) newPVH.mKeyframeSet;
            return newPVH;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        void setAnimatedValue(Object target) {
            if (this.mSetter != null) {
                try {
                    this.mTmpValueArray[0] = Float.valueOf(this.mFloatAnimatedValue);
                    this.mSetter.invoke(target, this.mTmpValueArray);
                } catch (IllegalAccessException e) {
                    Log.e("PropertyValuesHolder", e.toString());
                } catch (InvocationTargetException e2) {
                    Log.e("PropertyValuesHolder", e2.toString());
                }
            }
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
        void setupSetter(Class targetClass) {
            super.setupSetter(targetClass);
        }
    }
}

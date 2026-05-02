package com.actionbarsherlock.internal.nineoldandroids.animation;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/animation/ObjectAnimator.class */
public final class ObjectAnimator extends ValueAnimator {
    private static final boolean DBG = false;
    private Object mTarget;
    private String mPropertyName;

    public void setPropertyName(String propertyName) {
        if (this.mValues != null) {
            PropertyValuesHolder valuesHolder = this.mValues[0];
            String oldName = valuesHolder.getPropertyName();
            valuesHolder.setPropertyName(propertyName);
            this.mValuesMap.remove(oldName);
            this.mValuesMap.put(propertyName, valuesHolder);
        }
        this.mPropertyName = propertyName;
        this.mInitialized = false;
    }

    public String getPropertyName() {
        return this.mPropertyName;
    }

    public ObjectAnimator() {
    }

    private ObjectAnimator(Object target, String propertyName) {
        this.mTarget = target;
        setPropertyName(propertyName);
    }

    public static ObjectAnimator ofInt(Object target, String propertyName, int... values) {
        ObjectAnimator anim = new ObjectAnimator(target, propertyName);
        anim.setIntValues(values);
        return anim;
    }

    public static ObjectAnimator ofFloat(Object target, String propertyName, float... values) {
        ObjectAnimator anim = new ObjectAnimator(target, propertyName);
        anim.setFloatValues(values);
        return anim;
    }

    public static ObjectAnimator ofObject(Object target, String propertyName, TypeEvaluator evaluator, Object... values) {
        ObjectAnimator anim = new ObjectAnimator(target, propertyName);
        anim.setObjectValues(values);
        anim.setEvaluator(evaluator);
        return anim;
    }

    public static ObjectAnimator ofPropertyValuesHolder(Object target, PropertyValuesHolder... values) {
        ObjectAnimator anim = new ObjectAnimator();
        anim.mTarget = target;
        anim.setValues(values);
        return anim;
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator
    public void setIntValues(int... values) {
        if (this.mValues == null || this.mValues.length == 0) {
            setValues(PropertyValuesHolder.ofInt(this.mPropertyName, values));
        } else {
            super.setIntValues(values);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator
    public void setFloatValues(float... values) {
        if (this.mValues == null || this.mValues.length == 0) {
            setValues(PropertyValuesHolder.ofFloat(this.mPropertyName, values));
        } else {
            super.setFloatValues(values);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator
    public void setObjectValues(Object... values) {
        if (this.mValues == null || this.mValues.length == 0) {
            setValues(PropertyValuesHolder.ofObject(this.mPropertyName, (TypeEvaluator) null, values));
        } else {
            super.setObjectValues(values);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator, com.actionbarsherlock.internal.nineoldandroids.animation.Animator
    public void start() {
        super.start();
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator
    void initAnimation() {
        if (!this.mInitialized) {
            int numValues = this.mValues.length;
            for (int i = 0; i < numValues; i++) {
                this.mValues[i].setupSetterAndGetter(this.mTarget);
            }
            super.initAnimation();
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator, com.actionbarsherlock.internal.nineoldandroids.animation.Animator
    public ObjectAnimator setDuration(long duration) {
        super.setDuration(duration);
        return this;
    }

    public Object getTarget() {
        return this.mTarget;
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator
    public void setTarget(Object target) {
        if (this.mTarget != target) {
            Object oldTarget = this.mTarget;
            this.mTarget = target;
            if (oldTarget != null && target != null && oldTarget.getClass() == target.getClass()) {
                return;
            }
            this.mInitialized = false;
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator
    public void setupStartValues() {
        initAnimation();
        int numValues = this.mValues.length;
        for (int i = 0; i < numValues; i++) {
            this.mValues[i].setupStartValue(this.mTarget);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator
    public void setupEndValues() {
        initAnimation();
        int numValues = this.mValues.length;
        for (int i = 0; i < numValues; i++) {
            this.mValues[i].setupEndValue(this.mTarget);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator
    void animateValue(float fraction) {
        super.animateValue(fraction);
        int numValues = this.mValues.length;
        for (int i = 0; i < numValues; i++) {
            this.mValues[i].setAnimatedValue(this.mTarget);
        }
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator, com.actionbarsherlock.internal.nineoldandroids.animation.Animator
    /* renamed from: clone */
    public ObjectAnimator mo2clone() {
        ObjectAnimator anim = (ObjectAnimator) super.mo2clone();
        return anim;
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.ValueAnimator
    public String toString() {
        String returnVal = "ObjectAnimator@" + Integer.toHexString(hashCode()) + ", target " + this.mTarget;
        if (this.mValues != null) {
            for (int i = 0; i < this.mValues.length; i++) {
                returnVal = returnVal + "\n    " + this.mValues[i].toString();
            }
        }
        return returnVal;
    }
}

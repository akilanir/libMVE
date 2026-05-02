package com.actionbarsherlock.internal.nineoldandroids.animation;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/animation/FloatEvaluator.class */
public class FloatEvaluator implements TypeEvaluator<Number> {
    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.TypeEvaluator
    public Float evaluate(float fraction, Number startValue, Number endValue) {
        float startFloat = startValue.floatValue();
        return Float.valueOf(startFloat + (fraction * (endValue.floatValue() - startFloat)));
    }
}

package com.actionbarsherlock.internal.nineoldandroids.animation;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/nineoldandroids/animation/IntEvaluator.class */
public class IntEvaluator implements TypeEvaluator<Integer> {
    @Override // com.actionbarsherlock.internal.nineoldandroids.animation.TypeEvaluator
    public Integer evaluate(float fraction, Integer startValue, Integer endValue) {
        int startInt = startValue.intValue();
        return Integer.valueOf((int) (startInt + (fraction * (endValue.intValue() - startInt))));
    }
}

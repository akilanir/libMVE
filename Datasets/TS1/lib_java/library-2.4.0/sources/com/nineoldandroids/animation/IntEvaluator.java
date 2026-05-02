package com.nineoldandroids.animation;

/* loaded from: library-2.4.0.jar:com/nineoldandroids/animation/IntEvaluator.class */
public class IntEvaluator implements TypeEvaluator<Integer> {
    @Override // com.nineoldandroids.animation.TypeEvaluator
    public Integer evaluate(float fraction, Integer startValue, Integer endValue) {
        int startInt = startValue.intValue();
        return Integer.valueOf((int) (startInt + (fraction * (endValue.intValue() - startInt))));
    }
}

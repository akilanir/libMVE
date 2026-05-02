package com.github.mikephil.charting.animation;

import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.charts.Chart;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/animation/Easing.class */
public class Easing {

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/animation/Easing$EasingOption.class */
    public enum EasingOption {
        Linear,
        EaseInQuad,
        EaseOutQuad,
        EaseInOutQuad,
        EaseInCubic,
        EaseOutCubic,
        EaseInOutCubic,
        EaseInQuart,
        EaseOutQuart,
        EaseInOutQuart,
        EaseInSine,
        EaseOutSine,
        EaseInOutSine,
        EaseInExpo,
        EaseOutExpo,
        EaseInOutExpo,
        EaseInCirc,
        EaseOutCirc,
        EaseInOutCirc,
        EaseInElastic,
        EaseOutElastic,
        EaseInOutElastic,
        EaseInBack,
        EaseOutBack,
        EaseInOutBack,
        EaseInBounce,
        EaseOutBounce,
        EaseInOutBounce
    }

    /* renamed from: com.github.mikephil.charting.animation.Easing$1, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/animation/Easing$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption = new int[EasingOption.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.Linear.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInQuad.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutQuad.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutQuad.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInCubic.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutCubic.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutCubic.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInQuart.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutQuart.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutQuart.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInSine.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutSine.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutSine.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInExpo.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutExpo.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutExpo.ordinal()] = 16;
            } catch (NoSuchFieldError e16) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInCirc.ordinal()] = 17;
            } catch (NoSuchFieldError e17) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutCirc.ordinal()] = 18;
            } catch (NoSuchFieldError e18) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutCirc.ordinal()] = 19;
            } catch (NoSuchFieldError e19) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInElastic.ordinal()] = 20;
            } catch (NoSuchFieldError e20) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutElastic.ordinal()] = 21;
            } catch (NoSuchFieldError e21) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutElastic.ordinal()] = 22;
            } catch (NoSuchFieldError e22) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInBack.ordinal()] = 23;
            } catch (NoSuchFieldError e23) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutBack.ordinal()] = 24;
            } catch (NoSuchFieldError e24) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutBack.ordinal()] = 25;
            } catch (NoSuchFieldError e25) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInBounce.ordinal()] = 26;
            } catch (NoSuchFieldError e26) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseOutBounce.ordinal()] = 27;
            } catch (NoSuchFieldError e27) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[EasingOption.EaseInOutBounce.ordinal()] = 28;
            } catch (NoSuchFieldError e28) {
            }
        }
    }

    public static EasingFunction getEasingFunctionFromOption(EasingOption easing) {
        switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption[easing.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
            default:
                return EasingFunctions.Linear;
            case 2:
                return EasingFunctions.EaseInQuad;
            case 3:
                return EasingFunctions.EaseOutQuad;
            case Chart.PAINT_GRID_BACKGROUND /* 4 */:
                return EasingFunctions.EaseInOutQuad;
            case 5:
                return EasingFunctions.EaseInCubic;
            case 6:
                return EasingFunctions.EaseOutCubic;
            case Chart.PAINT_INFO /* 7 */:
                return EasingFunctions.EaseInOutCubic;
            case 8:
                return EasingFunctions.EaseInQuart;
            case 9:
                return EasingFunctions.EaseOutQuart;
            case 10:
                return EasingFunctions.EaseInOutQuart;
            case Chart.PAINT_DESCRIPTION /* 11 */:
                return EasingFunctions.EaseInSine;
            case 12:
                return EasingFunctions.EaseOutSine;
            case Chart.PAINT_HOLE /* 13 */:
                return EasingFunctions.EaseInOutSine;
            case Chart.PAINT_CENTER_TEXT /* 14 */:
                return EasingFunctions.EaseInExpo;
            case 15:
                return EasingFunctions.EaseOutExpo;
            case 16:
                return EasingFunctions.EaseInOutExpo;
            case 17:
                return EasingFunctions.EaseInCirc;
            case Chart.PAINT_LEGEND_LABEL /* 18 */:
                return EasingFunctions.EaseOutCirc;
            case 19:
                return EasingFunctions.EaseInOutCirc;
            case 20:
                return EasingFunctions.EaseInElastic;
            case 21:
                return EasingFunctions.EaseOutElastic;
            case 22:
                return EasingFunctions.EaseInOutElastic;
            case 23:
                return EasingFunctions.EaseInBack;
            case 24:
                return EasingFunctions.EaseOutBack;
            case 25:
                return EasingFunctions.EaseInOutBack;
            case 26:
                return EasingFunctions.EaseInBounce;
            case 27:
                return EasingFunctions.EaseOutBounce;
            case 28:
                return EasingFunctions.EaseInOutBounce;
        }
    }

    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/animation/Easing$EasingFunctions.class */
    private static class EasingFunctions {
        public static final EasingFunction Linear = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.1
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return input;
            }
        };
        public static final EasingFunction EaseInQuad = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.2
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return input * input;
            }
        };
        public static final EasingFunction EaseOutQuad = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.3
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return (-input) * (input - 2.0f);
            }
        };
        public static final EasingFunction EaseInOutQuad = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.4
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float position = input / 0.5f;
                if (position < 1.0f) {
                    return 0.5f * position * position;
                }
                float position2 = position - 1.0f;
                return (-0.5f) * ((position2 * (position2 - 2.0f)) - 1.0f);
            }
        };
        public static final EasingFunction EaseInCubic = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.5
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return input * input * input;
            }
        };
        public static final EasingFunction EaseOutCubic = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.6
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float input2 = input - 1.0f;
                return (input2 * input2 * input2) + 1.0f;
            }
        };
        public static final EasingFunction EaseInOutCubic = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.7
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float position = input / 0.5f;
                if (position < 1.0f) {
                    return 0.5f * position * position * position;
                }
                float position2 = position - 2.0f;
                return 0.5f * ((position2 * position2 * position2) + 2.0f);
            }
        };
        public static final EasingFunction EaseInQuart = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.8
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return input * input * input * input;
            }
        };
        public static final EasingFunction EaseOutQuart = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.9
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float input2 = input - 1.0f;
                return -((((input2 * input2) * input2) * input2) - 1.0f);
            }
        };
        public static final EasingFunction EaseInOutQuart = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.10
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float position = input / 0.5f;
                if (position < 1.0f) {
                    return 0.5f * position * position * position * position;
                }
                float position2 = position - 2.0f;
                return (-0.5f) * ((((position2 * position2) * position2) * position2) - 2.0f);
            }
        };
        public static final EasingFunction EaseInSine = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.11
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return (-((float) Math.cos(input * 1.5707963267948966d))) + 1.0f;
            }
        };
        public static final EasingFunction EaseOutSine = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.12
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return (float) Math.sin(input * 1.5707963267948966d);
            }
        };
        public static final EasingFunction EaseInOutSine = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.13
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return (-0.5f) * (((float) Math.cos(3.141592653589793d * input)) - 1.0f);
            }
        };
        public static final EasingFunction EaseInExpo = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.14
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input == 0.0f) {
                    return 0.0f;
                }
                return (float) Math.pow(2.0d, 10.0f * (input - 1.0f));
            }
        };
        public static final EasingFunction EaseOutExpo = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.15
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input == 1.0f) {
                    return 1.0f;
                }
                return -((float) Math.pow(2.0d, (-10.0f) * (input + 1.0f)));
            }
        };
        public static final EasingFunction EaseInOutExpo = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.16
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input == 0.0f) {
                    return 0.0f;
                }
                if (input == 1.0f) {
                    return 1.0f;
                }
                float position = input / 0.5f;
                if (position < 1.0f) {
                    return 0.5f * ((float) Math.pow(2.0d, 10.0f * (position - 1.0f)));
                }
                return 0.5f * ((-((float) Math.pow(2.0d, (-10.0f) * (position - 1.0f)))) + 2.0f);
            }
        };
        public static final EasingFunction EaseInCirc = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.17
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return -(((float) Math.sqrt(1.0f - (input * input))) - 1.0f);
            }
        };
        public static final EasingFunction EaseOutCirc = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.18
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float input2 = input - 1.0f;
                return (float) Math.sqrt(1.0f - (input2 * input2));
            }
        };
        public static final EasingFunction EaseInOutCirc = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.19
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float position = input / 0.5f;
                if (position < 1.0f) {
                    return (-0.5f) * (((float) Math.sqrt(1.0f - (position * position))) - 1.0f);
                }
                float position2 = position - 2.0f;
                return 0.5f * (((float) Math.sqrt(1.0f - (position2 * position2))) + 1.0f);
            }
        };
        public static final EasingFunction EaseInElastic = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.20
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input == 0.0f) {
                    return 0.0f;
                }
                if (input == 1.0f) {
                    return 1.0f;
                }
                float s = (0.3f / 6.2831855f) * ((float) Math.asin(1.0d));
                float position = input - 1.0f;
                return -(((float) Math.pow(2.0d, 10.0f * position)) * ((float) Math.sin(((position - s) * 6.283185307179586d) / 0.3f)));
            }
        };
        public static final EasingFunction EaseOutElastic = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.21
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input == 0.0f) {
                    return 0.0f;
                }
                if (input == 1.0f) {
                    return 1.0f;
                }
                float s = (0.3f / 6.2831855f) * ((float) Math.asin(1.0d));
                return (((float) Math.pow(2.0d, (-10.0f) * input)) * ((float) Math.sin(((input - s) * 6.283185307179586d) / 0.3f))) + 1.0f;
            }
        };
        public static final EasingFunction EaseInOutElastic = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.22
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input == 0.0f) {
                    return 0.0f;
                }
                float position = input / 0.5f;
                if (position == 2.0f) {
                    return 1.0f;
                }
                float s = (0.45000002f / 6.2831855f) * ((float) Math.asin(1.0d));
                if (position >= 1.0f) {
                    float position2 = position - 1.0f;
                    return (((float) Math.pow(2.0d, (-10.0f) * position2)) * ((float) Math.sin((((position2 * 1.0f) - s) * 6.283185307179586d) / 0.45000002f)) * 0.5f) + 1.0f;
                }
                float position3 = position - 1.0f;
                return (-0.5f) * ((float) Math.pow(2.0d, 10.0f * position3)) * ((float) Math.sin((((position3 * 1.0f) - s) * 6.283185307179586d) / 0.45000002f));
            }
        };
        public static final EasingFunction EaseInBack = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.23
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return input * input * ((2.70158f * input) - 1.70158f);
            }
        };
        public static final EasingFunction EaseOutBack = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.24
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float position = input - 1.0f;
                return (position * position * ((2.70158f * position) + 1.70158f)) + 1.0f;
            }
        };
        public static final EasingFunction EaseInOutBack = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.25
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                float position = input / 0.5f;
                if (position < 1.0f) {
                    float s = 1.70158f * 1.525f;
                    return 0.5f * position * position * (((s + 1.0f) * position) - s);
                }
                float position2 = position - 2.0f;
                float s2 = 1.70158f * 1.525f;
                return 0.5f * ((position2 * position2 * (((s2 + 1.0f) * position2) + s2)) + 2.0f);
            }
        };
        public static final EasingFunction EaseInBounce = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.26
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                return 1.0f - EasingFunctions.EaseOutBounce.getInterpolation(1.0f - input);
            }
        };
        public static final EasingFunction EaseOutBounce = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.27
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input < 0.36363637f) {
                    return 7.5625f * input * input;
                }
                if (input < 0.72727275f) {
                    float position = input - 0.54545456f;
                    return (7.5625f * position * position) + 0.75f;
                }
                if (input < 0.90909094f) {
                    float position2 = input - 0.8181818f;
                    return (7.5625f * position2 * position2) + 0.9375f;
                }
                float position3 = input - 0.95454544f;
                return (7.5625f * position3 * position3) + 0.984375f;
            }
        };
        public static final EasingFunction EaseInOutBounce = new EasingFunction() { // from class: com.github.mikephil.charting.animation.Easing.EasingFunctions.28
            @Override // com.github.mikephil.charting.animation.EasingFunction, android.animation.TimeInterpolator
            public float getInterpolation(float input) {
                if (input < 0.5f) {
                    return EasingFunctions.EaseInBounce.getInterpolation(input * 2.0f) * 0.5f;
                }
                return (EasingFunctions.EaseOutBounce.getInterpolation((input * 2.0f) - 1.0f) * 0.5f) + 0.5f;
            }
        };

        private EasingFunctions() {
        }
    }
}

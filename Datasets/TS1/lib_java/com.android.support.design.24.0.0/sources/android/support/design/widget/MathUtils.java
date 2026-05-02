package android.support.design.widget;

/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/MathUtils.class */
class MathUtils {
    MathUtils() {
    }

    static int constrain(int amount, int low, int high) {
        return amount < low ? low : amount > high ? high : amount;
    }

    static float constrain(float amount, float low, float high) {
        return amount < low ? low : amount > high ? high : amount;
    }
}

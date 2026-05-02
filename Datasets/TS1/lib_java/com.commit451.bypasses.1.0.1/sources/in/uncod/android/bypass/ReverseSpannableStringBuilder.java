package in.uncod.android.bypass;

import android.text.SpannableStringBuilder;

/* loaded from: com.commit451.bypasses.1.0.1.jar:in/uncod/android/bypass/ReverseSpannableStringBuilder.class */
public class ReverseSpannableStringBuilder extends SpannableStringBuilder {
    @Override // android.text.SpannableStringBuilder, android.text.Spanned
    public <T> T[] getSpans(int i, int i2, Class<T> cls) {
        T[] tArr = (T[]) super.getSpans(i, i2, cls);
        reverse(tArr);
        return tArr;
    }

    private static void reverse(Object[] arr) {
        if (arr == null) {
            return;
        }
        int j = arr.length - 1;
        for (int i = 0; j > i; i++) {
            Object tmp = arr[j];
            arr[j] = arr[i];
            arr[i] = tmp;
            j--;
        }
    }
}

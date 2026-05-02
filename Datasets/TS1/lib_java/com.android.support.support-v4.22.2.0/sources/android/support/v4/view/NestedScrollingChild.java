package android.support.v4.view;

/* loaded from: com.android.support.support-v4.22.2.0.jar:android/support/v4/view/NestedScrollingChild.class */
public interface NestedScrollingChild {
    void setNestedScrollingEnabled(boolean z);

    boolean isNestedScrollingEnabled();

    boolean startNestedScroll(int i);

    void stopNestedScroll();

    boolean hasNestedScrollingParent();

    boolean dispatchNestedScroll(int i, int i2, int i3, int i4, int[] iArr);

    boolean dispatchNestedPreScroll(int i, int i2, int[] iArr, int[] iArr2);

    boolean dispatchNestedFling(float f, float f2, boolean z);

    boolean dispatchNestedPreFling(float f, float f2);
}

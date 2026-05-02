package com.facebook.stetho.common.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.PointF;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.stetho.common.Predicate;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.protocol.module.DatabaseConstants;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/ViewUtil.class */
public final class ViewUtil {
    private ViewUtil() {
    }

    private static boolean isHittable(View view) {
        if (view.getVisibility() != 0 || ViewCompat.getInstance().getAlpha(view) < 0.001f) {
            return false;
        }
        return true;
    }

    @Nullable
    public static View hitTest(View view, float x, float y) {
        return hitTest(view, x, y, null);
    }

    @Nullable
    public static View hitTest(View view, float x, float y, @Nullable Predicate<View> viewSelector) {
        View result = hitTestImpl(view, x, y, viewSelector, false);
        if (result == null) {
            result = hitTestImpl(view, x, y, viewSelector, true);
        }
        return result;
    }

    private static View hitTestImpl(View view, float x, float y, @Nullable Predicate<View> viewSelector, boolean allowViewGroupResult) {
        View childResult;
        if (!isHittable(view) || !pointInView(view, x, y)) {
            return null;
        }
        if (viewSelector != null && !viewSelector.apply(view)) {
            return null;
        }
        if (!(view instanceof ViewGroup)) {
            return view;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        if (viewGroup.getChildCount() > 0) {
            PointF localPoint = new PointF();
            for (int i = viewGroup.getChildCount() - 1; i >= 0; i--) {
                View child = viewGroup.getChildAt(i);
                if (isTransformedPointInView(viewGroup, child, x, y, localPoint) && (childResult = hitTestImpl(child, localPoint.x, localPoint.y, viewSelector, allowViewGroupResult)) != null) {
                    return childResult;
                }
            }
        }
        if (allowViewGroupResult) {
            return viewGroup;
        }
        return null;
    }

    public static boolean pointInView(View view, float localX, float localY) {
        return localX >= 0.0f && localX < ((float) (view.getRight() - view.getLeft())) && localY >= 0.0f && localY < ((float) (view.getBottom() - view.getTop()));
    }

    public static boolean isTransformedPointInView(ViewGroup parent, View child, float x, float y, @Nullable PointF outLocalPoint) {
        Util.throwIfNull(parent);
        Util.throwIfNull(child);
        float localX = (x + parent.getScrollX()) - child.getLeft();
        float localY = (y + parent.getScrollY()) - child.getTop();
        boolean isInView = pointInView(child, localX, localY);
        if (isInView && outLocalPoint != null) {
            outLocalPoint.set(localX, localY);
        }
        return isInView;
    }

    @Nullable
    public static Activity tryGetActivity(View view) {
        if (view == null) {
            return null;
        }
        Context context = view.getContext();
        Activity activityFromContext = tryGetActivity(context);
        if (activityFromContext != null) {
            return activityFromContext;
        }
        Object parent = view.getParent();
        if (parent instanceof View) {
            View parentView = (View) parent;
            return tryGetActivity(parentView);
        }
        return null;
    }

    @Nullable
    private static Activity tryGetActivity(Context context) {
        while (context != null) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            if (context instanceof ContextWrapper) {
                context = ((ContextWrapper) context).getBaseContext();
            } else {
                return null;
            }
        }
        return null;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/ViewUtil$ViewCompat.class */
    private static class ViewCompat {
        private static final ViewCompat sInstance;

        static {
            if (Build.VERSION.SDK_INT >= 11) {
                sInstance = new ViewCompatHoneycomb();
            } else {
                sInstance = new ViewCompat();
            }
        }

        public static ViewCompat getInstance() {
            return sInstance;
        }

        protected ViewCompat() {
        }

        public float getAlpha(View view) {
            return 1.0f;
        }

        @TargetApi(DatabaseConstants.MIN_API_LEVEL)
        /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/ViewUtil$ViewCompat$ViewCompatHoneycomb.class */
        private static class ViewCompatHoneycomb extends ViewCompat {
            private ViewCompatHoneycomb() {
            }

            @Override // com.facebook.stetho.common.android.ViewUtil.ViewCompat
            public float getAlpha(View view) {
                return view.getAlpha();
            }
        }
    }
}

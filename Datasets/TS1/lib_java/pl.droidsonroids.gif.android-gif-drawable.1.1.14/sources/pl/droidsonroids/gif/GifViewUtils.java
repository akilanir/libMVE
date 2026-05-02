package pl.droidsonroids.gif;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.net.Uri;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.RawRes;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.widget.ImageView;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifViewUtils.class */
final class GifViewUtils {
    static final String ANDROID_NS = "http://schemas.android.com/apk/res/android";
    static final List<String> SUPPORTED_RESOURCE_TYPE_NAMES = Arrays.asList("raw", "drawable", "mipmap");

    private GifViewUtils() {
    }

    static InitResult initImageView(ImageView view, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        if (attrs != null && !view.isInEditMode()) {
            int sourceResId = getResourceId(view, attrs, true);
            int backgroundResId = getResourceId(view, attrs, false);
            boolean freezesAnimation = isFreezingAnimation(view, attrs, defStyleAttr, defStyleRes);
            return new InitResult(sourceResId, backgroundResId, freezesAnimation);
        }
        return new InitResult(0, 0, false);
    }

    private static int getResourceId(ImageView view, AttributeSet attrs, boolean isSrc) {
        int resId = attrs.getAttributeResourceValue(ANDROID_NS, isSrc ? "src" : "background", 0);
        if (resId > 0) {
            String resourceTypeName = view.getResources().getResourceTypeName(resId);
            if (SUPPORTED_RESOURCE_TYPE_NAMES.contains(resourceTypeName) && !setResource(view, isSrc, resId)) {
                return resId;
            }
            return 0;
        }
        return 0;
    }

    static boolean setResource(ImageView view, boolean isSrc, int resId) {
        Resources res = view.getResources();
        if (res != null) {
            try {
                GifDrawable d = new GifDrawable(res, resId);
                if (isSrc) {
                    view.setImageDrawable(d);
                    return true;
                }
                if (Build.VERSION.SDK_INT >= 16) {
                    view.setBackground(d);
                    return true;
                }
                view.setBackgroundDrawable(d);
                return true;
            } catch (Resources.NotFoundException | IOException e) {
                return false;
            }
        }
        return false;
    }

    static boolean isFreezingAnimation(View view, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray gifViewAttributes = view.getContext().obtainStyledAttributes(attrs, R.styleable.GifView, defStyleAttr, defStyleRes);
        boolean freezesAnimation = gifViewAttributes.getBoolean(R.styleable.GifView_freezesAnimation, false);
        gifViewAttributes.recycle();
        return freezesAnimation;
    }

    static boolean setGifImageUri(ImageView imageView, Uri uri) {
        if (uri != null) {
            try {
                imageView.setImageDrawable(new GifDrawable(imageView.getContext().getContentResolver(), uri));
                return true;
            } catch (IOException e) {
                return false;
            }
        }
        return false;
    }

    static float getDensityScale(@NonNull Resources res, @RawRes @DrawableRes int id) {
        int density;
        TypedValue value = new TypedValue();
        res.getValue(id, value, true);
        int resourceDensity = value.density;
        if (resourceDensity == 0) {
            density = 160;
        } else if (resourceDensity != 65535) {
            density = resourceDensity;
        } else {
            density = 0;
        }
        int targetDensity = res.getDisplayMetrics().densityDpi;
        if (density > 0 && targetDensity > 0) {
            return targetDensity / density;
        }
        return 1.0f;
    }

    /* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifViewUtils$InitResult.class */
    static class InitResult {
        final int mSourceResId;
        final int mBackgroundResId;
        final boolean mFreezesAnimation;

        InitResult(int sourceResId, int backgroundResId, boolean freezesAnimation) {
            this.mSourceResId = sourceResId;
            this.mBackgroundResId = backgroundResId;
            this.mFreezesAnimation = freezesAnimation;
        }
    }
}

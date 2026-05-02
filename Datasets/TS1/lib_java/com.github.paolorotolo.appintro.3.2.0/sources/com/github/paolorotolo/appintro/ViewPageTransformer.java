package com.github.paolorotolo.appintro;

import android.annotation.SuppressLint;
import android.support.v4.view.ViewPager;
import android.view.View;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/ViewPageTransformer.class */
class ViewPageTransformer implements ViewPager.PageTransformer {
    private final TransformType mTransformType;
    private static final float MIN_SCALE_DEPTH = 0.75f;
    private static final float MIN_SCALE_ZOOM = 0.85f;
    private static final float MIN_ALPHA_ZOOM = 0.5f;
    private static final float SCALE_FACTOR_SLIDE = 0.85f;
    private static final float MIN_ALPHA_SLIDE = 0.35f;

    /* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/ViewPageTransformer$TransformType.class */
    enum TransformType {
        FLOW,
        DEPTH,
        ZOOM,
        SLIDE_OVER,
        FADE
    }

    ViewPageTransformer(TransformType transformType) {
        this.mTransformType = transformType;
    }

    @SuppressLint({"NewApi"})
    public void transformPage(View page, float position) {
        float alpha;
        float scale;
        float translationX;
        switch (this.mTransformType) {
            case FLOW:
                page.setRotationY(position * (-30.0f));
                return;
            case SLIDE_OVER:
                if (position < 0.0f && position > -1.0f) {
                    scale = (Math.abs(Math.abs(position) - 1.0f) * 0.14999998f) + 0.85f;
                    alpha = Math.max(MIN_ALPHA_SLIDE, 1.0f - Math.abs(position));
                    int pageWidth = page.getWidth();
                    float translateValue = position * (-pageWidth);
                    if (translateValue > (-pageWidth)) {
                        translationX = translateValue;
                        break;
                    } else {
                        translationX = 0.0f;
                        break;
                    }
                } else {
                    alpha = 1.0f;
                    scale = 1.0f;
                    translationX = 0.0f;
                    break;
                }
                break;
            case DEPTH:
                if (position > 0.0f && position < 1.0f) {
                    alpha = 1.0f - position;
                    scale = MIN_SCALE_DEPTH + (0.25f * (1.0f - Math.abs(position)));
                    translationX = page.getWidth() * (-position);
                    break;
                } else {
                    alpha = 1.0f;
                    scale = 1.0f;
                    translationX = 0.0f;
                    break;
                }
                break;
            case ZOOM:
                if (position >= -1.0f && position <= 1.0f) {
                    scale = Math.max(0.85f, 1.0f - Math.abs(position));
                    alpha = MIN_ALPHA_ZOOM + (((scale - 0.85f) / 0.14999998f) * MIN_ALPHA_ZOOM);
                    float vMargin = (page.getHeight() * (1.0f - scale)) / 2.0f;
                    float hMargin = (page.getWidth() * (1.0f - scale)) / 2.0f;
                    if (position < 0.0f) {
                        translationX = hMargin - (vMargin / 2.0f);
                        break;
                    } else {
                        translationX = (-hMargin) + (vMargin / 2.0f);
                        break;
                    }
                } else {
                    alpha = 1.0f;
                    scale = 1.0f;
                    translationX = 0.0f;
                    break;
                }
                break;
            case FADE:
                if (position <= -1.0f || position >= 1.0f) {
                    page.setAlpha(0.0f);
                    page.setClickable(false);
                    return;
                } else if (position == 0.0f) {
                    page.setAlpha(1.0f);
                    page.setClickable(true);
                    return;
                } else {
                    page.setAlpha(1.0f - Math.abs(position));
                    return;
                }
            default:
                return;
        }
        page.setAlpha(alpha);
        page.setTranslationX(translationX);
        page.setScaleX(scale);
        page.setScaleY(scale);
    }
}

package com.github.paolorotolo.appintro;

import android.support.v4.view.ViewPager;
import android.view.View;

/* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/FadePageTransformer.class */
class FadePageTransformer implements ViewPager.PageTransformer {
    FadePageTransformer() {
    }

    public void transformPage(View view, float position) {
        view.setTranslationX(view.getWidth() * (-position));
        if (position <= -1.0f || position >= 1.0f) {
            view.setAlpha(0.0f);
            view.setClickable(false);
        } else if (position == 0.0f) {
            view.setAlpha(1.0f);
            view.setClickable(true);
        } else {
            view.setAlpha(1.0f - Math.abs(position));
        }
    }
}

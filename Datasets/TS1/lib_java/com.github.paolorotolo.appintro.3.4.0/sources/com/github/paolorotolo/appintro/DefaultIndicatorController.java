package com.github.paolorotolo.appintro;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/DefaultIndicatorController.class */
class DefaultIndicatorController implements IndicatorController {
    public static final int DEFAULT_COLOR = 1;
    private Context mContext;
    private LinearLayout mDotLayout;
    private List<ImageView> mDots;
    private int mSlideCount;
    int selectedDotColor = 1;
    int unselectedDotColor = 1;
    int mCurrentposition;
    private static final int FIRST_PAGE_NUM = 0;

    DefaultIndicatorController() {
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public View newInstance(@NonNull Context context) {
        this.mContext = context;
        this.mDotLayout = (LinearLayout) View.inflate(context, R.layout.default_indicator, null);
        return this.mDotLayout;
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void initialize(int slideCount) {
        this.mDots = new ArrayList();
        this.mSlideCount = slideCount;
        this.selectedDotColor = -1;
        this.unselectedDotColor = -1;
        for (int i = 0; i < slideCount; i++) {
            ImageView dot = new ImageView(this.mContext);
            dot.setImageDrawable(ContextCompat.getDrawable(this.mContext, R.drawable.indicator_dot_grey));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
            this.mDotLayout.addView(dot, params);
            this.mDots.add(dot);
        }
        selectPosition(0);
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void selectPosition(int index) {
        this.mCurrentposition = index;
        int i = 0;
        while (i < this.mSlideCount) {
            int drawableId = i == index ? R.drawable.indicator_dot_white : R.drawable.indicator_dot_grey;
            Drawable drawable = ContextCompat.getDrawable(this.mContext, drawableId);
            if (this.selectedDotColor != 1 && i == index) {
                drawable.mutate().setColorFilter(this.selectedDotColor, PorterDuff.Mode.SRC_IN);
            }
            if (this.unselectedDotColor != 1 && i != index) {
                drawable.mutate().setColorFilter(this.unselectedDotColor, PorterDuff.Mode.SRC_IN);
            }
            this.mDots.get(i).setImageDrawable(drawable);
            i++;
        }
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void setSelectedIndicatorColor(int color) {
        this.selectedDotColor = color;
        selectPosition(this.mCurrentposition);
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void setUnselectedIndicatorColor(int color) {
        this.unselectedDotColor = color;
        selectPosition(this.mCurrentposition);
    }
}

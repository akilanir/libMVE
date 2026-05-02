package com.github.paolorotolo.appintro;

import android.content.Context;
import android.graphics.PorterDuff;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.ProgressBar;

/* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/ProgressIndicatorController.class */
public class ProgressIndicatorController implements IndicatorController {
    public static final int DEFAULT_COLOR = 1;
    private static final int FIRST_PAGE_NUM = 0;
    private ProgressBar mProgressBar;
    int selectedDotColor = 1;
    int unselectedDotColor = 1;

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public View newInstance(@NonNull Context context) {
        this.mProgressBar = (ProgressBar) View.inflate(context, R.layout.progress_indicator, null);
        if (this.selectedDotColor != 1) {
            this.mProgressBar.getProgressDrawable().setColorFilter(this.selectedDotColor, PorterDuff.Mode.SRC_IN);
        }
        if (this.unselectedDotColor != 1) {
            this.mProgressBar.getIndeterminateDrawable().setColorFilter(this.unselectedDotColor, PorterDuff.Mode.SRC_IN);
        }
        return this.mProgressBar;
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void initialize(int slideCount) {
        this.mProgressBar.setMax(slideCount);
        selectPosition(0);
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void selectPosition(int index) {
        this.mProgressBar.setProgress(index + 1);
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void setSelectedIndicatorColor(int color) {
        this.selectedDotColor = color;
        if (this.mProgressBar != null) {
            this.mProgressBar.getProgressDrawable().setColorFilter(color, PorterDuff.Mode.SRC_IN);
        }
    }

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public void setUnselectedIndicatorColor(int color) {
        this.unselectedDotColor = color;
        if (this.mProgressBar != null) {
            this.mProgressBar.getIndeterminateDrawable().setColorFilter(color, PorterDuff.Mode.SRC_IN);
        }
    }
}

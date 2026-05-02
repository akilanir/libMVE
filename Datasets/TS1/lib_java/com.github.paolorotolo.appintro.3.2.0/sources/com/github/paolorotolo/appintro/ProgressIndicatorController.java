package com.github.paolorotolo.appintro;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.ProgressBar;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/ProgressIndicatorController.class */
public class ProgressIndicatorController implements IndicatorController {
    private ProgressBar mProgressBar;
    private static final int FIRST_PAGE_NUM = 0;

    @Override // com.github.paolorotolo.appintro.IndicatorController
    public View newInstance(@NonNull Context context) {
        this.mProgressBar = (ProgressBar) View.inflate(context, R.layout.progress_indicator, null);
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
}

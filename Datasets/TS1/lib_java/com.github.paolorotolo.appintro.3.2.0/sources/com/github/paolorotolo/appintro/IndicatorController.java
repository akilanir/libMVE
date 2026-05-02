package com.github.paolorotolo.appintro;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/IndicatorController.class */
public interface IndicatorController {
    View newInstance(@NonNull Context context);

    void initialize(int i);

    void selectPosition(int i);
}

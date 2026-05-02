package com.mikepenz.materialdrawer.model.interfaces;

import android.graphics.Typeface;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/Typefaceable.class */
public interface Typefaceable<T> {
    T withTypeface(Typeface typeface);

    Typeface getTypeface();

    void setTypeface(Typeface typeface);
}

package com.jpardogo.android.googleprogressbar.library;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.ProgressBar;
import com.jpardogo.android.googleprogressbar.library.ChromeFloatingCirclesDrawable;
import com.jpardogo.android.googleprogressbar.library.FoldingCirclesDrawable;
import com.jpardogo.android.googleprogressbar.library.GoogleMusicDicesDrawable;
import com.jpardogo.android.googleprogressbar.library.NexusRotationCrossDrawable;

/* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleProgressBar.class */
public class GoogleProgressBar extends ProgressBar {

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleProgressBar$ProgressType.class */
    private enum ProgressType {
        FOLDING_CIRCLES,
        GOOGLE_MUSIC_DICES,
        NEXUS_ROTATION_CROSS,
        CHROME_FLOATING_CIRCLES
    }

    public GoogleProgressBar(Context context) {
        this(context, null);
    }

    public GoogleProgressBar(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.progressBarStyle);
    }

    public GoogleProgressBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        if (isInEditMode()) {
            return;
        }
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.GoogleProgressBar, defStyle, 0);
        int typeIndex = a.getInteger(R.styleable.GoogleProgressBar_type, context.getResources().getInteger(R.integer.default_type));
        int colorsId = a.getResourceId(R.styleable.GoogleProgressBar_colors, R.array.google_colors);
        a.recycle();
        Drawable drawable = buildDrawable(context, typeIndex, colorsId);
        if (drawable != null) {
            setIndeterminateDrawable(drawable);
        }
    }

    private Drawable buildDrawable(Context context, int typeIndex, int colorsId) {
        Drawable drawable = null;
        ProgressType type = ProgressType.values()[typeIndex];
        switch (type) {
            case FOLDING_CIRCLES:
                drawable = new FoldingCirclesDrawable.Builder(context).colors(getResources().getIntArray(colorsId)).build();
                break;
            case GOOGLE_MUSIC_DICES:
                drawable = new GoogleMusicDicesDrawable.Builder().build();
                break;
            case NEXUS_ROTATION_CROSS:
                drawable = new NexusRotationCrossDrawable.Builder(context).colors(getResources().getIntArray(colorsId)).build();
                break;
            case CHROME_FLOATING_CIRCLES:
                drawable = new ChromeFloatingCirclesDrawable.Builder(context).colors(getResources().getIntArray(colorsId)).build();
                break;
        }
        return drawable;
    }
}

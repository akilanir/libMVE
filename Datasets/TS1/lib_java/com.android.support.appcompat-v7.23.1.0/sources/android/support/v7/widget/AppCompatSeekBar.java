package android.support.v7.widget;

import android.content.Context;
import android.support.v7.appcompat.R;
import android.support.v7.internal.widget.TintManager;
import android.util.AttributeSet;
import android.widget.SeekBar;

/* loaded from: com.android.support.appcompat-v7.23.1.0.jar:android/support/v7/widget/AppCompatSeekBar.class */
public class AppCompatSeekBar extends SeekBar {
    private AppCompatSeekBarHelper mAppCompatSeekBarHelper;
    private TintManager mTintManager;

    public AppCompatSeekBar(Context context) {
        this(context, null);
    }

    public AppCompatSeekBar(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.seekBarStyle);
    }

    public AppCompatSeekBar(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mTintManager = TintManager.get(context);
        this.mAppCompatSeekBarHelper = new AppCompatSeekBarHelper(this, this.mTintManager);
        this.mAppCompatSeekBarHelper.loadFromAttributes(attrs, defStyleAttr);
    }
}

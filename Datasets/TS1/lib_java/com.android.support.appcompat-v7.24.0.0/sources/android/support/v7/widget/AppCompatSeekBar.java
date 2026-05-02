package android.support.v7.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.support.v7.appcompat.R;
import android.util.AttributeSet;
import android.widget.SeekBar;

/* loaded from: com.android.support.appcompat-v7.24.0.0.jar:android/support/v7/widget/AppCompatSeekBar.class */
public class AppCompatSeekBar extends SeekBar {
    private AppCompatSeekBarHelper mAppCompatSeekBarHelper;
    private AppCompatDrawableManager mDrawableManager;

    public AppCompatSeekBar(Context context) {
        this(context, null);
    }

    public AppCompatSeekBar(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.seekBarStyle);
    }

    public AppCompatSeekBar(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mDrawableManager = AppCompatDrawableManager.get();
        this.mAppCompatSeekBarHelper = new AppCompatSeekBarHelper(this, this.mDrawableManager);
        this.mAppCompatSeekBarHelper.loadFromAttributes(attrs, defStyleAttr);
    }

    @Override // android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.mAppCompatSeekBarHelper.drawTickMarks(canvas);
    }

    @Override // android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        this.mAppCompatSeekBarHelper.drawableStateChanged();
    }

    @Override // android.widget.AbsSeekBar, android.widget.ProgressBar, android.view.View
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        this.mAppCompatSeekBarHelper.jumpDrawablesToCurrentState();
    }
}

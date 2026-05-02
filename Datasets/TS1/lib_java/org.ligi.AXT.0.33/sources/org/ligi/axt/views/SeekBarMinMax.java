package org.ligi.axt.views;

import android.content.Context;
import android.widget.SeekBar;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/views/SeekBarMinMax.class */
public class SeekBarMinMax extends SeekBar {
    private final int min;

    public SeekBarMinMax(Context context, int min, int max) {
        super(context);
        if (min > max) {
            throw new IllegalArgumentException("max must be bigger than min for SeegBarMinMax");
        }
        this.min = min;
        setMax(max - min);
    }

    @Override // android.widget.ProgressBar
    public synchronized int getProgress() {
        return super.getProgress() + this.min;
    }

    @Override // android.widget.ProgressBar
    public synchronized void setProgress(int progress) {
        super.setProgress(progress - this.min);
    }
}

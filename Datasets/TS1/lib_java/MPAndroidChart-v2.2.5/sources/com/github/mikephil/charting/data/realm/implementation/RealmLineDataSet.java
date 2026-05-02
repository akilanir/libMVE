package com.github.mikephil.charting.data.realm.implementation;

import android.content.Context;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.data.realm.base.RealmLineRadarDataSet;
import com.github.mikephil.charting.formatter.DefaultFillFormatter;
import com.github.mikephil.charting.formatter.FillFormatter;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.github.mikephil.charting.utils.Utils;
import io.realm.RealmObject;
import io.realm.RealmResults;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/implementation/RealmLineDataSet.class */
public class RealmLineDataSet<T extends RealmObject> extends RealmLineRadarDataSet<T> implements ILineDataSet {
    private LineDataSet.Mode mMode;
    private List<Integer> mCircleColors;
    private int mCircleColorHole;
    private float mCircleRadius;
    private float mCircleHoleRadius;
    private float mCubicIntensity;
    private DashPathEffect mDashPathEffect;
    private FillFormatter mFillFormatter;
    private boolean mDrawCircles;
    private boolean mDrawCircleHole;

    public RealmLineDataSet(RealmResults<T> result, String yValuesField) {
        super(result, yValuesField);
        this.mMode = LineDataSet.Mode.LINEAR;
        this.mCircleColors = null;
        this.mCircleColorHole = -1;
        this.mCircleRadius = 8.0f;
        this.mCircleHoleRadius = 4.0f;
        this.mCubicIntensity = 0.2f;
        this.mDashPathEffect = null;
        this.mFillFormatter = new DefaultFillFormatter();
        this.mDrawCircles = true;
        this.mDrawCircleHole = true;
        this.mCircleColors = new ArrayList();
        this.mCircleColors.add(Integer.valueOf(Color.rgb(140, 234, 255)));
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    public RealmLineDataSet(RealmResults<T> result, String yValuesField, String xIndexField) {
        super(result, yValuesField, xIndexField);
        this.mMode = LineDataSet.Mode.LINEAR;
        this.mCircleColors = null;
        this.mCircleColorHole = -1;
        this.mCircleRadius = 8.0f;
        this.mCircleHoleRadius = 4.0f;
        this.mCubicIntensity = 0.2f;
        this.mDashPathEffect = null;
        this.mFillFormatter = new DefaultFillFormatter();
        this.mDrawCircles = true;
        this.mDrawCircleHole = true;
        this.mCircleColors = new ArrayList();
        this.mCircleColors.add(Integer.valueOf(Color.rgb(140, 234, 255)));
        build(this.results);
        calcMinMax(0, this.results.size());
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public LineDataSet.Mode getMode() {
        return this.mMode;
    }

    public void setMode(LineDataSet.Mode mode) {
        this.mMode = mode;
    }

    public void setCubicIntensity(float intensity) {
        if (intensity > 1.0f) {
            intensity = 1.0f;
        }
        if (intensity < 0.05f) {
            intensity = 0.05f;
        }
        this.mCubicIntensity = intensity;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public float getCubicIntensity() {
        return this.mCubicIntensity;
    }

    public void setCircleSize(float size) {
        this.mCircleRadius = Utils.convertDpToPixel(size);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public float getCircleRadius() {
        return this.mCircleRadius;
    }

    public void setCircleHoleRadius(float holeRadius) {
        this.mCircleHoleRadius = Utils.convertDpToPixel(holeRadius);
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public float getCircleHoleRadius() {
        return this.mCircleHoleRadius;
    }

    public void enableDashedLine(float lineLength, float spaceLength, float phase) {
        this.mDashPathEffect = new DashPathEffect(new float[]{lineLength, spaceLength}, phase);
    }

    public void disableDashedLine() {
        this.mDashPathEffect = null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public boolean isDashedLineEnabled() {
        return this.mDashPathEffect != null;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public DashPathEffect getDashPathEffect() {
        return this.mDashPathEffect;
    }

    public void setDrawCircles(boolean enabled) {
        this.mDrawCircles = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public boolean isDrawCirclesEnabled() {
        return this.mDrawCircles;
    }

    @Deprecated
    public void setDrawCubic(boolean enabled) {
        this.mMode = enabled ? LineDataSet.Mode.CUBIC_BEZIER : LineDataSet.Mode.LINEAR;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    @Deprecated
    public boolean isDrawCubicEnabled() {
        return this.mMode == LineDataSet.Mode.CUBIC_BEZIER;
    }

    @Deprecated
    public void setDrawStepped(boolean enabled) {
        this.mMode = enabled ? LineDataSet.Mode.STEPPED : LineDataSet.Mode.LINEAR;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    @Deprecated
    public boolean isDrawSteppedEnabled() {
        return this.mMode == LineDataSet.Mode.STEPPED;
    }

    public List<Integer> getCircleColors() {
        return this.mCircleColors;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public int getCircleColor(int index) {
        return this.mCircleColors.get(index % this.mCircleColors.size()).intValue();
    }

    public void setCircleColors(List<Integer> colors) {
        this.mCircleColors = colors;
    }

    public void setCircleColors(int[] colors) {
        this.mCircleColors = ColorTemplate.createColors(colors);
    }

    public void setCircleColors(int[] colors, Context c) {
        List<Integer> clrs = new ArrayList<>();
        for (int color : colors) {
            clrs.add(Integer.valueOf(c.getResources().getColor(color)));
        }
        this.mCircleColors = clrs;
    }

    public void setCircleColor(int color) {
        resetCircleColors();
        this.mCircleColors.add(Integer.valueOf(color));
    }

    public void resetCircleColors() {
        this.mCircleColors = new ArrayList();
    }

    public void setCircleColorHole(int color) {
        this.mCircleColorHole = color;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public int getCircleHoleColor() {
        return this.mCircleColorHole;
    }

    public void setDrawCircleHole(boolean enabled) {
        this.mDrawCircleHole = enabled;
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public boolean isDrawCircleHoleEnabled() {
        return this.mDrawCircleHole;
    }

    public void setFillFormatter(FillFormatter formatter) {
        if (formatter == null) {
            this.mFillFormatter = new DefaultFillFormatter();
        } else {
            this.mFillFormatter = formatter;
        }
    }

    @Override // com.github.mikephil.charting.interfaces.datasets.ILineDataSet
    public FillFormatter getFillFormatter() {
        return this.mFillFormatter;
    }
}

package org.achartengine.renderer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/renderer/DialRenderer.class */
public class DialRenderer extends DefaultRenderer {
    private double mAngleMin = 330.0d;
    private double mAngleMax = 30.0d;
    private double mMinValue = Double.MAX_VALUE;
    private double mMaxValue = -1.7976931348623157E308d;
    private double mMinorTickSpacing = Double.MAX_VALUE;
    private double mMajorTickSpacing = Double.MAX_VALUE;
    private List<Type> mVisualTypes = new ArrayList();

    /* loaded from: achartengine-1.2.0.jar:org/achartengine/renderer/DialRenderer$Type.class */
    public enum Type {
        NEEDLE,
        ARROW
    }

    public double getAngleMin() {
        return this.mAngleMin;
    }

    public void setAngleMin(double min) {
        this.mAngleMin = min;
    }

    public double getAngleMax() {
        return this.mAngleMax;
    }

    public void setAngleMax(double max) {
        this.mAngleMax = max;
    }

    public double getMinValue() {
        return this.mMinValue;
    }

    public void setMinValue(double min) {
        this.mMinValue = min;
    }

    public boolean isMinValueSet() {
        return this.mMinValue != Double.MAX_VALUE;
    }

    public double getMaxValue() {
        return this.mMaxValue;
    }

    public void setMaxValue(double max) {
        this.mMaxValue = max;
    }

    public boolean isMaxValueSet() {
        return this.mMaxValue != -1.7976931348623157E308d;
    }

    public double getMinorTicksSpacing() {
        return this.mMinorTickSpacing;
    }

    public void setMinorTicksSpacing(double spacing) {
        this.mMinorTickSpacing = spacing;
    }

    public double getMajorTicksSpacing() {
        return this.mMajorTickSpacing;
    }

    public void setMajorTicksSpacing(double spacing) {
        this.mMajorTickSpacing = spacing;
    }

    public Type getVisualTypeForIndex(int index) {
        if (index < this.mVisualTypes.size()) {
            return this.mVisualTypes.get(index);
        }
        return Type.NEEDLE;
    }

    public void setVisualTypes(Type[] types) {
        this.mVisualTypes.clear();
        this.mVisualTypes.addAll(Arrays.asList(types));
    }
}

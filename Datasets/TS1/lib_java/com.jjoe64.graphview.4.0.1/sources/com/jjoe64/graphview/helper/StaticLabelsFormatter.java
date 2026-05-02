package com.jjoe64.graphview.helper;

import com.jjoe64.graphview.DefaultLabelFormatter;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.LabelFormatter;
import com.jjoe64.graphview.Viewport;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/helper/StaticLabelsFormatter.class */
public class StaticLabelsFormatter implements LabelFormatter {
    protected Viewport mViewport;
    protected String[] mVerticalLabels;
    protected String[] mHorizontalLabels;
    protected LabelFormatter mDynamicLabelFormatter;
    protected final GraphView mGraphView;

    public StaticLabelsFormatter(GraphView graphView) {
        this.mGraphView = graphView;
        init(null, null, null);
    }

    public StaticLabelsFormatter(GraphView graphView, LabelFormatter dynamicLabelFormatter) {
        this.mGraphView = graphView;
        init(null, null, dynamicLabelFormatter);
    }

    public StaticLabelsFormatter(GraphView graphView, String[] horizontalLabels, String[] verticalLabels) {
        this.mGraphView = graphView;
        init(horizontalLabels, verticalLabels, null);
    }

    public StaticLabelsFormatter(GraphView graphView, String[] horizontalLabels, String[] verticalLabels, LabelFormatter dynamicLabelFormatter) {
        this.mGraphView = graphView;
        init(horizontalLabels, verticalLabels, dynamicLabelFormatter);
    }

    protected void init(String[] horizontalLabels, String[] verticalLabels, LabelFormatter dynamicLabelFormatter) {
        this.mDynamicLabelFormatter = dynamicLabelFormatter;
        if (this.mDynamicLabelFormatter == null) {
            this.mDynamicLabelFormatter = new DefaultLabelFormatter();
        }
        this.mHorizontalLabels = horizontalLabels;
        this.mVerticalLabels = verticalLabels;
    }

    public void setDynamicLabelFormatter(LabelFormatter dynamicLabelFormatter) {
        this.mDynamicLabelFormatter = dynamicLabelFormatter;
        adjust();
    }

    public void setHorizontalLabels(String[] horizontalLabels) {
        this.mHorizontalLabels = horizontalLabels;
        adjust();
    }

    public void setVerticalLabels(String[] verticalLabels) {
        this.mVerticalLabels = verticalLabels;
        adjust();
    }

    @Override // com.jjoe64.graphview.LabelFormatter
    public String formatLabel(double value, boolean isValueX) {
        if (isValueX && this.mHorizontalLabels != null) {
            double minX = this.mViewport.getMinX(false);
            double maxX = this.mViewport.getMaxX(false);
            double range = maxX - minX;
            int idx = (int) (((value - minX) / range) * (this.mHorizontalLabels.length - 1));
            return this.mHorizontalLabels[idx];
        }
        if (!isValueX && this.mVerticalLabels != null) {
            double minY = this.mViewport.getMinY(false);
            double maxY = this.mViewport.getMaxY(false);
            double range2 = maxY - minY;
            int idx2 = (int) (((value - minY) / range2) * (this.mVerticalLabels.length - 1));
            return this.mVerticalLabels[idx2];
        }
        return this.mDynamicLabelFormatter.formatLabel(value, isValueX);
    }

    @Override // com.jjoe64.graphview.LabelFormatter
    public void setViewport(Viewport viewport) {
        this.mViewport = viewport;
        adjust();
    }

    protected void adjust() {
        this.mDynamicLabelFormatter.setViewport(this.mViewport);
        if (this.mVerticalLabels != null) {
            if (this.mVerticalLabels.length < 2) {
                throw new IllegalStateException("You need at least 2 vertical labels if you use static label formatter.");
            }
            this.mGraphView.getGridLabelRenderer().setNumVerticalLabels(this.mVerticalLabels.length);
        }
        if (this.mHorizontalLabels != null) {
            if (this.mHorizontalLabels.length < 2) {
                throw new IllegalStateException("You need at least 2 horizontal labels if you use static label formatter.");
            }
            this.mGraphView.getGridLabelRenderer().setNumHorizontalLabels(this.mHorizontalLabels.length);
        }
    }
}

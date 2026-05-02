package org.achartengine.chart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.achartengine.model.Point;
import org.achartengine.model.SeriesSelection;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/PieMapper.class */
public class PieMapper implements Serializable {
    private List<PieSegment> mPieSegmentList = new ArrayList();
    private int mPieChartRadius;
    private int mCenterX;
    private int mCenterY;

    public void setDimensions(int pieRadius, int centerX, int centerY) {
        this.mPieChartRadius = pieRadius;
        this.mCenterX = centerX;
        this.mCenterY = centerY;
    }

    public boolean areAllSegmentPresent(int datasetSize) {
        return this.mPieSegmentList.size() == datasetSize;
    }

    public void addPieSegment(int dataIndex, float value, float startAngle, float angle) {
        this.mPieSegmentList.add(new PieSegment(dataIndex, value, startAngle, angle));
    }

    public void clearPieSegments() {
        this.mPieSegmentList.clear();
    }

    public double getAngle(Point screenPoint) {
        double inRads;
        double dx = screenPoint.getX() - this.mCenterX;
        double dy = -(screenPoint.getY() - this.mCenterY);
        double inRads2 = Math.atan2(dy, dx);
        if (inRads2 < 0.0d) {
            inRads = Math.abs(inRads2);
        } else {
            inRads = 6.283185307179586d - inRads2;
        }
        return Math.toDegrees(inRads);
    }

    public boolean isOnPieChart(Point screenPoint) {
        double sqValue = Math.pow(this.mCenterX - screenPoint.getX(), 2.0d) + Math.pow(this.mCenterY - screenPoint.getY(), 2.0d);
        double radiusSquared = this.mPieChartRadius * this.mPieChartRadius;
        boolean isOnPieChart = sqValue <= radiusSquared;
        return isOnPieChart;
    }

    public SeriesSelection getSeriesAndPointForScreenCoordinate(Point screenPoint) {
        if (isOnPieChart(screenPoint)) {
            double angleFromPieCenter = getAngle(screenPoint);
            for (PieSegment pieSeg : this.mPieSegmentList) {
                if (pieSeg.isInSegment(angleFromPieCenter)) {
                    return new SeriesSelection(0, pieSeg.getDataIndex(), pieSeg.getValue(), pieSeg.getValue());
                }
            }
            return null;
        }
        return null;
    }
}

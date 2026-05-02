package org.achartengine.chart;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import java.io.Serializable;
import java.text.NumberFormat;
import java.util.List;
import org.achartengine.model.Point;
import org.achartengine.model.SeriesSelection;
import org.achartengine.renderer.DefaultRenderer;
import org.achartengine.renderer.SimpleSeriesRenderer;
import org.achartengine.renderer.XYMultipleSeriesRenderer;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/chart/AbstractChart.class */
public abstract class AbstractChart implements Serializable {
    public abstract void draw(Canvas canvas, int i, int i2, int i3, int i4, Paint paint);

    public abstract int getLegendShapeWidth(int i);

    public abstract void drawLegendShape(Canvas canvas, SimpleSeriesRenderer simpleSeriesRenderer, float f, float f2, int i, Paint paint);

    protected void drawBackground(DefaultRenderer renderer, Canvas canvas, int x, int y, int width, int height, Paint paint, boolean newColor, int color) {
        if (renderer.isApplyBackgroundColor() || newColor) {
            if (newColor) {
                paint.setColor(color);
            } else {
                paint.setColor(renderer.getBackgroundColor());
            }
            paint.setStyle(Paint.Style.FILL);
            canvas.drawRect(x, y, x + width, y + height, paint);
        }
    }

    protected int drawLegend(Canvas canvas, DefaultRenderer renderer, String[] titles, int left, int right, int y, int width, int height, int legendSize, Paint paint, boolean calculate) {
        float size = 32.0f;
        if (renderer.isShowLegend()) {
            float currentX = left;
            float currentY = ((y + height) - legendSize) + 32.0f;
            paint.setTextAlign(Paint.Align.LEFT);
            paint.setTextSize(renderer.getLegendTextSize());
            int sLength = Math.min(titles.length, renderer.getSeriesRendererCount());
            for (int i = 0; i < sLength; i++) {
                SimpleSeriesRenderer r = renderer.getSeriesRendererAt(i);
                float lineSize = getLegendShapeWidth(i);
                if (r.isShowLegendItem()) {
                    String text = titles[i];
                    if (titles.length == renderer.getSeriesRendererCount()) {
                        paint.setColor(r.getColor());
                    } else {
                        paint.setColor(DefaultRenderer.TEXT_COLOR);
                    }
                    float[] widths = new float[text.length()];
                    paint.getTextWidths(text, widths);
                    float sum = 0.0f;
                    for (float value : widths) {
                        sum += value;
                    }
                    float extraSize = lineSize + 10.0f + sum;
                    float currentWidth = currentX + extraSize;
                    if (i > 0 && getExceed(currentWidth, renderer, right, width)) {
                        currentX = left;
                        currentY += renderer.getLegendTextSize();
                        size += renderer.getLegendTextSize();
                        currentWidth = currentX + extraSize;
                    }
                    if (getExceed(currentWidth, renderer, right, width)) {
                        float maxWidth = ((right - currentX) - lineSize) - 10.0f;
                        if (isVertical(renderer)) {
                            maxWidth = ((width - currentX) - lineSize) - 10.0f;
                        }
                        int nr = paint.breakText(text, true, maxWidth, widths);
                        text = text.substring(0, nr) + "...";
                    }
                    if (!calculate) {
                        drawLegendShape(canvas, r, currentX, currentY, i, paint);
                        drawString(canvas, text, currentX + lineSize + 5.0f, currentY + 5.0f, paint);
                    }
                    currentX += extraSize;
                }
            }
        }
        return Math.round(size + renderer.getLegendTextSize());
    }

    protected void drawString(Canvas canvas, String text, float x, float y, Paint paint) {
        if (text != null) {
            String[] lines = text.split("\n");
            Rect rect = new Rect();
            int yOff = 0;
            for (int i = 0; i < lines.length; i++) {
                canvas.drawText(lines[i], x, y + yOff, paint);
                paint.getTextBounds(lines[i], 0, lines[i].length(), rect);
                yOff = yOff + rect.height() + 5;
            }
        }
    }

    protected boolean getExceed(float currentWidth, DefaultRenderer renderer, int right, int width) {
        boolean exceed = currentWidth > ((float) right);
        if (isVertical(renderer)) {
            exceed = currentWidth > ((float) width);
        }
        return exceed;
    }

    public boolean isVertical(DefaultRenderer renderer) {
        return (renderer instanceof XYMultipleSeriesRenderer) && ((XYMultipleSeriesRenderer) renderer).getOrientation() == XYMultipleSeriesRenderer.Orientation.VERTICAL;
    }

    protected String getLabel(NumberFormat format, double label) {
        String text;
        if (format != null) {
            text = format.format(label);
        } else if (label == Math.round(label)) {
            text = Math.round(label) + "";
        } else {
            text = label + "";
        }
        return text;
    }

    private static float[] calculateDrawPoints(float p1x, float p1y, float p2x, float p2y, int screenHeight, int screenWidth) {
        float drawP1x;
        float drawP1y;
        float drawP2x;
        float drawP2y;
        if (p1y > screenHeight) {
            float m = (p2y - p1y) / (p2x - p1x);
            drawP1x = ((screenHeight - p1y) + (m * p1x)) / m;
            drawP1y = screenHeight;
            if (drawP1x < 0.0f) {
                drawP1x = 0.0f;
                drawP1y = p1y - (m * p1x);
            } else if (drawP1x > screenWidth) {
                drawP1x = screenWidth;
                drawP1y = ((m * screenWidth) + p1y) - (m * p1x);
            }
        } else if (p1y < 0.0f) {
            float m2 = (p2y - p1y) / (p2x - p1x);
            drawP1x = ((-p1y) + (m2 * p1x)) / m2;
            drawP1y = 0.0f;
            if (drawP1x < 0.0f) {
                drawP1x = 0.0f;
                drawP1y = p1y - (m2 * p1x);
            } else if (drawP1x > screenWidth) {
                drawP1x = screenWidth;
                drawP1y = ((m2 * screenWidth) + p1y) - (m2 * p1x);
            }
        } else {
            drawP1x = p1x;
            drawP1y = p1y;
        }
        if (p2y > screenHeight) {
            float m3 = (p2y - p1y) / (p2x - p1x);
            drawP2x = ((screenHeight - p1y) + (m3 * p1x)) / m3;
            drawP2y = screenHeight;
            if (drawP2x < 0.0f) {
                drawP2x = 0.0f;
                drawP2y = p1y - (m3 * p1x);
            } else if (drawP2x > screenWidth) {
                drawP2x = screenWidth;
                drawP2y = ((m3 * screenWidth) + p1y) - (m3 * p1x);
            }
        } else if (p2y < 0.0f) {
            float m4 = (p2y - p1y) / (p2x - p1x);
            drawP2x = ((-p1y) + (m4 * p1x)) / m4;
            drawP2y = 0.0f;
            if (drawP2x < 0.0f) {
                drawP2x = 0.0f;
                drawP2y = p1y - (m4 * p1x);
            } else if (drawP2x > screenWidth) {
                drawP2x = screenWidth;
                drawP2y = ((m4 * screenWidth) + p1y) - (m4 * p1x);
            }
        } else {
            drawP2x = p2x;
            drawP2y = p2y;
        }
        return new float[]{drawP1x, drawP1y, drawP2x, drawP2y};
    }

    protected void drawPath(Canvas canvas, List<Float> points, Paint paint, boolean circular) {
        Path path = new Path();
        int height = canvas.getHeight();
        int width = canvas.getWidth();
        if (points.size() < 4) {
            return;
        }
        float[] tempDrawPoints = calculateDrawPoints(points.get(0).floatValue(), points.get(1).floatValue(), points.get(2).floatValue(), points.get(3).floatValue(), height, width);
        path.moveTo(tempDrawPoints[0], tempDrawPoints[1]);
        path.lineTo(tempDrawPoints[2], tempDrawPoints[3]);
        int length = points.size();
        for (int i = 4; i < length; i += 2) {
            if ((points.get(i - 1).floatValue() >= 0.0f || points.get(i + 1).floatValue() >= 0.0f) && (points.get(i - 1).floatValue() <= height || points.get(i + 1).floatValue() <= height)) {
                float[] tempDrawPoints2 = calculateDrawPoints(points.get(i - 2).floatValue(), points.get(i - 1).floatValue(), points.get(i).floatValue(), points.get(i + 1).floatValue(), height, width);
                if (!circular) {
                    path.moveTo(tempDrawPoints2[0], tempDrawPoints2[1]);
                }
                path.lineTo(tempDrawPoints2[2], tempDrawPoints2[3]);
            }
        }
        if (circular) {
            path.lineTo(points.get(0).floatValue(), points.get(1).floatValue());
        }
        canvas.drawPath(path, paint);
    }

    protected void drawPath(Canvas canvas, float[] points, Paint paint, boolean circular) {
        Path path = new Path();
        int height = canvas.getHeight();
        int width = canvas.getWidth();
        if (points.length < 4) {
            return;
        }
        float[] tempDrawPoints = calculateDrawPoints(points[0], points[1], points[2], points[3], height, width);
        path.moveTo(tempDrawPoints[0], tempDrawPoints[1]);
        path.lineTo(tempDrawPoints[2], tempDrawPoints[3]);
        int length = points.length;
        for (int i = 4; i < length; i += 2) {
            if ((points[i - 1] >= 0.0f || points[i + 1] >= 0.0f) && (points[i - 1] <= height || points[i + 1] <= height)) {
                float[] tempDrawPoints2 = calculateDrawPoints(points[i - 2], points[i - 1], points[i], points[i + 1], height, width);
                if (!circular) {
                    path.moveTo(tempDrawPoints2[0], tempDrawPoints2[1]);
                }
                path.lineTo(tempDrawPoints2[2], tempDrawPoints2[3]);
            }
        }
        if (circular) {
            path.lineTo(points[0], points[1]);
        }
        canvas.drawPath(path, paint);
    }

    private String getFitText(String text, float width, Paint paint) {
        String newText = text;
        int length = text.length();
        int diff = 0;
        while (paint.measureText(newText) > width && diff < length) {
            diff++;
            newText = text.substring(0, length - diff) + "...";
        }
        if (diff == length) {
            newText = "...";
        }
        return newText;
    }

    protected int getLegendSize(DefaultRenderer renderer, int defaultHeight, float extraHeight) {
        int legendSize = renderer.getLegendHeight();
        if (renderer.isShowLegend() && legendSize == 0) {
            legendSize = defaultHeight;
        }
        if (!renderer.isShowLegend() && renderer.isShowLabels()) {
            legendSize = (int) (((renderer.getLabelsTextSize() * 4.0f) / 3.0f) + extraHeight);
        }
        return legendSize;
    }

    /* JADX WARN: Incorrect condition in loop: B:14:0x00d9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void drawLabel(android.graphics.Canvas r10, java.lang.String r11, org.achartengine.renderer.DefaultRenderer r12, java.util.List<android.graphics.RectF> r13, int r14, int r15, float r16, float r17, float r18, float r19, int r20, int r21, int r22, android.graphics.Paint r23, boolean r24, boolean r25) {
        /*
            Method dump skipped, instructions count: 435
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.achartengine.chart.AbstractChart.drawLabel(android.graphics.Canvas, java.lang.String, org.achartengine.renderer.DefaultRenderer, java.util.List, int, int, float, float, float, float, int, int, int, android.graphics.Paint, boolean, boolean):void");
    }

    public boolean isNullValue(double value) {
        return Double.isNaN(value) || Double.isInfinite(value) || value == Double.MAX_VALUE;
    }

    public SeriesSelection getSeriesAndPointForScreenCoordinate(Point screenPoint) {
        return null;
    }
}

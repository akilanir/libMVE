package com.github.mikephil.charting.utils;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.formatter.DefaultValueFormatter;
import com.github.mikephil.charting.formatter.ValueFormatter;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/utils/Utils.class */
public abstract class Utils {
    private static DisplayMetrics mMetrics;
    public static final double DEG2RAD = 0.017453292519943295d;
    public static final float FDEG2RAD = 0.017453292f;
    private static int mMinimumFlingVelocity = 50;
    private static int mMaximumFlingVelocity = 8000;
    private static final int[] POW_10 = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000};
    private static Rect mDrawTextRectBuffer = new Rect();
    private static Paint.FontMetrics mFontMetricsBuffer = new Paint.FontMetrics();

    public static void init(Context context) {
        if (context == null) {
            mMinimumFlingVelocity = ViewConfiguration.getMinimumFlingVelocity();
            mMaximumFlingVelocity = ViewConfiguration.getMaximumFlingVelocity();
            Log.e("MPChartLib-Utils", "Utils.init(...) PROVIDED CONTEXT OBJECT IS NULL");
        } else {
            ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
            mMinimumFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
            mMaximumFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
            Resources res = context.getResources();
            mMetrics = res.getDisplayMetrics();
        }
    }

    @Deprecated
    public static void init(Resources res) {
        mMetrics = res.getDisplayMetrics();
        mMinimumFlingVelocity = ViewConfiguration.getMinimumFlingVelocity();
        mMaximumFlingVelocity = ViewConfiguration.getMaximumFlingVelocity();
    }

    public static float convertDpToPixel(float dp) {
        if (mMetrics == null) {
            Log.e("MPChartLib-Utils", "Utils NOT INITIALIZED. You need to call Utils.init(...) at least once before calling Utils.convertDpToPixel(...). Otherwise conversion does not take place.");
            return dp;
        }
        DisplayMetrics metrics = mMetrics;
        float px = dp * (metrics.densityDpi / 160.0f);
        return px;
    }

    public static float convertPixelsToDp(float px) {
        if (mMetrics == null) {
            Log.e("MPChartLib-Utils", "Utils NOT INITIALIZED. You need to call Utils.init(...) at least once before calling Utils.convertPixelsToDp(...). Otherwise conversion does not take place.");
            return px;
        }
        DisplayMetrics metrics = mMetrics;
        float dp = px / (metrics.densityDpi / 160.0f);
        return dp;
    }

    public static int calcTextWidth(Paint paint, String demoText) {
        return (int) paint.measureText(demoText);
    }

    public static int calcTextHeight(Paint paint, String demoText) {
        Rect r = new Rect();
        paint.getTextBounds(demoText, 0, demoText.length(), r);
        return r.height();
    }

    public static float getLineHeight(Paint paint) {
        Paint.FontMetrics metrics = paint.getFontMetrics();
        return metrics.descent - metrics.ascent;
    }

    public static float getLineSpacing(Paint paint) {
        Paint.FontMetrics metrics = paint.getFontMetrics();
        return (metrics.ascent - metrics.top) + metrics.bottom;
    }

    public static FSize calcTextSize(Paint paint, String demoText) {
        Rect r = new Rect();
        paint.getTextBounds(demoText, 0, demoText.length(), r);
        return new FSize(r.width(), r.height());
    }

    public static String formatNumber(float number, int digitCount, boolean separateThousands) {
        return formatNumber(number, digitCount, separateThousands, '.');
    }

    public static String formatNumber(float number, int digitCount, boolean separateThousands, char separateChar) {
        char[] out = new char[35];
        boolean neg = false;
        if (number == 0.0f) {
            return "0";
        }
        boolean zero = false;
        if (number < 1.0f && number > -1.0f) {
            zero = true;
        }
        if (number < 0.0f) {
            neg = true;
            number = -number;
        }
        if (digitCount > POW_10.length) {
            digitCount = POW_10.length - 1;
        }
        long lval = Math.round(number * POW_10[digitCount]);
        int ind = out.length - 1;
        int charCount = 0;
        boolean decimalPointAdded = false;
        while (true) {
            if (lval == 0 && charCount >= digitCount + 1) {
                break;
            }
            int digit = (int) (lval % 10);
            lval /= 10;
            int i = ind;
            ind--;
            out[i] = (char) (digit + 48);
            charCount++;
            if (charCount == digitCount) {
                ind--;
                out[ind] = ',';
                charCount++;
                decimalPointAdded = true;
            } else if (separateThousands && lval != 0 && charCount > digitCount) {
                if (decimalPointAdded) {
                    if ((charCount - digitCount) % 4 == 0) {
                        ind--;
                        out[ind] = separateChar;
                        charCount++;
                    }
                } else if ((charCount - digitCount) % 4 == 3) {
                    ind--;
                    out[ind] = separateChar;
                    charCount++;
                }
            }
        }
        if (zero) {
            int i2 = ind;
            ind--;
            out[i2] = '0';
            charCount++;
        }
        if (neg) {
            int i3 = ind;
            int i4 = ind - 1;
            out[i3] = '-';
            charCount++;
        }
        int start = out.length - charCount;
        return String.valueOf(out, start, out.length - start);
    }

    public static float roundToNextSignificant(double number) {
        float d = (float) Math.ceil((float) Math.log10(number < 0.0d ? -number : number));
        int pw = 1 - ((int) d);
        float magnitude = (float) Math.pow(10.0d, pw);
        long shifted = Math.round(number * magnitude);
        return shifted / magnitude;
    }

    public static int getDecimals(float number) {
        float i = roundToNextSignificant(number);
        return ((int) Math.ceil(-Math.log10(i))) + 2;
    }

    public static int[] convertIntegers(List<Integer> integers) {
        int[] ret = new int[integers.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = integers.get(i).intValue();
        }
        return ret;
    }

    public static String[] convertStrings(List<String> strings) {
        String[] ret = new String[strings.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = strings.get(i);
        }
        return ret;
    }

    public static double nextUp(double d) {
        if (d == Double.POSITIVE_INFINITY) {
            return d;
        }
        double d2 = d + 0.0d;
        return Double.longBitsToDouble(Double.doubleToRawLongBits(d2) + (d2 >= 0.0d ? 1L : -1L));
    }

    public static int getClosestDataSetIndexByValue(List<SelectionDetail> valsAtIndex, float value, YAxis.AxisDependency axis) {
        SelectionDetail sel = getClosestSelectionDetailByValue(valsAtIndex, value, axis);
        if (sel == null) {
            return -2147483647;
        }
        return sel.dataSetIndex;
    }

    public static int getClosestDataSetIndexByPixelY(List<SelectionDetail> valsAtIndex, float y, YAxis.AxisDependency axis) {
        SelectionDetail sel = getClosestSelectionDetailByPixelY(valsAtIndex, y, axis);
        if (sel == null) {
            return -2147483647;
        }
        return sel.dataSetIndex;
    }

    public static SelectionDetail getClosestSelectionDetailByValue(List<SelectionDetail> valsAtIndex, float value, YAxis.AxisDependency axis) {
        SelectionDetail closest = null;
        float distance = Float.MAX_VALUE;
        for (int i = 0; i < valsAtIndex.size(); i++) {
            SelectionDetail sel = valsAtIndex.get(i);
            if (axis == null || sel.dataSet.getAxisDependency() == axis) {
                float cdistance = Math.abs(sel.value - value);
                if (cdistance < distance) {
                    closest = sel;
                    distance = cdistance;
                }
            }
        }
        return closest;
    }

    public static SelectionDetail getClosestSelectionDetailByPixelY(List<SelectionDetail> valsAtIndex, float y, YAxis.AxisDependency axis) {
        SelectionDetail closest = null;
        float distance = Float.MAX_VALUE;
        for (int i = 0; i < valsAtIndex.size(); i++) {
            SelectionDetail sel = valsAtIndex.get(i);
            if (axis == null || sel.dataSet.getAxisDependency() == axis) {
                float cdistance = Math.abs(sel.y - y);
                if (cdistance < distance) {
                    closest = sel;
                    distance = cdistance;
                }
            }
        }
        return closest;
    }

    public static float getMinimumDistance(List<SelectionDetail> valsAtIndex, float y, YAxis.AxisDependency axis) {
        float distance = Float.MAX_VALUE;
        for (int i = 0; i < valsAtIndex.size(); i++) {
            SelectionDetail sel = valsAtIndex.get(i);
            if (sel.dataSet.getAxisDependency() == axis) {
                float cdistance = Math.abs(sel.y - y);
                if (cdistance < distance) {
                    distance = cdistance;
                }
            }
        }
        return distance;
    }

    public static boolean needsDefaultFormatter(ValueFormatter formatter) {
        if (formatter == null || (formatter instanceof DefaultValueFormatter)) {
            return true;
        }
        return false;
    }

    public static PointF getPosition(PointF center, float dist, float angle) {
        PointF p = new PointF((float) (center.x + (dist * Math.cos(Math.toRadians(angle)))), (float) (center.y + (dist * Math.sin(Math.toRadians(angle)))));
        return p;
    }

    public static void velocityTrackerPointerUpCleanUpIfNecessary(MotionEvent ev, VelocityTracker tracker) {
        tracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
        int upIndex = ev.getActionIndex();
        int id1 = ev.getPointerId(upIndex);
        float x1 = tracker.getXVelocity(id1);
        float y1 = tracker.getYVelocity(id1);
        int count = ev.getPointerCount();
        for (int i = 0; i < count; i++) {
            if (i != upIndex) {
                int id2 = ev.getPointerId(i);
                float x = x1 * tracker.getXVelocity(id2);
                float y = y1 * tracker.getYVelocity(id2);
                float dot = x + y;
                if (dot < 0.0f) {
                    tracker.clear();
                    return;
                }
            }
        }
    }

    @SuppressLint({"NewApi"})
    public static void postInvalidateOnAnimation(View view) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.postInvalidateOnAnimation();
        } else {
            view.postInvalidateDelayed(10L);
        }
    }

    public static int getMinimumFlingVelocity() {
        return mMinimumFlingVelocity;
    }

    public static int getMaximumFlingVelocity() {
        return mMaximumFlingVelocity;
    }

    public static float getNormalizedAngle(float angle) {
        while (angle < 0.0f) {
            angle += 360.0f;
        }
        return angle % 360.0f;
    }

    public static void drawXAxisValue(Canvas c, String text, float x, float y, Paint paint, PointF anchor, float angleDegrees) {
        float lineHeight = paint.getFontMetrics(mFontMetricsBuffer);
        paint.getTextBounds(text, 0, text.length(), mDrawTextRectBuffer);
        float drawOffsetX = 0.0f - mDrawTextRectBuffer.left;
        float drawOffsetY = 0.0f + (-mFontMetricsBuffer.ascent);
        Paint.Align originalTextAlign = paint.getTextAlign();
        paint.setTextAlign(Paint.Align.LEFT);
        if (angleDegrees != 0.0f) {
            float drawOffsetX2 = drawOffsetX - (mDrawTextRectBuffer.width() * 0.5f);
            float drawOffsetY2 = drawOffsetY - (lineHeight * 0.5f);
            float translateX = x;
            float translateY = y;
            if (anchor.x != 0.5f || anchor.y != 0.5f) {
                FSize rotatedSize = getSizeOfRotatedRectangleByDegrees(mDrawTextRectBuffer.width(), lineHeight, angleDegrees);
                translateX -= rotatedSize.width * (anchor.x - 0.5f);
                translateY -= rotatedSize.height * (anchor.y - 0.5f);
            }
            c.save();
            c.translate(translateX, translateY);
            c.rotate(angleDegrees);
            c.drawText(text, drawOffsetX2, drawOffsetY2, paint);
            c.restore();
        } else {
            if (anchor.x != 0.0f || anchor.y != 0.0f) {
                drawOffsetX -= mDrawTextRectBuffer.width() * anchor.x;
                drawOffsetY -= lineHeight * anchor.y;
            }
            c.drawText(text, drawOffsetX + x, drawOffsetY + y, paint);
        }
        paint.setTextAlign(originalTextAlign);
    }

    public static void drawMultilineText(Canvas c, StaticLayout textLayout, float x, float y, TextPaint paint, PointF anchor, float angleDegrees) {
        float lineHeight = paint.getFontMetrics(mFontMetricsBuffer);
        float drawWidth = textLayout.getWidth();
        float drawHeight = textLayout.getLineCount() * lineHeight;
        float drawOffsetX = 0.0f - mDrawTextRectBuffer.left;
        float drawOffsetY = 0.0f + drawHeight;
        Paint.Align originalTextAlign = paint.getTextAlign();
        paint.setTextAlign(Paint.Align.LEFT);
        if (angleDegrees != 0.0f) {
            float drawOffsetX2 = drawOffsetX - (drawWidth * 0.5f);
            float drawOffsetY2 = drawOffsetY - (drawHeight * 0.5f);
            float translateX = x;
            float translateY = y;
            if (anchor.x != 0.5f || anchor.y != 0.5f) {
                FSize rotatedSize = getSizeOfRotatedRectangleByDegrees(drawWidth, drawHeight, angleDegrees);
                translateX -= rotatedSize.width * (anchor.x - 0.5f);
                translateY -= rotatedSize.height * (anchor.y - 0.5f);
            }
            c.save();
            c.translate(translateX, translateY);
            c.rotate(angleDegrees);
            c.translate(drawOffsetX2, drawOffsetY2);
            textLayout.draw(c);
            c.restore();
        } else {
            if (anchor.x != 0.0f || anchor.y != 0.0f) {
                drawOffsetX -= drawWidth * anchor.x;
                drawOffsetY -= drawHeight * anchor.y;
            }
            c.save();
            c.translate(drawOffsetX + x, drawOffsetY + y);
            textLayout.draw(c);
            c.restore();
        }
        paint.setTextAlign(originalTextAlign);
    }

    public static void drawMultilineText(Canvas c, String text, float x, float y, TextPaint paint, FSize constrainedToSize, PointF anchor, float angleDegrees) {
        StaticLayout textLayout = new StaticLayout(text, 0, text.length(), paint, (int) Math.max(Math.ceil(constrainedToSize.width), 1.0d), Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
        drawMultilineText(c, textLayout, x, y, paint, anchor, angleDegrees);
    }

    public static FSize getSizeOfRotatedRectangleByDegrees(FSize rectangleSize, float degrees) {
        float radians = degrees * 0.017453292f;
        return getSizeOfRotatedRectangleByRadians(rectangleSize.width, rectangleSize.height, radians);
    }

    public static FSize getSizeOfRotatedRectangleByRadians(FSize rectangleSize, float radians) {
        return getSizeOfRotatedRectangleByRadians(rectangleSize.width, rectangleSize.height, radians);
    }

    public static FSize getSizeOfRotatedRectangleByDegrees(float rectangleWidth, float rectangleHeight, float degrees) {
        float radians = degrees * 0.017453292f;
        return getSizeOfRotatedRectangleByRadians(rectangleWidth, rectangleHeight, radians);
    }

    public static FSize getSizeOfRotatedRectangleByRadians(float rectangleWidth, float rectangleHeight, float radians) {
        return new FSize(Math.abs(rectangleWidth * ((float) Math.cos(radians))) + Math.abs(rectangleHeight * ((float) Math.sin(radians))), Math.abs(rectangleWidth * ((float) Math.sin(radians))) + Math.abs(rectangleHeight * ((float) Math.cos(radians))));
    }

    public static int getSDKInt() {
        return Build.VERSION.SDK_INT;
    }

    public static double granularity(float range, int labelCount) {
        double rawInterval = range / labelCount;
        double interval = roundToNextSignificant(rawInterval);
        double intervalMagnitude = roundToNextSignificant(Math.pow(10.0d, (int) Math.log10(interval)));
        int intervalSigDigit = (int) (interval / intervalMagnitude);
        if (intervalSigDigit > 5) {
            interval = Math.floor(10.0d * intervalMagnitude);
        }
        return interval * 0.1d;
    }
}

package com.jjoe64.graphview;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PointF;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.jjoe64.graphview.series.Series;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/GraphView.class */
public class GraphView extends View {
    private List<Series> mSeries;
    private GridLabelRenderer mGridLabelRenderer;
    private Viewport mViewport;
    private String mTitle;
    private Styles mStyles;
    protected SecondScale mSecondScale;
    private TapDetector mTapDetector;
    private LegendRenderer mLegendRenderer;
    private Paint mPaintTitle;
    private Paint mPreviewPaint;

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/GraphView$Styles.class */
    private static final class Styles {
        float titleTextSize;
        int titleColor;

        private Styles() {
        }
    }

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/GraphView$TapDetector.class */
    private class TapDetector {
        private long lastDown;
        private PointF lastPoint;

        private TapDetector() {
        }

        public boolean onTouchEvent(MotionEvent event) {
            if (event.getAction() == 0) {
                this.lastDown = System.currentTimeMillis();
                this.lastPoint = new PointF(event.getX(), event.getY());
                return false;
            }
            if (this.lastDown <= 0 || event.getAction() != 2) {
                if (event.getAction() == 1 && System.currentTimeMillis() - this.lastDown < 400) {
                    return true;
                }
                return false;
            }
            if (Math.abs(event.getX() - this.lastPoint.x) > 60.0f || Math.abs(event.getY() - this.lastPoint.y) > 60.0f) {
                this.lastDown = 0L;
                return false;
            }
            return false;
        }
    }

    public GraphView(Context context) {
        super(context);
        init();
    }

    public GraphView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public GraphView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    protected void init() {
        this.mPreviewPaint = new Paint();
        this.mPreviewPaint.setTextAlign(Paint.Align.CENTER);
        this.mPreviewPaint.setColor(-16777216);
        this.mPreviewPaint.setTextSize(50.0f);
        this.mStyles = new Styles();
        this.mViewport = new Viewport(this);
        this.mGridLabelRenderer = new GridLabelRenderer(this);
        this.mLegendRenderer = new LegendRenderer(this);
        this.mSeries = new ArrayList();
        this.mPaintTitle = new Paint();
        this.mTapDetector = new TapDetector();
        loadStyles();
    }

    protected void loadStyles() {
        this.mStyles.titleColor = this.mGridLabelRenderer.getHorizontalLabelsColor();
        this.mStyles.titleTextSize = this.mGridLabelRenderer.getTextSize();
    }

    public GridLabelRenderer getGridLabelRenderer() {
        return this.mGridLabelRenderer;
    }

    public void addSeries(Series s) {
        s.onGraphViewAttached(this);
        this.mSeries.add(s);
        onDataChanged(false, false);
    }

    public List<Series> getSeries() {
        return this.mSeries;
    }

    public void onDataChanged(boolean keepLabelsSize, boolean keepViewport) {
        this.mViewport.calcCompleteRange();
        this.mGridLabelRenderer.invalidate(keepLabelsSize, keepViewport);
        invalidate();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        if (isInEditMode()) {
            canvas.drawColor(Color.rgb(200, 200, 200));
            canvas.drawText("GraphView: No Preview available", canvas.getWidth() / 2, canvas.getHeight() / 2, this.mPreviewPaint);
            return;
        }
        drawTitle(canvas);
        this.mViewport.drawFirst(canvas);
        this.mGridLabelRenderer.draw(canvas);
        for (Series s : this.mSeries) {
            s.draw(this, canvas, false);
        }
        if (this.mSecondScale != null) {
            for (Series s2 : this.mSecondScale.getSeries()) {
                s2.draw(this, canvas, true);
            }
        }
        this.mViewport.draw(canvas);
        this.mLegendRenderer.draw(canvas);
    }

    protected void drawTitle(Canvas canvas) {
        if (this.mTitle != null && this.mTitle.length() > 0) {
            this.mPaintTitle.setColor(this.mStyles.titleColor);
            this.mPaintTitle.setTextSize(this.mStyles.titleTextSize);
            this.mPaintTitle.setTextAlign(Paint.Align.CENTER);
            float x = canvas.getWidth() / 2;
            float y = this.mPaintTitle.getTextSize();
            canvas.drawText(this.mTitle, x, y, this.mPaintTitle);
        }
    }

    protected int getTitleHeight() {
        if (this.mTitle != null && this.mTitle.length() > 0) {
            return (int) this.mPaintTitle.getTextSize();
        }
        return 0;
    }

    public Viewport getViewport() {
        return this.mViewport;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        onDataChanged(false, false);
    }

    public int getGraphContentLeft() {
        int border = getGridLabelRenderer().getStyles().padding;
        return border + getGridLabelRenderer().getLabelVerticalWidth() + getGridLabelRenderer().getVerticalAxisTitleWidth();
    }

    public int getGraphContentTop() {
        int border = getGridLabelRenderer().getStyles().padding + getTitleHeight();
        return border;
    }

    public int getGraphContentHeight() {
        int border = getGridLabelRenderer().getStyles().padding;
        int graphheight = ((getHeight() - (2 * border)) - getGridLabelRenderer().getLabelHorizontalHeight()) - getTitleHeight();
        return graphheight - getGridLabelRenderer().getHorizontalAxisTitleHeight();
    }

    public int getGraphContentWidth() {
        int border = getGridLabelRenderer().getStyles().padding;
        int graphwidth = (getWidth() - (2 * border)) - getGridLabelRenderer().getLabelVerticalWidth();
        if (this.mSecondScale != null) {
            graphwidth -= getGridLabelRenderer().getLabelVerticalSecondScaleWidth();
        }
        return graphwidth;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        boolean b = this.mViewport.onTouchEvent(event);
        boolean a = super.onTouchEvent(event);
        if (this.mTapDetector.onTouchEvent(event)) {
            for (Series s : this.mSeries) {
                s.onTap(event.getX(), event.getY());
            }
            if (this.mSecondScale != null) {
                for (Series s2 : this.mSecondScale.getSeries()) {
                    s2.onTap(event.getX(), event.getY());
                }
            }
        }
        return b || a;
    }

    @Override // android.view.View
    public void computeScroll() {
        super.computeScroll();
        this.mViewport.computeScroll();
    }

    public LegendRenderer getLegendRenderer() {
        return this.mLegendRenderer;
    }

    public void setLegendRenderer(LegendRenderer mLegendRenderer) {
        this.mLegendRenderer = mLegendRenderer;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public void setTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public float getTitleTextSize() {
        return this.mStyles.titleTextSize;
    }

    public void setTitleTextSize(float titleTextSize) {
        this.mStyles.titleTextSize = titleTextSize;
    }

    public int getTitleColor() {
        return this.mStyles.titleColor;
    }

    public void setTitleColor(int titleColor) {
        this.mStyles.titleColor = titleColor;
    }

    public SecondScale getSecondScale() {
        if (this.mSecondScale == null) {
            this.mSecondScale = new SecondScale(this.mViewport);
        }
        return this.mSecondScale;
    }

    public void removeAllSeries() {
        this.mSeries.clear();
        onDataChanged(false, false);
    }

    public void removeSeries(Series<?> series) {
        this.mSeries.remove(series);
        onDataChanged(false, false);
    }
}

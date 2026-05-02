package org.achartengine;

import android.graphics.RectF;
import android.view.MotionEvent;
import org.achartengine.chart.AbstractChart;
import org.achartengine.chart.RoundChart;
import org.achartengine.chart.XYChart;
import org.achartengine.renderer.DefaultRenderer;
import org.achartengine.tools.Pan;
import org.achartengine.tools.PanListener;
import org.achartengine.tools.ZoomListener;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/TouchHandlerOld.class */
public class TouchHandlerOld implements ITouchHandler {
    private DefaultRenderer mRenderer;
    private float oldX;
    private float oldY;
    private RectF zoomR;
    private Pan mPan;
    private GraphicalView graphicalView;

    public TouchHandlerOld(GraphicalView view, AbstractChart chart) {
        this.zoomR = new RectF();
        this.graphicalView = view;
        this.zoomR = this.graphicalView.getZoomRectangle();
        if (chart instanceof XYChart) {
            this.mRenderer = ((XYChart) chart).getRenderer();
        } else {
            this.mRenderer = ((RoundChart) chart).getRenderer();
        }
        if (this.mRenderer.isPanEnabled()) {
            this.mPan = new Pan(chart);
        }
    }

    @Override // org.achartengine.ITouchHandler
    public boolean handleTouch(MotionEvent event) {
        int action = event.getAction();
        if (this.mRenderer == null || action != 2) {
            if (action == 0) {
                this.oldX = event.getX();
                this.oldY = event.getY();
                if (this.mRenderer != null && this.mRenderer.isZoomEnabled() && this.zoomR.contains(this.oldX, this.oldY)) {
                    if (this.oldX < this.zoomR.left + (this.zoomR.width() / 3.0f)) {
                        this.graphicalView.zoomIn();
                        return true;
                    }
                    if (this.oldX < this.zoomR.left + ((this.zoomR.width() * 2.0f) / 3.0f)) {
                        this.graphicalView.zoomOut();
                        return true;
                    }
                    this.graphicalView.zoomReset();
                    return true;
                }
            } else if (action == 1) {
                this.oldX = 0.0f;
                this.oldY = 0.0f;
            }
        } else if (this.oldX >= 0.0f || this.oldY >= 0.0f) {
            float newX = event.getX();
            float newY = event.getY();
            if (this.mRenderer.isPanEnabled()) {
                this.mPan.apply(this.oldX, this.oldY, newX, newY);
            }
            this.oldX = newX;
            this.oldY = newY;
            this.graphicalView.repaint();
            return true;
        }
        return !this.mRenderer.isClickEnabled();
    }

    @Override // org.achartengine.ITouchHandler
    public void addZoomListener(ZoomListener listener) {
    }

    @Override // org.achartengine.ITouchHandler
    public void removeZoomListener(ZoomListener listener) {
    }

    @Override // org.achartengine.ITouchHandler
    public void addPanListener(PanListener listener) {
        if (this.mPan != null) {
            this.mPan.addPanListener(listener);
        }
    }

    @Override // org.achartengine.ITouchHandler
    public void removePanListener(PanListener listener) {
        if (this.mPan != null) {
            this.mPan.removePanListener(listener);
        }
    }
}

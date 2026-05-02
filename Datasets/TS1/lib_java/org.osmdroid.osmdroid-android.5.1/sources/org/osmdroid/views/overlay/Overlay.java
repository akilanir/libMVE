package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.KeyEvent;
import android.view.MotionEvent;
import java.util.concurrent.atomic.AtomicInteger;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IMapView;
import org.osmdroid.views.MapView;
import org.osmdroid.views.util.constants.OverlayConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/Overlay.class */
public abstract class Overlay implements OverlayConstants {
    protected static final float SHADOW_X_SKEW = -0.9f;
    protected static final float SHADOW_Y_SCALE = 0.5f;
    protected final ResourceProxy mResourceProxy;
    protected final float mScale;
    private boolean mEnabled = true;
    private static AtomicInteger sOrdinal = new AtomicInteger();
    private static final Rect mRect = new Rect();

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/Overlay$Snappable.class */
    public interface Snappable {
        boolean onSnapToItem(int i, int i2, Point point, IMapView iMapView);
    }

    protected abstract void draw(Canvas canvas, MapView mapView, boolean z);

    public Overlay(Context ctx) {
        this.mResourceProxy = new DefaultResourceProxyImpl(ctx);
        this.mScale = ctx.getResources().getDisplayMetrics().density;
    }

    public Overlay(ResourceProxy pResourceProxy) {
        this.mResourceProxy = pResourceProxy;
        this.mScale = this.mResourceProxy.getDisplayMetrics().density;
    }

    public void setEnabled(boolean pEnabled) {
        this.mEnabled = pEnabled;
    }

    public boolean isEnabled() {
        return this.mEnabled;
    }

    protected static final int getSafeMenuId() {
        return sOrdinal.getAndIncrement();
    }

    protected static final int getSafeMenuIdSequence(int count) {
        return sOrdinal.getAndAdd(count);
    }

    public void onDetach(MapView mapView) {
    }

    public boolean onKeyDown(int keyCode, KeyEvent event, MapView mapView) {
        return false;
    }

    public boolean onKeyUp(int keyCode, KeyEvent event, MapView mapView) {
        return false;
    }

    public boolean onTouchEvent(MotionEvent event, MapView mapView) {
        return false;
    }

    public boolean onTrackballEvent(MotionEvent event, MapView mapView) {
        return false;
    }

    public boolean onDoubleTap(MotionEvent e, MapView mapView) {
        return false;
    }

    public boolean onDoubleTapEvent(MotionEvent e, MapView mapView) {
        return false;
    }

    public boolean onSingleTapConfirmed(MotionEvent e, MapView mapView) {
        return false;
    }

    public boolean onDown(MotionEvent e, MapView mapView) {
        return false;
    }

    public boolean onFling(MotionEvent pEvent1, MotionEvent pEvent2, float pVelocityX, float pVelocityY, MapView pMapView) {
        return false;
    }

    public boolean onLongPress(MotionEvent e, MapView mapView) {
        return false;
    }

    public boolean onScroll(MotionEvent pEvent1, MotionEvent pEvent2, float pDistanceX, float pDistanceY, MapView pMapView) {
        return false;
    }

    public void onShowPress(MotionEvent pEvent, MapView pMapView) {
    }

    public boolean onSingleTapUp(MotionEvent e, MapView mapView) {
        return false;
    }

    protected static synchronized void drawAt(Canvas canvas, Drawable drawable, int x, int y, boolean shadow, float aMapOrientation) {
        canvas.save();
        canvas.rotate(-aMapOrientation, x, y);
        drawable.copyBounds(mRect);
        drawable.setBounds(mRect.left + x, mRect.top + y, mRect.right + x, mRect.bottom + y);
        drawable.draw(canvas);
        drawable.setBounds(mRect);
        canvas.restore();
    }
}

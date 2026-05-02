package org.osmdroid.views;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.view.animation.Animation;
import android.view.animation.ScaleAnimation;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.api.IMapController;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.views.util.MyMath;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/MapController.class */
public class MapController implements IMapController, MapViewConstants {
    protected final MapView mMapView;
    private ValueAnimator mZoomInAnimation;
    private ValueAnimator mZoomOutAnimation;
    private ScaleAnimation mZoomInAnimationOld;
    private ScaleAnimation mZoomOutAnimationOld;
    private Animator mCurrentAnimator;

    public MapController(MapView mapView) {
        this.mMapView = mapView;
        if (Build.VERSION.SDK_INT >= 11) {
            this.mZoomInAnimation = ValueAnimator.ofFloat(1.0f, 2.0f);
            this.mZoomInAnimation.addListener(new MyZoomAnimatorListener());
            this.mZoomInAnimation.addUpdateListener(new MyZoomAnimatorUpdateListener());
            this.mZoomInAnimation.setDuration(500L);
            this.mZoomOutAnimation = ValueAnimator.ofFloat(1.0f, 0.5f);
            this.mZoomOutAnimation.addListener(new MyZoomAnimatorListener());
            this.mZoomOutAnimation.addUpdateListener(new MyZoomAnimatorUpdateListener());
            this.mZoomOutAnimation.setDuration(500L);
            return;
        }
        this.mZoomInAnimationOld = new ScaleAnimation(1.0f, 2.0f, 1.0f, 2.0f, 1, 0.5f, 1, 0.5f);
        this.mZoomOutAnimationOld = new ScaleAnimation(1.0f, 0.5f, 1.0f, 0.5f, 1, 0.5f, 1, 0.5f);
        this.mZoomInAnimationOld.setDuration(500L);
        this.mZoomOutAnimationOld.setDuration(500L);
        this.mZoomInAnimationOld.setAnimationListener(new MyZoomAnimationListener());
        this.mZoomOutAnimationOld.setAnimationListener(new MyZoomAnimationListener());
    }

    public void zoomToSpan(BoundingBoxE6 bb) {
        zoomToSpan(bb.getLatitudeSpanE6(), bb.getLongitudeSpanE6());
    }

    @Override // org.osmdroid.api.IMapController
    public void zoomToSpan(int latSpanE6, int lonSpanE6) {
        if (latSpanE6 <= 0 || lonSpanE6 <= 0) {
            return;
        }
        BoundingBoxE6 bb = this.mMapView.getProjection().getBoundingBox();
        int curZoomLevel = this.mMapView.getProjection().getZoomLevel();
        int curLatSpan = bb.getLatitudeSpanE6();
        int curLonSpan = bb.getLongitudeSpanE6();
        float diffNeededLat = latSpanE6 / curLatSpan;
        float diffNeededLon = lonSpanE6 / curLonSpan;
        float diffNeeded = Math.max(diffNeededLat, diffNeededLon);
        if (diffNeeded > 1.0f) {
            this.mMapView.setZoomLevel(curZoomLevel - MyMath.getNextSquareNumberAbove(diffNeeded));
        } else if (diffNeeded < 0.5d) {
            this.mMapView.setZoomLevel((curZoomLevel + MyMath.getNextSquareNumberAbove(1.0f / diffNeeded)) - 1);
        }
    }

    @Override // org.osmdroid.api.IMapController
    public void animateTo(IGeoPoint point) {
        Point p = this.mMapView.getProjection().toPixels(point, null);
        animateTo(p.x, p.y);
    }

    public void animateTo(int x, int y) {
        if (!this.mMapView.isAnimating()) {
            this.mMapView.mIsFlinging = false;
            Point mercatorPoint = this.mMapView.getProjection().toMercatorPixels(x, y, null);
            mercatorPoint.offset((-this.mMapView.getWidth()) / 2, (-this.mMapView.getHeight()) / 2);
            int xStart = this.mMapView.getScrollX();
            int yStart = this.mMapView.getScrollY();
            this.mMapView.getScroller().startScroll(xStart, yStart, mercatorPoint.x - xStart, mercatorPoint.y - yStart, MapViewConstants.ANIMATION_DURATION_DEFAULT);
            this.mMapView.postInvalidate();
        }
    }

    @Override // org.osmdroid.api.IMapController
    public void scrollBy(int x, int y) {
        this.mMapView.scrollBy(x, y);
    }

    @Override // org.osmdroid.api.IMapController
    public void setCenter(IGeoPoint point) {
        Point p = this.mMapView.getProjection().toPixels(point, null);
        Point p2 = this.mMapView.getProjection().toMercatorPixels(p.x, p.y, p);
        p2.offset((-this.mMapView.getWidth()) / 2, (-this.mMapView.getHeight()) / 2);
        this.mMapView.scrollTo(p2.x, p2.y);
    }

    @Override // org.osmdroid.api.IMapController
    public void stopPanning() {
        this.mMapView.mIsFlinging = false;
        this.mMapView.getScroller().forceFinished(true);
    }

    @Override // org.osmdroid.api.IMapController
    public void stopAnimation(boolean jumpToTarget) {
        if (!this.mMapView.getScroller().isFinished()) {
            if (jumpToTarget) {
                this.mMapView.mIsFlinging = false;
                this.mMapView.getScroller().abortAnimation();
            } else {
                stopPanning();
            }
        }
        if (Build.VERSION.SDK_INT >= 11) {
            Animator currentAnimator = this.mCurrentAnimator;
            if (this.mMapView.mIsAnimating.get()) {
                currentAnimator.end();
                return;
            }
            return;
        }
        if (this.mMapView.mIsAnimating.get()) {
            this.mMapView.clearAnimation();
        }
    }

    @Override // org.osmdroid.api.IMapController
    public int setZoom(int zoomlevel) {
        return this.mMapView.setZoomLevel(zoomlevel);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomIn() {
        return zoomInFixing(this.mMapView.getWidth() / 2, this.mMapView.getHeight() / 2);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomInFixing(int xPixel, int yPixel) {
        this.mMapView.mMultiTouchScalePoint.set(xPixel, yPixel);
        if (!this.mMapView.canZoomIn() || this.mMapView.mIsAnimating.getAndSet(true)) {
            return false;
        }
        this.mMapView.mTargetZoomLevel.set(this.mMapView.getZoomLevel(false) + 1);
        if (Build.VERSION.SDK_INT >= 11) {
            this.mCurrentAnimator = this.mZoomInAnimation;
            this.mZoomInAnimation.start();
            return true;
        }
        this.mMapView.startAnimation(this.mZoomInAnimationOld);
        return true;
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomOut() {
        return zoomOutFixing(this.mMapView.getWidth() / 2, this.mMapView.getHeight() / 2);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomOutFixing(int xPixel, int yPixel) {
        this.mMapView.mMultiTouchScalePoint.set(xPixel, yPixel);
        if (!this.mMapView.canZoomOut() || this.mMapView.mIsAnimating.getAndSet(true)) {
            return false;
        }
        this.mMapView.mTargetZoomLevel.set(this.mMapView.getZoomLevel(false) - 1);
        if (Build.VERSION.SDK_INT >= 11) {
            this.mCurrentAnimator = this.mZoomOutAnimation;
            this.mZoomOutAnimation.start();
            return true;
        }
        this.mMapView.startAnimation(this.mZoomOutAnimationOld);
        return true;
    }

    protected void onAnimationStart() {
        this.mMapView.mIsAnimating.set(true);
    }

    protected void onAnimationEnd() {
        Rect screenRect = this.mMapView.getProjection().getScreenRect();
        Point p = this.mMapView.getProjection().unrotateAndScalePoint(screenRect.centerX(), screenRect.centerY(), null);
        Point p2 = this.mMapView.getProjection().toMercatorPixels(p.x, p.y, p);
        p2.offset((-this.mMapView.getWidth()) / 2, (-this.mMapView.getHeight()) / 2);
        this.mMapView.mIsAnimating.set(false);
        this.mMapView.scrollTo(p2.x, p2.y);
        setZoom(this.mMapView.mTargetZoomLevel.get());
        this.mMapView.mMultiTouchScale = 1.0f;
        if (Build.VERSION.SDK_INT >= 11) {
            this.mCurrentAnimator = null;
        }
        if (Build.VERSION.SDK_INT <= 10) {
            this.mMapView.clearAnimation();
            this.mZoomInAnimationOld.reset();
            this.mZoomOutAnimationOld.reset();
        }
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/MapController$MyZoomAnimatorListener.class */
    protected class MyZoomAnimatorListener extends AnimatorListenerAdapter {
        protected MyZoomAnimatorListener() {
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animation) {
            MapController.this.onAnimationStart();
            super.onAnimationStart(animation);
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            MapController.this.onAnimationEnd();
            super.onAnimationEnd(animation);
        }
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/MapController$MyZoomAnimatorUpdateListener.class */
    protected class MyZoomAnimatorUpdateListener implements ValueAnimator.AnimatorUpdateListener {
        protected MyZoomAnimatorUpdateListener() {
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public void onAnimationUpdate(ValueAnimator animation) {
            MapController.this.mMapView.mMultiTouchScale = ((Float) animation.getAnimatedValue()).floatValue();
            MapController.this.mMapView.invalidate();
        }
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/MapController$MyZoomAnimationListener.class */
    protected class MyZoomAnimationListener implements Animation.AnimationListener {
        protected MyZoomAnimationListener() {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationStart(Animation animation) {
            MapController.this.onAnimationStart();
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationEnd(Animation animation) {
            MapController.this.onAnimationEnd();
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationRepeat(Animation animation) {
        }
    }
}

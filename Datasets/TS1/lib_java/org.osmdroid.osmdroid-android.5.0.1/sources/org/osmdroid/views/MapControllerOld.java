package org.osmdroid.views;

import android.graphics.Point;
import microsoft.mappoint.TileSystem;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.api.IMapController;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.util.MyMath;
import org.osmdroid.views.util.constants.MapViewConstants;
import org.osmdroid.views.util.constants.MathConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld.class */
public class MapControllerOld implements IMapController, MapViewConstants {
    private final MapView mOsmv;
    private AbstractAnimationRunner mCurrentAnimationRunner;
    boolean isinverted = false;

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$AnimationType.class */
    public enum AnimationType {
        LINEAR,
        EXPONENTIALDECELERATING,
        QUARTERCOSINUSALDECELERATING,
        HALFCOSINUSALDECELERATING,
        MIDDLEPEAKSPEED
    }

    public MapControllerOld(MapView osmv) {
        this.mOsmv = osmv;
    }

    public void zoomToSpan(BoundingBoxE6 bb) {
        zoomToSpan(bb.getLatitudeSpanE6(), bb.getLongitudeSpanE6());
    }

    @Override // org.osmdroid.api.IMapController
    public void zoomToSpan(int reqLatSpan, int reqLonSpan) {
        if (reqLatSpan <= 0 || reqLonSpan <= 0) {
            return;
        }
        BoundingBoxE6 bb = this.mOsmv.getProjection().getBoundingBox();
        int curZoomLevel = this.mOsmv.getProjection().getZoomLevel();
        int curLatSpan = bb.getLatitudeSpanE6();
        int curLonSpan = bb.getLongitudeSpanE6();
        float diffNeededLat = reqLatSpan / curLatSpan;
        float diffNeededLon = reqLonSpan / curLonSpan;
        float diffNeeded = Math.max(diffNeededLat, diffNeededLon);
        if (diffNeeded > 1.0f) {
            this.mOsmv.setZoomLevel(curZoomLevel - MyMath.getNextSquareNumberAbove(diffNeeded));
        } else if (diffNeeded < 0.5d) {
            this.mOsmv.setZoomLevel((curZoomLevel + MyMath.getNextSquareNumberAbove(1.0f / diffNeeded)) - 1);
        }
    }

    @Override // org.osmdroid.api.IMapController
    public void animateTo(IGeoPoint point) {
        animateTo(point.getLatitudeE6() / 1000000.0d, point.getLongitudeE6() / 1000000.0d);
    }

    public void animateTo(double latitude, double longitude) {
        int x = this.mOsmv.getScrollX();
        int y = this.mOsmv.getScrollY();
        Point p = TileSystem.LatLongToPixelXY(latitude, longitude, this.mOsmv.getZoomLevel(), null);
        int worldSize_2 = TileSystem.MapSize(this.mOsmv.getZoomLevel()) / 2;
        this.mOsmv.getScroller().startScroll(x, y, (p.x - worldSize_2) - x, (p.y - worldSize_2) - y, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        this.mOsmv.postInvalidate();
    }

    public void animateTo(GeoPoint gp, AnimationType aAnimationType) {
        animateTo(gp.getLatitudeE6(), gp.getLongitudeE6(), aAnimationType, MapViewConstants.ANIMATION_DURATION_DEFAULT, 10);
    }

    public void animateTo(GeoPoint gp, AnimationType aAnimationType, int aSmoothness, int aDuration) {
        animateTo(gp.getLatitudeE6(), gp.getLongitudeE6(), aAnimationType, aSmoothness, aDuration);
    }

    public void animateTo(int aLatitudeE6, int aLongitudeE6, AnimationType aAnimationType) {
        animateTo(aLatitudeE6, aLongitudeE6, aAnimationType, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
    }

    public void animateTo(int aLatitudeE6, int aLongitudeE6, AnimationType aAnimationType, int aSmoothness, int aDuration) {
        stopAnimation(false);
        switch (AnonymousClass1.$SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType[aAnimationType.ordinal()]) {
            case 1:
                this.mCurrentAnimationRunner = new LinearAnimationRunner(aLatitudeE6, aLongitudeE6, aSmoothness, aDuration);
                break;
            case 2:
                this.mCurrentAnimationRunner = new ExponentialDeceleratingAnimationRunner(aLatitudeE6, aLongitudeE6, aSmoothness, aDuration);
                break;
            case 3:
                this.mCurrentAnimationRunner = new QuarterCosinusalDeceleratingAnimationRunner(aLatitudeE6, aLongitudeE6, aSmoothness, aDuration);
                break;
            case 4:
                this.mCurrentAnimationRunner = new HalfCosinusalDeceleratingAnimationRunner(aLatitudeE6, aLongitudeE6, aSmoothness, aDuration);
                break;
            case MapView.LayoutParams.CENTER /* 5 */:
                this.mCurrentAnimationRunner = new MiddlePeakSpeedAnimationRunner(aLatitudeE6, aLongitudeE6, aSmoothness, aDuration);
                break;
        }
        this.mCurrentAnimationRunner.start();
    }

    /* renamed from: org.osmdroid.views.MapControllerOld$1, reason: invalid class name */
    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType = new int[AnimationType.values().length];

        static {
            try {
                $SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType[AnimationType.LINEAR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType[AnimationType.EXPONENTIALDECELERATING.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType[AnimationType.QUARTERCOSINUSALDECELERATING.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType[AnimationType.HALFCOSINUSALDECELERATING.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$osmdroid$views$MapControllerOld$AnimationType[AnimationType.MIDDLEPEAKSPEED.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    @Override // org.osmdroid.api.IMapController
    public void scrollBy(int x, int y) {
        this.mOsmv.scrollBy(x, y);
    }

    @Override // org.osmdroid.api.IMapController
    public void setCenter(IGeoPoint point) {
        Point p = TileSystem.LatLongToPixelXY(point.getLatitudeE6() / 1000000.0d, point.getLongitudeE6() / 1000000.0d, this.mOsmv.getZoomLevel(), null);
        int worldSize_2 = TileSystem.MapSize(this.mOsmv.getZoomLevel()) / 2;
        this.mOsmv.scrollTo(p.x - worldSize_2, p.y - worldSize_2);
    }

    @Override // org.osmdroid.api.IMapController
    public void stopAnimation(boolean jumpToTarget) {
        AbstractAnimationRunner currentAnimationRunner = this.mCurrentAnimationRunner;
        if (currentAnimationRunner != null && !currentAnimationRunner.isDone()) {
            currentAnimationRunner.interrupt();
            if (jumpToTarget) {
                setCenter(new GeoPoint(currentAnimationRunner.mTargetLatitudeE6, currentAnimationRunner.mTargetLongitudeE6));
            }
        }
    }

    @Override // org.osmdroid.api.IMapController
    public void stopPanning() {
        this.mOsmv.getScroller().forceFinished(true);
    }

    @Override // org.osmdroid.api.IMapController
    public int setZoom(int zoomlevel) {
        return this.mOsmv.setZoomLevel(zoomlevel);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomIn() {
        return this.mOsmv.zoomIn();
    }

    public boolean zoomInFixing(GeoPoint point) {
        return this.mOsmv.zoomInFixing(point);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomInFixing(int xPixel, int yPixel) {
        return this.mOsmv.zoomInFixing(xPixel, yPixel);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomOut() {
        return this.mOsmv.zoomOut();
    }

    public boolean zoomOutFixing(GeoPoint point) {
        return this.mOsmv.zoomOutFixing(point);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean zoomOutFixing(int xPixel, int yPixel) {
        return this.mOsmv.zoomOutFixing(xPixel, yPixel);
    }

    @Override // org.osmdroid.api.IMapController
    public boolean isInvertedTiles() {
        return this.isinverted;
    }

    @Override // org.osmdroid.api.IMapController
    public void setInvertedTiles(boolean value) {
        this.isinverted = value;
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$AbstractAnimationRunner.class */
    private abstract class AbstractAnimationRunner extends Thread {
        protected final int mSmoothness;
        protected final int mTargetLatitudeE6;
        protected final int mTargetLongitudeE6;
        protected boolean mDone;
        protected final int mStepDuration;
        protected final int mPanTotalLatitudeE6;
        protected final int mPanTotalLongitudeE6;

        public abstract void onRunAnimation();

        public AbstractAnimationRunner(MapControllerOld mapControllerOld, MapControllerOld mapViewController, int aTargetLatitudeE6, int aTargetLongitudeE6) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        }

        public AbstractAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration) {
            this.mDone = false;
            this.mTargetLatitudeE6 = aTargetLatitudeE6;
            this.mTargetLongitudeE6 = aTargetLongitudeE6;
            this.mSmoothness = aSmoothness;
            this.mStepDuration = aDuration / aSmoothness;
            MapView mapview = MapControllerOld.this.mOsmv;
            IGeoPoint mapCenter = mapview.getMapCenter();
            this.mPanTotalLatitudeE6 = mapCenter.getLatitudeE6() - aTargetLatitudeE6;
            this.mPanTotalLongitudeE6 = mapCenter.getLongitudeE6() - aTargetLongitudeE6;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            onRunAnimation();
            this.mDone = true;
        }

        public boolean isDone() {
            return this.mDone;
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$LinearAnimationRunner.class */
    private class LinearAnimationRunner extends AbstractAnimationRunner {
        protected final int mPanPerStepLatitudeE6;
        protected final int mPanPerStepLongitudeE6;

        public LinearAnimationRunner(MapControllerOld mapControllerOld, int aTargetLatitudeE6, int aTargetLongitudeE6) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        }

        public LinearAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration) {
            super(aTargetLatitudeE6, aTargetLongitudeE6, aSmoothness, aDuration);
            MapView mapview = MapControllerOld.this.mOsmv;
            IGeoPoint mapCenter = mapview.getMapCenter();
            this.mPanPerStepLatitudeE6 = (mapCenter.getLatitudeE6() - aTargetLatitudeE6) / aSmoothness;
            this.mPanPerStepLongitudeE6 = (mapCenter.getLongitudeE6() - aTargetLongitudeE6) / aSmoothness;
            setName("LinearAnimationRunner");
        }

        @Override // org.osmdroid.views.MapControllerOld.AbstractAnimationRunner
        public void onRunAnimation() {
            MapView mapview = MapControllerOld.this.mOsmv;
            IGeoPoint mapCenter = mapview.getMapCenter();
            int panPerStepLatitudeE6 = this.mPanPerStepLatitudeE6;
            int panPerStepLongitudeE6 = this.mPanPerStepLongitudeE6;
            int stepDuration = this.mStepDuration;
            try {
                for (int i = this.mSmoothness; i > 0; i--) {
                    int newMapCenterLatE6 = mapCenter.getLatitudeE6() - panPerStepLatitudeE6;
                    int newMapCenterLonE6 = mapCenter.getLongitudeE6() - panPerStepLongitudeE6;
                    mapview.setMapCenter(new GeoPoint(newMapCenterLatE6, newMapCenterLonE6));
                    Thread.sleep(stepDuration);
                }
            } catch (Exception e) {
                interrupt();
            }
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner.class */
    private class ExponentialDeceleratingAnimationRunner extends AbstractAnimationRunner {
        public ExponentialDeceleratingAnimationRunner(MapControllerOld mapControllerOld, int aTargetLatitudeE6, int aTargetLongitudeE6) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        }

        public ExponentialDeceleratingAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration) {
            super(aTargetLatitudeE6, aTargetLongitudeE6, aSmoothness, aDuration);
            setName("ExponentialDeceleratingAnimationRunner");
        }

        @Override // org.osmdroid.views.MapControllerOld.AbstractAnimationRunner
        public void onRunAnimation() {
            MapView mapview = MapControllerOld.this.mOsmv;
            IGeoPoint mapCenter = mapview.getMapCenter();
            int stepDuration = this.mStepDuration;
            for (int i = 0; i < this.mSmoothness; i++) {
                try {
                    double delta = Math.pow(0.5d, i + 1);
                    int deltaLatitudeE6 = (int) (this.mPanTotalLatitudeE6 * delta);
                    int detlaLongitudeE6 = (int) (this.mPanTotalLongitudeE6 * delta);
                    int newMapCenterLatE6 = mapCenter.getLatitudeE6() - deltaLatitudeE6;
                    int newMapCenterLonE6 = mapCenter.getLongitudeE6() - detlaLongitudeE6;
                    mapview.setMapCenter(new GeoPoint(newMapCenterLatE6, newMapCenterLonE6));
                    Thread.sleep(stepDuration);
                } catch (Exception e) {
                    interrupt();
                    return;
                }
            }
            mapview.setMapCenter(new GeoPoint(this.mTargetLatitudeE6, this.mTargetLongitudeE6));
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner.class */
    private class CosinusalBasedAnimationRunner extends AbstractAnimationRunner implements MathConstants {
        protected final float mStepIncrement;
        protected final float mAmountStretch;
        protected final float mYOffset;
        protected final float mStart;

        public CosinusalBasedAnimationRunner(MapControllerOld mapControllerOld, int aTargetLatitudeE6, int aTargetLongitudeE6, float aStart, float aRange, float aYOffset) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT, aStart, aRange, aYOffset);
        }

        public CosinusalBasedAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration, float aStart, float aRange, float aYOffset) {
            super(aTargetLatitudeE6, aTargetLongitudeE6, aSmoothness, aDuration);
            this.mYOffset = aYOffset;
            this.mStart = aStart;
            this.mStepIncrement = aRange / aSmoothness;
            float amountSum = 0.0f;
            for (int i = 0; i < aSmoothness; i++) {
                amountSum = (float) (amountSum + aYOffset + Math.cos((this.mStepIncrement * i) + aStart));
            }
            this.mAmountStretch = 1.0f / amountSum;
            setName("QuarterCosinusalDeceleratingAnimationRunner");
        }

        @Override // org.osmdroid.views.MapControllerOld.AbstractAnimationRunner
        public void onRunAnimation() {
            MapView mapview = MapControllerOld.this.mOsmv;
            IGeoPoint mapCenter = mapview.getMapCenter();
            int stepDuration = this.mStepDuration;
            float amountStretch = this.mAmountStretch;
            for (int i = 0; i < this.mSmoothness; i++) {
                try {
                    double delta = (this.mYOffset + Math.cos((this.mStepIncrement * i) + this.mStart)) * amountStretch;
                    int deltaLatitudeE6 = (int) (this.mPanTotalLatitudeE6 * delta);
                    int deltaLongitudeE6 = (int) (this.mPanTotalLongitudeE6 * delta);
                    int newMapCenterLatE6 = mapCenter.getLatitudeE6() - deltaLatitudeE6;
                    int newMapCenterLonE6 = mapCenter.getLongitudeE6() - deltaLongitudeE6;
                    mapview.setMapCenter(new GeoPoint(newMapCenterLatE6, newMapCenterLonE6));
                    Thread.sleep(stepDuration);
                } catch (Exception e) {
                    interrupt();
                    return;
                }
            }
            mapview.setMapCenter(new GeoPoint(this.mTargetLatitudeE6, this.mTargetLongitudeE6));
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$QuarterCosinusalDeceleratingAnimationRunner.class */
    protected class QuarterCosinusalDeceleratingAnimationRunner extends CosinusalBasedAnimationRunner implements MathConstants {
        protected QuarterCosinusalDeceleratingAnimationRunner(MapControllerOld mapControllerOld, int aTargetLatitudeE6, int aTargetLongitudeE6) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        }

        protected QuarterCosinusalDeceleratingAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration) {
            super(aTargetLatitudeE6, aTargetLongitudeE6, aSmoothness, aDuration, 0.0f, 1.5707964f, 0.0f);
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$HalfCosinusalDeceleratingAnimationRunner.class */
    protected class HalfCosinusalDeceleratingAnimationRunner extends CosinusalBasedAnimationRunner implements MathConstants {
        protected HalfCosinusalDeceleratingAnimationRunner(MapControllerOld mapControllerOld, int aTargetLatitudeE6, int aTargetLongitudeE6) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        }

        protected HalfCosinusalDeceleratingAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration) {
            super(aTargetLatitudeE6, aTargetLongitudeE6, aSmoothness, aDuration, 0.0f, 3.1415927f, 1.0f);
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapControllerOld$MiddlePeakSpeedAnimationRunner.class */
    protected class MiddlePeakSpeedAnimationRunner extends CosinusalBasedAnimationRunner implements MathConstants {
        protected MiddlePeakSpeedAnimationRunner(MapControllerOld mapControllerOld, int aTargetLatitudeE6, int aTargetLongitudeE6) {
            this(aTargetLatitudeE6, aTargetLongitudeE6, 10, MapViewConstants.ANIMATION_DURATION_DEFAULT);
        }

        protected MiddlePeakSpeedAnimationRunner(int aTargetLatitudeE6, int aTargetLongitudeE6, int aSmoothness, int aDuration) {
            super(aTargetLatitudeE6, aTargetLongitudeE6, aSmoothness, aDuration, -1.5707964f, 3.1415927f, 0.0f);
        }
    }
}

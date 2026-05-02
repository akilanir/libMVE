package org.osmdroid.views.overlay;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.MotionEvent;
import java.util.ArrayList;
import org.osmdroid.ResourceProxy;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.osmdroid.views.overlay.Overlay;
import org.osmdroid.views.overlay.OverlayItem;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedOverlay.class */
public abstract class ItemizedOverlay<Item extends OverlayItem> extends Overlay implements Overlay.Snappable {
    protected final Drawable mDefaultMarker;
    private final ArrayList<Item> mInternalItemList;
    private final Rect mRect;
    private final Point mCurScreenCoords;
    protected boolean mDrawFocusedItem;
    private Item mFocusedItem;
    private boolean mPendingFocusChangedEvent;
    private OnFocusChangeListener mOnFocusChangeListener;
    private final float[] mMatrixValues;
    private final Matrix mMatrix;
    protected float scaleX;
    protected float scaleY;

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener.class */
    public interface OnFocusChangeListener {
        void onFocusChanged(ItemizedOverlay<?> itemizedOverlay, OverlayItem overlayItem);
    }

    protected abstract Item createItem(int i);

    public abstract int size();

    public ItemizedOverlay(Drawable pDefaultMarker, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mRect = new Rect();
        this.mCurScreenCoords = new Point();
        this.mDrawFocusedItem = true;
        this.mPendingFocusChangedEvent = false;
        this.mMatrixValues = new float[9];
        this.mMatrix = new Matrix();
        this.scaleX = 1.0f;
        this.scaleY = 1.0f;
        if (pDefaultMarker == null) {
            throw new IllegalArgumentException("You must pass a default marker to ItemizedOverlay.");
        }
        this.mDefaultMarker = pDefaultMarker;
        this.mInternalItemList = new ArrayList<>();
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas canvas, MapView mapView, boolean shadow) {
        if (shadow) {
            return;
        }
        if (this.mPendingFocusChangedEvent && this.mOnFocusChangeListener != null) {
            this.mOnFocusChangeListener.onFocusChanged(this, this.mFocusedItem);
        }
        this.mPendingFocusChangedEvent = false;
        Projection pj = mapView.getProjection();
        int size = this.mInternalItemList.size() - 1;
        canvas.getMatrix(this.mMatrix);
        this.mMatrix.getValues(this.mMatrixValues);
        this.scaleX = (float) Math.sqrt((this.mMatrixValues[0] * this.mMatrixValues[0]) + (this.mMatrixValues[3] * this.mMatrixValues[3]));
        this.scaleY = (float) Math.sqrt((this.mMatrixValues[4] * this.mMatrixValues[4]) + (this.mMatrixValues[1] * this.mMatrixValues[1]));
        for (int i = size; i >= 0; i--) {
            OverlayItem item = getItem(i);
            if (item != null) {
                pj.toPixels(item.getPoint(), this.mCurScreenCoords);
                onDrawItem(canvas, item, this.mCurScreenCoords, mapView.getMapOrientation());
            }
        }
    }

    protected final void populate() {
        int size = size();
        this.mInternalItemList.clear();
        this.mInternalItemList.ensureCapacity(size);
        for (int i = 0; i < size; i++) {
            this.mInternalItemList.add(createItem(i));
        }
    }

    public final Item getItem(int position) {
        try {
            return this.mInternalItemList.get(position);
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    protected void onDrawItem(Canvas canvas, Item item, Point curScreenCoords, float aMapOrientation) {
        int state = (this.mDrawFocusedItem && this.mFocusedItem == item) ? 4 : 0;
        Drawable marker = item.getMarker(state) == null ? getDefaultMarker(state) : item.getMarker(state);
        OverlayItem.HotspotPlace hotspot = item.getMarkerHotspot();
        boundToHotspot(marker, hotspot);
        int x = this.mCurScreenCoords.x;
        int y = this.mCurScreenCoords.y;
        canvas.save();
        canvas.rotate(-aMapOrientation, x, y);
        marker.copyBounds(this.mRect);
        marker.setBounds(this.mRect.left + x, this.mRect.top + y, this.mRect.right + x, this.mRect.bottom + y);
        canvas.scale(1.0f / this.scaleX, 1.0f / this.scaleY, x, y);
        marker.draw(canvas);
        marker.setBounds(this.mRect);
        canvas.restore();
    }

    protected Drawable getDefaultMarker(int state) {
        OverlayItem.setState(this.mDefaultMarker, state);
        return this.mDefaultMarker;
    }

    protected boolean hitTest(Item item, Drawable marker, int hitX, int hitY) {
        return marker.getBounds().contains(hitX, hitY);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onSingleTapConfirmed(MotionEvent e, MapView mapView) {
        Projection pj = mapView.getProjection();
        Rect screenRect = pj.getIntrinsicScreenRect();
        int size = size();
        for (int i = 0; i < size; i++) {
            OverlayItem item = getItem(i);
            if (item != null) {
                pj.toPixels(item.getPoint(), this.mCurScreenCoords);
                int state = (this.mDrawFocusedItem && this.mFocusedItem == item) ? 4 : 0;
                Drawable marker = item.getMarker(state) == null ? getDefaultMarker(state) : item.getMarker(state);
                boundToHotspot(marker, item.getMarkerHotspot());
                if (hitTest(item, marker, (-this.mCurScreenCoords.x) + screenRect.left + ((int) e.getX()), (-this.mCurScreenCoords.y) + screenRect.top + ((int) e.getY())) && onTap(i)) {
                    return true;
                }
            }
        }
        return super.onSingleTapConfirmed(e, mapView);
    }

    protected boolean onTap(int index) {
        return false;
    }

    public void setDrawFocusedItem(boolean drawFocusedItem) {
        this.mDrawFocusedItem = drawFocusedItem;
    }

    public void setFocus(Item item) {
        this.mPendingFocusChangedEvent = item != this.mFocusedItem;
        this.mFocusedItem = item;
    }

    public Item getFocus() {
        return this.mFocusedItem;
    }

    protected synchronized Drawable boundToHotspot(Drawable marker, OverlayItem.HotspotPlace hotspot) {
        int markerWidth = marker.getIntrinsicWidth();
        int markerHeight = marker.getIntrinsicHeight();
        this.mRect.set(0, 0, 0 + markerWidth, 0 + markerHeight);
        if (hotspot == null) {
            hotspot = OverlayItem.HotspotPlace.BOTTOM_CENTER;
        }
        switch (AnonymousClass1.$SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[hotspot.ordinal()]) {
            case 2:
                this.mRect.offset((-markerWidth) / 2, (-markerHeight) / 2);
                break;
            case 3:
                this.mRect.offset((-markerWidth) / 2, -markerHeight);
                break;
            case 4:
                this.mRect.offset((-markerWidth) / 2, 0);
                break;
            case MapView.LayoutParams.CENTER /* 5 */:
                this.mRect.offset(-markerWidth, (-markerHeight) / 2);
                break;
            case MapView.LayoutParams.CENTER_RIGHT /* 6 */:
                this.mRect.offset(0, (-markerHeight) / 2);
                break;
            case MapView.LayoutParams.BOTTOM_LEFT /* 7 */:
                this.mRect.offset(-markerWidth, 0);
                break;
            case 8:
                this.mRect.offset(-markerWidth, -markerHeight);
                break;
            case 9:
                this.mRect.offset(0, 0);
                break;
            case MapViewConstants.ANIMATION_SMOOTHNESS_DEFAULT /* 10 */:
                this.mRect.offset(0, -markerHeight);
                break;
        }
        marker.setBounds(this.mRect);
        return marker;
    }

    /* renamed from: org.osmdroid.views.overlay.ItemizedOverlay$1, reason: invalid class name */
    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedOverlay$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace = new int[OverlayItem.HotspotPlace.values().length];

        static {
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.NONE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.CENTER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.BOTTOM_CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.TOP_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.RIGHT_CENTER.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.LEFT_CENTER.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.UPPER_RIGHT_CORNER.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.LOWER_RIGHT_CORNER.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.UPPER_LEFT_CORNER.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace[OverlayItem.HotspotPlace.LOWER_LEFT_CORNER.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
        }
    }

    public void setOnFocusChangeListener(OnFocusChangeListener l) {
        this.mOnFocusChangeListener = l;
    }
}

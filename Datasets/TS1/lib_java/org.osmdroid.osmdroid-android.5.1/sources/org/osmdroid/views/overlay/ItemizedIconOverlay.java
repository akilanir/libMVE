package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.view.MotionEvent;
import java.util.List;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IMapView;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.osmdroid.views.overlay.OverlayItem;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedIconOverlay.class */
public class ItemizedIconOverlay<Item extends OverlayItem> extends ItemizedOverlay<Item> {
    protected final List<Item> mItemList;
    protected OnItemGestureListener<Item> mOnItemGestureListener;
    private int mDrawnItemsLimit;
    private final Point mItemPoint;

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedIconOverlay$ActiveItem.class */
    public interface ActiveItem {
        boolean run(int i);
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener.class */
    public interface OnItemGestureListener<T> {
        boolean onItemSingleTapUp(int i, T t);

        boolean onItemLongPress(int i, T t);
    }

    public ItemizedIconOverlay(List<Item> pList, Drawable pDefaultMarker, OnItemGestureListener<Item> pOnItemGestureListener, ResourceProxy pResourceProxy) {
        super(pDefaultMarker, pResourceProxy);
        this.mDrawnItemsLimit = Integer.MAX_VALUE;
        this.mItemPoint = new Point();
        this.mItemList = pList;
        this.mOnItemGestureListener = pOnItemGestureListener;
        populate();
    }

    public ItemizedIconOverlay(List<Item> pList, OnItemGestureListener<Item> pOnItemGestureListener, ResourceProxy pResourceProxy) {
        this(pList, pResourceProxy.getDrawable(ResourceProxy.bitmap.marker_default), pOnItemGestureListener, pResourceProxy);
    }

    public ItemizedIconOverlay(Context pContext, List<Item> pList, OnItemGestureListener<Item> pOnItemGestureListener) {
        this(pList, new DefaultResourceProxyImpl(pContext).getDrawable(ResourceProxy.bitmap.marker_default), pOnItemGestureListener, new DefaultResourceProxyImpl(pContext));
    }

    @Override // org.osmdroid.views.overlay.Overlay.Snappable
    public boolean onSnapToItem(int pX, int pY, Point pSnapPoint, IMapView pMapView) {
        return false;
    }

    @Override // org.osmdroid.views.overlay.ItemizedOverlay
    protected Item createItem(int index) {
        return this.mItemList.get(index);
    }

    @Override // org.osmdroid.views.overlay.ItemizedOverlay
    public int size() {
        return Math.min(this.mItemList.size(), this.mDrawnItemsLimit);
    }

    public boolean addItem(Item item) {
        boolean result = this.mItemList.add(item);
        populate();
        return result;
    }

    public void addItem(int location, Item item) {
        this.mItemList.add(location, item);
        populate();
    }

    public boolean addItems(List<Item> items) {
        boolean result = this.mItemList.addAll(items);
        populate();
        return result;
    }

    public void removeAllItems() {
        removeAllItems(true);
    }

    public void removeAllItems(boolean withPopulate) {
        this.mItemList.clear();
        if (withPopulate) {
            populate();
        }
    }

    public boolean removeItem(Item item) {
        boolean result = this.mItemList.remove(item);
        populate();
        return result;
    }

    public Item removeItem(int position) {
        Item result = this.mItemList.remove(position);
        populate();
        return result;
    }

    @Override // org.osmdroid.views.overlay.ItemizedOverlay, org.osmdroid.views.overlay.Overlay
    public boolean onSingleTapConfirmed(MotionEvent event, final MapView mapView) {
        if (activateSelectedItems(event, mapView, new ActiveItem() { // from class: org.osmdroid.views.overlay.ItemizedIconOverlay.1
            @Override // org.osmdroid.views.overlay.ItemizedIconOverlay.ActiveItem
            public boolean run(int index) {
                ItemizedIconOverlay<Item> that = ItemizedIconOverlay.this;
                if (that.mOnItemGestureListener == null) {
                    return false;
                }
                return ItemizedIconOverlay.this.onSingleTapUpHelper(index, that.mItemList.get(index), mapView);
            }
        })) {
            return true;
        }
        return super.onSingleTapConfirmed(event, mapView);
    }

    protected boolean onSingleTapUpHelper(int index, Item item, MapView mapView) {
        return this.mOnItemGestureListener.onItemSingleTapUp(index, item);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onLongPress(MotionEvent event, MapView mapView) {
        if (activateSelectedItems(event, mapView, new ActiveItem() { // from class: org.osmdroid.views.overlay.ItemizedIconOverlay.2
            /* JADX WARN: Multi-variable type inference failed */
            @Override // org.osmdroid.views.overlay.ItemizedIconOverlay.ActiveItem
            public boolean run(int index) {
                ItemizedIconOverlay<Item> that = ItemizedIconOverlay.this;
                if (that.mOnItemGestureListener == null) {
                    return false;
                }
                return ItemizedIconOverlay.this.onLongPressHelper(index, ItemizedIconOverlay.this.getItem(index));
            }
        })) {
            return true;
        }
        return super.onLongPress(event, mapView);
    }

    protected boolean onLongPressHelper(int index, Item item) {
        return this.mOnItemGestureListener.onItemLongPress(index, item);
    }

    private boolean activateSelectedItems(MotionEvent event, MapView mapView, ActiveItem task) {
        Projection pj = mapView.getProjection();
        int eventX = (int) event.getX();
        int eventY = (int) event.getY();
        for (int i = 0; i < this.mItemList.size(); i++) {
            Item item = getItem(i);
            if (item != null) {
                Drawable marker = item.getMarker(0) == null ? this.mDefaultMarker : item.getMarker(0);
                pj.toPixels(item.getPoint(), this.mItemPoint);
                if (hitTest(item, marker, eventX - this.mItemPoint.x, eventY - this.mItemPoint.y) && task.run(i)) {
                    return true;
                }
            }
        }
        return false;
    }

    public int getDrawnItemsLimit() {
        return this.mDrawnItemsLimit;
    }

    public void setDrawnItemsLimit(int aLimit) {
        this.mDrawnItemsLimit = aLimit;
    }
}

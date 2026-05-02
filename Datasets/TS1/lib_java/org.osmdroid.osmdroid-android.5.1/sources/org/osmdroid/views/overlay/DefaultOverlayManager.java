package org.osmdroid.views.overlay;

import android.graphics.Canvas;
import android.graphics.Point;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.concurrent.CopyOnWriteArrayList;
import org.osmdroid.api.IMapView;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.Overlay;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/DefaultOverlayManager.class */
public class DefaultOverlayManager extends AbstractList<Overlay> implements OverlayManager {
    private TilesOverlay mTilesOverlay;
    private final CopyOnWriteArrayList<Overlay> mOverlayList;

    public DefaultOverlayManager(TilesOverlay tilesOverlay) {
        setTilesOverlay(tilesOverlay);
        this.mOverlayList = new CopyOnWriteArrayList<>();
    }

    @Override // java.util.AbstractList, java.util.List
    public Overlay get(int pIndex) {
        return this.mOverlayList.get(pIndex);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List, org.osmdroid.views.overlay.OverlayManager
    public int size() {
        return this.mOverlayList.size();
    }

    @Override // java.util.AbstractList, java.util.List
    public void add(int pIndex, Overlay pElement) {
        this.mOverlayList.add(pIndex, pElement);
    }

    @Override // java.util.AbstractList, java.util.List
    public Overlay remove(int pIndex) {
        return this.mOverlayList.remove(pIndex);
    }

    @Override // java.util.AbstractList, java.util.List
    public Overlay set(int pIndex, Overlay pElement) {
        Overlay overlay = this.mOverlayList.set(pIndex, pElement);
        return overlay;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public TilesOverlay getTilesOverlay() {
        return this.mTilesOverlay;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public void setTilesOverlay(TilesOverlay tilesOverlay) {
        this.mTilesOverlay = tilesOverlay;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public Iterable<Overlay> overlaysReversed() {
        return new Iterable<Overlay>() { // from class: org.osmdroid.views.overlay.DefaultOverlayManager.1
            @Override // java.lang.Iterable
            public Iterator<Overlay> iterator() {
                final ListIterator<Overlay> i = DefaultOverlayManager.this.mOverlayList.listIterator(DefaultOverlayManager.this.mOverlayList.size());
                return new Iterator<Overlay>() { // from class: org.osmdroid.views.overlay.DefaultOverlayManager.1.1
                    @Override // java.util.Iterator
                    public boolean hasNext() {
                        return i.hasPrevious();
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // java.util.Iterator
                    public Overlay next() {
                        return (Overlay) i.previous();
                    }

                    @Override // java.util.Iterator
                    public void remove() {
                        i.remove();
                    }
                };
            }
        };
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public List<Overlay> overlays() {
        return this.mOverlayList;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public void onDraw(Canvas c, MapView pMapView) {
        if (this.mTilesOverlay != null && this.mTilesOverlay.isEnabled()) {
            this.mTilesOverlay.draw(c, pMapView, true);
        }
        if (this.mTilesOverlay != null && this.mTilesOverlay.isEnabled()) {
            this.mTilesOverlay.draw(c, pMapView, false);
        }
        Iterator i$ = this.mOverlayList.iterator();
        while (i$.hasNext()) {
            Overlay overlay = i$.next();
            if (overlay.isEnabled()) {
                overlay.draw(c, pMapView, true);
            }
        }
        Iterator i$2 = this.mOverlayList.iterator();
        while (i$2.hasNext()) {
            Overlay overlay2 = i$2.next();
            if (overlay2.isEnabled()) {
                overlay2.draw(c, pMapView, false);
            }
        }
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public void onDetach(MapView pMapView) {
        if (this.mTilesOverlay != null) {
            this.mTilesOverlay.onDetach(pMapView);
        }
        for (Overlay overlay : overlaysReversed()) {
            overlay.onDetach(pMapView);
        }
        clear();
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onKeyDown(int keyCode, KeyEvent event, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onKeyDown(keyCode, event, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onKeyUp(int keyCode, KeyEvent event, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onKeyUp(keyCode, event, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onTouchEvent(MotionEvent event, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onTouchEvent(event, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onTrackballEvent(MotionEvent event, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onTrackballEvent(event, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onSnapToItem(int x, int y, Point snapPoint, IMapView pMapView) {
        for (Object obj : overlaysReversed()) {
            if ((obj instanceof Overlay.Snappable) && ((Overlay.Snappable) obj).onSnapToItem(x, y, snapPoint, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onDoubleTap(MotionEvent e, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onDoubleTap(e, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onDoubleTapEvent(MotionEvent e, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onDoubleTapEvent(e, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onSingleTapConfirmed(MotionEvent e, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onSingleTapConfirmed(e, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onDown(MotionEvent pEvent, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onDown(pEvent, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onFling(MotionEvent pEvent1, MotionEvent pEvent2, float pVelocityX, float pVelocityY, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onFling(pEvent1, pEvent2, pVelocityX, pVelocityY, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onLongPress(MotionEvent pEvent, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onLongPress(pEvent, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onScroll(MotionEvent pEvent1, MotionEvent pEvent2, float pDistanceX, float pDistanceY, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onScroll(pEvent1, pEvent2, pDistanceX, pDistanceY, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public void onShowPress(MotionEvent pEvent, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            overlay.onShowPress(pEvent, pMapView);
        }
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onSingleTapUp(MotionEvent pEvent, MapView pMapView) {
        for (Overlay overlay : overlaysReversed()) {
            if (overlay.onSingleTapUp(pEvent, pMapView)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public void setOptionsMenusEnabled(boolean pEnabled) {
        Iterator i$ = this.mOverlayList.iterator();
        while (i$.hasNext()) {
            Object obj = (Overlay) i$.next();
            if ((obj instanceof IOverlayMenuProvider) && ((IOverlayMenuProvider) obj).isOptionsMenuEnabled()) {
                ((IOverlayMenuProvider) obj).setOptionsMenuEnabled(pEnabled);
            }
        }
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onCreateOptionsMenu(Menu pMenu, int menuIdOffset, MapView mapView) {
        boolean result = true;
        for (Object obj : overlaysReversed()) {
            if (obj instanceof IOverlayMenuProvider) {
                IOverlayMenuProvider overlayMenuProvider = (IOverlayMenuProvider) obj;
                if (overlayMenuProvider.isOptionsMenuEnabled()) {
                    result &= overlayMenuProvider.onCreateOptionsMenu(pMenu, menuIdOffset, mapView);
                }
            }
        }
        if (this.mTilesOverlay != null && this.mTilesOverlay.isOptionsMenuEnabled()) {
            result &= this.mTilesOverlay.onCreateOptionsMenu(pMenu, menuIdOffset, mapView);
        }
        return result;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onPrepareOptionsMenu(Menu pMenu, int menuIdOffset, MapView mapView) {
        for (Object obj : overlaysReversed()) {
            if (obj instanceof IOverlayMenuProvider) {
                IOverlayMenuProvider overlayMenuProvider = (IOverlayMenuProvider) obj;
                if (overlayMenuProvider.isOptionsMenuEnabled()) {
                    overlayMenuProvider.onPrepareOptionsMenu(pMenu, menuIdOffset, mapView);
                }
            }
        }
        if (this.mTilesOverlay != null && this.mTilesOverlay.isOptionsMenuEnabled()) {
            this.mTilesOverlay.onPrepareOptionsMenu(pMenu, menuIdOffset, mapView);
            return true;
        }
        return true;
    }

    @Override // org.osmdroid.views.overlay.OverlayManager
    public boolean onOptionsItemSelected(MenuItem item, int menuIdOffset, MapView mapView) {
        for (Object obj : overlaysReversed()) {
            if (obj instanceof IOverlayMenuProvider) {
                IOverlayMenuProvider overlayMenuProvider = (IOverlayMenuProvider) obj;
                if (overlayMenuProvider.isOptionsMenuEnabled() && overlayMenuProvider.onOptionsItemSelected(item, menuIdOffset, mapView)) {
                    return true;
                }
            }
        }
        if (this.mTilesOverlay != null && this.mTilesOverlay.isOptionsMenuEnabled() && this.mTilesOverlay.onOptionsItemSelected(item, menuIdOffset, mapView)) {
            return true;
        }
        return false;
    }
}

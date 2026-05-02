package org.osmdroid.views.overlay;

import android.graphics.Canvas;
import android.graphics.Point;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import java.util.List;
import org.osmdroid.api.IMapView;
import org.osmdroid.views.MapView;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/OverlayManager.class */
public interface OverlayManager extends List<Overlay> {
    @Override // java.util.List, org.osmdroid.views.overlay.OverlayManager
    Overlay get(int i);

    @Override // java.util.Collection, java.util.List, org.osmdroid.views.overlay.OverlayManager
    int size();

    void add(int i, Overlay overlay);

    @Override // java.util.List, org.osmdroid.views.overlay.OverlayManager
    Overlay remove(int i);

    Overlay set(int i, Overlay overlay);

    TilesOverlay getTilesOverlay();

    void setTilesOverlay(TilesOverlay tilesOverlay);

    List<Overlay> overlays();

    Iterable<Overlay> overlaysReversed();

    void onDraw(Canvas canvas, MapView mapView);

    void onDetach(MapView mapView);

    boolean onKeyDown(int i, KeyEvent keyEvent, MapView mapView);

    boolean onKeyUp(int i, KeyEvent keyEvent, MapView mapView);

    boolean onTouchEvent(MotionEvent motionEvent, MapView mapView);

    boolean onTrackballEvent(MotionEvent motionEvent, MapView mapView);

    boolean onSnapToItem(int i, int i2, Point point, IMapView iMapView);

    boolean onDoubleTap(MotionEvent motionEvent, MapView mapView);

    boolean onDoubleTapEvent(MotionEvent motionEvent, MapView mapView);

    boolean onSingleTapConfirmed(MotionEvent motionEvent, MapView mapView);

    boolean onDown(MotionEvent motionEvent, MapView mapView);

    boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2, MapView mapView);

    boolean onLongPress(MotionEvent motionEvent, MapView mapView);

    boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2, MapView mapView);

    void onShowPress(MotionEvent motionEvent, MapView mapView);

    boolean onSingleTapUp(MotionEvent motionEvent, MapView mapView);

    void setOptionsMenusEnabled(boolean z);

    boolean onCreateOptionsMenu(Menu menu, int i, MapView mapView);

    boolean onPrepareOptionsMenu(Menu menu, int i, MapView mapView);

    boolean onOptionsItemSelected(MenuItem menuItem, int i, MapView mapView);
}

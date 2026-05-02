package org.osmdroid.views.overlay.gestures;

import android.R;
import android.content.Context;
import android.graphics.Canvas;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.IOverlayMenuProvider;
import org.osmdroid.views.overlay.Overlay;
import org.osmdroid.views.overlay.gestures.RotationGestureDetector;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/gestures/RotationGestureOverlay.class */
public class RotationGestureOverlay extends Overlay implements RotationGestureDetector.RotationListener, IOverlayMenuProvider {
    private static final boolean SHOW_ROTATE_MENU_ITEMS = false;
    private static final int MENU_ENABLED = getSafeMenuId();
    private static final int MENU_ROTATE_CCW = getSafeMenuId();
    private static final int MENU_ROTATE_CW = getSafeMenuId();
    private final RotationGestureDetector mRotationDetector;
    private MapView mMapView;
    private float lastAngle;
    private boolean mOptionsMenuEnabled;
    long timeLastSet;
    final long deltaTime = 25;
    float currentAngle;

    public RotationGestureOverlay(Context context, MapView mapView) {
        super(context);
        this.lastAngle = 0.0f;
        this.mOptionsMenuEnabled = true;
        this.timeLastSet = 0L;
        this.deltaTime = 25L;
        this.currentAngle = 0.0f;
        this.mMapView = mapView;
        this.mRotationDetector = new RotationGestureDetector(this);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas c, MapView osmv, boolean shadow) {
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onTouchEvent(MotionEvent event, MapView mapView) {
        if (isEnabled()) {
            this.mRotationDetector.onTouch(event);
        }
        return super.onTouchEvent(event, mapView);
    }

    @Override // org.osmdroid.views.overlay.gestures.RotationGestureDetector.RotationListener
    public void onRotate(float deltaAngle) {
        this.currentAngle += deltaAngle;
        if (System.currentTimeMillis() - 25 > this.timeLastSet) {
            this.timeLastSet = System.currentTimeMillis();
            this.mMapView.setMapOrientation(this.mMapView.getMapOrientation() + this.currentAngle);
        }
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean isOptionsMenuEnabled() {
        return this.mOptionsMenuEnabled;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onCreateOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        pMenu.add(0, MENU_ENABLED + pMenuIdOffset, 0, "Enable rotation").setIcon(R.drawable.ic_menu_info_details);
        return true;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onOptionsItemSelected(MenuItem pItem, int pMenuIdOffset, MapView pMapView) {
        if (pItem.getItemId() == MENU_ENABLED + pMenuIdOffset) {
            if (isEnabled()) {
                this.mMapView.setMapOrientation(0.0f);
                setEnabled(false);
                return false;
            }
            setEnabled(true);
            return true;
        }
        if (pItem.getItemId() == MENU_ROTATE_CCW + pMenuIdOffset) {
            this.mMapView.setMapOrientation(this.mMapView.getMapOrientation() - 10.0f);
            return false;
        }
        if (pItem.getItemId() == MENU_ROTATE_CW + pMenuIdOffset) {
            this.mMapView.setMapOrientation(this.mMapView.getMapOrientation() + 10.0f);
            return false;
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onPrepareOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        pMenu.findItem(MENU_ENABLED + pMenuIdOffset).setTitle(isEnabled() ? "Disable rotation" : "Enable rotation");
        return false;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public void setOptionsMenuEnabled(boolean enabled) {
        this.mOptionsMenuEnabled = enabled;
    }
}

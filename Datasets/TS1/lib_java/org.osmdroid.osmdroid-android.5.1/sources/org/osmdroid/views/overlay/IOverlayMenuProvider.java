package org.osmdroid.views.overlay;

import android.view.Menu;
import android.view.MenuItem;
import org.osmdroid.views.MapView;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/IOverlayMenuProvider.class */
public interface IOverlayMenuProvider {
    boolean onCreateOptionsMenu(Menu menu, int i, MapView mapView);

    boolean onPrepareOptionsMenu(Menu menu, int i, MapView mapView);

    boolean onOptionsItemSelected(MenuItem menuItem, int i, MapView mapView);

    boolean isOptionsMenuEnabled();

    void setOptionsMenuEnabled(boolean z);
}

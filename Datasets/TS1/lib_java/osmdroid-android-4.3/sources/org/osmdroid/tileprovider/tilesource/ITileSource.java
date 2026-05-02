package org.osmdroid.tileprovider.tilesource;

import android.graphics.drawable.Drawable;
import java.io.InputStream;
import org.osmdroid.ResourceProxy;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/tilesource/ITileSource.class */
public interface ITileSource {
    int ordinal();

    String name();

    String localizedName(ResourceProxy resourceProxy);

    String getTileRelativeFilenameString(MapTile mapTile);

    Drawable getDrawable(String str) throws BitmapTileSourceBase.LowMemoryException;

    Drawable getDrawable(InputStream inputStream) throws BitmapTileSourceBase.LowMemoryException;

    int getMinimumZoomLevel();

    int getMaximumZoomLevel();

    int getTileSizePixels();
}

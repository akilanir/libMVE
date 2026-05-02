package org.osmdroid.tileprovider.tilesource;

import android.graphics.drawable.Drawable;
import java.io.InputStream;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/tilesource/ITileSource.class */
public interface ITileSource {
    @Deprecated
    int ordinal();

    String name();

    String getTileRelativeFilenameString(MapTile mapTile);

    Drawable getDrawable(String str) throws BitmapTileSourceBase.LowMemoryException;

    Drawable getDrawable(InputStream inputStream) throws BitmapTileSourceBase.LowMemoryException;

    int getMinimumZoomLevel();

    int getMaximumZoomLevel();

    int getTileSizePixels();
}

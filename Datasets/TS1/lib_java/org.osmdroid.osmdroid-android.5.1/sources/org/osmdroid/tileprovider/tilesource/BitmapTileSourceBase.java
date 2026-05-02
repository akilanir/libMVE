package org.osmdroid.tileprovider.tilesource;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import java.io.File;
import java.io.InputStream;
import java.util.Random;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.BitmapPool;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.ReusableBitmapDrawable;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/BitmapTileSourceBase.class */
public abstract class BitmapTileSourceBase implements ITileSource {
    private static int globalOrdinal = 0;
    private final int mMinimumZoomLevel;
    private final int mMaximumZoomLevel;
    private final int mOrdinal;
    protected final String mName;
    protected final String mImageFilenameEnding;
    protected final Random random = new Random();
    private final int mTileSizePixels;

    public BitmapTileSourceBase(String aName, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding) {
        int i = globalOrdinal;
        globalOrdinal = i + 1;
        this.mOrdinal = i;
        this.mName = aName;
        this.mMinimumZoomLevel = aZoomMinLevel;
        this.mMaximumZoomLevel = aZoomMaxLevel;
        this.mTileSizePixels = aTileSizePixels;
        this.mImageFilenameEnding = aImageFilenameEnding;
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public int ordinal() {
        return this.mOrdinal;
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public String name() {
        return this.mName;
    }

    public String pathBase() {
        return this.mName;
    }

    public String imageFilenameEnding() {
        return this.mImageFilenameEnding;
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public int getMinimumZoomLevel() {
        return this.mMinimumZoomLevel;
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public int getMaximumZoomLevel() {
        return this.mMaximumZoomLevel;
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public int getTileSizePixels() {
        return this.mTileSizePixels;
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public Drawable getDrawable(String aFilePath) throws LowMemoryException {
        Bitmap bitmap;
        try {
            BitmapFactory.Options bitmapOptions = new BitmapFactory.Options();
            BitmapPool.getInstance().applyReusableOptions(bitmapOptions);
            if (Build.VERSION.SDK_INT == 15) {
                bitmap = BitmapFactory.decodeFile(aFilePath);
            } else {
                bitmap = BitmapFactory.decodeFile(aFilePath, bitmapOptions);
            }
            if (bitmap != null) {
                return new ReusableBitmapDrawable(bitmap);
            }
            File bmp = new File(aFilePath);
            if (bmp.exists()) {
                Log.d(IMapView.LOGTAG, aFilePath + " is an invalid image file, deleting...");
                try {
                    new File(aFilePath).delete();
                } catch (Throwable e) {
                    Log.e(IMapView.LOGTAG, "Error deleting invalid file: " + aFilePath, e);
                }
            } else {
                Log.d(IMapView.LOGTAG, "Request tile: " + aFilePath + " does not exist");
            }
            return null;
        } catch (Exception e2) {
            Log.e(IMapView.LOGTAG, "Unexpected error loading bitmap: " + aFilePath, e2);
            System.gc();
            return null;
        } catch (OutOfMemoryError e3) {
            Log.e(IMapView.LOGTAG, "OutOfMemoryError loading bitmap: " + aFilePath);
            System.gc();
            throw new LowMemoryException(e3);
        }
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public String getTileRelativeFilenameString(MapTile tile) {
        return pathBase() + '/' + tile.getZoomLevel() + '/' + tile.getX() + '/' + tile.getY() + imageFilenameEnding();
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public Drawable getDrawable(InputStream aFileInputStream) throws LowMemoryException {
        try {
            BitmapFactory.Options bitmapOptions = new BitmapFactory.Options();
            BitmapPool.getInstance().applyReusableOptions(bitmapOptions);
            Bitmap bitmap = BitmapFactory.decodeStream(aFileInputStream, null, bitmapOptions);
            if (bitmap != null) {
                return new ReusableBitmapDrawable(bitmap);
            }
            return null;
        } catch (OutOfMemoryError e) {
            Log.e(IMapView.LOGTAG, "OutOfMemoryError loading bitmap");
            System.gc();
            throw new LowMemoryException(e);
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException.class */
    public final class LowMemoryException extends Exception {
        private static final long serialVersionUID = 146526524087765134L;

        public LowMemoryException(String pDetailMessage) {
            super(pDetailMessage);
        }

        public LowMemoryException(Throwable pThrowable) {
            super(pThrowable);
        }
    }
}

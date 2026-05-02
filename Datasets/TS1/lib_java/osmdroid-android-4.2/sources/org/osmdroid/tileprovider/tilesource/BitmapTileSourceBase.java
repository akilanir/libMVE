package org.osmdroid.tileprovider.tilesource;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import java.io.File;
import java.io.InputStream;
import java.util.Random;
import org.osmdroid.ResourceProxy;
import org.osmdroid.tileprovider.BitmapPool;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.ReusableBitmapDrawable;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/tilesource/BitmapTileSourceBase.class */
public abstract class BitmapTileSourceBase implements ITileSource, OpenStreetMapTileProviderConstants {
    private static final Logger logger = LoggerFactory.getLogger(BitmapTileSourceBase.class);
    private static int globalOrdinal = 0;
    private final int mMinimumZoomLevel;
    private final int mMaximumZoomLevel;
    private final int mOrdinal;
    protected final String mName;
    protected final String mImageFilenameEnding;
    protected final Random random = new Random();
    private final int mTileSizePixels;
    private final ResourceProxy.string mResourceId;

    public BitmapTileSourceBase(String aName, ResourceProxy.string aResourceId, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding) {
        this.mResourceId = aResourceId;
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
    public String localizedName(ResourceProxy proxy) {
        return proxy.getString(this.mResourceId);
    }

    @Override // org.osmdroid.tileprovider.tilesource.ITileSource
    public Drawable getDrawable(String aFilePath) {
        try {
            BitmapFactory.Options bitmapOptions = new BitmapFactory.Options();
            BitmapPool.getInstance().applyReusableOptions(bitmapOptions);
            Bitmap bitmap = BitmapFactory.decodeFile(aFilePath, bitmapOptions);
            if (bitmap != null) {
                return new ReusableBitmapDrawable(bitmap);
            }
            try {
                new File(aFilePath).delete();
            } catch (Throwable e) {
                logger.error("Error deleting invalid file: " + aFilePath, e);
            }
            return null;
        } catch (OutOfMemoryError e2) {
            logger.error("OutOfMemoryError loading bitmap: " + aFilePath);
            System.gc();
            return null;
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
            logger.error("OutOfMemoryError loading bitmap");
            System.gc();
            throw new LowMemoryException(e);
        }
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException.class */
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

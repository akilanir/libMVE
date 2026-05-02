package org.osmdroid.util;

import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.Rect;
import org.osmdroid.tileprovider.MapTile;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/util/TileLooper.class */
public abstract class TileLooper {
    protected final Point mUpperLeft = new Point();
    protected final Point mLowerRight = new Point();

    public abstract void initialiseLoop(int i, int i2);

    public abstract void handleTile(Canvas canvas, int i, MapTile mapTile, int i2, int i3);

    public abstract void finaliseLoop();

    public final void loop(Canvas pCanvas, int pZoomLevel, int pTileSizePx, Rect pViewPort) {
        TileSystem.PixelXYToTileXY(pViewPort.left, pViewPort.top, this.mUpperLeft);
        this.mUpperLeft.offset(-1, -1);
        TileSystem.PixelXYToTileXY(pViewPort.right, pViewPort.bottom, this.mLowerRight);
        int mapTileUpperBound = 1 << pZoomLevel;
        initialiseLoop(pZoomLevel, pTileSizePx);
        for (int y = this.mUpperLeft.y; y <= this.mLowerRight.y; y++) {
            for (int x = this.mUpperLeft.x; x <= this.mLowerRight.x; x++) {
                int tileY = MyMath.mod(y, mapTileUpperBound);
                int tileX = MyMath.mod(x, mapTileUpperBound);
                MapTile tile = new MapTile(pZoomLevel, tileX, tileY);
                handleTile(pCanvas, pTileSizePx, tile, x, y);
            }
        }
        finaliseLoop();
    }
}

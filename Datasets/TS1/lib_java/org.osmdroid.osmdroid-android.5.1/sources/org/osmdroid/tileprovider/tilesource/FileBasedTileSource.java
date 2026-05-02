package org.osmdroid.tileprovider.tilesource;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/FileBasedTileSource.class */
public class FileBasedTileSource extends XYTileSource {
    public FileBasedTileSource(String aName, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding, String[] aBaseUrl) {
        super(aName, aZoomMinLevel, aZoomMaxLevel, aTileSizePixels, aImageFilenameEnding, aBaseUrl);
    }

    public static ITileSource getSource(String name) {
        if (name.contains(".")) {
            name = name.substring(0, name.indexOf("."));
        }
        return new FileBasedTileSource(name, 0, 18, 256, ".png", new String[]{"http://localhost"});
    }
}

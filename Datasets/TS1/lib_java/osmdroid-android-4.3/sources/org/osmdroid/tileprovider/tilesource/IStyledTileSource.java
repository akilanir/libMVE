package org.osmdroid.tileprovider.tilesource;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/tilesource/IStyledTileSource.class */
public interface IStyledTileSource<T> {
    void setStyle(T t);

    void setStyle(String str);

    T getStyle();
}

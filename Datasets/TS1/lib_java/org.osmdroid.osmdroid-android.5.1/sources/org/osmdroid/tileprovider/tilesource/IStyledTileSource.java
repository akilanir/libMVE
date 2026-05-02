package org.osmdroid.tileprovider.tilesource;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/IStyledTileSource.class */
public interface IStyledTileSource<T> {
    void setStyle(T t);

    void setStyle(String str);

    T getStyle();
}

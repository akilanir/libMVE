package com.drew.metadata.exif;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.MetadataException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/ExifThumbnailDirectory.class */
public class ExifThumbnailDirectory extends ExifDirectoryBase {
    public static final int TAG_THUMBNAIL_OFFSET = 513;
    public static final int TAG_THUMBNAIL_LENGTH = 514;

    @Deprecated
    public static final int TAG_THUMBNAIL_COMPRESSION = 259;

    @NotNull
    protected static final HashMap<Integer, String> _tagNameMap = new HashMap<>();

    @Nullable
    private byte[] _thumbnailData;

    static {
        addExifTagNames(_tagNameMap);
        _tagNameMap.put(513, "Thumbnail Offset");
        _tagNameMap.put(514, "Thumbnail Length");
    }

    public ExifThumbnailDirectory() {
        setDescriptor(new ExifThumbnailDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    @NotNull
    public String getName() {
        return "Exif Thumbnail";
    }

    @Override // com.drew.metadata.Directory
    @NotNull
    protected HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    public boolean hasThumbnailData() {
        return this._thumbnailData != null;
    }

    @Nullable
    public byte[] getThumbnailData() {
        return this._thumbnailData;
    }

    public void setThumbnailData(@Nullable byte[] data) {
        this._thumbnailData = data;
    }

    public void writeThumbnail(@NotNull String filename) throws MetadataException, IOException {
        byte[] data = this._thumbnailData;
        if (data == null) {
            throw new MetadataException("No thumbnail data exists.");
        }
        FileOutputStream stream = null;
        try {
            stream = new FileOutputStream(filename);
            stream.write(data);
            if (stream != null) {
                stream.close();
            }
        } catch (Throwable th) {
            if (stream != null) {
                stream.close();
            }
            throw th;
        }
    }
}

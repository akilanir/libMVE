package com.drew.metadata.gif;

import com.drew.lang.SequentialReader;
import com.drew.lang.annotations.NotNull;
import com.drew.metadata.Metadata;
import java.io.IOException;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/gif/GifReader.class */
public class GifReader {
    private static final String GIF_87A_VERSION_IDENTIFIER = "87a";
    private static final String GIF_89A_VERSION_IDENTIFIER = "89a";

    public void extract(@NotNull SequentialReader reader, @NotNull Metadata metadata) {
        GifHeaderDirectory directory = new GifHeaderDirectory();
        metadata.addDirectory(directory);
        reader.setMotorolaByteOrder(false);
        try {
            String signature = reader.getString(3);
            if (!signature.equals("GIF")) {
                directory.addError("Invalid GIF file signature");
                return;
            }
            String version = reader.getString(3);
            if (!version.equals(GIF_87A_VERSION_IDENTIFIER) && !version.equals(GIF_89A_VERSION_IDENTIFIER)) {
                directory.addError("Unexpected GIF version");
                return;
            }
            directory.setString(1, version);
            directory.setInt(2, reader.getUInt16());
            directory.setInt(3, reader.getUInt16());
            short flags = reader.getUInt8();
            int colorTableSize = 1 << ((flags & 7) + 1);
            directory.setInt(4, colorTableSize);
            if (version.equals(GIF_89A_VERSION_IDENTIFIER)) {
                boolean isColorTableSorted = (flags & 8) != 0;
                directory.setBoolean(5, isColorTableSorted);
            }
            int bitsPerPixel = ((flags & 112) >> 4) + 1;
            directory.setInt(6, bitsPerPixel);
            boolean hasGlobalColorTable = (flags & 15) != 0;
            directory.setBoolean(7, hasGlobalColorTable);
            directory.setInt(8, reader.getUInt8());
            int aspectRatioByte = reader.getUInt8();
            if (aspectRatioByte != 0) {
                float pixelAspectRatio = (float) ((aspectRatioByte + 15.0d) / 64.0d);
                directory.setFloat(9, pixelAspectRatio);
            }
        } catch (IOException e) {
            directory.addError("Unable to read BMP header");
        }
    }
}

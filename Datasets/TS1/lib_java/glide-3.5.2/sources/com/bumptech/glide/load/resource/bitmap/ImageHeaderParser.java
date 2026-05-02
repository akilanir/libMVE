package com.bumptech.glide.load.resource.bitmap;

import android.util.Log;
import com.bumptech.glide.load.Key;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/ImageHeaderParser.class */
public class ImageHeaderParser {
    private static final String TAG = "ImageHeaderParser";
    private static final int GIF_HEADER = 4671814;
    private static final int PNG_HEADER = -1991225785;
    private static final int EXIF_MAGIC_NUMBER = 65496;
    private static final int MOTOROLA_TIFF_MAGIC_NUMBER = 19789;
    private static final int INTEL_TIFF_MAGIC_NUMBER = 18761;
    private static final String JPEG_EXIF_SEGMENT_PREAMBLE = "Exif����";
    private static final byte[] JPEG_EXIF_SEGMENT_PREAMBLE_BYTES;
    private static final int SEGMENT_SOS = 218;
    private static final int MARKER_EOI = 217;
    private static final int SEGMENT_START_ID = 255;
    private static final int EXIF_SEGMENT_TYPE = 225;
    private static final int ORIENTATION_TAG_TYPE = 274;
    private static final int[] BYTES_PER_FORMAT = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8};
    private final StreamReader streamReader;

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/ImageHeaderParser$ImageType.class */
    public enum ImageType {
        GIF(true),
        JPEG(false),
        PNG_A(true),
        PNG(false),
        UNKNOWN(false);

        private final boolean hasAlpha;

        ImageType(boolean hasAlpha) {
            this.hasAlpha = hasAlpha;
        }

        public boolean hasAlpha() {
            return this.hasAlpha;
        }
    }

    static {
        byte[] bytes = new byte[0];
        try {
            bytes = JPEG_EXIF_SEGMENT_PREAMBLE.getBytes(Key.STRING_CHARSET_NAME);
        } catch (UnsupportedEncodingException e) {
        }
        JPEG_EXIF_SEGMENT_PREAMBLE_BYTES = bytes;
    }

    public ImageHeaderParser(InputStream is) {
        this.streamReader = new StreamReader(is);
    }

    public boolean hasAlpha() throws IOException {
        return getType().hasAlpha();
    }

    public ImageType getType() throws IOException {
        int firstTwoBytes = this.streamReader.getUInt16();
        if (firstTwoBytes == EXIF_MAGIC_NUMBER) {
            return ImageType.JPEG;
        }
        int firstFourBytes = ((firstTwoBytes << 16) & (-65536)) | (this.streamReader.getUInt16() & 65535);
        if (firstFourBytes == PNG_HEADER) {
            this.streamReader.skip(21L);
            int alpha = this.streamReader.getByte();
            return alpha >= 3 ? ImageType.PNG_A : ImageType.PNG;
        }
        if ((firstFourBytes >> 8) == GIF_HEADER) {
            return ImageType.GIF;
        }
        return ImageType.UNKNOWN;
    }

    public int getOrientation() throws IOException {
        int magicNumber = this.streamReader.getUInt16();
        if (!handles(magicNumber)) {
            return -1;
        }
        byte[] exifData = getExifSegment();
        boolean hasJpegExifPreamble = exifData != null && exifData.length > JPEG_EXIF_SEGMENT_PREAMBLE_BYTES.length;
        if (hasJpegExifPreamble) {
            int i = 0;
            while (true) {
                if (i >= JPEG_EXIF_SEGMENT_PREAMBLE_BYTES.length) {
                    break;
                }
                if (exifData[i] == JPEG_EXIF_SEGMENT_PREAMBLE_BYTES[i]) {
                    i++;
                } else {
                    hasJpegExifPreamble = false;
                    break;
                }
            }
        }
        if (hasJpegExifPreamble) {
            return parseExifSegment(new RandomAccessReader(exifData));
        }
        return -1;
    }

    private byte[] getExifSegment() throws IOException {
        short segmentType;
        int segmentLength;
        do {
            short segmentId = this.streamReader.getUInt8();
            if (segmentId != SEGMENT_START_ID) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Unknown segmentId=" + ((int) segmentId));
                    return null;
                }
                return null;
            }
            segmentType = this.streamReader.getUInt8();
            if (segmentType == SEGMENT_SOS) {
                return null;
            }
            if (segmentType == MARKER_EOI) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Found MARKER_EOI in exif segment");
                    return null;
                }
                return null;
            }
            segmentLength = this.streamReader.getUInt16() - 2;
            if (segmentType == EXIF_SEGMENT_TYPE) {
                byte[] segmentData = new byte[segmentLength];
                if (segmentLength != this.streamReader.read(segmentData)) {
                    if (Log.isLoggable(TAG, 3)) {
                        Log.d(TAG, "Unable to read segment data for type=" + ((int) segmentType) + " length=" + segmentLength);
                        return null;
                    }
                    return null;
                }
                return segmentData;
            }
        } while (segmentLength == this.streamReader.skip(segmentLength));
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "Unable to skip enough data for type=" + ((int) segmentType));
            return null;
        }
        return null;
    }

    private static int parseExifSegment(RandomAccessReader segmentData) {
        ByteOrder byteOrder;
        int headerOffsetSize = JPEG_EXIF_SEGMENT_PREAMBLE.length();
        short byteOrderIdentifier = segmentData.getInt16(headerOffsetSize);
        if (byteOrderIdentifier == MOTOROLA_TIFF_MAGIC_NUMBER) {
            byteOrder = ByteOrder.BIG_ENDIAN;
        } else if (byteOrderIdentifier == INTEL_TIFF_MAGIC_NUMBER) {
            byteOrder = ByteOrder.LITTLE_ENDIAN;
        } else {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Unknown endianness = " + ((int) byteOrderIdentifier));
            }
            byteOrder = ByteOrder.BIG_ENDIAN;
        }
        segmentData.order(byteOrder);
        int firstIfdOffset = segmentData.getInt32(headerOffsetSize + 4) + headerOffsetSize;
        int tagCount = segmentData.getInt16(firstIfdOffset);
        for (int i = 0; i < tagCount; i++) {
            int tagOffset = calcTagOffset(firstIfdOffset, i);
            int tagType = segmentData.getInt16(tagOffset);
            if (tagType == ORIENTATION_TAG_TYPE) {
                int formatCode = segmentData.getInt16(tagOffset + 2);
                if (formatCode < 1 || formatCode > 12) {
                    if (Log.isLoggable(TAG, 3)) {
                        Log.d(TAG, "Got invalid format code = " + formatCode);
                    }
                } else {
                    int componentCount = segmentData.getInt32(tagOffset + 4);
                    if (componentCount < 0) {
                        if (Log.isLoggable(TAG, 3)) {
                            Log.d(TAG, "Negative tiff component count");
                        }
                    } else {
                        if (Log.isLoggable(TAG, 3)) {
                            Log.d(TAG, "Got tagIndex=" + i + " tagType=" + tagType + " formatCode =" + formatCode + " componentCount=" + componentCount);
                        }
                        int byteCount = componentCount + BYTES_PER_FORMAT[formatCode];
                        if (byteCount > 4) {
                            if (Log.isLoggable(TAG, 3)) {
                                Log.d(TAG, "Got byte count > 4, not orientation, continuing, formatCode=" + formatCode);
                            }
                        } else {
                            int tagValueOffset = tagOffset + 8;
                            if (tagValueOffset < 0 || tagValueOffset > segmentData.length()) {
                                if (Log.isLoggable(TAG, 3)) {
                                    Log.d(TAG, "Illegal tagValueOffset=" + tagValueOffset + " tagType=" + tagType);
                                }
                            } else if (byteCount < 0 || tagValueOffset + byteCount > segmentData.length()) {
                                if (Log.isLoggable(TAG, 3)) {
                                    Log.d(TAG, "Illegal number of bytes for TI tag data tagType=" + tagType);
                                }
                            } else {
                                return segmentData.getInt16(tagValueOffset);
                            }
                        }
                    }
                }
            }
        }
        return -1;
    }

    private static int calcTagOffset(int ifdOffset, int tagIndex) {
        return ifdOffset + 2 + (12 * tagIndex);
    }

    private static boolean handles(int imageMagicNumber) {
        return (imageMagicNumber & EXIF_MAGIC_NUMBER) == EXIF_MAGIC_NUMBER || imageMagicNumber == MOTOROLA_TIFF_MAGIC_NUMBER || imageMagicNumber == INTEL_TIFF_MAGIC_NUMBER;
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/ImageHeaderParser$RandomAccessReader.class */
    private static class RandomAccessReader {
        private final ByteBuffer data;

        public RandomAccessReader(byte[] data) {
            this.data = ByteBuffer.wrap(data);
            this.data.order(ByteOrder.BIG_ENDIAN);
        }

        public void order(ByteOrder byteOrder) {
            this.data.order(byteOrder);
        }

        public int length() {
            return this.data.array().length;
        }

        public int getInt32(int offset) {
            return this.data.getInt(offset);
        }

        public short getInt16(int offset) {
            return this.data.getShort(offset);
        }
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/ImageHeaderParser$StreamReader.class */
    private static class StreamReader {
        private final InputStream is;

        public StreamReader(InputStream is) {
            this.is = is;
        }

        public int getUInt16() throws IOException {
            return ((this.is.read() << 8) & 65280) | (this.is.read() & ImageHeaderParser.SEGMENT_START_ID);
        }

        public short getUInt8() throws IOException {
            return (short) (this.is.read() & ImageHeaderParser.SEGMENT_START_ID);
        }

        public long skip(long total) throws IOException {
            return this.is.skip(total);
        }

        public int read(byte[] buffer) throws IOException {
            return this.is.read(buffer);
        }

        public int getByte() throws IOException {
            return this.is.read();
        }
    }
}

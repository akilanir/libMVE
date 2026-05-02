package com.drew.metadata.xmp;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPIterator;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.properties.XMPPropertyInfo;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.Rational;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import java.util.Collections;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/xmp/XmpReader.class */
public class XmpReader implements JpegSegmentMetadataReader {
    private static final int FMT_STRING = 1;
    private static final int FMT_RATIONAL = 2;
    private static final int FMT_INT = 3;
    private static final int FMT_DOUBLE = 4;
    private static final int FMT_STRING_ARRAY = 5;

    @NotNull
    private static final String SCHEMA_XMP_PROPERTIES = "http://ns.adobe.com/xap/1.0/";

    @NotNull
    private static final String SCHEMA_EXIF_SPECIFIC_PROPERTIES = "http://ns.adobe.com/exif/1.0/";

    @NotNull
    private static final String SCHEMA_EXIF_ADDITIONAL_PROPERTIES = "http://ns.adobe.com/exif/1.0/aux/";

    @NotNull
    private static final String SCHEMA_EXIF_TIFF_PROPERTIES = "http://ns.adobe.com/tiff/1.0/";

    @NotNull
    public static final String XMP_JPEG_PREAMBLE = "http://ns.adobe.com/xap/1.0/��";

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    @NotNull
    public Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APP1);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public void readJpegSegments(@NotNull Iterable<byte[]> segments, @NotNull Metadata metadata, @NotNull JpegSegmentType segmentType) {
        for (byte[] segmentBytes : segments) {
            int preambleLength = XMP_JPEG_PREAMBLE.length();
            if (segmentBytes.length >= preambleLength && (XMP_JPEG_PREAMBLE.equalsIgnoreCase(new String(segmentBytes, 0, preambleLength)) || "XMP".equalsIgnoreCase(new String(segmentBytes, 0, 3)))) {
                byte[] xmlBytes = new byte[segmentBytes.length - preambleLength];
                System.arraycopy(segmentBytes, preambleLength, xmlBytes, 0, xmlBytes.length);
                extract(xmlBytes, metadata);
            }
        }
    }

    public void extract(@NotNull byte[] xmpBytes, @NotNull Metadata metadata) {
        extract(xmpBytes, metadata, (Directory) null);
    }

    public void extract(@NotNull byte[] xmpBytes, @NotNull Metadata metadata, @Nullable Directory parentDirectory) {
        XmpDirectory directory = new XmpDirectory();
        if (parentDirectory != null) {
            directory.setParent(parentDirectory);
        }
        try {
            XMPMeta xmpMeta = XMPMetaFactory.parseFromBuffer(xmpBytes);
            processXmpTags(directory, xmpMeta);
        } catch (XMPException e) {
            directory.addError("Error processing XMP data: " + e.getMessage());
        }
        if (!directory.isEmpty()) {
            metadata.addDirectory(directory);
        }
    }

    public void extract(@NotNull String xmpString, @NotNull Metadata metadata) {
        extract(xmpString, metadata, (Directory) null);
    }

    public void extract(@NotNull String xmpString, @NotNull Metadata metadata, @Nullable Directory parentDirectory) {
        XmpDirectory directory = new XmpDirectory();
        if (parentDirectory != null) {
            directory.setParent(parentDirectory);
        }
        try {
            XMPMeta xmpMeta = XMPMetaFactory.parseFromString(xmpString);
            processXmpTags(directory, xmpMeta);
        } catch (XMPException e) {
            directory.addError("Error processing XMP data: " + e.getMessage());
        }
        if (!directory.isEmpty()) {
            metadata.addDirectory(directory);
        }
    }

    private static void processXmpTags(XmpDirectory directory, XMPMeta xmpMeta) throws XMPException {
        directory.setXMPMeta(xmpMeta);
        processXmpTag(xmpMeta, directory, 6, 1);
        processXmpTag(xmpMeta, directory, 7, 1);
        processXmpTag(xmpMeta, directory, 8, 1);
        processXmpTag(xmpMeta, directory, 9, 1);
        processXmpTag(xmpMeta, directory, 1, 1);
        processXmpTag(xmpMeta, directory, 2, 1);
        processXmpTag(xmpMeta, directory, 3, 1);
        processXmpTag(xmpMeta, directory, 12, 3);
        processXmpTag(xmpMeta, directory, 11, 2);
        processXmpTag(xmpMeta, directory, 5, 2);
        processXmpTag(xmpMeta, directory, 10, 2);
        processXmpTag(xmpMeta, directory, 4, 2);
        processXmpTag(xmpMeta, directory, 13, 1);
        processXmpTag(xmpMeta, directory, 14, 1);
        processXmpTag(xmpMeta, directory, 513, 1);
        processXmpTag(xmpMeta, directory, 514, 1);
        processXmpTag(xmpMeta, directory, 515, 1);
        processXmpTag(xmpMeta, directory, 516, 1);
        processXmpTag(xmpMeta, directory, 517, 1);
        processXmpTag(xmpMeta, directory, 518, 1);
        processXmpTag(xmpMeta, directory, 519, 1);
        processXmpTag(xmpMeta, directory, 4097, 4);
        processXmpTag(xmpMeta, directory, 8192, 1);
        processXmpTag(xmpMeta, directory, XmpDirectory.TAG_SUBJECT, 5);
        XMPIterator iterator = xmpMeta.iterator();
        while (iterator.hasNext()) {
            XMPPropertyInfo propInfo = (XMPPropertyInfo) iterator.next();
            String path = propInfo.getPath();
            String value = propInfo.getValue();
            if (path != null && value != null) {
                directory.addProperty(path, value);
            }
        }
    }

    private static void processXmpTag(@NotNull XMPMeta meta, @NotNull XmpDirectory directory, int tagType, int formatCode) throws XMPException {
        String schemaNS = XmpDirectory._tagSchemaMap.get(Integer.valueOf(tagType));
        String propName = XmpDirectory._tagPropNameMap.get(Integer.valueOf(tagType));
        String property = meta.getPropertyString(schemaNS, propName);
        if (property == null) {
        }
        switch (formatCode) {
            case 1:
                directory.setString(tagType, property);
                break;
            case 2:
                String[] rationalParts = property.split("/", 2);
                if (rationalParts.length == 2) {
                    try {
                        Rational rational = new Rational((long) Float.parseFloat(rationalParts[0]), (long) Float.parseFloat(rationalParts[1]));
                        directory.setRational(tagType, rational);
                        break;
                    } catch (NumberFormatException e) {
                        directory.addError(String.format("Unable to parse XMP property %s as a Rational.", propName));
                        return;
                    }
                } else {
                    directory.addError("Error in rational format for tag " + tagType);
                    break;
                }
            case 3:
                try {
                    directory.setInt(tagType, Integer.valueOf(property).intValue());
                    break;
                } catch (NumberFormatException e2) {
                    directory.addError(String.format("Unable to parse XMP property %s as an int.", propName));
                    return;
                }
            case 4:
                try {
                    directory.setDouble(tagType, Double.valueOf(property).doubleValue());
                    break;
                } catch (NumberFormatException e3) {
                    directory.addError(String.format("Unable to parse XMP property %s as an double.", propName));
                    return;
                }
            case 5:
                int count = meta.countArrayItems(schemaNS, propName);
                String[] array = new String[count];
                for (int i = 1; i <= count; i++) {
                    array[i - 1] = meta.getArrayItem(schemaNS, propName, i).getValue();
                }
                directory.setStringArray(tagType, array);
                break;
            default:
                directory.addError(String.format("Unknown format code %d for tag %d", Integer.valueOf(formatCode), Integer.valueOf(tagType)));
                break;
        }
    }
}

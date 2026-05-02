package com.drew.imaging.jpeg;

import com.drew.lang.StreamReader;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Metadata;
import com.drew.metadata.adobe.AdobeJpegReader;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.file.FileMetadataReader;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.iptc.IptcReader;
import com.drew.metadata.jfif.JfifReader;
import com.drew.metadata.jfxx.JfxxReader;
import com.drew.metadata.jpeg.JpegCommentReader;
import com.drew.metadata.jpeg.JpegReader;
import com.drew.metadata.photoshop.DuckyReader;
import com.drew.metadata.photoshop.PhotoshopReader;
import com.drew.metadata.xmp.XmpReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/imaging/jpeg/JpegMetadataReader.class */
public class JpegMetadataReader {
    public static final Iterable<JpegSegmentMetadataReader> ALL_READERS = Arrays.asList(new JpegReader(), new JpegCommentReader(), new JfifReader(), new JfxxReader(), new ExifReader(), new XmpReader(), new IccReader(), new PhotoshopReader(), new DuckyReader(), new IptcReader(), new AdobeJpegReader());

    @NotNull
    public static Metadata readMetadata(@NotNull InputStream inputStream, @Nullable Iterable<JpegSegmentMetadataReader> readers) throws JpegProcessingException, IOException {
        Metadata metadata = new Metadata();
        process(metadata, inputStream, readers);
        return metadata;
    }

    @NotNull
    public static Metadata readMetadata(@NotNull InputStream inputStream) throws JpegProcessingException, IOException {
        return readMetadata(inputStream, (Iterable<JpegSegmentMetadataReader>) null);
    }

    @NotNull
    public static Metadata readMetadata(@NotNull File file, @Nullable Iterable<JpegSegmentMetadataReader> readers) throws JpegProcessingException, IOException {
        InputStream inputStream = new FileInputStream(file);
        try {
            Metadata metadata = readMetadata(inputStream, readers);
            inputStream.close();
            new FileMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            inputStream.close();
            throw th;
        }
    }

    @NotNull
    public static Metadata readMetadata(@NotNull File file) throws JpegProcessingException, IOException {
        return readMetadata(file, (Iterable<JpegSegmentMetadataReader>) null);
    }

    public static void process(@NotNull Metadata metadata, @NotNull InputStream inputStream) throws JpegProcessingException, IOException {
        process(metadata, inputStream, null);
    }

    public static void process(@NotNull Metadata metadata, @NotNull InputStream inputStream, @Nullable Iterable<JpegSegmentMetadataReader> readers) throws JpegProcessingException, IOException {
        if (readers == null) {
            readers = ALL_READERS;
        }
        Set<JpegSegmentType> segmentTypes = new HashSet<>();
        for (JpegSegmentMetadataReader reader : readers) {
            for (JpegSegmentType type : reader.getSegmentTypes()) {
                segmentTypes.add(type);
            }
        }
        JpegSegmentData segmentData = JpegSegmentReader.readSegments(new StreamReader(inputStream), segmentTypes);
        processJpegSegmentData(metadata, readers, segmentData);
    }

    public static void processJpegSegmentData(Metadata metadata, Iterable<JpegSegmentMetadataReader> readers, JpegSegmentData segmentData) {
        for (JpegSegmentMetadataReader reader : readers) {
            for (JpegSegmentType segmentType : reader.getSegmentTypes()) {
                reader.readJpegSegments(segmentData.getSegments(segmentType), metadata, segmentType);
            }
        }
    }

    private JpegMetadataReader() throws Exception {
        throw new Exception("Not intended for instantiation");
    }
}

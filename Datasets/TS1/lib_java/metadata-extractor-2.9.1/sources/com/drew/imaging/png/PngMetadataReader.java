package com.drew.imaging.png;

import com.drew.lang.ByteConvert;
import com.drew.lang.DateUtil;
import com.drew.lang.KeyValuePair;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.lang.StreamReader;
import com.drew.lang.StringUtil;
import com.drew.lang.annotations.NotNull;
import com.drew.metadata.Metadata;
import com.drew.metadata.file.FileMetadataReader;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.png.PngChromaticitiesDirectory;
import com.drew.metadata.png.PngDirectory;
import com.drew.metadata.xmp.XmpReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.InflaterInputStream;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/imaging/png/PngMetadataReader.class */
public class PngMetadataReader {
    private static Set<PngChunkType> _desiredChunkTypes;

    static {
        Set<PngChunkType> desiredChunkTypes = new HashSet<>();
        desiredChunkTypes.add(PngChunkType.IHDR);
        desiredChunkTypes.add(PngChunkType.PLTE);
        desiredChunkTypes.add(PngChunkType.tRNS);
        desiredChunkTypes.add(PngChunkType.cHRM);
        desiredChunkTypes.add(PngChunkType.sRGB);
        desiredChunkTypes.add(PngChunkType.gAMA);
        desiredChunkTypes.add(PngChunkType.iCCP);
        desiredChunkTypes.add(PngChunkType.bKGD);
        desiredChunkTypes.add(PngChunkType.tEXt);
        desiredChunkTypes.add(PngChunkType.iTXt);
        desiredChunkTypes.add(PngChunkType.tIME);
        desiredChunkTypes.add(PngChunkType.pHYs);
        desiredChunkTypes.add(PngChunkType.sBIT);
        _desiredChunkTypes = Collections.unmodifiableSet(desiredChunkTypes);
    }

    @NotNull
    public static Metadata readMetadata(@NotNull File file) throws PngProcessingException, IOException {
        InputStream inputStream = new FileInputStream(file);
        try {
            Metadata metadata = readMetadata(inputStream);
            inputStream.close();
            new FileMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            inputStream.close();
            throw th;
        }
    }

    @NotNull
    public static Metadata readMetadata(@NotNull InputStream inputStream) throws PngProcessingException, IOException {
        Iterable<PngChunk> chunks = new PngChunkReader().extract(new StreamReader(inputStream), _desiredChunkTypes);
        Metadata metadata = new Metadata();
        for (PngChunk chunk : chunks) {
            try {
                processChunk(metadata, chunk);
            } catch (Exception e) {
                e.printStackTrace(System.err);
            }
        }
        return metadata;
    }

    private static void processChunk(@NotNull Metadata metadata, @NotNull PngChunk chunk) throws PngProcessingException, IOException {
        PngChunkType chunkType = chunk.getType();
        byte[] bytes = chunk.getBytes();
        if (chunkType.equals(PngChunkType.IHDR)) {
            PngHeader header = new PngHeader(bytes);
            PngDirectory directory = new PngDirectory(PngChunkType.IHDR);
            directory.setInt(1, header.getImageWidth());
            directory.setInt(2, header.getImageHeight());
            directory.setInt(3, header.getBitsPerSample());
            directory.setInt(4, header.getColorType().getNumericValue());
            directory.setInt(5, header.getCompressionType());
            directory.setInt(6, header.getFilterMethod());
            directory.setInt(7, header.getInterlaceMethod());
            metadata.addDirectory(directory);
            return;
        }
        if (chunkType.equals(PngChunkType.PLTE)) {
            PngDirectory directory2 = new PngDirectory(PngChunkType.PLTE);
            directory2.setInt(8, bytes.length / 3);
            metadata.addDirectory(directory2);
            return;
        }
        if (chunkType.equals(PngChunkType.tRNS)) {
            PngDirectory directory3 = new PngDirectory(PngChunkType.tRNS);
            directory3.setInt(9, 1);
            metadata.addDirectory(directory3);
            return;
        }
        if (chunkType.equals(PngChunkType.sRGB)) {
            byte b = bytes[0];
            PngDirectory directory4 = new PngDirectory(PngChunkType.sRGB);
            directory4.setInt(10, b);
            metadata.addDirectory(directory4);
            return;
        }
        if (chunkType.equals(PngChunkType.cHRM)) {
            PngChromaticities chromaticities = new PngChromaticities(bytes);
            PngChromaticitiesDirectory directory5 = new PngChromaticitiesDirectory();
            directory5.setInt(1, chromaticities.getWhitePointX());
            directory5.setInt(2, chromaticities.getWhitePointY());
            directory5.setInt(3, chromaticities.getRedX());
            directory5.setInt(4, chromaticities.getRedY());
            directory5.setInt(5, chromaticities.getGreenX());
            directory5.setInt(6, chromaticities.getGreenY());
            directory5.setInt(7, chromaticities.getBlueX());
            directory5.setInt(8, chromaticities.getBlueY());
            metadata.addDirectory(directory5);
            return;
        }
        if (chunkType.equals(PngChunkType.gAMA)) {
            int gammaInt = ByteConvert.toInt32BigEndian(bytes);
            new SequentialByteArrayReader(bytes).getInt32();
            PngDirectory directory6 = new PngDirectory(PngChunkType.gAMA);
            directory6.setDouble(11, gammaInt / 100000.0d);
            metadata.addDirectory(directory6);
            return;
        }
        if (chunkType.equals(PngChunkType.iCCP)) {
            SequentialReader reader = new SequentialByteArrayReader(bytes);
            String profileName = reader.getNullTerminatedString(79);
            PngDirectory directory7 = new PngDirectory(PngChunkType.iCCP);
            directory7.setString(12, profileName);
            byte compressionMethod = reader.getInt8();
            if (compressionMethod == 0) {
                byte[] compressedProfile = reader.getBytes((bytes.length - profileName.length()) - 2);
                InflaterInputStream inflateStream = new InflaterInputStream(new ByteArrayInputStream(compressedProfile));
                new IccReader().extract(new RandomAccessStreamReader(inflateStream), metadata, directory7);
                inflateStream.close();
            } else {
                directory7.addError("Invalid compression method value");
            }
            metadata.addDirectory(directory7);
            return;
        }
        if (chunkType.equals(PngChunkType.bKGD)) {
            PngDirectory directory8 = new PngDirectory(PngChunkType.bKGD);
            directory8.setByteArray(15, bytes);
            metadata.addDirectory(directory8);
            return;
        }
        if (chunkType.equals(PngChunkType.tEXt)) {
            SequentialReader reader2 = new SequentialByteArrayReader(bytes);
            String keyword = reader2.getNullTerminatedString(79);
            String value = reader2.getNullTerminatedString((bytes.length - keyword.length()) - 1);
            List<KeyValuePair> textPairs = new ArrayList<>();
            textPairs.add(new KeyValuePair(keyword, value));
            PngDirectory directory9 = new PngDirectory(PngChunkType.iTXt);
            directory9.setObject(13, textPairs);
            metadata.addDirectory(directory9);
            return;
        }
        if (chunkType.equals(PngChunkType.iTXt)) {
            SequentialReader reader3 = new SequentialByteArrayReader(bytes);
            String keyword2 = reader3.getNullTerminatedString(79);
            byte compressionFlag = reader3.getInt8();
            byte compressionMethod2 = reader3.getInt8();
            String languageTag = reader3.getNullTerminatedString(bytes.length);
            String translatedKeyword = reader3.getNullTerminatedString(bytes.length);
            int bytesLeft = (((((((bytes.length - keyword2.length()) - 1) - 1) - 1) - languageTag.length()) - 1) - translatedKeyword.length()) - 1;
            String text = null;
            if (compressionFlag == 0) {
                text = reader3.getNullTerminatedString(bytesLeft);
            } else if (compressionFlag == 1) {
                if (compressionMethod2 == 0) {
                    text = StringUtil.fromStream(new InflaterInputStream(new ByteArrayInputStream(bytes, bytes.length - bytesLeft, bytesLeft)));
                } else {
                    PngDirectory directory10 = new PngDirectory(PngChunkType.iTXt);
                    directory10.addError("Invalid compression method value");
                    metadata.addDirectory(directory10);
                }
            } else {
                PngDirectory directory11 = new PngDirectory(PngChunkType.iTXt);
                directory11.addError("Invalid compression flag value");
                metadata.addDirectory(directory11);
            }
            if (text != null) {
                if (keyword2.equals("XML:com.adobe.xmp")) {
                    new XmpReader().extract(text, metadata);
                    return;
                }
                List<KeyValuePair> textPairs2 = new ArrayList<>();
                textPairs2.add(new KeyValuePair(keyword2, text));
                PngDirectory directory12 = new PngDirectory(PngChunkType.iTXt);
                directory12.setObject(13, textPairs2);
                metadata.addDirectory(directory12);
                return;
            }
            return;
        }
        if (chunkType.equals(PngChunkType.tIME)) {
            SequentialByteArrayReader reader4 = new SequentialByteArrayReader(bytes);
            int year = reader4.getUInt16();
            int month = reader4.getUInt8();
            int day = reader4.getUInt8();
            int hour = reader4.getUInt8();
            int minute = reader4.getUInt8();
            int second = reader4.getUInt8();
            PngDirectory directory13 = new PngDirectory(PngChunkType.tIME);
            if (DateUtil.isValidDate(year, month - 1, day) && DateUtil.isValidTime(hour, minute, second)) {
                String dateString = String.format("%04d:%02d:%02d %02d:%02d:%02d", Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day), Integer.valueOf(hour), Integer.valueOf(minute), Integer.valueOf(second));
                directory13.setString(14, dateString);
            } else {
                directory13.addError(String.format("PNG tIME data describes an invalid date/time: year=%d month=%d day=%d hour=%d minute=%d second=%d", Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day), Integer.valueOf(hour), Integer.valueOf(minute), Integer.valueOf(second)));
            }
            metadata.addDirectory(directory13);
            return;
        }
        if (!chunkType.equals(PngChunkType.pHYs)) {
            if (chunkType.equals(PngChunkType.sBIT)) {
                PngDirectory directory14 = new PngDirectory(PngChunkType.sBIT);
                directory14.setByteArray(19, bytes);
                metadata.addDirectory(directory14);
                return;
            }
            return;
        }
        SequentialByteArrayReader reader5 = new SequentialByteArrayReader(bytes);
        int pixelsPerUnitX = reader5.getInt32();
        int pixelsPerUnitY = reader5.getInt32();
        byte unitSpecifier = reader5.getInt8();
        PngDirectory directory15 = new PngDirectory(PngChunkType.pHYs);
        directory15.setInt(16, pixelsPerUnitX);
        directory15.setInt(17, pixelsPerUnitY);
        directory15.setInt(18, unitSpecifier);
        metadata.addDirectory(directory15);
    }
}

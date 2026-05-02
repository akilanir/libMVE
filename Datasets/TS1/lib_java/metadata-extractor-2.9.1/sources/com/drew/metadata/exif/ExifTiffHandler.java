package com.drew.metadata.exif;

import com.drew.imaging.tiff.TiffProcessingException;
import com.drew.imaging.tiff.TiffReader;
import com.drew.lang.RandomAccessReader;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.CasioType1MakernoteDirectory;
import com.drew.metadata.exif.makernotes.CasioType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import com.drew.metadata.exif.makernotes.KodakMakernoteDirectory;
import com.drew.metadata.exif.makernotes.KyoceraMakernoteDirectory;
import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;
import com.drew.metadata.exif.makernotes.NikonType1MakernoteDirectory;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusCameraSettingsMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusEquipmentMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PentaxMakernoteDirectory;
import com.drew.metadata.exif.makernotes.RicohMakernoteDirectory;
import com.drew.metadata.exif.makernotes.SanyoMakernoteDirectory;
import com.drew.metadata.exif.makernotes.SigmaMakernoteDirectory;
import com.drew.metadata.exif.makernotes.SonyType1MakernoteDirectory;
import com.drew.metadata.exif.makernotes.SonyType6MakernoteDirectory;
import com.drew.metadata.iptc.IptcReader;
import com.drew.metadata.tiff.DirectoryTiffHandler;
import com.drew.metadata.xmp.XmpReader;
import java.io.IOException;
import java.util.Set;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/ExifTiffHandler.class */
public class ExifTiffHandler extends DirectoryTiffHandler {
    private final boolean _storeThumbnailBytes;

    public ExifTiffHandler(@NotNull Metadata metadata, boolean storeThumbnailBytes, @Nullable Directory parentDirectory) {
        super(metadata, ExifIFD0Directory.class);
        this._storeThumbnailBytes = storeThumbnailBytes;
        if (parentDirectory != null) {
            this._currentDirectory.setParent(parentDirectory);
        }
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public void setTiffMarker(int marker) throws TiffProcessingException {
        if (marker != 42 && marker != 20306 && marker != 21330 && marker != 85) {
            throw new TiffProcessingException("Unexpected TIFF marker: 0x" + Integer.toHexString(marker));
        }
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public boolean tryEnterSubIfd(int tagId) {
        if (tagId == 330) {
            pushDirectory(ExifSubIFDDirectory.class);
            return true;
        }
        if (this._currentDirectory instanceof ExifIFD0Directory) {
            if (tagId == 34665) {
                pushDirectory(ExifSubIFDDirectory.class);
                return true;
            }
            if (tagId == 34853) {
                pushDirectory(GpsDirectory.class);
                return true;
            }
        }
        if ((this._currentDirectory instanceof ExifSubIFDDirectory) && tagId == 40965) {
            pushDirectory(ExifInteropDirectory.class);
            return true;
        }
        if (this._currentDirectory instanceof OlympusMakernoteDirectory) {
            if (tagId == 8208) {
                pushDirectory(OlympusEquipmentMakernoteDirectory.class);
                return true;
            }
            if (tagId == 8224) {
                pushDirectory(OlympusCameraSettingsMakernoteDirectory.class);
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public boolean hasFollowerIfd() {
        if (this._currentDirectory instanceof ExifIFD0Directory) {
            pushDirectory(ExifThumbnailDirectory.class);
            return true;
        }
        if (this._currentDirectory instanceof ExifThumbnailDirectory) {
            return true;
        }
        return false;
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    @Nullable
    public Long tryCustomProcessFormat(int tagId, int formatCode, long componentCount) {
        if (formatCode == 13) {
            return Long.valueOf(componentCount * 4);
        }
        return null;
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public boolean customProcessTag(int tagOffset, @NotNull Set<Integer> processedIfdOffsets, int tiffHeaderOffset, @NotNull RandomAccessReader reader, int tagId, int byteCount) throws IOException {
        if (tagId == 37500 && (this._currentDirectory instanceof ExifSubIFDDirectory)) {
            return processMakernote(tagOffset, processedIfdOffsets, tiffHeaderOffset, reader);
        }
        if (tagId == 33723 && (this._currentDirectory instanceof ExifIFD0Directory)) {
            if (reader.getInt8(tagOffset) == 28) {
                byte[] iptcBytes = reader.getBytes(tagOffset, byteCount);
                new IptcReader().extract(new SequentialByteArrayReader(iptcBytes), this._metadata, iptcBytes.length, this._currentDirectory);
                return true;
            }
            return false;
        }
        if (tagId == 700 && (this._currentDirectory instanceof ExifIFD0Directory)) {
            new XmpReader().extract(reader.getNullTerminatedString(tagOffset, byteCount), this._metadata, this._currentDirectory);
            return true;
        }
        return false;
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public void completed(@NotNull RandomAccessReader reader, int tiffHeaderOffset) {
        ExifThumbnailDirectory thumbnailDirectory;
        if (this._storeThumbnailBytes && (thumbnailDirectory = (ExifThumbnailDirectory) this._metadata.getFirstDirectoryOfType(ExifThumbnailDirectory.class)) != null && thumbnailDirectory.containsTag(259)) {
            Integer offset = thumbnailDirectory.getInteger(513);
            Integer length = thumbnailDirectory.getInteger(514);
            if (offset != null && length != null) {
                try {
                    byte[] thumbnailData = reader.getBytes(tiffHeaderOffset + offset.intValue(), length.intValue());
                    thumbnailDirectory.setThumbnailData(thumbnailData);
                } catch (IOException ex) {
                    thumbnailDirectory.addError("Invalid thumbnail data specification: " + ex.getMessage());
                }
            }
        }
    }

    private boolean processMakernote(int makernoteOffset, @NotNull Set<Integer> processedIfdOffsets, int tiffHeaderOffset, @NotNull RandomAccessReader reader) throws IOException {
        Directory ifd0Directory = this._metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);
        if (ifd0Directory == null) {
            return false;
        }
        String cameraMake = ifd0Directory.getString(ExifDirectoryBase.TAG_MAKE);
        String firstTwoChars = reader.getString(makernoteOffset, 2);
        String firstThreeChars = reader.getString(makernoteOffset, 3);
        String firstFourChars = reader.getString(makernoteOffset, 4);
        String firstFiveChars = reader.getString(makernoteOffset, 5);
        String firstSixChars = reader.getString(makernoteOffset, 6);
        String firstSevenChars = reader.getString(makernoteOffset, 7);
        String firstEightChars = reader.getString(makernoteOffset, 8);
        String firstTenChars = reader.getString(makernoteOffset, 10);
        String firstTwelveChars = reader.getString(makernoteOffset, 12);
        boolean byteOrderBefore = reader.isMotorolaByteOrder();
        if ("OLYMP��".equals(firstSixChars) || "EPSON".equals(firstFiveChars) || "AGFA".equals(firstFourChars)) {
            pushDirectory(OlympusMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 8, tiffHeaderOffset);
        } else if ("OLYMPUS��II".equals(firstTenChars)) {
            pushDirectory(OlympusMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 12, makernoteOffset);
        } else if (cameraMake != null && cameraMake.toUpperCase().startsWith("MINOLTA")) {
            pushDirectory(OlympusMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset, tiffHeaderOffset);
        } else if (cameraMake != null && cameraMake.trim().toUpperCase().startsWith("NIKON")) {
            if ("Nikon".equals(firstFiveChars)) {
                switch (reader.getUInt8(makernoteOffset + 6)) {
                    case 1:
                        pushDirectory(NikonType1MakernoteDirectory.class);
                        TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 8, tiffHeaderOffset);
                        break;
                    case 2:
                        pushDirectory(NikonType2MakernoteDirectory.class);
                        TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 18, makernoteOffset + 10);
                        break;
                    default:
                        ifd0Directory.addError("Unsupported Nikon makernote data ignored.");
                        break;
                }
            } else {
                pushDirectory(NikonType2MakernoteDirectory.class);
                TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset, tiffHeaderOffset);
            }
        } else if ("SONY CAM".equals(firstEightChars) || "SONY DSC".equals(firstEightChars)) {
            pushDirectory(SonyType1MakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 12, tiffHeaderOffset);
        } else if ("SEMC MS����������".equals(firstTwelveChars)) {
            reader.setMotorolaByteOrder(true);
            pushDirectory(SonyType6MakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 20, tiffHeaderOffset);
        } else if ("SIGMA������".equals(firstEightChars) || "FOVEON����".equals(firstEightChars)) {
            pushDirectory(SigmaMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 10, tiffHeaderOffset);
        } else if ("KDK".equals(firstThreeChars)) {
            reader.setMotorolaByteOrder(firstSevenChars.equals("KDK INFO"));
            KodakMakernoteDirectory directory = new KodakMakernoteDirectory();
            this._metadata.addDirectory(directory);
            processKodakMakernote(directory, makernoteOffset, reader);
        } else if ("Canon".equalsIgnoreCase(cameraMake)) {
            pushDirectory(CanonMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset, tiffHeaderOffset);
        } else if (cameraMake != null && cameraMake.toUpperCase().startsWith("CASIO")) {
            if ("QVC������".equals(firstSixChars)) {
                pushDirectory(CasioType2MakernoteDirectory.class);
                TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 6, tiffHeaderOffset);
            } else {
                pushDirectory(CasioType1MakernoteDirectory.class);
                TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset, tiffHeaderOffset);
            }
        } else if ("FUJIFILM".equals(firstEightChars) || "Fujifilm".equalsIgnoreCase(cameraMake)) {
            reader.setMotorolaByteOrder(false);
            int ifdStart = makernoteOffset + reader.getInt32(makernoteOffset + 8);
            pushDirectory(FujifilmMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, ifdStart, makernoteOffset);
        } else if ("KYOCERA".equals(firstSevenChars)) {
            pushDirectory(KyoceraMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 22, tiffHeaderOffset);
        } else if ("LEICA".equals(firstFiveChars)) {
            reader.setMotorolaByteOrder(false);
            if ("Leica Camera AG".equals(cameraMake)) {
                pushDirectory(LeicaMakernoteDirectory.class);
                TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 8, tiffHeaderOffset);
            } else if ("LEICA".equals(cameraMake)) {
                pushDirectory(PanasonicMakernoteDirectory.class);
                TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 8, tiffHeaderOffset);
            } else {
                return false;
            }
        } else if ("Panasonic������".equals(reader.getString(makernoteOffset, 12))) {
            pushDirectory(PanasonicMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 12, tiffHeaderOffset);
        } else if ("AOC��".equals(firstFourChars)) {
            pushDirectory(CasioType2MakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 6, makernoteOffset);
        } else if (cameraMake != null && (cameraMake.toUpperCase().startsWith("PENTAX") || cameraMake.toUpperCase().startsWith("ASAHI"))) {
            pushDirectory(PentaxMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset, makernoteOffset);
        } else if ("SANYO��\u0001��".equals(firstEightChars)) {
            pushDirectory(SanyoMakernoteDirectory.class);
            TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 8, makernoteOffset);
        } else {
            if (cameraMake == null || !cameraMake.toLowerCase().startsWith("ricoh") || firstTwoChars.equals("Rv") || firstThreeChars.equals("Rev")) {
                return false;
            }
            if (firstFiveChars.equalsIgnoreCase("Ricoh")) {
                reader.setMotorolaByteOrder(true);
                pushDirectory(RicohMakernoteDirectory.class);
                TiffReader.processIfd(this, reader, processedIfdOffsets, makernoteOffset + 8, makernoteOffset);
            }
        }
        reader.setMotorolaByteOrder(byteOrderBefore);
        return true;
    }

    private static void processKodakMakernote(@NotNull KodakMakernoteDirectory directory, int tagValueOffset, @NotNull RandomAccessReader reader) {
        int dataOffset = tagValueOffset + 8;
        try {
            directory.setString(0, reader.getString(dataOffset, 8));
            directory.setInt(9, reader.getUInt8(dataOffset + 9));
            directory.setInt(10, reader.getUInt8(dataOffset + 10));
            directory.setInt(12, reader.getUInt16(dataOffset + 12));
            directory.setInt(14, reader.getUInt16(dataOffset + 14));
            directory.setInt(16, reader.getUInt16(dataOffset + 16));
            directory.setByteArray(18, reader.getBytes(dataOffset + 18, 2));
            directory.setByteArray(20, reader.getBytes(dataOffset + 20, 4));
            directory.setInt(24, reader.getUInt16(dataOffset + 24));
            directory.setInt(27, reader.getUInt8(dataOffset + 27));
            directory.setInt(28, reader.getUInt8(dataOffset + 28));
            directory.setInt(29, reader.getUInt8(dataOffset + 29));
            directory.setInt(30, reader.getUInt16(dataOffset + 30));
            directory.setLong(32, reader.getUInt32(dataOffset + 32));
            directory.setInt(36, reader.getInt16(dataOffset + 36));
            directory.setInt(56, reader.getUInt8(dataOffset + 56));
            directory.setInt(64, reader.getUInt8(dataOffset + 64));
            directory.setInt(92, reader.getUInt8(dataOffset + 92));
            directory.setInt(93, reader.getUInt8(dataOffset + 93));
            directory.setInt(94, reader.getUInt16(dataOffset + 94));
            directory.setInt(96, reader.getUInt16(dataOffset + 96));
            directory.setInt(98, reader.getUInt16(dataOffset + 98));
            directory.setInt(100, reader.getUInt16(dataOffset + 100));
            directory.setInt(102, reader.getUInt16(dataOffset + 102));
            directory.setInt(KodakMakernoteDirectory.TAG_DIGITAL_ZOOM, reader.getUInt16(dataOffset + KodakMakernoteDirectory.TAG_DIGITAL_ZOOM));
            directory.setInt(107, reader.getInt8(dataOffset + 107));
        } catch (IOException ex) {
            directory.addError("Error processing Kodak makernote data: " + ex.getMessage());
        }
    }
}

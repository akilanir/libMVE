package com.koushikdutta.ion.loader;

import java.util.HashMap;
import java.util.Locale;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/loader/MediaFile.class */
public class MediaFile {
    public static final int FILE_TYPE_MP3 = 1;
    public static final int FILE_TYPE_M4A = 2;
    public static final int FILE_TYPE_WAV = 3;
    public static final int FILE_TYPE_AMR = 4;
    public static final int FILE_TYPE_AWB = 5;
    public static final int FILE_TYPE_WMA = 6;
    public static final int FILE_TYPE_OGG = 7;
    public static final int FILE_TYPE_AAC = 8;
    public static final int FILE_TYPE_MKA = 9;
    public static final int FILE_TYPE_FLAC = 10;
    public static final int FILE_TYPE_3GPA = 11;
    public static final int FILE_TYPE_AC3 = 12;
    public static final int FILE_TYPE_QCP = 13;
    public static final int FILE_TYPE_WEBMA = 14;
    public static final int FILE_TYPE_PCM = 15;
    public static final int FILE_TYPE_EC3 = 16;
    private static final int FIRST_AUDIO_FILE_TYPE = 1;
    private static final int LAST_AUDIO_FILE_TYPE = 16;
    public static final int FILE_TYPE_DTS = 300;
    private static final int FIRST_AUDIO_FILE_TYPE2 = 300;
    private static final int LAST_AUDIO_FILE_TYPE2 = 300;
    public static final int FILE_TYPE_MID = 17;
    public static final int FILE_TYPE_SMF = 18;
    public static final int FILE_TYPE_IMY = 19;
    private static final int FIRST_MIDI_FILE_TYPE = 17;
    private static final int LAST_MIDI_FILE_TYPE = 19;
    public static final int FILE_TYPE_MP4 = 21;
    public static final int FILE_TYPE_M4V = 22;
    public static final int FILE_TYPE_3GPP = 23;
    public static final int FILE_TYPE_3GPP2 = 24;
    public static final int FILE_TYPE_WMV = 25;
    public static final int FILE_TYPE_ASF = 26;
    public static final int FILE_TYPE_MKV = 27;
    public static final int FILE_TYPE_MP2TS = 28;
    public static final int FILE_TYPE_AVI = 29;
    public static final int FILE_TYPE_WEBM = 30;
    public static final int FILE_TYPE_DIVX = 31;
    private static final int FIRST_VIDEO_FILE_TYPE = 21;
    private static final int LAST_VIDEO_FILE_TYPE = 31;
    public static final int FILE_TYPE_MP2PS = 200;
    private static final int FIRST_VIDEO_FILE_TYPE2 = 200;
    private static final int LAST_VIDEO_FILE_TYPE2 = 200;
    public static final int FILE_TYPE_JPEG = 32;
    public static final int FILE_TYPE_GIF = 33;
    public static final int FILE_TYPE_PNG = 34;
    public static final int FILE_TYPE_BMP = 35;
    public static final int FILE_TYPE_WBMP = 36;
    public static final int FILE_TYPE_WEBP = 37;
    private static final int FIRST_IMAGE_FILE_TYPE = 32;
    private static final int LAST_IMAGE_FILE_TYPE = 37;
    public static final int FILE_TYPE_M3U = 41;
    public static final int FILE_TYPE_PLS = 42;
    public static final int FILE_TYPE_WPL = 43;
    public static final int FILE_TYPE_HTTPLIVE = 44;
    private static final int FIRST_PLAYLIST_FILE_TYPE = 41;
    private static final int LAST_PLAYLIST_FILE_TYPE = 44;
    public static final int FILE_TYPE_FL = 51;
    private static final int FIRST_DRM_FILE_TYPE = 51;
    private static final int LAST_DRM_FILE_TYPE = 51;
    public static final int FILE_TYPE_TEXT = 100;
    public static final int FILE_TYPE_HTML = 101;
    public static final int FILE_TYPE_PDF = 102;
    public static final int FILE_TYPE_XML = 103;
    public static final int FILE_TYPE_MS_WORD = 104;
    public static final int FILE_TYPE_MS_EXCEL = 105;
    public static final int FILE_TYPE_MS_POWERPOINT = 106;
    public static final int FILE_TYPE_ZIP = 107;
    private static final HashMap<String, MediaFileType> sFileTypeMap = new HashMap<>();
    private static final HashMap<String, Integer> sMimeTypeMap = new HashMap<>();
    private static final HashMap<String, Integer> sFileTypeToFormatMap = new HashMap<>();
    private static final HashMap<String, Integer> sMimeTypeToFormatMap = new HashMap<>();
    private static final HashMap<Integer, String> sFormatToMimeTypeMap = new HashMap<>();
    private static final HashMap<String, String> sMimeTypeToExtensionMap = new HashMap<>();

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/loader/MediaFile$MediaFileType.class */
    public static class MediaFileType {
        public final int fileType;
        public final String mimeType;

        MediaFileType(int fileType, String mimeType) {
            this.fileType = fileType;
            this.mimeType = mimeType;
        }
    }

    static {
        addFileType("MP3", 1, "audio/mpeg", MtpConstants.FORMAT_MP3);
        addFileType("MPGA", 1, "audio/mpeg", MtpConstants.FORMAT_MP3);
        addFileType("M4A", 2, "audio/mp4", MtpConstants.FORMAT_MPEG);
        addFileType("WAV", 3, "audio/x-wav", MtpConstants.FORMAT_WAV);
        addFileType("WAV", 15, "audio/wav");
        addFileType("AMR", 4, "audio/amr");
        addFileType("AWB", 5, "audio/amr-wb");
        addFileType("DIVX", 31, "video/divx");
        addFileType("QCP", 13, "audio/qcelp");
        addFileType("OGG", 7, "audio/ogg", MtpConstants.FORMAT_OGG);
        addFileType("OGG", 7, "application/ogg", MtpConstants.FORMAT_OGG);
        addFileType("OGA", 7, "audio/ogg", MtpConstants.FORMAT_OGG);
        addFileType("OGA", 7, "application/ogg", MtpConstants.FORMAT_OGG);
        addFileType("AAC", 8, "audio/aac", MtpConstants.FORMAT_AAC);
        addFileType("AAC", 8, "audio/aac-adts", MtpConstants.FORMAT_AAC);
        addFileType("MKA", 9, "audio/x-matroska");
        addFileType("MID", 17, "audio/midi");
        addFileType("MIDI", 17, "audio/midi");
        addFileType("XMF", 17, "audio/midi");
        addFileType("RTTTL", 17, "audio/midi");
        addFileType("SMF", 18, "audio/sp-midi");
        addFileType("IMY", 19, "audio/imelody");
        addFileType("RTX", 17, "audio/midi");
        addFileType("OTA", 17, "audio/midi");
        addFileType("MXMF", 17, "audio/midi");
        addFileType("MPEG", 21, "video/mpeg", MtpConstants.FORMAT_MPEG);
        addFileType("MPG", 21, "video/mpeg", MtpConstants.FORMAT_MPEG);
        addFileType("MP4", 21, "video/mp4", MtpConstants.FORMAT_MPEG);
        addFileType("MPEG4", 21, "video/mpeg4", MtpConstants.FORMAT_MPEG);
        addFileType("M4V", 22, "video/m4v", MtpConstants.FORMAT_MPEG);
        addFileType("3GP", 23, "video/3gpp", MtpConstants.FORMAT_3GP_CONTAINER);
        addFileType("3GPP", 23, "video/3gpp", MtpConstants.FORMAT_3GP_CONTAINER);
        addFileType("3G2", 24, "video/3gpp2", MtpConstants.FORMAT_3GP_CONTAINER);
        addFileType("3GPP2", 24, "video/3gpp2", MtpConstants.FORMAT_3GP_CONTAINER);
        addFileType("MKV", 27, "video/x-matroska");
        addFileType("WEBM", 30, "video/webm");
        addFileType("TS", 28, "video/mp2ts");
        addFileType("MPG", 28, "video/mp2ts");
        addFileType("AVI", 29, "video/avi");
        addFileType("JPG", 32, "image/jpeg", MtpConstants.FORMAT_EXIF_JPEG);
        addFileType("JPEG", 32, "image/jpeg", MtpConstants.FORMAT_EXIF_JPEG);
        addFileType("GIF", 33, "image/gif", MtpConstants.FORMAT_GIF);
        addFileType("PNG", 34, "image/png", MtpConstants.FORMAT_PNG);
        addFileType("BMP", 35, "image/x-ms-bmp", MtpConstants.FORMAT_BMP);
        addFileType("WBMP", 36, "image/vnd.wap.wbmp");
        addFileType("WEBP", 37, "image/webp");
        addFileType("M3U", 41, "audio/x-mpegurl", MtpConstants.FORMAT_M3U_PLAYLIST);
        addFileType("M3U", 41, "application/x-mpegurl", MtpConstants.FORMAT_M3U_PLAYLIST);
        addFileType("PLS", 42, "audio/x-scpls", MtpConstants.FORMAT_PLS_PLAYLIST);
        addFileType("WPL", 43, "application/vnd.ms-wpl", MtpConstants.FORMAT_WPL_PLAYLIST);
        addFileType("M3U8", 44, "application/vnd.apple.mpegurl");
        addFileType("M3U8", 44, "audio/mpegurl");
        addFileType("M3U8", 44, "audio/x-mpegurl");
        addFileType("FL", 51, "application/x-android-drm-fl");
        addFileType("TXT", 100, "text/plain", MtpConstants.FORMAT_TEXT);
        addFileType("HTM", FILE_TYPE_HTML, "text/html", MtpConstants.FORMAT_HTML);
        addFileType("HTML", FILE_TYPE_HTML, "text/html", MtpConstants.FORMAT_HTML);
        addFileType("PDF", FILE_TYPE_PDF, "application/pdf");
        addFileType("DOC", FILE_TYPE_MS_WORD, "application/msword", MtpConstants.FORMAT_MS_WORD_DOCUMENT);
        addFileType("XLS", FILE_TYPE_MS_EXCEL, "application/vnd.ms-excel", MtpConstants.FORMAT_MS_EXCEL_SPREADSHEET);
        addFileType("PPT", FILE_TYPE_MS_POWERPOINT, "application/mspowerpoint", MtpConstants.FORMAT_MS_POWERPOINT_PRESENTATION);
        addFileType("FLAC", 10, "audio/flac", MtpConstants.FORMAT_FLAC);
        addFileType("ZIP", FILE_TYPE_ZIP, "application/zip");
        addFileType("MPG", FILE_TYPE_MP2PS, "video/mp2p");
        addFileType("MPEG", FILE_TYPE_MP2PS, "video/mp2p");
    }

    static void addFileType(String extension, int fileType, String mimeType) {
        sFileTypeMap.put(extension, new MediaFileType(fileType, mimeType));
        sMimeTypeMap.put(mimeType, Integer.valueOf(fileType));
    }

    static void addFileType(String extension, int fileType, String mimeType, int mtpFormatCode) {
        addFileType(extension, fileType, mimeType);
        sFileTypeToFormatMap.put(extension, Integer.valueOf(mtpFormatCode));
        sMimeTypeToFormatMap.put(mimeType, Integer.valueOf(mtpFormatCode));
        sFormatToMimeTypeMap.put(Integer.valueOf(mtpFormatCode), mimeType);
        sMimeTypeToExtensionMap.put(mimeType, extension);
    }

    public static boolean isAudioFileType(int fileType) {
        return (fileType >= 1 && fileType <= 16) || (fileType >= 17 && fileType <= 19) || (fileType >= 300 && fileType <= 300);
    }

    public static boolean isVideoFileType(int fileType) {
        return (fileType >= 21 && fileType <= 31) || (fileType >= 200 && fileType <= 200);
    }

    public static boolean isImageFileType(int fileType) {
        return fileType >= 32 && fileType <= 37;
    }

    public static boolean isPlayListFileType(int fileType) {
        return fileType >= 41 && fileType <= 44;
    }

    public static boolean isDrmFileType(int fileType) {
        return fileType >= 51 && fileType <= 51;
    }

    public static MediaFileType getFileType(String path) {
        int lastDot = path.lastIndexOf(46);
        if (lastDot < 0) {
            return null;
        }
        return sFileTypeMap.get(path.substring(lastDot + 1).toUpperCase(Locale.ROOT));
    }

    public static boolean isMimeTypeMedia(String mimeType) {
        int fileType = getFileTypeForMimeType(mimeType);
        return isAudioFileType(fileType) || isVideoFileType(fileType) || isImageFileType(fileType) || isPlayListFileType(fileType);
    }

    public static String getExtensionForMimeType(String mimeType) {
        return sMimeTypeToExtensionMap.get(mimeType).toLowerCase();
    }

    public static String getFileTitle(String path) {
        int lastSlash;
        int lastSlash2 = path.lastIndexOf(47);
        if (lastSlash2 >= 0 && (lastSlash = lastSlash2 + 1) < path.length()) {
            path = path.substring(lastSlash);
        }
        int lastDot = path.lastIndexOf(46);
        if (lastDot > 0) {
            path = path.substring(0, lastDot);
        }
        return path;
    }

    public static int getFileTypeForMimeType(String mimeType) {
        Integer value = sMimeTypeMap.get(mimeType);
        if (value == null) {
            return 0;
        }
        return value.intValue();
    }

    public static String getMimeTypeForFile(String path) {
        MediaFileType mediaFileType = getFileType(path);
        if (mediaFileType == null) {
            return null;
        }
        return mediaFileType.mimeType;
    }

    public static int getFormatCode(String fileName, String mimeType) {
        Integer value;
        if (mimeType != null && (value = sMimeTypeToFormatMap.get(mimeType)) != null) {
            return value.intValue();
        }
        int lastDot = fileName.lastIndexOf(46);
        if (lastDot > 0) {
            String extension = fileName.substring(lastDot + 1).toUpperCase(Locale.ROOT);
            Integer value2 = sFileTypeToFormatMap.get(extension);
            if (value2 != null) {
                return value2.intValue();
            }
            return MtpConstants.FORMAT_UNDEFINED;
        }
        return MtpConstants.FORMAT_UNDEFINED;
    }

    public static String getMimeTypeForFormatCode(int formatCode) {
        return sFormatToMimeTypeMap.get(Integer.valueOf(formatCode));
    }
}

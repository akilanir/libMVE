package org.acra.collector;

import android.annotation.TargetApi;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/MediaCodecListCollector.class */
final class MediaCodecListCollector {
    private static final String COLOR_FORMAT_PREFIX = "COLOR_";
    private static final String[] MPEG4_TYPES = {"mp4", "mpeg4", "MP4", "MPEG4"};
    private static final String[] AVC_TYPES = {"avc", "h264", "AVC", "H264"};
    private static final String[] H263_TYPES = {"h263", "H263"};
    private static final String[] AAC_TYPES = {"aac", "AAC"};
    private static final SparseArray<String> mColorFormatValues = new SparseArray<>();
    private static final SparseArray<String> mAVCLevelValues = new SparseArray<>();
    private static final SparseArray<String> mAVCProfileValues = new SparseArray<>();
    private static final SparseArray<String> mH263LevelValues = new SparseArray<>();
    private static final SparseArray<String> mH263ProfileValues = new SparseArray<>();
    private static final SparseArray<String> mMPEG4LevelValues = new SparseArray<>();
    private static final SparseArray<String> mMPEG4ProfileValues = new SparseArray<>();
    private static final SparseArray<String> mAACProfileValues = new SparseArray<>();

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/MediaCodecListCollector$CodecType.class */
    private enum CodecType {
        AVC,
        H263,
        MPEG4,
        AAC
    }

    private MediaCodecListCollector() {
    }

    static {
        try {
            Class<?> codecCapabilitiesClass = Class.forName("android.media.MediaCodecInfo$CodecCapabilities");
            for (Field f : codecCapabilitiesClass.getFields()) {
                if (Modifier.isStatic(f.getModifiers()) && Modifier.isFinal(f.getModifiers()) && f.getName().startsWith(COLOR_FORMAT_PREFIX)) {
                    mColorFormatValues.put(f.getInt(null), f.getName());
                }
            }
            Class<?> codecProfileLevelClass = Class.forName("android.media.MediaCodecInfo$CodecProfileLevel");
            for (Field f2 : codecProfileLevelClass.getFields()) {
                if (Modifier.isStatic(f2.getModifiers()) && Modifier.isFinal(f2.getModifiers())) {
                    if (f2.getName().startsWith("AVCLevel")) {
                        mAVCLevelValues.put(f2.getInt(null), f2.getName());
                    } else if (f2.getName().startsWith("AVCProfile")) {
                        mAVCProfileValues.put(f2.getInt(null), f2.getName());
                    } else if (f2.getName().startsWith("H263Level")) {
                        mH263LevelValues.put(f2.getInt(null), f2.getName());
                    } else if (f2.getName().startsWith("H263Profile")) {
                        mH263ProfileValues.put(f2.getInt(null), f2.getName());
                    } else if (f2.getName().startsWith("MPEG4Level")) {
                        mMPEG4LevelValues.put(f2.getInt(null), f2.getName());
                    } else if (f2.getName().startsWith("MPEG4Profile")) {
                        mMPEG4ProfileValues.put(f2.getInt(null), f2.getName());
                    } else if (f2.getName().startsWith("AAC")) {
                        mAACProfileValues.put(f2.getInt(null), f2.getName());
                    }
                }
            }
        } catch (ClassNotFoundException e) {
        } catch (IllegalAccessException e2) {
        } catch (IllegalArgumentException e3) {
        } catch (SecurityException e4) {
        }
    }

    @NonNull
    public static String collectMediaCodecList() {
        MediaCodecInfo[] infos;
        if (Build.VERSION.SDK_INT < 16) {
            return "";
        }
        if (Build.VERSION.SDK_INT < 21) {
            int codecCount = MediaCodecList.getCodecCount();
            infos = new MediaCodecInfo[codecCount];
            for (int codecIdx = 0; codecIdx < codecCount; codecIdx++) {
                infos[codecIdx] = MediaCodecList.getCodecInfoAt(codecIdx);
            }
        } else {
            infos = new MediaCodecList(1).getCodecInfos();
        }
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < infos.length; i++) {
            MediaCodecInfo codecInfo = infos[i];
            result.append('\n').append(i).append(": ").append(codecInfo.getName()).append('\n').append("isEncoder: ").append(codecInfo.isEncoder()).append('\n');
            String[] supportedTypes = codecInfo.getSupportedTypes();
            result.append("Supported types: ").append(Arrays.toString(supportedTypes)).append('\n');
            for (String type : supportedTypes) {
                result.append(collectCapabilitiesForType(codecInfo, type));
            }
            result.append('\n');
        }
        return result.toString();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0170  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0177 A[SYNTHETIC] */
    @android.support.annotation.NonNull
    @android.annotation.TargetApi(16)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.lang.String collectCapabilitiesForType(@android.support.annotation.NonNull android.media.MediaCodecInfo r5, @android.support.annotation.NonNull java.lang.String r6) {
        /*
            Method dump skipped, instructions count: 398
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.acra.collector.MediaCodecListCollector.collectCapabilitiesForType(android.media.MediaCodecInfo, java.lang.String):java.lang.String");
    }

    @Nullable
    @TargetApi(16)
    private static CodecType identifyCodecType(@NonNull MediaCodecInfo codecInfo) {
        String name = codecInfo.getName();
        for (String token : AVC_TYPES) {
            if (name.contains(token)) {
                return CodecType.AVC;
            }
        }
        for (String token2 : H263_TYPES) {
            if (name.contains(token2)) {
                return CodecType.H263;
            }
        }
        for (String token3 : MPEG4_TYPES) {
            if (name.contains(token3)) {
                return CodecType.MPEG4;
            }
        }
        for (String token4 : AAC_TYPES) {
            if (name.contains(token4)) {
                return CodecType.AAC;
            }
        }
        return null;
    }
}

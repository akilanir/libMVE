package org.acra.collector;

import android.util.SparseArray;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import org.acra.ACRAConstants;

/* loaded from: acra-4.5.0.jar:org/acra/collector/MediaCodecListCollector.class */
public class MediaCodecListCollector {
    private static final String COLOR_FORMAT_PREFIX = "COLOR_";
    private static Class<?> mediaCodecListClass;
    private static Method getCodecInfoAtMethod;
    private static Class<?> mediaCodecInfoClass;
    private static Method getNameMethod;
    private static Method isEncoderMethod;
    private static Method getSupportedTypesMethod;
    private static Method getCapabilitiesForTypeMethod;
    private static Class<?> codecCapabilitiesClass;
    private static Field colorFormatsField;
    private static Field profileLevelsField;
    private static Field profileField;
    private static Field levelField;
    private static final String[] MPEG4_TYPES = {"mp4", "mpeg4", "MP4", "MPEG4"};
    private static final String[] AVC_TYPES = {"avc", "h264", "AVC", "H264"};
    private static final String[] H263_TYPES = {"h263", "H263"};
    private static final String[] AAC_TYPES = {"aac", "AAC"};
    private static SparseArray<String> mColorFormatValues = new SparseArray<>();
    private static SparseArray<String> mAVCLevelValues = new SparseArray<>();
    private static SparseArray<String> mAVCProfileValues = new SparseArray<>();
    private static SparseArray<String> mH263LevelValues = new SparseArray<>();
    private static SparseArray<String> mH263ProfileValues = new SparseArray<>();
    private static SparseArray<String> mMPEG4LevelValues = new SparseArray<>();
    private static SparseArray<String> mMPEG4ProfileValues = new SparseArray<>();
    private static SparseArray<String> mAACProfileValues = new SparseArray<>();

    /* loaded from: acra-4.5.0.jar:org/acra/collector/MediaCodecListCollector$CodecType.class */
    private enum CodecType {
        AVC,
        H263,
        MPEG4,
        AAC
    }

    static {
        mediaCodecListClass = null;
        getCodecInfoAtMethod = null;
        mediaCodecInfoClass = null;
        getNameMethod = null;
        isEncoderMethod = null;
        getSupportedTypesMethod = null;
        getCapabilitiesForTypeMethod = null;
        codecCapabilitiesClass = null;
        colorFormatsField = null;
        profileLevelsField = null;
        profileField = null;
        levelField = null;
        try {
            mediaCodecListClass = Class.forName("android.media.MediaCodecList");
            getCodecInfoAtMethod = mediaCodecListClass.getMethod("getCodecInfoAt", Integer.TYPE);
            mediaCodecInfoClass = Class.forName("android.media.MediaCodecInfo");
            getNameMethod = mediaCodecInfoClass.getMethod("getName", new Class[0]);
            isEncoderMethod = mediaCodecInfoClass.getMethod("isEncoder", new Class[0]);
            getSupportedTypesMethod = mediaCodecInfoClass.getMethod("getSupportedTypes", new Class[0]);
            getCapabilitiesForTypeMethod = mediaCodecInfoClass.getMethod("getCapabilitiesForType", String.class);
            codecCapabilitiesClass = Class.forName("android.media.MediaCodecInfo$CodecCapabilities");
            colorFormatsField = codecCapabilitiesClass.getField("colorFormats");
            profileLevelsField = codecCapabilitiesClass.getField("profileLevels");
            Field[] arr$ = codecCapabilitiesClass.getFields();
            for (Field f : arr$) {
                if (Modifier.isStatic(f.getModifiers()) && Modifier.isFinal(f.getModifiers()) && f.getName().startsWith(COLOR_FORMAT_PREFIX)) {
                    mColorFormatValues.put(f.getInt(null), f.getName());
                }
            }
            Class<?> codecProfileLevelClass = Class.forName("android.media.MediaCodecInfo$CodecProfileLevel");
            Field[] arr$2 = codecProfileLevelClass.getFields();
            for (Field f2 : arr$2) {
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
            profileField = codecProfileLevelClass.getField("profile");
            levelField = codecProfileLevelClass.getField("level");
        } catch (ClassNotFoundException e) {
        } catch (IllegalAccessException e2) {
        } catch (IllegalArgumentException e3) {
        } catch (NoSuchFieldException e4) {
        } catch (NoSuchMethodException e5) {
        } catch (SecurityException e6) {
        }
    }

    public static String collecMediaCodecList() {
        StringBuilder result = new StringBuilder();
        if (mediaCodecListClass != null && mediaCodecInfoClass != null) {
            try {
                int codecCount = ((Integer) mediaCodecListClass.getMethod("getCodecCount", new Class[0]).invoke(null, new Object[0])).intValue();
                for (int codecIdx = 0; codecIdx < codecCount; codecIdx++) {
                    result.append("\n");
                    Object codecInfo = getCodecInfoAtMethod.invoke(null, Integer.valueOf(codecIdx));
                    result.append(codecIdx).append(": ").append(getNameMethod.invoke(codecInfo, new Object[0])).append("\n");
                    result.append("isEncoder: ").append(isEncoderMethod.invoke(codecInfo, new Object[0])).append("\n");
                    String[] supportedTypes = (String[]) getSupportedTypesMethod.invoke(codecInfo, new Object[0]);
                    result.append("Supported types: ").append(Arrays.toString(supportedTypes)).append("\n");
                    for (String type : supportedTypes) {
                        result.append(collectCapabilitiesForType(codecInfo, type));
                    }
                    result.append("\n");
                }
            } catch (IllegalAccessException e) {
            } catch (NoSuchMethodException e2) {
            } catch (InvocationTargetException e3) {
            }
        }
        return result.toString();
    }

    private static String collectCapabilitiesForType(Object codecInfo, String type) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
        StringBuilder result = new StringBuilder();
        Object codecCapabilities = getCapabilitiesForTypeMethod.invoke(codecInfo, type);
        int[] colorFormats = (int[]) colorFormatsField.get(codecCapabilities);
        if (colorFormats.length > 0) {
            result.append(type).append(" color formats:");
            for (int i = 0; i < colorFormats.length; i++) {
                result.append(mColorFormatValues.get(colorFormats[i]));
                if (i < colorFormats.length - 1) {
                    result.append(',');
                }
            }
            result.append("\n");
        }
        Object[] codecProfileLevels = (Object[]) profileLevelsField.get(codecCapabilities);
        if (codecProfileLevels.length > 0) {
            result.append(type).append(" profile levels:");
            for (int i2 = 0; i2 < codecProfileLevels.length; i2++) {
                CodecType codecType = identifyCodecType(codecInfo);
                int profileValue = profileField.getInt(codecProfileLevels[i2]);
                int levelValue = levelField.getInt(codecProfileLevels[i2]);
                if (codecType == null) {
                    result.append(profileValue).append('-').append(levelValue);
                }
                switch (AnonymousClass1.$SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType[codecType.ordinal()]) {
                    case 1:
                        result.append(profileValue).append(mAVCProfileValues.get(profileValue)).append('-').append(mAVCLevelValues.get(levelValue));
                        break;
                    case 2:
                        result.append(mH263ProfileValues.get(profileValue)).append('-').append(mH263LevelValues.get(levelValue));
                        break;
                    case ACRAConstants.DEFAULT_MAX_NUMBER_OF_REQUEST_RETRIES /* 3 */:
                        result.append(mMPEG4ProfileValues.get(profileValue)).append('-').append(mMPEG4LevelValues.get(levelValue));
                        break;
                    case 4:
                        result.append(mAACProfileValues.get(profileValue));
                        break;
                }
                if (i2 < codecProfileLevels.length - 1) {
                    result.append(',');
                }
            }
            result.append("\n");
        }
        return result.append("\n").toString();
    }

    /* renamed from: org.acra.collector.MediaCodecListCollector$1, reason: invalid class name */
    /* loaded from: acra-4.5.0.jar:org/acra/collector/MediaCodecListCollector$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType = new int[CodecType.values().length];

        static {
            try {
                $SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType[CodecType.AVC.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType[CodecType.H263.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType[CodecType.MPEG4.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$acra$collector$MediaCodecListCollector$CodecType[CodecType.AAC.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    private static CodecType identifyCodecType(Object codecInfo) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
        String name = (String) getNameMethod.invoke(codecInfo, new Object[0]);
        String[] arr$ = AVC_TYPES;
        for (String token : arr$) {
            if (name.contains(token)) {
                return CodecType.AVC;
            }
        }
        String[] arr$2 = H263_TYPES;
        for (String token2 : arr$2) {
            if (name.contains(token2)) {
                return CodecType.H263;
            }
        }
        String[] arr$3 = MPEG4_TYPES;
        for (String token3 : arr$3) {
            if (name.contains(token3)) {
                return CodecType.MPEG4;
            }
        }
        String[] arr$4 = AAC_TYPES;
        for (String token4 : arr$4) {
            if (name.contains(token4)) {
                return CodecType.AAC;
            }
        }
        return null;
    }
}

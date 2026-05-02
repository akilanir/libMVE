package com.drew.metadata.exif.makernotes;

import com.drew.lang.ByteArrayReader;
import com.drew.lang.RandomAccessReader;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Age;
import com.drew.metadata.Face;
import com.drew.metadata.TagDescriptor;
import com.drew.metadata.exif.ExifDirectoryBase;
import java.io.IOException;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/makernotes/PanasonicMakernoteDescriptor.class */
public class PanasonicMakernoteDescriptor extends TagDescriptor<PanasonicMakernoteDirectory> {
    private static final String[] _sceneModes = {"Normal", "Portrait", "Scenery", "Sports", "Night Portrait", "Program", "Aperture Priority", "Shutter Priority", "Macro", "Spot", "Manual", "Movie Preview", "Panning", "Simple", "Color Effects", "Self Portrait", "Economy", "Fireworks", "Party", "Snow", "Night Scenery", "Food", "Baby", "Soft Skin", "Candlelight", "Starry Night", "High Sensitivity", "Panorama Assist", "Underwater", "Beach", "Aerial Photo", "Sunset", "Pet", "Intelligent ISO", "Clipboard", "High Speed Continuous Shooting", "Intelligent Auto", null, "Multi-aspect", null, "Transform", "Flash Burst", "Pin Hole", "Film Grain", "My Color", "Photo Frame", null, null, null, null, "HDR"};

    public PanasonicMakernoteDescriptor(@NotNull PanasonicMakernoteDirectory directory) {
        super(directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    @Nullable
    public String getDescription(int tagType) {
        switch (tagType) {
            case 1:
                return getQualityModeDescription();
            case 2:
                return getVersionDescription();
            case 3:
                return getWhiteBalanceDescription();
            case 7:
                return getFocusModeDescription();
            case 15:
                return getAfAreaModeDescription();
            case 26:
                return getImageStabilizationDescription();
            case 28:
                return getMacroModeDescription();
            case 31:
                return getRecordModeDescription();
            case 32:
                return getAudioDescription();
            case 33:
                return getUnknownDataDumpDescription();
            case 37:
                return getInternalSerialNumberDescription();
            case 38:
                return getExifVersionDescription();
            case 40:
                return getColorEffectDescription();
            case 41:
                return getUptimeDescription();
            case 42:
                return getBurstModeDescription();
            case 44:
                return getContrastModeDescription();
            case 45:
                return getNoiseReductionDescription();
            case 46:
                return getSelfTimerDescription();
            case 48:
                return getRotationDescription();
            case 49:
                return getAfAssistLampDescription();
            case PanasonicMakernoteDirectory.TAG_COLOR_MODE /* 50 */:
                return getColorModeDescription();
            case PanasonicMakernoteDirectory.TAG_BABY_AGE /* 51 */:
                return getBabyAgeDescription();
            case 52:
                return getOpticalZoomModeDescription();
            case PanasonicMakernoteDirectory.TAG_CONVERSION_LENS /* 53 */:
                return getConversionLensDescription();
            case PanasonicMakernoteDirectory.TAG_CONTRAST /* 57 */:
                return getContrastDescription();
            case PanasonicMakernoteDirectory.TAG_WORLD_TIME_LOCATION /* 58 */:
                return getWorldTimeLocationDescription();
            case PanasonicMakernoteDirectory.TAG_TEXT_STAMP /* 59 */:
                return getTextStampDescription();
            case PanasonicMakernoteDirectory.TAG_ADVANCED_SCENE_MODE /* 61 */:
                return getAdvancedSceneModeDescription();
            case PanasonicMakernoteDirectory.TAG_TEXT_STAMP_1 /* 62 */:
                return getTextStamp1Description();
            case PanasonicMakernoteDirectory.TAG_FACE_DETECTION_INFO /* 78 */:
                return getDetectedFacesDescription();
            case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                return getTransformDescription();
            case 93:
                return getIntelligentExposureDescription();
            case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                return getRecognizedFacesDescription();
            case 98:
                return getFlashWarningDescription();
            case PanasonicMakernoteDirectory.TAG_TITLE /* 101 */:
                return getTitleDescription();
            case 102:
                return getBabyNameDescription();
            case PanasonicMakernoteDirectory.TAG_LOCATION /* 103 */:
                return getLocationDescription();
            case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                return getCountryDescription();
            case 107:
                return getStateDescription();
            case PanasonicMakernoteDirectory.TAG_CITY /* 109 */:
                return getCityDescription();
            case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                return getLandmarkDescription();
            case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                return getIntelligentResolutionDescription();
            case 3584:
                return getPrintImageMatchingInfoDescription();
            case 32768:
                return getMakernoteVersionDescription();
            case PanasonicMakernoteDirectory.TAG_SCENE_MODE /* 32769 */:
                return getSceneModeDescription();
            case PanasonicMakernoteDirectory.TAG_FLASH_FIRED /* 32775 */:
                return getFlashFiredDescription();
            case PanasonicMakernoteDirectory.TAG_TEXT_STAMP_2 /* 32776 */:
                return getTextStamp2Description();
            case PanasonicMakernoteDirectory.TAG_TEXT_STAMP_3 /* 32777 */:
                return getTextStamp3Description();
            case PanasonicMakernoteDirectory.TAG_BABY_AGE_1 /* 32784 */:
                return getBabyAge1Description();
            case PanasonicMakernoteDirectory.TAG_TRANSFORM_1 /* 32786 */:
                return getTransform1Description();
            default:
                return super.getDescription(tagType);
        }
    }

    @Nullable
    public String getPrintImageMatchingInfoDescription() {
        return getByteLengthDescription(3584);
    }

    @Nullable
    public String getTextStampDescription() {
        return getIndexedDescription(59, 1, "Off", "On");
    }

    @Nullable
    public String getTextStamp1Description() {
        return getIndexedDescription(62, 1, "Off", "On");
    }

    @Nullable
    public String getTextStamp2Description() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_TEXT_STAMP_2, 1, "Off", "On");
    }

    @Nullable
    public String getTextStamp3Description() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_TEXT_STAMP_3, 1, "Off", "On");
    }

    @Nullable
    public String getMacroModeDescription() {
        return getIndexedDescription(28, 1, "Off", "On");
    }

    @Nullable
    public String getFlashFiredDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_FLASH_FIRED, 1, "Off", "On");
    }

    @Nullable
    public String getImageStabilizationDescription() {
        return getIndexedDescription(26, 2, "On, Mode 1", "Off", "On, Mode 2");
    }

    @Nullable
    public String getAudioDescription() {
        return getIndexedDescription(32, 1, "Off", "On");
    }

    @Nullable
    public String getTransformDescription() {
        return getTransformDescription(89);
    }

    @Nullable
    public String getTransform1Description() {
        return getTransformDescription(PanasonicMakernoteDirectory.TAG_TRANSFORM_1);
    }

    @Nullable
    private String getTransformDescription(int tag) {
        byte[] values = ((PanasonicMakernoteDirectory) this._directory).getByteArray(tag);
        if (values == null) {
            return null;
        }
        RandomAccessReader reader = new ByteArrayReader(values);
        try {
            int val1 = reader.getUInt16(0);
            int val2 = reader.getUInt16(2);
            if (val1 == -1 && val2 == 1) {
                return "Slim Low";
            }
            if (val1 == -3 && val2 == 2) {
                return "Slim High";
            }
            if (val1 == 0 && val2 == 0) {
                return "Off";
            }
            if (val1 == 1 && val2 == 1) {
                return "Stretch Low";
            }
            if (val1 == 3 && val2 == 2) {
                return "Stretch High";
            }
            return "Unknown (" + val1 + " " + val2 + ")";
        } catch (IOException e) {
            return null;
        }
    }

    @Nullable
    public String getIntelligentExposureDescription() {
        return getIndexedDescription(93, "Off", "Low", "Standard", "High");
    }

    @Nullable
    public String getFlashWarningDescription() {
        return getIndexedDescription(98, "No", "Yes (Flash required but disabled)");
    }

    @Nullable
    public String getCountryDescription() {
        return getAsciiStringFromBytes(PanasonicMakernoteDirectory.TAG_COUNTRY);
    }

    @Nullable
    public String getStateDescription() {
        return getAsciiStringFromBytes(107);
    }

    @Nullable
    public String getCityDescription() {
        return getAsciiStringFromBytes(PanasonicMakernoteDirectory.TAG_CITY);
    }

    @Nullable
    public String getLandmarkDescription() {
        return getAsciiStringFromBytes(PanasonicMakernoteDirectory.TAG_LANDMARK);
    }

    @Nullable
    public String getTitleDescription() {
        return getAsciiStringFromBytes(PanasonicMakernoteDirectory.TAG_TITLE);
    }

    @Nullable
    public String getBabyNameDescription() {
        return getAsciiStringFromBytes(102);
    }

    @Nullable
    public String getLocationDescription() {
        return getAsciiStringFromBytes(PanasonicMakernoteDirectory.TAG_LOCATION);
    }

    @Nullable
    public String getIntelligentResolutionDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, "Off", null, "Auto", "On");
    }

    @Nullable
    public String getContrastDescription() {
        return getIndexedDescription(57, "Normal");
    }

    @Nullable
    public String getWorldTimeLocationDescription() {
        return getIndexedDescription(58, 1, "Home", "Destination");
    }

    @Nullable
    public String getAdvancedSceneModeDescription() {
        return getIndexedDescription(61, 1, "Normal", "Outdoor/Illuminations/Flower/HDR Art", "Indoor/Architecture/Objects/HDR B&W", "Creative", "Auto", null, "Expressive", "Retro", "Pure", "Elegant", null, "Monochrome", "Dynamic Art", "Silhouette");
    }

    @Nullable
    public String getUnknownDataDumpDescription() {
        return getByteLengthDescription(33);
    }

    @Nullable
    public String getColorEffectDescription() {
        return getIndexedDescription(40, 1, "Off", "Warm", "Cool", "Black & White", "Sepia");
    }

    @Nullable
    public String getUptimeDescription() {
        Integer value = ((PanasonicMakernoteDirectory) this._directory).getInteger(41);
        if (value == null) {
            return null;
        }
        return (value.intValue() / 100.0f) + " s";
    }

    @Nullable
    public String getBurstModeDescription() {
        return getIndexedDescription(42, "Off", null, "On", "Indefinite", "Unlimited");
    }

    @Nullable
    public String getContrastModeDescription() {
        Integer value = ((PanasonicMakernoteDirectory) this._directory).getInteger(44);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                return "Normal";
            case 1:
                return "Low";
            case 2:
                return "High";
            case 6:
                return "Medium Low";
            case 7:
                return "Medium High";
            case 256:
                return "Low";
            case ExifDirectoryBase.TAG_MODEL /* 272 */:
                return "Normal";
            case 288:
                return "High";
            default:
                return "Unknown (" + value + ")";
        }
    }

    @Nullable
    public String getNoiseReductionDescription() {
        return getIndexedDescription(45, "Standard (0)", "Low (-1)", "High (+1)", "Lowest (-2)", "Highest (+2)");
    }

    @Nullable
    public String getSelfTimerDescription() {
        return getIndexedDescription(46, 1, "Off", "10 s", "2 s");
    }

    @Nullable
    public String getRotationDescription() {
        Integer value = ((PanasonicMakernoteDirectory) this._directory).getInteger(48);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 1:
                return "Horizontal";
            case 2:
            case 4:
            case 5:
            case 7:
            default:
                return "Unknown (" + value + ")";
            case 3:
                return "Rotate 180";
            case 6:
                return "Rotate 90 CW";
            case 8:
                return "Rotate 270 CW";
        }
    }

    @Nullable
    public String getAfAssistLampDescription() {
        return getIndexedDescription(49, 1, "Fired", "Enabled but not used", "Disabled but required", "Disabled and not required");
    }

    @Nullable
    public String getColorModeDescription() {
        return getIndexedDescription(50, "Normal", "Natural", "Vivid");
    }

    @Nullable
    public String getOpticalZoomModeDescription() {
        return getIndexedDescription(52, 1, "Standard", "Extended");
    }

    @Nullable
    public String getConversionLensDescription() {
        return getIndexedDescription(53, 1, "Off", "Wide", "Telephoto", "Macro");
    }

    @Nullable
    public String getDetectedFacesDescription() {
        return buildFacesDescription(((PanasonicMakernoteDirectory) this._directory).getDetectedFaces());
    }

    @Nullable
    public String getRecognizedFacesDescription() {
        return buildFacesDescription(((PanasonicMakernoteDirectory) this._directory).getRecognizedFaces());
    }

    @Nullable
    private String buildFacesDescription(@Nullable Face[] faces) {
        if (faces == null) {
            return null;
        }
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < faces.length; i++) {
            result.append("Face ").append(i + 1).append(": ").append(faces[i].toString()).append("\n");
        }
        if (result.length() > 0) {
            return result.substring(0, result.length() - 1);
        }
        return null;
    }

    @Nullable
    public String getRecordModeDescription() {
        return getIndexedDescription(31, 1, _sceneModes);
    }

    @Nullable
    public String getSceneModeDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_SCENE_MODE, 1, _sceneModes);
    }

    @Nullable
    public String getFocusModeDescription() {
        return getIndexedDescription(7, 1, "Auto", "Manual", null, "Auto, Focus Button", "Auto, Continuous");
    }

    @Nullable
    public String getAfAreaModeDescription() {
        int[] value = ((PanasonicMakernoteDirectory) this._directory).getIntArray(15);
        if (value == null || value.length < 2) {
            return null;
        }
        switch (value[0]) {
            case 0:
                switch (value[1]) {
                    case 1:
                        return "Spot Mode On";
                    case 16:
                        return "Spot Mode Off";
                    default:
                        return "Unknown (" + value[0] + " " + value[1] + ")";
                }
            case 1:
                switch (value[1]) {
                    case 0:
                        return "Spot Focusing";
                    case 1:
                        return "5-area";
                    default:
                        return "Unknown (" + value[0] + " " + value[1] + ")";
                }
            case 16:
                switch (value[1]) {
                    case 0:
                        return "1-area";
                    case 16:
                        return "1-area (high speed)";
                    default:
                        return "Unknown (" + value[0] + " " + value[1] + ")";
                }
            case 32:
                switch (value[1]) {
                    case 0:
                        return "Auto or Face Detect";
                    case 1:
                        return "3-area (left)";
                    case 2:
                        return "3-area (center)";
                    case 3:
                        return "3-area (right)";
                    default:
                        return "Unknown (" + value[0] + " " + value[1] + ")";
                }
            case 64:
                return "Face Detect";
            default:
                return "Unknown (" + value[0] + " " + value[1] + ")";
        }
    }

    @Nullable
    public String getQualityModeDescription() {
        return getIndexedDescription(1, 2, "High", "Normal", null, null, "Very High", "Raw", null, "Motion Picture");
    }

    @Nullable
    public String getVersionDescription() {
        return getVersionBytesDescription(2, 2);
    }

    @Nullable
    public String getMakernoteVersionDescription() {
        return getVersionBytesDescription(32768, 2);
    }

    @Nullable
    public String getExifVersionDescription() {
        return getVersionBytesDescription(38, 2);
    }

    @Nullable
    public String getInternalSerialNumberDescription() {
        return get7BitStringFromBytes(37);
    }

    @Nullable
    public String getWhiteBalanceDescription() {
        return getIndexedDescription(3, 1, "Auto", "Daylight", "Cloudy", "Incandescent", "Manual", null, null, "Flash", null, "Black & White", "Manual", "Shade");
    }

    @Nullable
    public String getBabyAgeDescription() {
        Age age = ((PanasonicMakernoteDirectory) this._directory).getAge(51);
        if (age == null) {
            return null;
        }
        return age.toFriendlyString();
    }

    @Nullable
    public String getBabyAge1Description() {
        Age age = ((PanasonicMakernoteDirectory) this._directory).getAge(PanasonicMakernoteDirectory.TAG_BABY_AGE_1);
        if (age == null) {
            return null;
        }
        return age.toFriendlyString();
    }
}

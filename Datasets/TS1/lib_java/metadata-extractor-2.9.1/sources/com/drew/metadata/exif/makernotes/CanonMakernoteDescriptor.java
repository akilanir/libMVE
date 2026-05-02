package com.drew.metadata.exif.makernotes;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.TagDescriptor;
import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import java.text.DecimalFormat;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/makernotes/CanonMakernoteDescriptor.class */
public class CanonMakernoteDescriptor extends TagDescriptor<CanonMakernoteDirectory> {
    public CanonMakernoteDescriptor(@NotNull CanonMakernoteDirectory directory) {
        super(directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    @Nullable
    public String getDescription(int tagType) {
        switch (tagType) {
            case 12:
                return getSerialNumberDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_MACRO_MODE /* 49409 */:
                return getMacroModeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_SELF_TIMER_DELAY /* 49410 */:
                return getSelfTimerDelayDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_QUALITY /* 49411 */:
                return getQualityDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FLASH_MODE /* 49412 */:
                return getFlashModeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_CONTINUOUS_DRIVE_MODE /* 49413 */:
                return getContinuousDriveModeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_1 /* 49415 */:
                return getFocusMode1Description();
            case CanonMakernoteDirectory.CameraSettings.TAG_IMAGE_SIZE /* 49418 */:
                return getImageSizeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_EASY_SHOOTING_MODE /* 49419 */:
                return getEasyShootingModeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_DIGITAL_ZOOM /* 49420 */:
                return getDigitalZoomDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_CONTRAST /* 49421 */:
                return getContrastDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_SATURATION /* 49422 */:
                return getSaturationDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_SHARPNESS /* 49423 */:
                return getSharpnessDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_ISO /* 49424 */:
                return getIsoDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_METERING_MODE /* 49425 */:
                return getMeteringModeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_TYPE /* 49426 */:
                return getFocusTypeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_AF_POINT_SELECTED /* 49427 */:
                return getAfPointSelectedDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_EXPOSURE_MODE /* 49428 */:
                return getExposureModeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_LENS_TYPE /* 49430 */:
                return getLensTypeDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_LONG_FOCAL_LENGTH /* 49431 */:
                return getLongFocalLengthDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_SHORT_FOCAL_LENGTH /* 49432 */:
                return getShortFocalLengthDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FOCAL_UNITS_PER_MM /* 49433 */:
                return getFocalUnitsPerMillimetreDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FLASH_ACTIVITY /* 49436 */:
                return getFlashActivityDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FLASH_DETAILS /* 49437 */:
                return getFlashDetailsDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_2 /* 49440 */:
                return getFocusMode2Description();
            case CanonMakernoteDirectory.FocalLength.TAG_WHITE_BALANCE /* 49671 */:
                return getWhiteBalanceDescription();
            case CanonMakernoteDirectory.FocalLength.TAG_AF_POINT_USED /* 49678 */:
                return getAfPointUsedDescription();
            case CanonMakernoteDirectory.FocalLength.TAG_FLASH_BIAS /* 49679 */:
                return getFlashBiasDescription();
            default:
                return super.getDescription(tagType);
        }
    }

    @Nullable
    public String getSerialNumberDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(12);
        if (value == null) {
            return null;
        }
        return String.format("%04X%05d", Integer.valueOf((value.intValue() >> 8) & 255), Integer.valueOf(value.intValue() & 255));
    }

    @Nullable
    public String getFlashBiasDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.FocalLength.TAG_FLASH_BIAS);
        if (value == null) {
            return null;
        }
        boolean isNegative = false;
        if (value.intValue() > 61440) {
            isNegative = true;
            value = Integer.valueOf(Integer.valueOf(65535 - value.intValue()).intValue() + 1);
        }
        return (isNegative ? "-" : "") + Float.toString(value.intValue() / 32.0f) + " EV";
    }

    @Nullable
    public String getAfPointUsedDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.FocalLength.TAG_AF_POINT_USED);
        if (value == null) {
            return null;
        }
        if ((value.intValue() & 7) == 0) {
            return "Right";
        }
        if ((value.intValue() & 7) == 1) {
            return "Centre";
        }
        if ((value.intValue() & 7) == 2) {
            return "Left";
        }
        return "Unknown (" + value + ")";
    }

    @Nullable
    public String getWhiteBalanceDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.FocalLength.TAG_WHITE_BALANCE, "Auto", "Sunny", "Cloudy", "Tungsten", "Florescent", "Flash", "Custom");
    }

    @Nullable
    public String getFocusMode2Description() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_2, "Single", "Continuous");
    }

    @Nullable
    public String getFlashDetailsDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FLASH_DETAILS);
        if (value == null) {
            return null;
        }
        if (((value.intValue() >> 14) & 1) > 0) {
            return "External E-TTL";
        }
        if (((value.intValue() >> 13) & 1) > 0) {
            return "Internal flash";
        }
        if (((value.intValue() >> 11) & 1) > 0) {
            return "FP sync used";
        }
        if (((value.intValue() >> 4) & 1) > 0) {
            return "FP sync enabled";
        }
        return "Unknown (" + value + ")";
    }

    @Nullable
    public String getFocalUnitsPerMillimetreDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FOCAL_UNITS_PER_MM);
        if (value == null) {
            return null;
        }
        if (value.intValue() != 0) {
            return Integer.toString(value.intValue());
        }
        return "";
    }

    @Nullable
    public String getShortFocalLengthDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SHORT_FOCAL_LENGTH);
        if (value == null) {
            return null;
        }
        String units = getFocalUnitsPerMillimetreDescription();
        return Integer.toString(value.intValue()) + " " + units;
    }

    @Nullable
    public String getLongFocalLengthDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_LONG_FOCAL_LENGTH);
        if (value == null) {
            return null;
        }
        String units = getFocalUnitsPerMillimetreDescription();
        return Integer.toString(value.intValue()) + " " + units;
    }

    @Nullable
    public String getExposureModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_EXPOSURE_MODE, "Easy shooting", "Program", "Tv-priority", "Av-priority", "Manual", "A-DEP");
    }

    @Nullable
    public String getLensTypeDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_LENS_TYPE);
        if (value == null) {
            return null;
        }
        return "Lens type: " + Integer.toString(value.intValue());
    }

    @Nullable
    public String getAfPointSelectedDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_AF_POINT_SELECTED, 12288, "None (MF)", "Auto selected", "Right", "Centre", "Left");
    }

    @Nullable
    public String getMeteringModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_METERING_MODE, 3, "Evaluative", "Partial", "Centre weighted");
    }

    @Nullable
    public String getIsoDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_ISO);
        if (value == null) {
            return null;
        }
        if ((value.intValue() & 16384) > 0) {
            return "" + (value.intValue() & (16384 ^ (-1)));
        }
        switch (value.intValue()) {
            case 0:
                return "Not specified (see ISOSpeedRatings tag)";
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            default:
                return "Unknown (" + value + ")";
            case 15:
                return "Auto";
            case 16:
                return "50";
            case 17:
                return "100";
            case 18:
                return "200";
            case 19:
                return "400";
        }
    }

    @Nullable
    public String getSharpnessDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SHARPNESS);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                return "Normal";
            case 1:
                return "High";
            case 65535:
                return "Low";
            default:
                return "Unknown (" + value + ")";
        }
    }

    @Nullable
    public String getSaturationDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SATURATION);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                return "Normal";
            case 1:
                return "High";
            case 65535:
                return "Low";
            default:
                return "Unknown (" + value + ")";
        }
    }

    @Nullable
    public String getContrastDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_CONTRAST);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                return "Normal";
            case 1:
                return "High";
            case 65535:
                return "Low";
            default:
                return "Unknown (" + value + ")";
        }
    }

    @Nullable
    public String getEasyShootingModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_EASY_SHOOTING_MODE, "Full auto", "Manual", "Landscape", "Fast shutter", "Slow shutter", "Night", "B&W", "Sepia", "Portrait", "Sports", "Macro / Closeup", "Pan focus");
    }

    @Nullable
    public String getImageSizeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_IMAGE_SIZE, "Large", "Medium", "Small");
    }

    @Nullable
    public String getFocusMode1Description() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_1, "One-shot", "AI Servo", "AI Focus", "Manual Focus", "Single", "Continuous", "Manual Focus");
    }

    @Nullable
    public String getContinuousDriveModeDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_CONTINUOUS_DRIVE_MODE);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                Integer delay = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SELF_TIMER_DELAY);
                if (delay != null) {
                    return delay.intValue() == 0 ? "Single shot" : "Single shot with self-timer";
                }
                return "Continuous";
            case 1:
                return "Continuous";
            default:
                return "Unknown (" + value + ")";
        }
    }

    @Nullable
    public String getFlashModeDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FLASH_MODE);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                return "No flash fired";
            case 1:
                return "Auto";
            case 2:
                return "On";
            case 3:
                return "Red-eye reduction";
            case 4:
                return "Slow-synchro";
            case 5:
                return "Auto and red-eye reduction";
            case 6:
                return "On and red-eye reduction";
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            default:
                return "Unknown (" + value + ")";
            case 16:
                return "External flash";
        }
    }

    @Nullable
    public String getSelfTimerDelayDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SELF_TIMER_DELAY);
        if (value == null) {
            return null;
        }
        if (value.intValue() == 0) {
            return "Self timer not used";
        }
        DecimalFormat format = new DecimalFormat("0.##");
        return format.format(value.intValue() * 0.1d) + " sec";
    }

    @Nullable
    public String getMacroModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_MACRO_MODE, 1, "Macro", "Normal");
    }

    @Nullable
    public String getQualityDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_QUALITY, 2, "Normal", "Fine", null, "Superfine");
    }

    @Nullable
    public String getDigitalZoomDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_DIGITAL_ZOOM, "No digital zoom", "2x", "4x");
    }

    @Nullable
    public String getFocusTypeDescription() {
        Integer value = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_TYPE);
        if (value == null) {
            return null;
        }
        switch (value.intValue()) {
            case 0:
                return "Manual";
            case 1:
                return "Auto";
            case 2:
            case 4:
            case 5:
            case 6:
            case 7:
            default:
                return "Unknown (" + value + ")";
            case 3:
                return "Close-up (Macro)";
            case 8:
                return "Locked (Pan Mode)";
        }
    }

    @Nullable
    public String getFlashActivityDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FLASH_ACTIVITY, "Flash did not fire", "Flash fired");
    }
}

package com.drew.metadata.exif.makernotes;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.TagDescriptor;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/makernotes/LeicaMakernoteDescriptor.class */
public class LeicaMakernoteDescriptor extends TagDescriptor<LeicaMakernoteDirectory> {
    public LeicaMakernoteDescriptor(@NotNull LeicaMakernoteDirectory directory) {
        super(directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    @Nullable
    public String getDescription(int tagType) {
        switch (tagType) {
            case 768:
                return getQualityDescription();
            case 769:
            case 771:
            case OlympusCameraSettingsMakernoteDirectory.TagAfPointSelected /* 773 */:
            case OlympusCameraSettingsMakernoteDirectory.TagAfFineTune /* 774 */:
            case OlympusCameraSettingsMakernoteDirectory.TagAfFineTuneAdj /* 775 */:
            case 776:
            case 777:
            case 778:
            case 779:
            case 780:
            case 781:
            case 782:
            case 783:
            case LeicaMakernoteDirectory.TAG_LENS_TYPE /* 784 */:
            case 788:
            case 789:
            case 790:
            case 791:
            case 792:
            case 793:
            case 794:
            case 795:
            case 796:
            case 797:
            case 798:
            case 799:
            case LeicaMakernoteDirectory.TAG_COLOR_TEMPERATURE /* 801 */:
            default:
                return super.getDescription(tagType);
            case 770:
                return getUserProfileDescription();
            case 772:
                return getWhiteBalanceDescription();
            case LeicaMakernoteDirectory.TAG_EXTERNAL_SENSOR_BRIGHTNESS_VALUE /* 785 */:
                return getExternalSensorBrightnessValueDescription();
            case LeicaMakernoteDirectory.TAG_MEASURED_LV /* 786 */:
                return getMeasuredLvDescription();
            case LeicaMakernoteDirectory.TAG_APPROXIMATE_F_NUMBER /* 787 */:
                return getApproximateFNumberDescription();
            case LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE /* 800 */:
                return getCameraTemperatureDescription();
            case LeicaMakernoteDirectory.TAG_WB_RED_LEVEL /* 802 */:
            case LeicaMakernoteDirectory.TAG_WB_GREEN_LEVEL /* 803 */:
            case LeicaMakernoteDirectory.TAG_WB_BLUE_LEVEL /* 804 */:
                return getSimpleRational(tagType);
        }
    }

    @Nullable
    private String getCameraTemperatureDescription() {
        return getFormattedInt(LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE, "%d C");
    }

    @Nullable
    private String getApproximateFNumberDescription() {
        return getSimpleRational(LeicaMakernoteDirectory.TAG_APPROXIMATE_F_NUMBER);
    }

    @Nullable
    private String getMeasuredLvDescription() {
        return getSimpleRational(LeicaMakernoteDirectory.TAG_MEASURED_LV);
    }

    @Nullable
    private String getExternalSensorBrightnessValueDescription() {
        return getSimpleRational(LeicaMakernoteDirectory.TAG_EXTERNAL_SENSOR_BRIGHTNESS_VALUE);
    }

    @Nullable
    private String getWhiteBalanceDescription() {
        return getIndexedDescription(772, "Auto or Manual", "Daylight", "Fluorescent", "Tungsten", "Flash", "Cloudy", "Shadow");
    }

    @Nullable
    private String getUserProfileDescription() {
        return getIndexedDescription(768, 1, "User Profile 1", "User Profile 2", "User Profile 3", "User Profile 0 (Dynamic)");
    }

    @Nullable
    private String getQualityDescription() {
        return getIndexedDescription(768, 1, "Fine", "Basic");
    }
}

package com.drew.metadata.exif.makernotes;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.TagDescriptor;
import com.drew.metadata.icc.IccDirectory;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/exif/makernotes/SigmaMakernoteDescriptor.class */
public class SigmaMakernoteDescriptor extends TagDescriptor<SigmaMakernoteDirectory> {
    public SigmaMakernoteDescriptor(@NotNull SigmaMakernoteDirectory directory) {
        super(directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public String getDescription(int tagType) {
        switch (tagType) {
            case 8:
                return getExposureModeDescription();
            case 9:
                return getMeteringModeDescription();
            default:
                return super.getDescription(tagType);
        }
    }

    @Nullable
    private String getMeteringModeDescription() {
        String value = ((SigmaMakernoteDirectory) this._directory).getString(9);
        if (value == null || value.length() == 0) {
            return null;
        }
        switch (value.charAt(0)) {
            case '8':
                return "Multi Segment";
            case PanasonicMakernoteDirectory.TAG_SHARPNESS /* 65 */:
                return "Average";
            case 'C':
                return "Center Weighted Average";
            default:
                return value;
        }
    }

    @Nullable
    private String getExposureModeDescription() {
        String value = ((SigmaMakernoteDirectory) this._directory).getString(8);
        if (value == null || value.length() == 0) {
            return null;
        }
        switch (value.charAt(0)) {
            case PanasonicMakernoteDirectory.TAG_SHARPNESS /* 65 */:
                return "Aperture Priority AE";
            case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                return "Manual";
            case IccDirectory.TAG_PROFILE_CREATOR /* 80 */:
                return "Program AE";
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                return "Shutter Speed Priority AE";
            default:
                return value;
        }
    }
}

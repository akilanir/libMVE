package com.drew.metadata.xmp;

import com.drew.imaging.PhotographicConversions;
import com.drew.lang.Rational;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.TagDescriptor;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/xmp/XmpDescriptor.class */
public class XmpDescriptor extends TagDescriptor<XmpDirectory> {
    public XmpDescriptor(@NotNull XmpDirectory directory) {
        super(directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public String getDescription(int tagType) {
        switch (tagType) {
            case 1:
            case 2:
                return ((XmpDirectory) this._directory).getString(tagType);
            case 3:
                return getExposureTimeDescription();
            case 4:
                return getShutterSpeedDescription();
            case 5:
                return getFNumberDescription();
            case 6:
            case 7:
            case 8:
            case 9:
                return ((XmpDirectory) this._directory).getString(tagType);
            case 10:
                return getFocalLengthDescription();
            case 11:
                return getApertureValueDescription();
            case 12:
                return getExposureProgramDescription();
            default:
                return super.getDescription(tagType);
        }
    }

    @Nullable
    public String getExposureTimeDescription() {
        String value = ((XmpDirectory) this._directory).getString(3);
        if (value == null) {
            return null;
        }
        return value + " sec";
    }

    @Nullable
    public String getExposureProgramDescription() {
        return getIndexedDescription(12, 1, "Manual control", "Program normal", "Aperture priority", "Shutter priority", "Program creative (slow program)", "Program action (high-speed program)", "Portrait mode", "Landscape mode");
    }

    @Nullable
    public String getShutterSpeedDescription() {
        Float value = ((XmpDirectory) this._directory).getFloatObject(4);
        if (value == null) {
            return null;
        }
        if (value.floatValue() <= 1.0f) {
            float apexPower = (float) (1.0d / Math.exp(value.floatValue() * Math.log(2.0d)));
            long apexPower10 = Math.round(apexPower * 10.0d);
            float fApexPower = apexPower10 / 10.0f;
            return fApexPower + " sec";
        }
        int apexPower2 = (int) Math.exp(value.floatValue() * Math.log(2.0d));
        return "1/" + apexPower2 + " sec";
    }

    @Nullable
    public String getFNumberDescription() {
        Rational value = ((XmpDirectory) this._directory).getRational(5);
        if (value == null) {
            return null;
        }
        return getFStopDescription(value.doubleValue());
    }

    @Nullable
    public String getFocalLengthDescription() {
        Rational value = ((XmpDirectory) this._directory).getRational(10);
        if (value == null) {
            return null;
        }
        return getFocalLengthDescription(value.doubleValue());
    }

    @Nullable
    public String getApertureValueDescription() {
        Double value = ((XmpDirectory) this._directory).getDoubleObject(11);
        if (value == null) {
            return null;
        }
        double fStop = PhotographicConversions.apertureToFStop(value.doubleValue());
        return getFStopDescription(fStop);
    }
}

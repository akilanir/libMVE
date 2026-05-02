package org.piwik.sdk.plugins;

import org.piwik.sdk.TrackMe;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/plugins/CustomDimensions.class */
public class CustomDimensions extends TrackMe {
    protected static final String LOGGER_TAG = "PIWIK:CustomDimensions";

    public synchronized CustomDimensions set(int dimensionId, String dimensionValue) {
        if (dimensionId < 1) {
            Logy.w(LOGGER_TAG, "dimensionId should be great than 0");
            return this;
        }
        if (dimensionValue != null && dimensionValue.length() > 255) {
            Logy.w(LOGGER_TAG, "dimensionValue will be truncated to 255 chars");
            dimensionValue = dimensionValue.substring(0, 255);
        }
        set("dimension" + dimensionId, dimensionValue);
        return this;
    }
}

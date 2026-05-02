package com.journeyapps.barcodescanner.camera;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/camera/CameraSettings.class */
public class CameraSettings {
    private int requestedCameraId = -1;
    private boolean scanInverted = false;
    private boolean barcodeSceneModeEnabled = false;
    private boolean meteringEnabled = false;
    private boolean autoFocusEnabled = true;
    private boolean continuousFocusEnabled = false;
    private boolean exposureEnabled = false;
    private boolean autoTorchEnabled = false;

    public int getRequestedCameraId() {
        return this.requestedCameraId;
    }

    public void setRequestedCameraId(int requestedCameraId) {
        this.requestedCameraId = requestedCameraId;
    }

    public boolean isScanInverted() {
        return this.scanInverted;
    }

    public void setScanInverted(boolean scanInverted) {
        this.scanInverted = scanInverted;
    }

    public boolean isBarcodeSceneModeEnabled() {
        return this.barcodeSceneModeEnabled;
    }

    public void setBarcodeSceneModeEnabled(boolean barcodeSceneModeEnabled) {
        this.barcodeSceneModeEnabled = barcodeSceneModeEnabled;
    }

    public boolean isExposureEnabled() {
        return this.exposureEnabled;
    }

    public void setExposureEnabled(boolean exposureEnabled) {
        this.exposureEnabled = exposureEnabled;
    }

    public boolean isMeteringEnabled() {
        return this.meteringEnabled;
    }

    public void setMeteringEnabled(boolean meteringEnabled) {
        this.meteringEnabled = meteringEnabled;
    }

    public boolean isAutoFocusEnabled() {
        return this.autoFocusEnabled;
    }

    public void setAutoFocusEnabled(boolean autoFocusEnabled) {
        this.autoFocusEnabled = autoFocusEnabled;
    }

    public boolean isContinuousFocusEnabled() {
        return this.continuousFocusEnabled;
    }

    public void setContinuousFocusEnabled(boolean continuousFocusEnabled) {
        this.continuousFocusEnabled = continuousFocusEnabled;
    }

    public boolean isAutoTorchEnabled() {
        return this.autoTorchEnabled;
    }

    public void setAutoTorchEnabled(boolean autoTorchEnabled) {
        this.autoTorchEnabled = autoTorchEnabled;
    }
}

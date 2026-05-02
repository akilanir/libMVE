.class public Lcom/journeyapps/barcodescanner/camera/CameraSettings;
.super Ljava/lang/Object;
.source "CameraSettings.java"


# instance fields
.field private autoFocusEnabled:Z

.field private autoTorchEnabled:Z

.field private barcodeSceneModeEnabled:Z

.field private continuousFocusEnabled:Z

.field private exposureEnabled:Z

.field private meteringEnabled:Z

.field private requestedCameraId:I

.field private scanInverted:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, -0x1

    iput v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->requestedCameraId:I

    .line 10
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->scanInverted:Z

    .line 11
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->barcodeSceneModeEnabled:Z

    .line 12
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->meteringEnabled:Z

    .line 13
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->autoFocusEnabled:Z

    .line 14
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->continuousFocusEnabled:Z

    .line 15
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->exposureEnabled:Z

    .line 16
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->autoTorchEnabled:Z

    return-void
.end method


# virtual methods
.method public getRequestedCameraId()I
    .registers 2

    .prologue
    .line 20
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->requestedCameraId:I

    return v0
.end method

.method public isAutoFocusEnabled()Z
    .registers 2

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->autoFocusEnabled:Z

    return v0
.end method

.method public isAutoTorchEnabled()Z
    .registers 2

    .prologue
    .line 122
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->autoTorchEnabled:Z

    return v0
.end method

.method public isBarcodeSceneModeEnabled()Z
    .registers 2

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->barcodeSceneModeEnabled:Z

    return v0
.end method

.method public isContinuousFocusEnabled()Z
    .registers 2

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->continuousFocusEnabled:Z

    return v0
.end method

.method public isExposureEnabled()Z
    .registers 2

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->exposureEnabled:Z

    return v0
.end method

.method public isMeteringEnabled()Z
    .registers 2

    .prologue
    .line 83
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->meteringEnabled:Z

    return v0
.end method

.method public isScanInverted()Z
    .registers 2

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->scanInverted:Z

    return v0
.end method

.method public setAutoFocusEnabled(Z)V
    .registers 2
    .param p1, "autoFocusEnabled"    # Z

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->autoFocusEnabled:Z

    .line 101
    return-void
.end method

.method public setAutoTorchEnabled(Z)V
    .registers 2
    .param p1, "autoTorchEnabled"    # Z

    .prologue
    .line 126
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->autoTorchEnabled:Z

    .line 127
    return-void
.end method

.method public setBarcodeSceneModeEnabled(Z)V
    .registers 2
    .param p1, "barcodeSceneModeEnabled"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->barcodeSceneModeEnabled:Z

    .line 60
    return-void
.end method

.method public setContinuousFocusEnabled(Z)V
    .registers 2
    .param p1, "continuousFocusEnabled"    # Z

    .prologue
    .line 113
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->continuousFocusEnabled:Z

    .line 114
    return-void
.end method

.method public setExposureEnabled(Z)V
    .registers 2
    .param p1, "exposureEnabled"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->exposureEnabled:Z

    .line 73
    return-void
.end method

.method public setMeteringEnabled(Z)V
    .registers 2
    .param p1, "meteringEnabled"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->meteringEnabled:Z

    .line 88
    return-void
.end method

.method public setRequestedCameraId(I)V
    .registers 2
    .param p1, "requestedCameraId"    # I

    .prologue
    .line 31
    iput p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->requestedCameraId:I

    .line 32
    return-void
.end method

.method public setScanInverted(Z)V
    .registers 2
    .param p1, "scanInverted"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->scanInverted:Z

    .line 47
    return-void
.end method

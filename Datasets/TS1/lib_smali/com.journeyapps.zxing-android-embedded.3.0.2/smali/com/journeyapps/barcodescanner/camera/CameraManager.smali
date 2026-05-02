.class public final Lcom/journeyapps/barcodescanner/camera/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

.field private autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

.field private camera:Landroid/hardware/Camera;

.field private cameraInfo:Landroid/hardware/Camera$CameraInfo;

.field private final cameraPreviewCallback:Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

.field private context:Landroid/content/Context;

.field private defaultParameters:Ljava/lang/String;

.field private displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

.field private previewSize:Lcom/journeyapps/barcodescanner/Size;

.field private previewing:Z

.field private requestedPreviewSize:Lcom/journeyapps/barcodescanner/Size;

.field private rotationDegrees:I

.field private settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const-class v0, Lcom/journeyapps/barcodescanner/camera/CameraManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 71
    const/4 v0, -0x1

    iput v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->rotationDegrees:I

    .line 113
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->context:Landroid/content/Context;

    .line 114
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;-><init>(Lcom/journeyapps/barcodescanner/camera/CameraManager;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraPreviewCallback:Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

    .line 115
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private calculateDisplayRotation()I
    .registers 7

    .prologue
    .line 301
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    invoke-virtual {v3}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->getRotation()I

    move-result v2

    .line 302
    .local v2, "rotation":I
    const/4 v0, 0x0

    .line 303
    .local v0, "degrees":I
    packed-switch v2, :pswitch_data_4a

    .line 319
    :goto_a
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v3, v3, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_40

    .line 320
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v3, v3, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v3, v0

    rem-int/lit16 v1, v3, 0x168

    .line 321
    .local v1, "result":I
    rsub-int v3, v1, 0x168

    rem-int/lit16 v1, v3, 0x168

    .line 325
    :goto_1c
    sget-object v3, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Camera Display Orientation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    return v1

    .line 305
    .end local v1    # "result":I
    :pswitch_35
    const/4 v0, 0x0

    .line 306
    goto :goto_a

    .line 308
    :pswitch_37
    const/16 v0, 0x5a

    .line 309
    goto :goto_a

    .line 311
    :pswitch_3a
    const/16 v0, 0xb4

    .line 312
    goto :goto_a

    .line 314
    :pswitch_3d
    const/16 v0, 0x10e

    goto :goto_a

    .line 323
    :cond_40
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraInfo:Landroid/hardware/Camera$CameraInfo;

    iget v3, v3, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v3, v0

    add-int/lit16 v3, v3, 0x168

    rem-int/lit16 v1, v3, 0x168

    .restart local v1    # "result":I
    goto :goto_1c

    .line 303
    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_35
        :pswitch_37
        :pswitch_3a
        :pswitch_3d
    .end packed-switch
.end method

.method private getDefaultCameraParameters()Landroid/hardware/Camera$Parameters;
    .registers 3

    .prologue
    .line 220
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 221
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->defaultParameters:Ljava/lang/String;

    if-nez v1, :cond_11

    .line 222
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->defaultParameters:Ljava/lang/String;

    .line 226
    :goto_10
    return-object v0

    .line 224
    :cond_11
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->defaultParameters:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->unflatten(Ljava/lang/String;)V

    goto :goto_10
.end method

.method private static getPreviewSizes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;
    .registers 9
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/Camera$Parameters;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/journeyapps/barcodescanner/Size;",
            ">;"
        }
    .end annotation

    .prologue
    .line 283
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v3

    .line 284
    .local v3, "rawSupportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 285
    .local v2, "previewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/journeyapps/barcodescanner/Size;>;"
    if-nez v3, :cond_1e

    .line 286
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 287
    .local v0, "defaultSize":Landroid/hardware/Camera$Size;
    if-eqz v0, :cond_1d

    .line 289
    new-instance v5, Lcom/journeyapps/barcodescanner/Size;

    iget v6, v0, Landroid/hardware/Camera$Size;->width:I

    iget v7, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v5, v6, v7}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    .end local v0    # "defaultSize":Landroid/hardware/Camera$Size;
    :cond_1d
    return-object v2

    .line 293
    :cond_1e
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_22
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/Camera$Size;

    .line 294
    .local v4, "size":Landroid/hardware/Camera$Size;
    new-instance v5, Lcom/journeyapps/barcodescanner/Size;

    iget v6, v4, Landroid/hardware/Camera$Size;->width:I

    iget v7, v4, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v5, v6, v7}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_22
.end method

.method private setCameraDisplayOrientation(I)V
    .registers 3
    .param p1, "rotation"    # I

    .prologue
    .line 330
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 331
    return-void
.end method

.method private setDesiredParameters(Z)V
    .registers 8
    .param p1, "safeMode"    # Z

    .prologue
    const/4 v3, 0x0

    .line 230
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->getDefaultCameraParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 233
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_f

    .line 234
    sget-object v2, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    const-string v3, "Device error: no camera parameters are available. Proceeding without configuration."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    :goto_e
    return-void

    .line 238
    :cond_f
    sget-object v2, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Initial camera parameters: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    if-eqz p1, :cond_34

    .line 241
    sget-object v2, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    const-string v4, "In camera config safe mode -- most settings will not be honored"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    :cond_34
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isAutoFocusEnabled()Z

    move-result v4

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isContinuousFocusEnabled()Z

    move-result v2

    if-nez v2, :cond_a8

    const/4 v2, 0x1

    :goto_43
    invoke-static {v0, v4, v2, p1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setFocus(Landroid/hardware/Camera$Parameters;ZZZ)V

    .line 247
    if-nez p1, :cond_78

    .line 248
    invoke-static {v0, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setTorch(Landroid/hardware/Camera$Parameters;Z)V

    .line 250
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isScanInverted()Z

    move-result v2

    if-eqz v2, :cond_56

    .line 251
    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setInvertColor(Landroid/hardware/Camera$Parameters;)V

    .line 254
    :cond_56
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isBarcodeSceneModeEnabled()Z

    move-result v2

    if-eqz v2, :cond_61

    .line 255
    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setBarcodeSceneMode(Landroid/hardware/Camera$Parameters;)V

    .line 258
    :cond_61
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isMeteringEnabled()Z

    move-result v2

    if-eqz v2, :cond_78

    .line 259
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xf

    if-lt v2, v3, :cond_78

    .line 260
    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setVideoStabilization(Landroid/hardware/Camera$Parameters;)V

    .line 261
    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setFocusArea(Landroid/hardware/Camera$Parameters;)V

    .line 262
    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setMetering(Landroid/hardware/Camera$Parameters;)V

    .line 268
    :cond_78
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->getPreviewSizes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v1

    .line 269
    .local v1, "previewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/journeyapps/barcodescanner/Size;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_aa

    .line 270
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->requestedPreviewSize:Lcom/journeyapps/barcodescanner/Size;

    .line 277
    :goto_85
    sget-object v2, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Final camera parameters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v2, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    goto/16 :goto_e

    .end local v1    # "previewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/journeyapps/barcodescanner/Size;>;"
    :cond_a8
    move v2, v3

    .line 245
    goto :goto_43

    .line 272
    .restart local v1    # "previewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/journeyapps/barcodescanner/Size;>;"
    :cond_aa
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->isCameraRotated()Z

    move-result v3

    invoke-virtual {v2, v1, v3}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->getBestPreviewSize(Ljava/util/List;Z)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v2

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->requestedPreviewSize:Lcom/journeyapps/barcodescanner/Size;

    .line 274
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->requestedPreviewSize:Lcom/journeyapps/barcodescanner/Size;

    iget v2, v2, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->requestedPreviewSize:Lcom/journeyapps/barcodescanner/Size;

    iget v3, v3, Lcom/journeyapps/barcodescanner/Size;->height:I

    invoke-virtual {v0, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    goto :goto_85
.end method

.method private setParameters()V
    .registers 7

    .prologue
    .line 336
    :try_start_0
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->calculateDisplayRotation()I

    move-result v3

    iput v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->rotationDegrees:I

    .line 337
    iget v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->rotationDegrees:I

    invoke-direct {p0, v3}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setCameraDisplayOrientation(I)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_27

    .line 342
    :goto_b
    const/4 v3, 0x0

    :try_start_c
    invoke-direct {p0, v3}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setDesiredParameters(Z)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_f} :catch_30

    .line 353
    :goto_f
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v3

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v2

    .line 354
    .local v2, "realPreviewSize":Landroid/hardware/Camera$Size;
    if-nez v2, :cond_3f

    .line 355
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->requestedPreviewSize:Lcom/journeyapps/barcodescanner/Size;

    iput-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    .line 359
    :goto_1f
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraPreviewCallback:Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

    iget-object v4, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    invoke-virtual {v3, v4}, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->setResolution(Lcom/journeyapps/barcodescanner/Size;)V

    .line 360
    return-void

    .line 338
    .end local v2    # "realPreviewSize":Landroid/hardware/Camera$Size;
    :catch_27
    move-exception v0

    .line 339
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    const-string v4, "Failed to set rotation."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    .line 343
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_30
    move-exception v0

    .line 346
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    :try_start_32
    invoke-direct {p0, v3}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setDesiredParameters(Z)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_36

    goto :goto_f

    .line 347
    :catch_36
    move-exception v1

    .line 349
    .local v1, "e2":Ljava/lang/Exception;
    sget-object v3, Lcom/journeyapps/barcodescanner/camera/CameraManager;->TAG:Ljava/lang/String;

    const-string v4, "Camera rejected even safe-mode parameters! No configuration"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f

    .line 357
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e2":Ljava/lang/Exception;
    .restart local v2    # "realPreviewSize":Landroid/hardware/Camera$Size;
    :cond_3f
    new-instance v3, Lcom/journeyapps/barcodescanner/Size;

    iget v4, v2, Landroid/hardware/Camera$Size;->width:I

    iget v5, v2, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v3, v4, v5}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    iput-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    goto :goto_1f
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_c

    .line 194
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 197
    :cond_c
    return-void
.end method

.method public configure()V
    .registers 1

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->setParameters()V

    .line 140
    return-void
.end method

.method public getCameraRotation()I
    .registers 2

    .prologue
    .line 215
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->rotationDegrees:I

    return v0
.end method

.method public getCameraSettings()Lcom/journeyapps/barcodescanner/camera/CameraSettings;
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    return-object v0
.end method

.method public getDisplayConfiguration()Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;
    .registers 2

    .prologue
    .line 416
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    return-object v0
.end method

.method public getNaturalPreviewSize()Lcom/journeyapps/barcodescanner/Size;
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    return-object v0
.end method

.method public getPreviewSize()Lcom/journeyapps/barcodescanner/Size;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    if-nez v0, :cond_6

    .line 383
    const/4 v0, 0x0

    .line 387
    :goto_5
    return-object v0

    .line 384
    :cond_6
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->isCameraRotated()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 385
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/Size;->rotate()Lcom/journeyapps/barcodescanner/Size;

    move-result-object v0

    goto :goto_5

    .line 387
    :cond_13
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    goto :goto_5
.end method

.method public isCameraRotated()Z
    .registers 3

    .prologue
    .line 203
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->rotationDegrees:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_d

    .line 204
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Rotation not calculated yet. Call configure() first."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_d
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->rotationDegrees:I

    rem-int/lit16 v0, v0, 0xb4

    if-eqz v0, :cond_15

    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 364
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isTorchOn()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 446
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 447
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    if-eqz v1, :cond_20

    .line 448
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v0

    .line 449
    .local v0, "flashMode":Ljava/lang/String;
    if-eqz v0, :cond_20

    const-string v3, "on"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    const-string v3, "torch"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_20

    :cond_1f
    const/4 v2, 0x1

    .line 453
    .end local v0    # "flashMode":Ljava/lang/String;
    :cond_20
    return v2
.end method

.method public open()V
    .registers 4

    .prologue
    .line 121
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->getRequestedCameraId()I

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->open(I)Landroid/hardware/Camera;

    move-result-object v1

    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 122
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-nez v1, :cond_18

    .line 123
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to open camera"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 126
    :cond_18
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->getRequestedCameraId()I

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->getCameraId(I)I

    move-result v0

    .line 127
    .local v0, "cameraId":I
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraInfo:Landroid/hardware/Camera$CameraInfo;

    .line 128
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraInfo:Landroid/hardware/Camera$CameraInfo;

    invoke-static {v0, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 129
    return-void
.end method

.method public requestPreviewFrame(Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/journeyapps/barcodescanner/camera/PreviewCallback;

    .prologue
    .line 400
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 401
    .local v0, "theCamera":Landroid/hardware/Camera;
    if-eqz v0, :cond_12

    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewing:Z

    if-eqz v1, :cond_12

    .line 402
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraPreviewCallback:Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

    invoke-virtual {v1, p1}, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->setCallback(Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V

    .line 403
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraPreviewCallback:Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 405
    :cond_12
    return-void
.end method

.method public setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V
    .registers 2
    .param p1, "settings"    # Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .prologue
    .line 412
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 413
    return-void
.end method

.method public setDisplayConfiguration(Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;)V
    .registers 2
    .param p1, "displayConfiguration"    # Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    .prologue
    .line 420
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    .line 421
    return-void
.end method

.method public setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 147
    return-void
.end method

.method public setTorch(Z)V
    .registers 5
    .param p1, "on"    # Z

    .prologue
    .line 424
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v2, :cond_35

    .line 425
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/camera/CameraManager;->isTorchOn()Z

    move-result v0

    .line 426
    .local v0, "isOn":Z
    if-eq p1, v0, :cond_35

    .line 427
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    if-eqz v2, :cond_13

    .line 428
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->stop()V

    .line 431
    :cond_13
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 432
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-static {v1, p1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setTorch(Landroid/hardware/Camera$Parameters;Z)V

    .line 433
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isExposureEnabled()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 434
    invoke-static {v1, p1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setBestExposure(Landroid/hardware/Camera$Parameters;Z)V

    .line 436
    :cond_27
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 438
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    if-eqz v2, :cond_35

    .line 439
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->start()V

    .line 443
    .end local v0    # "isOn":Z
    .end local v1    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_35
    return-void
.end method

.method public startPreview()V
    .registers 5

    .prologue
    .line 155
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 156
    .local v0, "theCamera":Landroid/hardware/Camera;
    if-eqz v0, :cond_29

    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewing:Z

    if-nez v1, :cond_29

    .line 157
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 158
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewing:Z

    .line 159
    new-instance v1, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v1, v2, v3}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;-><init>(Landroid/hardware/Camera;Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V

    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    .line 160
    new-instance v1, Lcom/google/zxing/client/android/AmbientLightManager;

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->settings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v1, v2, p0, v3}, Lcom/google/zxing/client/android/AmbientLightManager;-><init>(Landroid/content/Context;Lcom/journeyapps/barcodescanner/camera/CameraManager;Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V

    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    .line 161
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    invoke-virtual {v1}, Lcom/google/zxing/client/android/AmbientLightManager;->start()V

    .line 163
    :cond_29
    return-void
.end method

.method public stopPreview()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 171
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    if-eqz v0, :cond_c

    .line 172
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->stop()V

    .line 173
    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->autoFocusManager:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    .line 175
    :cond_c
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    if-eqz v0, :cond_17

    .line 176
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/AmbientLightManager;->stop()V

    .line 177
    iput-object v1, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->ambientLightManager:Lcom/google/zxing/client/android/AmbientLightManager;

    .line 179
    :cond_17
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_2c

    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewing:Z

    if-eqz v0, :cond_2c

    .line 180
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 181
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->cameraPreviewCallback:Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraManager$CameraPreviewCallback;->setCallback(Lcom/journeyapps/barcodescanner/camera/PreviewCallback;)V

    .line 182
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/CameraManager;->previewing:Z

    .line 184
    :cond_2c
    return-void
.end method

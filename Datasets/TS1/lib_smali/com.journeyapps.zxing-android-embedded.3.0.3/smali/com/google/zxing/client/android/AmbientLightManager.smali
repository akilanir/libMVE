.class public final Lcom/google/zxing/client/android/AmbientLightManager;
.super Ljava/lang/Object;
.source "AmbientLightManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field private static final BRIGHT_ENOUGH_LUX:F = 450.0f

.field private static final TOO_DARK_LUX:F = 45.0f


# instance fields
.field private cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

.field private cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

.field private context:Landroid/content/Context;

.field private handler:Landroid/os/Handler;

.field private lightSensor:Landroid/hardware/Sensor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/journeyapps/barcodescanner/camera/CameraManager;Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraManager"    # Lcom/journeyapps/barcodescanner/camera/CameraManager;
    .param p3, "settings"    # Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->context:Landroid/content/Context;

    .line 49
    iput-object p2, p0, Lcom/google/zxing/client/android/AmbientLightManager;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    .line 50
    iput-object p3, p0, Lcom/google/zxing/client/android/AmbientLightManager;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/client/android/AmbientLightManager;->handler:Landroid/os/Handler;

    .line 53
    return-void
.end method

.method static synthetic access$000(Lcom/google/zxing/client/android/AmbientLightManager;)Lcom/journeyapps/barcodescanner/camera/CameraManager;
    .registers 2
    .param p0, "x0"    # Lcom/google/zxing/client/android/AmbientLightManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/zxing/client/android/AmbientLightManager;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    return-object v0
.end method

.method private setTorch(Z)V
    .registers 4
    .param p1, "on"    # Z

    .prologue
    .line 74
    iget-object v0, p0, Lcom/google/zxing/client/android/AmbientLightManager;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/google/zxing/client/android/AmbientLightManager$1;

    invoke-direct {v1, p0, p1}, Lcom/google/zxing/client/android/AmbientLightManager$1;-><init>(Lcom/google/zxing/client/android/AmbientLightManager;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 80
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 97
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 5
    .param p1, "sensorEvent"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v2, 0x0

    .line 84
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v1, v2

    .line 85
    .local v0, "ambientLightLux":F
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->cameraManager:Lcom/journeyapps/barcodescanner/camera/CameraManager;

    if-eqz v1, :cond_13

    .line 86
    const/high16 v1, 0x42340000    # 45.0f

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_14

    .line 87
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/zxing/client/android/AmbientLightManager;->setTorch(Z)V

    .line 92
    :cond_13
    :goto_13
    return-void

    .line 88
    :cond_14
    const/high16 v1, 0x43e10000    # 450.0f

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_13

    .line 89
    invoke-direct {p0, v2}, Lcom/google/zxing/client/android/AmbientLightManager;->setTorch(Z)V

    goto :goto_13
.end method

.method public start()V
    .registers 4

    .prologue
    .line 56
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;->isAutoTorchEnabled()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 57
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->context:Landroid/content/Context;

    const-string v2, "sensor"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 58
    .local v0, "sensorManager":Landroid/hardware/SensorManager;
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->lightSensor:Landroid/hardware/Sensor;

    .line 59
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->lightSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_23

    .line 60
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->lightSensor:Landroid/hardware/Sensor;

    const/4 v2, 0x3

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 63
    .end local v0    # "sensorManager":Landroid/hardware/SensorManager;
    :cond_23
    return-void
.end method

.method public stop()V
    .registers 4

    .prologue
    .line 66
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->lightSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_14

    .line 67
    iget-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->context:Landroid/content/Context;

    const-string v2, "sensor"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 68
    .local v0, "sensorManager":Landroid/hardware/SensorManager;
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 69
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/zxing/client/android/AmbientLightManager;->lightSensor:Landroid/hardware/Sensor;

    .line 71
    .end local v0    # "sensorManager":Landroid/hardware/SensorManager;
    :cond_14
    return-void
.end method

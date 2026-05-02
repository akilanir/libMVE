.class public final Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;
.super Ljava/lang/Object;
.source "OpenCameraInterface.java"


# static fields
.field public static final NO_REQUESTED_CAMERA:I = -0x1

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    const-class v0, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static getCameraId(I)I
    .registers 9
    .param p0, "requestedId"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 35
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v4

    .line 36
    .local v4, "numCameras":I
    if-nez v4, :cond_11

    .line 37
    sget-object v6, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    const-string v7, "No cameras!"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v5

    .line 66
    :cond_10
    :goto_10
    return v0

    .line 41
    :cond_11
    move v0, p0

    .line 43
    .local v0, "cameraId":I
    if-ltz v0, :cond_2d

    const/4 v2, 0x1

    .line 45
    .local v2, "explicitRequest":Z
    :goto_15
    if-nez v2, :cond_27

    .line 47
    const/4 v3, 0x0

    .line 48
    .local v3, "index":I
    :goto_18
    if-ge v3, v4, :cond_26

    .line 49
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 50
    .local v1, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v3, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 51
    iget v7, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v7, :cond_2f

    .line 57
    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    :cond_26
    move v0, v3

    .line 60
    .end local v3    # "index":I
    :cond_27
    if-lt v0, v4, :cond_10

    .line 63
    if-eqz v2, :cond_32

    move v0, v5

    .line 64
    goto :goto_10

    .end local v2    # "explicitRequest":Z
    :cond_2d
    move v2, v6

    .line 43
    goto :goto_15

    .line 54
    .restart local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .restart local v2    # "explicitRequest":Z
    .restart local v3    # "index":I
    :cond_2f
    add-int/lit8 v3, v3, 0x1

    .line 55
    goto :goto_18

    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .end local v3    # "index":I
    :cond_32
    move v0, v6

    .line 66
    goto :goto_10
.end method

.method public static open(I)Landroid/hardware/Camera;
    .registers 3
    .param p0, "requestedId"    # I

    .prologue
    .line 79
    invoke-static {p0}, Lcom/google/zxing/client/android/camera/open/OpenCameraInterface;->getCameraId(I)I

    move-result v0

    .line 80
    .local v0, "cameraId":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 81
    const/4 v1, 0x0

    .line 83
    :goto_8
    return-object v1

    :cond_9
    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v1

    goto :goto_8
.end method

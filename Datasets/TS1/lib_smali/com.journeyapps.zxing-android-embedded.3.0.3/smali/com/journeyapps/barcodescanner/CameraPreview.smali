.class public Lcom/journeyapps/barcodescanner/CameraPreview;
.super Landroid/view/ViewGroup;
.source "CameraPreview.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

.field private cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

.field private containerSize:Lcom/journeyapps/barcodescanner/Size;

.field private currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;

.field private displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

.field private final fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

.field private framingRect:Landroid/graphics/Rect;

.field private previewActive:Z

.field private previewFramingRect:Landroid/graphics/Rect;

.field private previewSize:Lcom/journeyapps/barcodescanner/Size;

.field private rotationCallback:Lcom/journeyapps/barcodescanner/RotationCallback;

.field private rotationListener:Lcom/journeyapps/barcodescanner/RotationListener;

.field private final stateCallback:Landroid/os/Handler$Callback;

.field private stateHandler:Landroid/os/Handler;

.field private stateListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;",
            ">;"
        }
    .end annotation
.end field

.field private final surfaceCallback:Landroid/view/SurfaceHolder$Callback;

.field private surfaceRect:Landroid/graphics/Rect;

.field private surfaceView:Landroid/view/SurfaceView;

.field private windowManager:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 73
    const-class v0, Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 167
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 83
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;

    .line 90
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 105
    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    .line 108
    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 111
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$1;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    .line 134
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$2;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$2;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateCallback:Landroid/os/Handler$Callback;

    .line 153
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$3;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$3;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationCallback:Lcom/journeyapps/barcodescanner/RotationCallback;

    .line 220
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$4;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$4;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 168
    invoke-direct {p0, p1, v2, v1, v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->initialize(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 169
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 172
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 83
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;

    .line 90
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 105
    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    .line 108
    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 111
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$1;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    .line 134
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$2;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$2;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateCallback:Landroid/os/Handler$Callback;

    .line 153
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$3;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$3;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationCallback:Lcom/journeyapps/barcodescanner/RotationCallback;

    .line 220
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$4;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$4;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 173
    invoke-direct {p0, p1, p2, v1, v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->initialize(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 174
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 177
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 83
    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;

    .line 90
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/camera/CameraSettings;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 105
    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    .line 108
    iput-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 111
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$1;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    .line 134
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$2;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$2;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateCallback:Landroid/os/Handler$Callback;

    .line 153
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$3;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$3;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationCallback:Lcom/journeyapps/barcodescanner/RotationCallback;

    .line 220
    new-instance v0, Lcom/journeyapps/barcodescanner/CameraPreview$4;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CameraPreview$4;-><init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 178
    invoke-direct {p0, p1, p2, p3, v1}, Lcom/journeyapps/barcodescanner/CameraPreview;->initialize(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 179
    return-void
.end method

.method static synthetic access$002(Lcom/journeyapps/barcodescanner/CameraPreview;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;
    .param p1, "x1"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;

    return-object p1
.end method

.method static synthetic access$100()Ljava/lang/String;
    .registers 1

    .prologue
    .line 48
    sget-object v0, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/journeyapps/barcodescanner/CameraPreview;)V
    .registers 1
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->startPreviewIfReady()V

    return-void
.end method

.method static synthetic access$300(Lcom/journeyapps/barcodescanner/CameraPreview;Lcom/journeyapps/barcodescanner/Size;)V
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;
    .param p1, "x1"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSized(Lcom/journeyapps/barcodescanner/Size;)V

    return-void
.end method

.method static synthetic access$400(Lcom/journeyapps/barcodescanner/CameraPreview;)Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/journeyapps/barcodescanner/CameraPreview;)V
    .registers 1
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationChanged()V

    return-void
.end method

.method static synthetic access$600(Lcom/journeyapps/barcodescanner/CameraPreview;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$700(Lcom/journeyapps/barcodescanner/CameraPreview;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CameraPreview;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;

    return-object v0
.end method

.method private calculateFrames()V
    .registers 14

    .prologue
    const/4 v8, 0x0

    const/4 v12, 0x0

    .line 252
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSize:Lcom/journeyapps/barcodescanner/Size;

    if-eqz v6, :cond_e

    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    if-eqz v6, :cond_e

    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    if-nez v6, :cond_1c

    .line 253
    :cond_e
    iput-object v12, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 254
    iput-object v12, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    .line 255
    iput-object v12, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    .line 256
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "containerSize or previewSize is not set yet"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 259
    :cond_1c
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    iget v4, v6, Lcom/journeyapps/barcodescanner/Size;->width:I

    .line 260
    .local v4, "previewWidth":I
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    iget v3, v6, Lcom/journeyapps/barcodescanner/Size;->height:I

    .line 262
    .local v3, "previewHeight":I
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSize:Lcom/journeyapps/barcodescanner/Size;

    iget v5, v6, Lcom/journeyapps/barcodescanner/Size;->width:I

    .line 263
    .local v5, "width":I
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSize:Lcom/journeyapps/barcodescanner/Size;

    iget v2, v6, Lcom/journeyapps/barcodescanner/Size;->height:I

    .line 265
    .local v2, "height":I
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    iget-object v7, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    invoke-virtual {v6, v7}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->scalePreview(Lcom/journeyapps/barcodescanner/Size;)Landroid/graphics/Rect;

    move-result-object v6

    iput-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    .line 267
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v8, v8, v5, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 268
    .local v0, "container":Landroid/graphics/Rect;
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v0, v6}, Lcom/journeyapps/barcodescanner/CameraPreview;->calculateFramingRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v6

    iput-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    .line 269
    new-instance v1, Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    invoke-direct {v1, v6}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 270
    .local v1, "frameInPreview":Landroid/graphics/Rect;
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    neg-int v6, v6

    iget-object v7, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    neg-int v7, v7

    invoke-virtual {v1, v6, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 272
    new-instance v6, Landroid/graphics/Rect;

    iget v7, v1, Landroid/graphics/Rect;->left:I

    mul-int/2addr v7, v4

    iget-object v8, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    div-int/2addr v7, v8

    iget v8, v1, Landroid/graphics/Rect;->top:I

    mul-int/2addr v8, v3

    iget-object v9, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v9

    div-int/2addr v8, v9

    iget v9, v1, Landroid/graphics/Rect;->right:I

    mul-int/2addr v9, v4

    iget-object v10, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v10

    div-int/2addr v9, v10

    iget v10, v1, Landroid/graphics/Rect;->bottom:I

    mul-int/2addr v10, v3

    iget-object v11, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v11

    div-int/2addr v10, v11

    invoke-direct {v6, v7, v8, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 277
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    if-lez v6, :cond_96

    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    if-gtz v6, :cond_a2

    .line 278
    :cond_96
    iput-object v12, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 279
    iput-object v12, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    .line 280
    sget-object v6, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    const-string v7, "Preview frame is too small"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    :goto_a1
    return-void

    .line 282
    :cond_a2
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    invoke-interface {v6}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->previewSized()V

    goto :goto_a1
.end method

.method private containerSized(Lcom/journeyapps/barcodescanner/Size;)V
    .registers 4
    .param p1, "containerSize"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSize:Lcom/journeyapps/barcodescanner/Size;

    .line 299
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    if-eqz v0, :cond_25

    .line 300
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->getDisplayConfiguration()Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    move-result-object v0

    if-nez v0, :cond_25

    .line 301
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getDisplayRotation()I

    move-result v1

    invoke-direct {v0, v1, p1}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;-><init>(ILcom/journeyapps/barcodescanner/Size;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    .line 302
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->displayConfiguration:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->setDisplayConfiguration(Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;)V

    .line 303
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->configureCamera()V

    .line 306
    :cond_25
    return-void
.end method

.method private getDisplayRotation()I
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    return v0
.end method

.method private initCamera()V
    .registers 3

    .prologue
    .line 456
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    if-eqz v0, :cond_c

    .line 457
    sget-object v0, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    const-string v1, "initCamera called twice"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    :goto_b
    return-void

    .line 461
    :cond_c
    new-instance v0, Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .line 462
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V

    .line 464
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->setReadyHandler(Landroid/os/Handler;)V

    .line 465
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->open()V

    goto :goto_b
.end method

.method private initialize(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_b

    .line 185
    const/high16 v0, -0x1000000

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->setBackgroundColor(I)V

    .line 188
    :cond_b
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->windowManager:Landroid/view/WindowManager;

    .line 190
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateCallback:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateHandler:Landroid/os/Handler;

    .line 192
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->setupSurfaceView()V

    .line 194
    new-instance v0, Lcom/journeyapps/barcodescanner/RotationListener;

    invoke-direct {v0}, Lcom/journeyapps/barcodescanner/RotationListener;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationListener:Lcom/journeyapps/barcodescanner/RotationListener;

    .line 195
    return-void
.end method

.method private previewSized(Lcom/journeyapps/barcodescanner/Size;)V
    .registers 3
    .param p1, "size"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 309
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    .line 310
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSize:Lcom/journeyapps/barcodescanner/Size;

    if-eqz v0, :cond_f

    .line 311
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->calculateFrames()V

    .line 312
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->requestLayout()V

    .line 313
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->startPreviewIfReady()V

    .line 315
    :cond_f
    return-void
.end method

.method private rotationChanged()V
    .registers 1

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->pause()V

    .line 199
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->resume()V

    .line 200
    return-void
.end method

.method private setupSurfaceView()V
    .registers 3

    .prologue
    .line 203
    new-instance v0, Landroid/view/SurfaceView;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    .line 204
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_1b

    .line 205
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 207
    :cond_1b
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 208
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->addView(Landroid/view/View;)V

    .line 209
    return-void
.end method

.method private startCameraPreview(Landroid/view/SurfaceHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 470
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    if-nez v0, :cond_20

    .line 471
    sget-object v0, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    const-string v1, "Starting preview"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->setSurfaceHolder(Landroid/view/SurfaceHolder;)V

    .line 473
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->startPreview()V

    .line 474
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    .line 476
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->previewStarted()V

    .line 477
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    invoke-interface {v0}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->previewStarted()V

    .line 479
    :cond_20
    return-void
.end method

.method private startPreviewIfReady()V
    .registers 5

    .prologue
    .line 318
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    if-eqz v0, :cond_2e

    .line 319
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;

    new-instance v1, Lcom/journeyapps/barcodescanner/Size;

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/Size;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 320
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->startCameraPreview(Landroid/view/SurfaceHolder;)V

    .line 325
    :cond_2e
    return-void
.end method


# virtual methods
.method public addStateListener(Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .prologue
    .line 217
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    return-void
.end method

.method protected calculateFramingRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 8
    .param p1, "container"    # Landroid/graphics/Rect;
    .param p2, "surface"    # Landroid/graphics/Rect;

    .prologue
    .line 520
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 521
    .local v0, "intersection":Landroid/graphics/Rect;
    invoke-virtual {v0, p2}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 524
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    div-int/lit8 v2, v2, 0xa

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    div-int/lit8 v3, v3, 0xa

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 525
    .local v1, "margin":I
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Rect;->inset(II)V

    .line 526
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-le v2, v3, :cond_34

    .line 528
    const/4 v2, 0x0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 530
    :cond_34
    return-object v0
.end method

.method public getCameraInstance()Lcom/journeyapps/barcodescanner/camera/CameraInstance;
    .registers 2

    .prologue
    .line 498
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    return-object v0
.end method

.method public getCameraSettings()Lcom/journeyapps/barcodescanner/camera/CameraSettings;
    .registers 2

    .prologue
    .line 369
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    return-object v0
.end method

.method public getFramingRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 350
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->framingRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getPreviewFramingRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method protected isActive()Z
    .registers 2

    .prologue
    .line 448
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isPreviewActive()Z
    .registers 2

    .prologue
    .line 508
    iget-boolean v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 11
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DrawAllocation"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 330
    new-instance v0, Lcom/journeyapps/barcodescanner/Size;

    sub-int v1, p4, p2

    sub-int v2, p5, p3

    invoke-direct {v0, v1, v2}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    invoke-direct {p0, v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSized(Lcom/journeyapps/barcodescanner/Size;)V

    .line 332
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    if-nez v0, :cond_1f

    .line 335
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/view/SurfaceView;->layout(IIII)V

    .line 339
    :goto_1e
    return-void

    .line 337
    :cond_1f
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/SurfaceView;->layout(IIII)V

    goto :goto_1e
.end method

.method public pause()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 421
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 422
    sget-object v1, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    const-string v2, "pause()"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    if-eqz v1, :cond_19

    .line 425
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->close()V

    .line 426
    iput-object v3, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    .line 427
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewActive:Z

    .line 429
    :cond_19
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;

    if-nez v1, :cond_28

    .line 430
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 431
    .local v0, "surfaceHolder":Landroid/view/SurfaceHolder;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 434
    .end local v0    # "surfaceHolder":Landroid/view/SurfaceHolder;
    :cond_28
    iput-object v3, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->containerSize:Lcom/journeyapps/barcodescanner/Size;

    .line 435
    iput-object v3, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewSize:Lcom/journeyapps/barcodescanner/Size;

    .line 436
    iput-object v3, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->previewFramingRect:Landroid/graphics/Rect;

    .line 437
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationListener:Lcom/journeyapps/barcodescanner/RotationListener;

    invoke-virtual {v1}, Lcom/journeyapps/barcodescanner/RotationListener;->stop()V

    .line 439
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->fireState:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    invoke-interface {v1}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->previewStopped()V

    .line 440
    return-void
.end method

.method protected previewStarted()V
    .registers 1

    .prologue
    .line 486
    return-void
.end method

.method public resume()V
    .registers 4

    .prologue
    .line 392
    invoke-static {}, Lcom/journeyapps/barcodescanner/Util;->validateMainThread()V

    .line 393
    sget-object v0, Lcom/journeyapps/barcodescanner/CameraPreview;->TAG:Ljava/lang/String;

    const-string v1, "resume()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->initCamera()V

    .line 398
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->currentSurfaceSize:Lcom/journeyapps/barcodescanner/Size;

    if-eqz v0, :cond_23

    .line 401
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->startPreviewIfReady()V

    .line 408
    :goto_14
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->requestLayout()V

    .line 409
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationListener:Lcom/journeyapps/barcodescanner/RotationListener;

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->rotationCallback:Lcom/journeyapps/barcodescanner/RotationCallback;

    invoke-virtual {v0, v1, v2}, Lcom/journeyapps/barcodescanner/RotationListener;->listen(Landroid/content/Context;Lcom/journeyapps/barcodescanner/RotationCallback;)V

    .line 410
    return-void

    .line 404
    :cond_23
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->surfaceCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    goto :goto_14
.end method

.method public setCameraSettings(Lcom/journeyapps/barcodescanner/camera/CameraSettings;)V
    .registers 2
    .param p1, "cameraSettings"    # Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .prologue
    .line 381
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraSettings:Lcom/journeyapps/barcodescanner/camera/CameraSettings;

    .line 382
    return-void
.end method

.method public setTorch(Z)V
    .registers 3
    .param p1, "on"    # Z

    .prologue
    .line 292
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    if-eqz v0, :cond_9

    .line 293
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview;->cameraInstance:Lcom/journeyapps/barcodescanner/camera/CameraInstance;

    invoke-virtual {v0, p1}, Lcom/journeyapps/barcodescanner/camera/CameraInstance;->setTorch(Z)V

    .line 295
    :cond_9
    return-void
.end method

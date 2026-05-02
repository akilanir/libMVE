.class public Lcom/journeyapps/barcodescanner/CaptureManager;
.super Ljava/lang/Object;
.source "CaptureManager.java"


# static fields
.field private static final DELAY_BEEP:J = 0x96L

.field private static final SAVED_ORIENTATION_LOCK:Ljava/lang/String; = "SAVED_ORIENTATION_LOCK"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private activity:Landroid/app/Activity;

.field private barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

.field private beepManager:Lcom/google/zxing/client/android/BeepManager;

.field private callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

.field private destroyed:Z

.field private handler:Landroid/os/Handler;

.field private inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

.field private orientationLock:I

.field private final stateListener:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-class v0, Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/CaptureManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/journeyapps/barcodescanner/CompoundBarcodeView;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "barcodeView"    # Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, -0x1

    iput v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->destroyed:Z

    .line 62
    new-instance v0, Lcom/journeyapps/barcodescanner/CaptureManager$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CaptureManager$1;-><init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 83
    new-instance v0, Lcom/journeyapps/barcodescanner/CaptureManager$2;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/CaptureManager$2;-><init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->stateListener:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 106
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    .line 107
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    .line 108
    invoke-virtual {p2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->getBarcodeView()Lcom/journeyapps/barcodescanner/BarcodeView;

    move-result-object v0

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->stateListener:Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->addStateListener(Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;)V

    .line 110
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->handler:Landroid/os/Handler;

    .line 112
    new-instance v0, Lcom/google/zxing/client/android/InactivityTimer;

    new-instance v1, Lcom/journeyapps/barcodescanner/CaptureManager$3;

    invoke-direct {v1, p0}, Lcom/journeyapps/barcodescanner/CaptureManager$3;-><init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    invoke-direct {v0, p1, v1}, Lcom/google/zxing/client/android/InactivityTimer;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    .line 120
    new-instance v0, Lcom/google/zxing/client/android/BeepManager;

    invoke-direct {v0, p1}, Lcom/google/zxing/client/android/BeepManager;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    .line 121
    return-void
.end method

.method static synthetic access$000(Lcom/journeyapps/barcodescanner/CaptureManager;)Lcom/journeyapps/barcodescanner/CompoundBarcodeView;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CaptureManager;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/journeyapps/barcodescanner/CaptureManager;)Lcom/google/zxing/client/android/BeepManager;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CaptureManager;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/journeyapps/barcodescanner/CaptureManager;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CaptureManager;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lcom/journeyapps/barcodescanner/CaptureManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/journeyapps/barcodescanner/CaptureManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/journeyapps/barcodescanner/CaptureManager;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CaptureManager;->finish()V

    return-void
.end method

.method private finish()V
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 278
    return-void
.end method

.method public static resultIntent(Lcom/journeyapps/barcodescanner/BarcodeResult;)Landroid/content/Intent;
    .registers 12
    .param p0, "rawResult"    # Lcom/journeyapps/barcodescanner/BarcodeResult;

    .prologue
    .line 241
    new-instance v5, Landroid/content/Intent;

    const-string v9, "com.google.zxing.client.android.SCAN"

    invoke-direct {v5, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 242
    .local v5, "intent":Landroid/content/Intent;
    const/high16 v9, 0x80000

    invoke-virtual {v5, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 243
    const-string v9, "SCAN_RESULT"

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeResult;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    const-string v9, "SCAN_RESULT_FORMAT"

    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeResult;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/zxing/BarcodeFormat;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 245
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeResult;->getRawBytes()[B

    move-result-object v8

    .line 246
    .local v8, "rawBytes":[B
    if-eqz v8, :cond_30

    array-length v9, v8

    if-lez v9, :cond_30

    .line 247
    const-string v9, "SCAN_RESULT_BYTES"

    invoke-virtual {v5, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 249
    :cond_30
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/BarcodeResult;->getResultMetadata()Ljava/util/Map;

    move-result-object v6

    .line 250
    .local v6, "metadata":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/ResultMetadataType;*>;"
    if-eqz v6, :cond_a3

    .line 251
    sget-object v9, Lcom/google/zxing/ResultMetadataType;->UPC_EAN_EXTENSION:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v6, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 252
    const-string v9, "SCAN_RESULT_UPC_EAN_EXTENSION"

    sget-object v10, Lcom/google/zxing/ResultMetadataType;->UPC_EAN_EXTENSION:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v6, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    :cond_4d
    sget-object v9, Lcom/google/zxing/ResultMetadataType;->ORIENTATION:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    .line 256
    .local v7, "orientation":Ljava/lang/Number;
    if-eqz v7, :cond_60

    .line 257
    const-string v9, "SCAN_RESULT_ORIENTATION"

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v10

    invoke-virtual {v5, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 259
    :cond_60
    sget-object v9, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 260
    .local v2, "ecLevel":Ljava/lang/String;
    if-eqz v2, :cond_6f

    .line 261
    const-string v9, "SCAN_RESULT_ERROR_CORRECTION_LEVEL"

    invoke-virtual {v5, v9, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 264
    :cond_6f
    sget-object v9, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v6, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 265
    .local v1, "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    if-eqz v1, :cond_a3

    .line 266
    const/4 v3, 0x0

    .line 267
    .local v3, "i":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_7e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 268
    .local v0, "byteSegment":[B
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SCAN_RESULT_BYTE_SEGMENTS_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 269
    add-int/lit8 v3, v3, 0x1

    .line 270
    goto :goto_7e

    .line 273
    .end local v0    # "byteSegment":[B
    .end local v1    # "byteSegments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    .end local v2    # "ecLevel":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v7    # "orientation":Ljava/lang/Number;
    :cond_a3
    return-object v5
.end method


# virtual methods
.method public decode()V
    .registers 3

    .prologue
    .line 196
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->decodeSingle(Lcom/journeyapps/barcodescanner/BarcodeCallback;)V

    .line 197
    return-void
.end method

.method protected displayFrameworkBugMessageAndExit()V
    .registers 4

    .prologue
    .line 288
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_c

    iget-boolean v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->destroyed:Z

    if-eqz v1, :cond_d

    .line 307
    :cond_c
    :goto_c
    return-void

    .line 291
    :cond_d
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 292
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    sget v2, Lcom/google/zxing/client/android/R$string;->zxing_app_name:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 293
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    sget v2, Lcom/google/zxing/client/android/R$string;->zxing_msg_camera_framework_bug:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 294
    sget v1, Lcom/google/zxing/client/android/R$string;->zxing_button_ok:I

    new-instance v2, Lcom/journeyapps/barcodescanner/CaptureManager$4;

    invoke-direct {v2, p0}, Lcom/journeyapps/barcodescanner/CaptureManager$4;-><init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 300
    new-instance v1, Lcom/journeyapps/barcodescanner/CaptureManager$5;

    invoke-direct {v1, p0}, Lcom/journeyapps/barcodescanner/CaptureManager$5;-><init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 306
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_c
.end method

.method public initializeFromIntent(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 130
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 131
    .local v1, "window":Landroid/view/Window;
    const/16 v2, 0x80

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 133
    if-eqz p2, :cond_17

    .line 137
    const-string v2, "SAVED_ORIENTATION_LOCK"

    invoke-virtual {p2, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    .line 140
    :cond_17
    if-eqz p1, :cond_4c

    .line 141
    iget v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    if-ne v2, v3, :cond_28

    .line 143
    const-string v2, "SCAN_ORIENTATION_LOCKED"

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 145
    .local v0, "orientationLocked":Z
    if-eqz v0, :cond_28

    .line 146
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/CaptureManager;->lockOrientation()V

    .line 150
    .end local v0    # "orientationLocked":Z
    :cond_28
    const-string v2, "com.google.zxing.client.android.SCAN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 151
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    invoke-virtual {v2, p1}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->initializeFromIntent(Landroid/content/Intent;)V

    .line 154
    :cond_39
    const-string v2, "BEEP_ENABLED"

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_4c

    .line 155
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/zxing/client/android/BeepManager;->setBeepEnabled(Z)V

    .line 156
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v2}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V

    .line 159
    :cond_4c
    return-void
.end method

.method protected lockOrientation()V
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 166
    iget v4, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_2b

    .line 168
    iget-object v4, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 169
    .local v1, "display":Landroid/view/Display;
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 170
    .local v3, "rotation":I
    iget-object v4, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v0, v4, Landroid/content/res/Configuration;->orientation:I

    .line 171
    .local v0, "baseOrientation":I
    const/4 v2, 0x0

    .line 172
    .local v2, "orientation":I
    const/4 v4, 0x2

    if-ne v0, v4, :cond_36

    .line 173
    if-eqz v3, :cond_28

    if-ne v3, v6, :cond_33

    .line 174
    :cond_28
    const/4 v2, 0x0

    .line 186
    :cond_29
    :goto_29
    iput v2, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    .line 189
    .end local v0    # "baseOrientation":I
    .end local v1    # "display":Landroid/view/Display;
    .end local v2    # "orientation":I
    .end local v3    # "rotation":I
    :cond_2b
    iget-object v4, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    iget v5, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    invoke-virtual {v4, v5}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 190
    return-void

    .line 176
    .restart local v0    # "baseOrientation":I
    .restart local v1    # "display":Landroid/view/Display;
    .restart local v2    # "orientation":I
    .restart local v3    # "rotation":I
    :cond_33
    const/16 v2, 0x8

    goto :goto_29

    .line 178
    :cond_36
    if-ne v0, v6, :cond_29

    .line 179
    if-eqz v3, :cond_3d

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3f

    .line 180
    :cond_3d
    const/4 v2, 0x1

    goto :goto_29

    .line 182
    :cond_3f
    const/16 v2, 0x9

    goto :goto_29
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 222
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->destroyed:Z

    .line 223
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/InactivityTimer;->cancel()V

    .line 224
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->pause()V

    .line 214
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/InactivityTimer;->cancel()V

    .line 215
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/BeepManager;->close()V

    .line 216
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->barcodeView:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->resume()V

    .line 204
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->beepManager:Lcom/google/zxing/client/android/BeepManager;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/BeepManager;->updatePrefs()V

    .line 205
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->inactivityTimer:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-virtual {v0}, Lcom/google/zxing/client/android/InactivityTimer;->start()V

    .line 206
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 230
    const-string v0, "SAVED_ORIENTATION_LOCK"

    iget v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->orientationLock:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 231
    return-void
.end method

.method protected returnResult(Lcom/journeyapps/barcodescanner/BarcodeResult;)V
    .registers 5
    .param p1, "rawResult"    # Lcom/journeyapps/barcodescanner/BarcodeResult;

    .prologue
    .line 282
    invoke-static {p1}, Lcom/journeyapps/barcodescanner/CaptureManager;->resultIntent(Lcom/journeyapps/barcodescanner/BarcodeResult;)Landroid/content/Intent;

    move-result-object v0

    .line 283
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/CaptureManager;->activity:Landroid/app/Activity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 284
    invoke-direct {p0}, Lcom/journeyapps/barcodescanner/CaptureManager;->finish()V

    .line 285
    return-void
.end method

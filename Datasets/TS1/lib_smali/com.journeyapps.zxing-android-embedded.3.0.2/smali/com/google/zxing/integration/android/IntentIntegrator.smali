.class public Lcom/google/zxing/integration/android/IntentIntegrator;
.super Ljava/lang/Object;
.source "IntentIntegrator.java"


# static fields
.field public static final ALL_CODE_TYPES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final DATA_MATRIX_TYPES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ONE_D_CODE_TYPES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRODUCT_CODE_TYPES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final QR_CODE_TYPES:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final REQUEST_CODE:I = 0xc0de

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Landroid/app/Activity;

.field private captureActivity:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private desiredBarcodeFormats:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fragment:Landroid/app/Fragment;

.field private final moreExtras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private supportFragment:Landroid/support/v4/app/Fragment;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 50
    const-class v0, Lcom/google/zxing/integration/android/IntentIntegrator;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->TAG:Ljava/lang/String;

    .line 53
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "UPC_A"

    aput-object v1, v0, v2

    const-string v1, "UPC_E"

    aput-object v1, v0, v3

    const-string v1, "EAN_8"

    aput-object v1, v0, v4

    const-string v1, "EAN_13"

    aput-object v1, v0, v5

    const-string v1, "RSS_14"

    aput-object v1, v0, v6

    invoke-static {v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->list([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->PRODUCT_CODE_TYPES:Ljava/util/Collection;

    .line 54
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "UPC_A"

    aput-object v1, v0, v2

    const-string v1, "UPC_E"

    aput-object v1, v0, v3

    const-string v1, "EAN_8"

    aput-object v1, v0, v4

    const-string v1, "EAN_13"

    aput-object v1, v0, v5

    const-string v1, "CODE_39"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string v2, "CODE_93"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "CODE_128"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "ITF"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "RSS_14"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "RSS_EXPANDED"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->list([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->ONE_D_CODE_TYPES:Ljava/util/Collection;

    .line 57
    const-string v0, "QR_CODE"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->QR_CODE_TYPES:Ljava/util/Collection;

    .line 58
    const-string v0, "DATA_MATRIX"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->DATA_MATRIX_TYPES:Ljava/util/Collection;

    .line 60
    const/4 v0, 0x0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->ALL_CODE_TYPES:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    .line 79
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    .line 80
    return-void
.end method

.method private attachMoreExtras(Landroid/content/Intent;)V
    .registers 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 306
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_64

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 307
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 308
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 310
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Ljava/lang/Integer;

    if-eqz v4, :cond_2a

    .line 311
    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 312
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_2a
    instance-of v4, v3, Ljava/lang/Long;

    if-eqz v4, :cond_34

    .line 313
    check-cast v3, Ljava/lang/Long;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 314
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_34
    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_3e

    .line 315
    check-cast v3, Ljava/lang/Boolean;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 316
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_3e
    instance-of v4, v3, Ljava/lang/Double;

    if-eqz v4, :cond_48

    .line 317
    check-cast v3, Ljava/lang/Double;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 318
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_48
    instance-of v4, v3, Ljava/lang/Float;

    if-eqz v4, :cond_52

    .line 319
    check-cast v3, Ljava/lang/Float;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 320
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_52
    instance-of v4, v3, Landroid/os/Bundle;

    if-eqz v4, :cond_5c

    .line 321
    check-cast v3, Landroid/os/Bundle;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_a

    .line 323
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_5c
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_a

    .line 326
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    :cond_64
    return-void
.end method

.method public static forFragment(Landroid/app/Fragment;)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 3
    .param p0, "fragment"    # Landroid/app/Fragment;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 118
    new-instance v0, Lcom/google/zxing/integration/android/IntentIntegrator;

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;-><init>(Landroid/app/Activity;)V

    .line 119
    .local v0, "integrator":Lcom/google/zxing/integration/android/IntentIntegrator;
    iput-object p0, v0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    .line 120
    return-object v0
.end method

.method public static forSupportFragment(Landroid/support/v4/app/Fragment;)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 3
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 106
    new-instance v0, Lcom/google/zxing/integration/android/IntentIntegrator;

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;-><init>(Landroid/app/Activity;)V

    .line 107
    .local v0, "integrator":Lcom/google/zxing/integration/android/IntentIntegrator;
    iput-object p0, v0, Lcom/google/zxing/integration/android/IntentIntegrator;->supportFragment:Landroid/support/v4/app/Fragment;

    .line 108
    return-object v0
.end method

.method private static varargs list([Ljava/lang/String;)Ljava/util/List;
    .registers 2
    .param p0, "values"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 302
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static parseActivityResult(IILandroid/content/Intent;)Lcom/google/zxing/integration/android/IntentResult;
    .registers 11
    .param p0, "requestCode"    # I
    .param p1, "resultCode"    # I
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    const/high16 v7, -0x80000000

    .line 282
    const v0, 0xc0de

    if-ne p0, v0, :cond_3c

    .line 283
    const/4 v0, -0x1

    if-ne p1, v0, :cond_36

    .line 284
    const-string v0, "SCAN_RESULT"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 285
    .local v1, "contents":Ljava/lang/String;
    const-string v0, "SCAN_RESULT_FORMAT"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 286
    .local v2, "formatName":Ljava/lang/String;
    const-string v0, "SCAN_RESULT_BYTES"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v3

    .line 287
    .local v3, "rawBytes":[B
    const-string v0, "SCAN_RESULT_ORIENTATION"

    invoke-virtual {p2, v0, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 288
    .local v6, "intentOrientation":I
    if-ne v6, v7, :cond_31

    .line 289
    .local v4, "orientation":Ljava/lang/Integer;
    :goto_25
    const-string v0, "SCAN_RESULT_ERROR_CORRECTION_LEVEL"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 290
    .local v5, "errorCorrectionLevel":Ljava/lang/String;
    new-instance v0, Lcom/google/zxing/integration/android/IntentResult;

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/integration/android/IntentResult;-><init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Integer;Ljava/lang/String;)V

    .line 298
    .end local v1    # "contents":Ljava/lang/String;
    .end local v2    # "formatName":Ljava/lang/String;
    .end local v3    # "rawBytes":[B
    .end local v4    # "orientation":Ljava/lang/Integer;
    .end local v5    # "errorCorrectionLevel":Ljava/lang/String;
    .end local v6    # "intentOrientation":I
    :goto_30
    return-object v0

    .line 288
    .restart local v1    # "contents":Ljava/lang/String;
    .restart local v2    # "formatName":Ljava/lang/String;
    .restart local v3    # "rawBytes":[B
    .restart local v6    # "intentOrientation":I
    :cond_31
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_25

    .line 296
    .end local v1    # "contents":Ljava/lang/String;
    .end local v2    # "formatName":Ljava/lang/String;
    .end local v3    # "rawBytes":[B
    .end local v6    # "intentOrientation":I
    :cond_36
    new-instance v0, Lcom/google/zxing/integration/android/IntentResult;

    invoke-direct {v0}, Lcom/google/zxing/integration/android/IntentResult;-><init>()V

    goto :goto_30

    :cond_3c
    move-object v0, v4

    .line 298
    goto :goto_30
.end method


# virtual methods
.method public final addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    return-object p0
.end method

.method public createScanIntent()Landroid/content/Intent;
    .registers 7

    .prologue
    .line 202
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->getCaptureActivity()Ljava/lang/Class;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 203
    .local v2, "intentScan":Landroid/content/Intent;
    const-string v4, "com.google.zxing.client.android.SCAN"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 206
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->desiredBarcodeFormats:Ljava/util/Collection;

    if-eqz v4, :cond_43

    .line 208
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .local v3, "joinedByComma":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->desiredBarcodeFormats:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 210
    .local v0, "format":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_36

    .line 211
    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 213
    :cond_36
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 215
    .end local v0    # "format":Ljava/lang/String;
    :cond_3a
    const-string v4, "SCAN_FORMATS"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 218
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "joinedByComma":Ljava/lang/StringBuilder;
    :cond_43
    const/high16 v4, 0x4000000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 219
    const/high16 v4, 0x80000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 220
    invoke-direct {p0, v2}, Lcom/google/zxing/integration/android/IntentIntegrator;->attachMoreExtras(Landroid/content/Intent;)V

    .line 221
    return-object v2
.end method

.method public getCaptureActivity()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->captureActivity:Ljava/lang/Class;

    if-nez v0, :cond_a

    .line 84
    invoke-virtual {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->getDefaultCaptureActivity()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->captureActivity:Ljava/lang/Class;

    .line 86
    :cond_a
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->captureActivity:Ljava/lang/Class;

    return-object v0
.end method

.method protected getDefaultCaptureActivity()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 73
    const-class v0, Lcom/journeyapps/barcodescanner/CaptureActivity;

    return-object v0
.end method

.method public getMoreExtras()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    return-object v0
.end method

.method public final initiateScan()V
    .registers 3

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->createScanIntent()Landroid/content/Intent;

    move-result-object v0

    const v1, 0xc0de

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->startActivityForResult(Landroid/content/Intent;I)V

    .line 194
    return-void
.end method

.method public final initiateScan(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 232
    .local p1, "desiredBarcodeFormats":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-virtual {p0, p1}, Lcom/google/zxing/integration/android/IntentIntegrator;->setDesiredBarcodeFormats(Ljava/util/Collection;)Lcom/google/zxing/integration/android/IntentIntegrator;

    .line 233
    invoke-virtual {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->initiateScan()V

    .line 234
    return-void
.end method

.method public setBeepEnabled(Z)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 174
    const-string v0, "BEEP_ENABLED"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/zxing/integration/android/IntentIntegrator;

    .line 175
    return-object p0
.end method

.method public setCameraId(I)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 4
    .param p1, "cameraId"    # I

    .prologue
    .line 161
    if-ltz p1, :cond_b

    .line 162
    const-string v0, "SCAN_CAMERA_ID"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/zxing/integration/android/IntentIntegrator;

    .line 164
    :cond_b
    return-object p0
.end method

.method public setCaptureActivity(Ljava/lang/Class;)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/google/zxing/integration/android/IntentIntegrator;"
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "captureActivity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->captureActivity:Ljava/lang/Class;

    .line 97
    return-object p0
.end method

.method public setDesiredBarcodeFormats(Ljava/util/Collection;)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/zxing/integration/android/IntentIntegrator;"
        }
    .end annotation

    .prologue
    .line 185
    .local p1, "desiredBarcodeFormats":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->desiredBarcodeFormats:Ljava/util/Collection;

    .line 186
    return-object p0
.end method

.method public setOrientationLocked(Z)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 4
    .param p1, "locked"    # Z

    .prologue
    .line 150
    const-string v0, "SCAN_ORIENTATION_LOCKED"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/zxing/integration/android/IntentIntegrator;

    .line 151
    return-object p0
.end method

.method public final setPrompt(Ljava/lang/String;)Lcom/google/zxing/integration/android/IntentIntegrator;
    .registers 3
    .param p1, "prompt"    # Ljava/lang/String;

    .prologue
    .line 138
    if-eqz p1, :cond_7

    .line 139
    const-string v0, "PROMPT_MESSAGE"

    invoke-virtual {p0, v0, p1}, Lcom/google/zxing/integration/android/IntentIntegrator;->addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/zxing/integration/android/IntentIntegrator;

    .line 141
    :cond_7
    return-object p0
.end method

.method protected startActivity(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 259
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    if-eqz v0, :cond_10

    .line 260
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_f

    .line 261
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    invoke-virtual {v0, p1}, Landroid/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 268
    :cond_f
    :goto_f
    return-void

    .line 263
    :cond_10
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->supportFragment:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_1a

    .line 264
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->supportFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0, p1}, Landroid/support/v4/app/Fragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_f

    .line 266
    :cond_1a
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_f
.end method

.method protected startActivityForResult(Landroid/content/Intent;I)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "code"    # I

    .prologue
    .line 246
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    if-eqz v0, :cond_10

    .line 247
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_f

    .line 248
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    invoke-virtual {v0, p1, p2}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 255
    :cond_f
    :goto_f
    return-void

    .line 250
    :cond_10
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->supportFragment:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_1a

    .line 251
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->supportFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_f

    .line 253
    :cond_1a
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_f
.end method

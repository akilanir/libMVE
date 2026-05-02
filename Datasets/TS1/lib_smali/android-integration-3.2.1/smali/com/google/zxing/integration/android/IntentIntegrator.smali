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

.field private static final BSPLUS_PACKAGE:Ljava/lang/String; = "com.srowen.bs.android"

.field private static final BS_PACKAGE:Ljava/lang/String; = "com.google.zxing.client.android"

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

.field public static final DEFAULT_MESSAGE:Ljava/lang/String; = "This application requires Barcode Scanner. Would you like to install it?"

.field public static final DEFAULT_NO:Ljava/lang/String; = "No"

.field public static final DEFAULT_TITLE:Ljava/lang/String; = "Install Barcode Scanner?"

.field public static final DEFAULT_YES:Ljava/lang/String; = "Yes"

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

.field public static final TARGET_ALL_KNOWN:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TARGET_BARCODE_SCANNER_ONLY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final activity:Landroid/app/Activity;

.field private buttonNo:Ljava/lang/String;

.field private buttonYes:Ljava/lang/String;

.field private final fragment:Landroid/app/Fragment;

.field private message:Ljava/lang/String;

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

.field private targetApplications:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v2, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 113
    const-class v0, Lcom/google/zxing/integration/android/IntentIntegrator;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->TAG:Ljava/lang/String;

    .line 125
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "UPC_A"

    aput-object v1, v0, v3

    const-string v1, "UPC_E"

    aput-object v1, v0, v4

    const-string v1, "EAN_8"

    aput-object v1, v0, v5

    const-string v1, "EAN_13"

    aput-object v1, v0, v6

    const-string v1, "RSS_14"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->list([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->PRODUCT_CODE_TYPES:Ljava/util/Collection;

    .line 126
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "UPC_A"

    aput-object v1, v0, v3

    const-string v1, "UPC_E"

    aput-object v1, v0, v4

    const-string v1, "EAN_8"

    aput-object v1, v0, v5

    const-string v1, "EAN_13"

    aput-object v1, v0, v6

    const-string v1, "CODE_39"

    aput-object v1, v0, v2

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

    .line 127
    invoke-static {v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->list([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->ONE_D_CODE_TYPES:Ljava/util/Collection;

    .line 129
    const-string v0, "QR_CODE"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->QR_CODE_TYPES:Ljava/util/Collection;

    .line 130
    const-string v0, "DATA_MATRIX"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->DATA_MATRIX_TYPES:Ljava/util/Collection;

    .line 132
    const/4 v0, 0x0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->ALL_CODE_TYPES:Ljava/util/Collection;

    .line 134
    const-string v0, "com.google.zxing.client.android"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->TARGET_BARCODE_SCANNER_ONLY:Ljava/util/List;

    .line 135
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "com.srowen.bs.android"

    aput-object v1, v0, v3

    const-string v1, "com.srowen.bs.android.simple"

    aput-object v1, v0, v4

    const-string v1, "com.google.zxing.client.android"

    aput-object v1, v0, v5

    invoke-static {v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->list([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->TARGET_ALL_KNOWN:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    .line 156
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    .line 157
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    .line 158
    invoke-direct {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->initializeConfiguration()V

    .line 159
    return-void
.end method

.method public constructor <init>(Landroid/app/Fragment;)V
    .registers 4
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    .line 167
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    .line 168
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    .line 169
    invoke-direct {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->initializeConfiguration()V

    .line 170
    return-void
.end method

.method static synthetic access$000(Lcom/google/zxing/integration/android/IntentIntegrator;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/google/zxing/integration/android/IntentIntegrator;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/zxing/integration/android/IntentIntegrator;)Landroid/app/Fragment;
    .registers 2
    .param p0, "x0"    # Lcom/google/zxing/integration/android/IntentIntegrator;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/zxing/integration/android/IntentIntegrator;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lcom/google/zxing/integration/android/IntentIntegrator;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .registers 1

    .prologue
    .line 110
    sget-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private attachMoreExtras(Landroid/content/Intent;)V
    .registers 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 484
    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_64

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 485
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 486
    .local v1, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 488
    .local v2, "value":Ljava/lang/Object;
    instance-of v4, v2, Ljava/lang/Integer;

    if-eqz v4, :cond_2a

    .line 489
    check-cast v2, Ljava/lang/Integer;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 490
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_2a
    instance-of v4, v2, Ljava/lang/Long;

    if-eqz v4, :cond_34

    .line 491
    check-cast v2, Ljava/lang/Long;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 492
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_34
    instance-of v4, v2, Ljava/lang/Boolean;

    if-eqz v4, :cond_3e

    .line 493
    check-cast v2, Ljava/lang/Boolean;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 494
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_3e
    instance-of v4, v2, Ljava/lang/Double;

    if-eqz v4, :cond_48

    .line 495
    check-cast v2, Ljava/lang/Double;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 496
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_48
    instance-of v4, v2, Ljava/lang/Float;

    if-eqz v4, :cond_52

    .line 497
    check-cast v2, Ljava/lang/Float;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_a

    .line 498
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_52
    instance-of v4, v2, Landroid/os/Bundle;

    if-eqz v4, :cond_5c

    .line 499
    check-cast v2, Landroid/os/Bundle;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_a

    .line 501
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_5c
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_a

    .line 504
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_64
    return-void
.end method

.method private static contains(Ljava/lang/Iterable;Ljava/lang/String;)Z
    .registers 6
    .param p1, "targetApp"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 360
    .local p0, "availableApps":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 361
    .local v0, "availableApp":Landroid/content/pm/ResolveInfo;
    iget-object v3, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 362
    .local v1, "packageName":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 363
    const/4 v2, 0x1

    .line 366
    .end local v0    # "availableApp":Landroid/content/pm/ResolveInfo;
    .end local v1    # "packageName":Ljava/lang/String;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method private findTargetAppPackage(Landroid/content/Intent;)Ljava/lang/String;
    .registers 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 347
    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 348
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/high16 v3, 0x10000

    invoke-virtual {v1, p1, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 349
    .local v0, "availableApps":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v0, :cond_27

    .line 350
    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 351
    .local v2, "targetApp":Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/google/zxing/integration/android/IntentIntegrator;->contains(Ljava/lang/Iterable;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 356
    .end local v2    # "targetApp":Ljava/lang/String;
    :goto_26
    return-object v2

    :cond_27
    const/4 v2, 0x0

    goto :goto_26
.end method

.method private initializeConfiguration()V
    .registers 2

    .prologue
    .line 173
    const-string v0, "Install Barcode Scanner?"

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->title:Ljava/lang/String;

    .line 174
    const-string v0, "This application requires Barcode Scanner. Would you like to install it?"

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->message:Ljava/lang/String;

    .line 175
    const-string v0, "Yes"

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonYes:Ljava/lang/String;

    .line 176
    const-string v0, "No"

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonNo:Ljava/lang/String;

    .line 177
    sget-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->TARGET_ALL_KNOWN:Ljava/util/List;

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;

    .line 178
    return-void
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
    .line 480
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

    .line 416
    const v0, 0xc0de

    if-ne p0, v0, :cond_3c

    .line 417
    const/4 v0, -0x1

    if-ne p1, v0, :cond_36

    .line 418
    const-string v0, "SCAN_RESULT"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 419
    .local v1, "contents":Ljava/lang/String;
    const-string v0, "SCAN_RESULT_FORMAT"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 420
    .local v2, "formatName":Ljava/lang/String;
    const-string v0, "SCAN_RESULT_BYTES"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v3

    .line 421
    .local v3, "rawBytes":[B
    const-string v0, "SCAN_RESULT_ORIENTATION"

    invoke-virtual {p2, v0, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 422
    .local v6, "intentOrientation":I
    if-ne v6, v7, :cond_31

    .line 423
    .local v4, "orientation":Ljava/lang/Integer;
    :goto_25
    const-string v0, "SCAN_RESULT_ERROR_CORRECTION_LEVEL"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 424
    .local v5, "errorCorrectionLevel":Ljava/lang/String;
    new-instance v0, Lcom/google/zxing/integration/android/IntentResult;

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/integration/android/IntentResult;-><init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Integer;Ljava/lang/String;)V

    .line 432
    .end local v1    # "contents":Ljava/lang/String;
    .end local v2    # "formatName":Ljava/lang/String;
    .end local v3    # "rawBytes":[B
    .end local v4    # "orientation":Ljava/lang/Integer;
    .end local v5    # "errorCorrectionLevel":Ljava/lang/String;
    .end local v6    # "intentOrientation":I
    :goto_30
    return-object v0

    .line 422
    .restart local v1    # "contents":Ljava/lang/String;
    .restart local v2    # "formatName":Ljava/lang/String;
    .restart local v3    # "rawBytes":[B
    .restart local v6    # "intentOrientation":I
    :cond_31
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_25

    .line 430
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

    .line 432
    goto :goto_30
.end method

.method private showDownloadDialog()Landroid/app/AlertDialog;
    .registers 4

    .prologue
    .line 370
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 371
    .local v0, "downloadDialog":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 372
    iget-object v1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 373
    iget-object v1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonYes:Ljava/lang/String;

    new-instance v2, Lcom/google/zxing/integration/android/IntentIntegrator$1;

    invoke-direct {v2, p0}, Lcom/google/zxing/integration/android/IntentIntegrator$1;-><init>(Lcom/google/zxing/integration/android/IntentIntegrator;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 398
    iget-object v1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonNo:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 399
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 400
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public final addExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 248
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    return-void
.end method

.method public getButtonNo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonNo:Ljava/lang/String;

    return-object v0
.end method

.method public getButtonYes()Ljava/lang/String;
    .registers 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonYes:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->message:Ljava/lang/String;

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
    .line 244
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->moreExtras:Ljava/util/Map;

    return-object v0
.end method

.method public getTargetApplications()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->title:Ljava/lang/String;

    return-object v0
.end method

.method public final initiateScan()Landroid/app/AlertDialog;
    .registers 3

    .prologue
    .line 258
    sget-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->ALL_CODE_TYPES:Ljava/util/Collection;

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->initiateScan(Ljava/util/Collection;I)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public final initiateScan(I)Landroid/app/AlertDialog;
    .registers 3
    .param p1, "cameraId"    # I

    .prologue
    .line 269
    sget-object v0, Lcom/google/zxing/integration/android/IntentIntegrator;->ALL_CODE_TYPES:Ljava/util/Collection;

    invoke-virtual {p0, v0, p1}, Lcom/google/zxing/integration/android/IntentIntegrator;->initiateScan(Ljava/util/Collection;I)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public final initiateScan(Ljava/util/Collection;)Landroid/app/AlertDialog;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/app/AlertDialog;"
        }
    .end annotation

    .prologue
    .line 282
    .local p1, "desiredBarcodeFormats":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->initiateScan(Ljava/util/Collection;I)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public final initiateScan(Ljava/util/Collection;I)Landroid/app/AlertDialog;
    .registers 9
    .param p2, "cameraId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;I)",
            "Landroid/app/AlertDialog;"
        }
    .end annotation

    .prologue
    .line 296
    .local p1, "desiredBarcodeFormats":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.google.zxing.client.android.SCAN"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 297
    .local v1, "intentScan":Landroid/content/Intent;
    const-string v4, "android.intent.category.DEFAULT"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 300
    if-eqz p1, :cond_3b

    .line 302
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 303
    .local v2, "joinedByComma":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_17
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_32

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 304
    .local v0, "format":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2e

    .line 305
    const/16 v5, 0x2c

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    :cond_2e
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17

    .line 309
    .end local v0    # "format":Ljava/lang/String;
    :cond_32
    const-string v4, "SCAN_FORMATS"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 313
    .end local v2    # "joinedByComma":Ljava/lang/StringBuilder;
    :cond_3b
    if-ltz p2, :cond_42

    .line 314
    const-string v4, "SCAN_CAMERA_ID"

    invoke-virtual {v1, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 317
    :cond_42
    invoke-direct {p0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->findTargetAppPackage(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    .line 318
    .local v3, "targetAppPackage":Ljava/lang/String;
    if-nez v3, :cond_4d

    .line 319
    invoke-direct {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->showDownloadDialog()Landroid/app/AlertDialog;

    move-result-object v4

    .line 326
    :goto_4c
    return-object v4

    .line 321
    :cond_4d
    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 322
    const/high16 v4, 0x4000000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 323
    const/high16 v4, 0x80000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 324
    invoke-direct {p0, v1}, Lcom/google/zxing/integration/android/IntentIntegrator;->attachMoreExtras(Landroid/content/Intent;)V

    .line 325
    const v4, 0xc0de

    invoke-virtual {p0, v1, v4}, Lcom/google/zxing/integration/android/IntentIntegrator;->startActivityForResult(Landroid/content/Intent;I)V

    .line 326
    const/4 v4, 0x0

    goto :goto_4c
.end method

.method public setButtonNo(Ljava/lang/String;)V
    .registers 2
    .param p1, "buttonNo"    # Ljava/lang/String;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonNo:Ljava/lang/String;

    .line 222
    return-void
.end method

.method public setButtonNoByID(I)V
    .registers 3
    .param p1, "buttonNoID"    # I

    .prologue
    .line 225
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonNo:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setButtonYes(Ljava/lang/String;)V
    .registers 2
    .param p1, "buttonYes"    # Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonYes:Ljava/lang/String;

    .line 210
    return-void
.end method

.method public setButtonYesByID(I)V
    .registers 3
    .param p1, "buttonYesID"    # I

    .prologue
    .line 213
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->buttonYes:Ljava/lang/String;

    .line 214
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 197
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->message:Ljava/lang/String;

    .line 198
    return-void
.end method

.method public setMessageByID(I)V
    .registers 3
    .param p1, "messageID"    # I

    .prologue
    .line 201
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->message:Ljava/lang/String;

    .line 202
    return-void
.end method

.method public setSingleTargetApplication(Ljava/lang/String;)V
    .registers 3
    .param p1, "targetApplication"    # Ljava/lang/String;

    .prologue
    .line 240
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;

    .line 241
    return-void
.end method

.method public final setTargetApplications(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 233
    .local p1, "targetApplications":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 234
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No target applications"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 236
    :cond_e
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->targetApplications:Ljava/util/List;

    .line 237
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 185
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->title:Ljava/lang/String;

    .line 186
    return-void
.end method

.method public setTitleByID(I)V
    .registers 3
    .param p1, "titleID"    # I

    .prologue
    .line 189
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->title:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public final shareText(Ljava/lang/CharSequence;)Landroid/app/AlertDialog;
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 445
    const-string v0, "TEXT_TYPE"

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->shareText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method public final shareText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;
    .registers 6
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Ljava/lang/CharSequence;

    .prologue
    .line 458
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 459
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 460
    const-string v2, "com.google.zxing.client.android.ENCODE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 461
    const-string v2, "ENCODE_TYPE"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 462
    const-string v2, "ENCODE_DATA"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 463
    invoke-direct {p0, v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->findTargetAppPackage(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    .line 464
    .local v1, "targetAppPackage":Ljava/lang/String;
    if-nez v1, :cond_24

    .line 465
    invoke-direct {p0}, Lcom/google/zxing/integration/android/IntentIntegrator;->showDownloadDialog()Landroid/app/AlertDialog;

    move-result-object v2

    .line 476
    :goto_23
    return-object v2

    .line 467
    :cond_24
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 468
    const/high16 v2, 0x4000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 469
    const/high16 v2, 0x80000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 470
    invoke-direct {p0, v0}, Lcom/google/zxing/integration/android/IntentIntegrator;->attachMoreExtras(Landroid/content/Intent;)V

    .line 471
    iget-object v2, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    if-nez v2, :cond_3f

    .line 472
    iget-object v2, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 476
    :goto_3d
    const/4 v2, 0x0

    goto :goto_23

    .line 474
    :cond_3f
    iget-object v2, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    invoke-virtual {v2, v0}, Landroid/app/Fragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_3d
.end method

.method protected startActivityForResult(Landroid/content/Intent;I)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "code"    # I

    .prologue
    .line 339
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    if-nez v0, :cond_a

    .line 340
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 344
    :goto_9
    return-void

    .line 342
    :cond_a
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentIntegrator;->fragment:Landroid/app/Fragment;

    invoke-virtual {v0, p1, p2}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_9
.end method

.class public final Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;
.super Ljava/lang/Object;
.source "CameraConfigurationUtils.java"


# static fields
.field private static final AREA_PER_1000:I = 0x190

.field private static final MAX_EXPOSURE_COMPENSATION:F = 1.5f

.field private static final MAX_FPS:I = 0x14

.field private static final MIN_EXPOSURE_COMPENSATION:F = 0.0f

.field private static final MIN_FPS:I = 0xa

.field private static final SEMICOLON:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "CameraConfiguration"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    const-string v0, ";"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->SEMICOLON:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method private static buildMiddleArea(I)Ljava/util/List;
    .registers 5
    .param p0, "areaPer1000"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation

    .prologue
    .line 191
    new-instance v0, Landroid/hardware/Camera$Area;

    new-instance v1, Landroid/graphics/Rect;

    neg-int v2, p0

    neg-int v3, p0

    invoke-direct {v1, v2, v3, p0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static collectStats(Landroid/hardware/Camera$Parameters;)Ljava/lang/String;
    .registers 2
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 321
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->collectStats(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static collectStats(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 11
    .param p0, "flattenedParams"    # Ljava/lang/CharSequence;

    .prologue
    const/16 v9, 0xa

    .line 325
    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x3e8

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 327
    .local v5, "result":Ljava/lang/StringBuilder;
    const-string v6, "BOARD="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->BOARD:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 328
    const-string v6, "BRAND="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 329
    const-string v6, "CPU_ABI="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 330
    const-string v6, "DEVICE="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 331
    const-string v6, "DISPLAY="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 332
    const-string v6, "FINGERPRINT="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 333
    const-string v6, "HOST="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->HOST:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 334
    const-string v6, "ID="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 335
    const-string v6, "MANUFACTURER="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 336
    const-string v6, "MODEL="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 337
    const-string v6, "PRODUCT="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 338
    const-string v6, "TAGS="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->TAGS:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 339
    const-string v6, "TIME="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-wide v7, Landroid/os/Build;->TIME:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 340
    const-string v6, "TYPE="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 341
    const-string v6, "USER="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->USER:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 342
    const-string v6, "VERSION.CODENAME="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 343
    const-string v6, "VERSION.INCREMENTAL="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 344
    const-string v6, "VERSION.RELEASE="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    const-string v6, "VERSION.SDK_INT="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 347
    if-eqz p0, :cond_142

    .line 348
    sget-object v6, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->SEMICOLON:Ljava/util/regex/Pattern;

    invoke-virtual {v6, p0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    .line 349
    .local v4, "params":[Ljava/lang/String;
    invoke-static {v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 350
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_134
    if-ge v1, v2, :cond_142

    aget-object v3, v0, v1

    .line 351
    .local v3, "param":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    add-int/lit8 v1, v1, 0x1

    goto :goto_134

    .line 355
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "param":Ljava/lang/String;
    .end local v4    # "params":[Ljava/lang/String;
    :cond_142
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method private static varargs findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "name"    # Ljava/lang/String;
    .param p2, "desiredValues"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 277
    .local p1, "supportedValues":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string v4, "CameraConfiguration"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Requesting "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " value from among: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    const-string v4, "CameraConfiguration"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Supported "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " values: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    if-eqz p1, :cond_7d

    .line 280
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_4d
    if-ge v2, v3, :cond_7d

    aget-object v1, v0, v2

    .line 281
    .local v1, "desiredValue":Ljava/lang/String;
    invoke-interface {p1, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7a

    .line 282
    const-string v4, "CameraConfiguration"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can set "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "desiredValue":Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :goto_79
    return-object v1

    .line 280
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "desiredValue":Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    :cond_7a
    add-int/lit8 v2, v2, 0x1

    goto :goto_4d

    .line 287
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "desiredValue":Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_7d
    const-string v4, "CameraConfiguration"

    const-string v5, "No supported values match"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    const/4 v1, 0x0

    goto :goto_79
.end method

.method private static indexOfClosestZoom(Landroid/hardware/Camera$Parameters;D)Ljava/lang/Integer;
    .registers 20
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "targetZoomRatio"    # D

    .prologue
    .line 240
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    move-result-object v5

    .line 241
    .local v5, "ratios":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const-string v10, "CameraConfiguration"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Zoom ratios: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    invoke-virtual/range {p0 .. p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v4

    .line 243
    .local v4, "maxZoom":I
    if-eqz v5, :cond_30

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_30

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v11, v4, 0x1

    if-eq v10, v11, :cond_39

    .line 244
    :cond_30
    const-string v10, "CameraConfiguration"

    const-string v11, "Invalid zoom ratios!"

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    const/4 v10, 0x0

    .line 258
    :goto_38
    return-object v10

    .line 247
    :cond_39
    const-wide/high16 v10, 0x4059000000000000L    # 100.0

    mul-double v8, v10, p1

    .line 248
    .local v8, "target100":D
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 249
    .local v6, "smallestDiff":D
    const/4 v0, 0x0

    .line 250
    .local v0, "closestIndex":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_41
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v3, v10, :cond_60

    .line 251
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    int-to-double v10, v10

    sub-double/2addr v10, v8

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v1

    .line 252
    .local v1, "diff":D
    cmpg-double v10, v1, v6

    if-gez v10, :cond_5d

    .line 253
    move-wide v6, v1

    .line 254
    move v0, v3

    .line 250
    :cond_5d
    add-int/lit8 v3, v3, 0x1

    goto :goto_41

    .line 257
    .end local v1    # "diff":D
    :cond_60
    const-string v11, "CameraConfiguration"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Chose zoom ratio of "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    int-to-double v13, v10

    const-wide/high16 v15, 0x4059000000000000L    # 100.0

    div-double/2addr v13, v15

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    goto :goto_38
.end method

.method public static setBarcodeSceneMode(Landroid/hardware/Camera$Parameters;)V
    .registers 7
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 210
    const-string v1, "barcode"

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSceneMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 211
    const-string v1, "CameraConfiguration"

    const-string v2, "Barcode scene mode already set"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    :cond_13
    :goto_13
    return-void

    .line 214
    :cond_14
    const-string v1, "scene mode"

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedSceneModes()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "barcode"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "sceneMode":Ljava/lang/String;
    if-eqz v0, :cond_13

    .line 218
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setSceneMode(Ljava/lang/String;)V

    goto :goto_13
.end method

.method public static setBestExposure(Landroid/hardware/Camera$Parameters;Z)V
    .registers 11
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "lightOn"    # Z

    .prologue
    const/4 v5, 0x0

    .line 111
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMinExposureCompensation()I

    move-result v3

    .line 112
    .local v3, "minExposure":I
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxExposureCompensation()I

    move-result v2

    .line 113
    .local v2, "maxExposure":I
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getExposureCompensationStep()F

    move-result v4

    .line 114
    .local v4, "step":F
    if-nez v3, :cond_11

    if-eqz v2, :cond_7a

    :cond_11
    cmpl-float v6, v4, v5

    if-lez v6, :cond_7a

    .line 116
    if-eqz p1, :cond_51

    .line 117
    .local v5, "targetCompensation":F
    :goto_17
    div-float v6, v5, v4

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 118
    .local v1, "compensationSteps":I
    int-to-float v6, v1

    mul-float v0, v4, v6

    .line 120
    .local v0, "actualCompensation":F
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 121
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getExposureCompensation()I

    move-result v6

    if-ne v6, v1, :cond_54

    .line 122
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exposure compensation already set to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " / "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .end local v0    # "actualCompensation":F
    .end local v1    # "compensationSteps":I
    .end local v5    # "targetCompensation":F
    :goto_50
    return-void

    .line 116
    :cond_51
    const/high16 v5, 0x3fc00000    # 1.5f

    goto :goto_17

    .line 124
    .restart local v0    # "actualCompensation":F
    .restart local v1    # "compensationSteps":I
    .restart local v5    # "targetCompensation":F
    :cond_54
    const-string v6, "CameraConfiguration"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Setting exposure compensation to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " / "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    goto :goto_50

    .line 128
    .end local v0    # "actualCompensation":F
    .end local v1    # "compensationSteps":I
    .end local v5    # "targetCompensation":F
    :cond_7a
    const-string v6, "CameraConfiguration"

    const-string v7, "Camera does not support exposure compensation"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_50
.end method

.method public static setBestPreviewFPS(Landroid/hardware/Camera$Parameters;)V
    .registers 3
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 133
    const/16 v0, 0xa

    const/16 v1, 0x14

    invoke-static {p0, v0, v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->setBestPreviewFPS(Landroid/hardware/Camera$Parameters;II)V

    .line 134
    return-void
.end method

.method public static setBestPreviewFPS(Landroid/hardware/Camera$Parameters;II)V
    .registers 15
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "minFPS"    # I
    .param p2, "maxFPS"    # I

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 137
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v4

    .line 138
    .local v4, "supportedPreviewFpsRanges":Ljava/util/List;, "Ljava/util/List<[I>;"
    const-string v7, "CameraConfiguration"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Supported FPS ranges: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v4}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    if-eqz v4, :cond_51

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_51

    .line 140
    const/4 v3, 0x0

    .line 141
    .local v3, "suitableFPSRange":[I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_48

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 142
    .local v1, "fpsRange":[I
    aget v6, v1, v10

    .line 143
    .local v6, "thisMin":I
    aget v5, v1, v11

    .line 144
    .local v5, "thisMax":I
    mul-int/lit16 v7, p1, 0x3e8

    if-lt v6, v7, :cond_2f

    mul-int/lit16 v7, p2, 0x3e8

    if-gt v5, v7, :cond_2f

    .line 145
    move-object v3, v1

    .line 149
    .end local v1    # "fpsRange":[I
    .end local v5    # "thisMax":I
    .end local v6    # "thisMin":I
    :cond_48
    if-nez v3, :cond_52

    .line 150
    const-string v7, "CameraConfiguration"

    const-string v8, "No suitable FPS range?"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "suitableFPSRange":[I
    :cond_51
    :goto_51
    return-void

    .line 152
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "suitableFPSRange":[I
    :cond_52
    const/4 v7, 0x2

    new-array v0, v7, [I

    .line 153
    .local v0, "currentFpsRange":[I
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    .line 154
    invoke-static {v0, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v7

    if-eqz v7, :cond_7b

    .line 155
    const-string v7, "CameraConfiguration"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "FPS range already set to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_51

    .line 157
    :cond_7b
    const-string v7, "CameraConfiguration"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Setting FPS range to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    aget v7, v3, v10

    aget v8, v3, v11

    invoke-virtual {p0, v7, v8}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    goto :goto_51
.end method

.method public static setFocus(Landroid/hardware/Camera$Parameters;ZZZ)V
    .registers 12
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "autoFocus"    # Z
    .param p2, "disableContinuous"    # Z
    .param p3, "safeMode"    # Z

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 56
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v1

    .line 57
    .local v1, "supportedFocusModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 58
    .local v0, "focusMode":Ljava/lang/String;
    if-eqz p1, :cond_1a

    .line 59
    if-nez p3, :cond_e

    if-eqz p2, :cond_53

    .line 60
    :cond_e
    const-string v2, "focus mode"

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "auto"

    aput-object v4, v3, v5

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    :cond_1a
    :goto_1a
    if-nez p3, :cond_2e

    if-nez v0, :cond_2e

    .line 73
    const-string v2, "focus mode"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "macro"

    aput-object v4, v3, v5

    const-string v4, "edof"

    aput-object v4, v3, v6

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 78
    :cond_2e
    if-eqz v0, :cond_52

    .line 79
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_69

    .line 80
    const-string v2, "CameraConfiguration"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Focus mode already set to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :cond_52
    :goto_52
    return-void

    .line 64
    :cond_53
    const-string v2, "focus mode"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "continuous-picture"

    aput-object v4, v3, v5

    const-string v4, "continuous-video"

    aput-object v4, v3, v6

    const-string v4, "auto"

    aput-object v4, v3, v7

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1a

    .line 82
    :cond_69
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_52
.end method

.method public static setFocusArea(Landroid/hardware/Camera$Parameters;)V
    .registers 5
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .prologue
    .line 167
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I

    move-result v1

    if-lez v1, :cond_4c

    .line 168
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old focus areas: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFocusAreas()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/16 v1, 0x190

    invoke-static {v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->buildMiddleArea(I)Ljava/util/List;

    move-result-object v0

    .line 170
    .local v0, "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting focus area to : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 175
    .end local v0    # "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    :goto_4b
    return-void

    .line 173
    :cond_4c
    const-string v1, "CameraConfiguration"

    const-string v2, "Device does not support focus areas"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4b
.end method

.method public static setInvertColor(Landroid/hardware/Camera$Parameters;)V
    .registers 7
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 262
    const-string v1, "negative"

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getColorEffect()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 263
    const-string v1, "CameraConfiguration"

    const-string v2, "Negative effect already set"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    :cond_13
    :goto_13
    return-void

    .line 266
    :cond_14
    const-string v1, "color effect"

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedColorEffects()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "negative"

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 269
    .local v0, "colorMode":Ljava/lang/String;
    if-eqz v0, :cond_13

    .line 270
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_13
.end method

.method public static setMetering(Landroid/hardware/Camera$Parameters;)V
    .registers 5
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .prologue
    .line 179
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    move-result v1

    if-lez v1, :cond_48

    .line 180
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old metering areas: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMeteringAreas()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    const/16 v1, 0x190

    invoke-static {v1}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->buildMiddleArea(I)Ljava/util/List;

    move-result-object v0

    .line 182
    .local v0, "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting metering area to : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->toString(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setMeteringAreas(Ljava/util/List;)V

    .line 187
    .end local v0    # "middleArea":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Area;>;"
    :goto_47
    return-void

    .line 185
    :cond_48
    const-string v1, "CameraConfiguration"

    const-string v2, "Device does not support metering areas"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_47
.end method

.method public static setTorch(Landroid/hardware/Camera$Parameters;Z)V
    .registers 9
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "on"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 88
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v1

    .line 90
    .local v1, "supportedFlashModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_3e

    .line 91
    const-string v2, "flash mode"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "torch"

    aput-object v4, v3, v5

    const-string v4, "on"

    aput-object v4, v3, v6

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "flashMode":Ljava/lang/String;
    :goto_19
    if-eqz v0, :cond_3d

    .line 101
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 102
    const-string v2, "CameraConfiguration"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Flash mode already set to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :cond_3d
    :goto_3d
    return-void

    .line 96
    .end local v0    # "flashMode":Ljava/lang/String;
    :cond_3e
    const-string v2, "flash mode"

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "off"

    aput-object v4, v3, v5

    invoke-static {v2, v1, v3}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->findSettableValue(Ljava/lang/String;Ljava/util/Collection;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "flashMode":Ljava/lang/String;
    goto :goto_19

    .line 104
    :cond_4b
    const-string v2, "CameraConfiguration"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting flash mode to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_3d
.end method

.method public static setVideoStabilization(Landroid/hardware/Camera$Parameters;)V
    .registers 3
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .prologue
    .line 197
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 198
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getVideoStabilization()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 199
    const-string v0, "CameraConfiguration"

    const-string v1, "Video stabilization already enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    :goto_13
    return-void

    .line 201
    :cond_14
    const-string v0, "CameraConfiguration"

    const-string v1, "Enabling video stabilization..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    goto :goto_13

    .line 205
    :cond_20
    const-string v0, "CameraConfiguration"

    const-string v1, "This device does not support video stabilization"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13
.end method

.method public static setZoom(Landroid/hardware/Camera$Parameters;D)V
    .registers 7
    .param p0, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p1, "targetZoomRatio"    # D

    .prologue
    .line 223
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 224
    invoke-static {p0, p1, p2}, Lcom/google/zxing/client/android/camera/CameraConfigurationUtils;->indexOfClosestZoom(Landroid/hardware/Camera$Parameters;D)Ljava/lang/Integer;

    move-result-object v0

    .line 225
    .local v0, "zoom":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 237
    .end local v0    # "zoom":Ljava/lang/Integer;
    :goto_c
    return-void

    .line 228
    .restart local v0    # "zoom":Ljava/lang/Integer;
    :cond_d
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getZoom()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_30

    .line 229
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Zoom is already set to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 231
    :cond_30
    const-string v1, "CameraConfiguration"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting zoom to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    goto :goto_c

    .line 235
    .end local v0    # "zoom":Ljava/lang/Integer;
    :cond_50
    const-string v1, "CameraConfiguration"

    const-string v2, "Zoom is not supported"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c
.end method

.method private static toString(Ljava/lang/Iterable;)Ljava/lang/String;
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Landroid/hardware/Camera$Area;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 310
    .local p0, "areas":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Landroid/hardware/Camera$Area;>;"
    if-nez p0, :cond_4

    .line 311
    const/4 v3, 0x0

    .line 317
    :goto_3
    return-object v3

    .line 313
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 314
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Area;

    .line 315
    .local v0, "area":Landroid/hardware/Camera$Area;
    iget-object v3, v0, Landroid/hardware/Camera$Area;->rect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Landroid/hardware/Camera$Area;->weight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 317
    .end local v0    # "area":Landroid/hardware/Camera$Area;
    :cond_31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3
.end method

.method private static toString(Ljava/util/Collection;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<[I>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 292
    .local p0, "arrays":Ljava/util/Collection;, "Ljava/util/Collection<[I>;"
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 293
    :cond_8
    const-string v2, "[]"

    .line 305
    :goto_a
    return-object v2

    .line 295
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 296
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/16 v2, 0x5b

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 297
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 298
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<[I>;"
    :cond_19
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 299
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    invoke-static {v2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 301
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 304
    :cond_38
    const/16 v2, 0x5d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 305
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_a
.end method

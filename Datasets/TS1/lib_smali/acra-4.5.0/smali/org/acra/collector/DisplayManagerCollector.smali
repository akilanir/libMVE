.class final Lorg/acra/collector/DisplayManagerCollector;
.super Ljava/lang/Object;
.source "DisplayManagerCollector.java"


# static fields
.field static final mDensities:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final mFlagsNames:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lorg/acra/collector/DisplayManagerCollector;->mFlagsNames:Landroid/util/SparseArray;

    .line 21
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lorg/acra/collector/DisplayManagerCollector;->mDensities:Landroid/util/SparseArray;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static activeFlags(Landroid/util/SparseArray;I)Ljava/lang/String;
    .registers 7
    .param p1, "bitfield"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 281
    .local p0, "valueNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 284
    .local v2, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v0, v4, :cond_2b

    .line 285
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 286
    .local v1, "maskValue":I
    and-int v3, p1, v1

    .line 287
    .local v3, "value":I
    if-lez v3, :cond_28

    .line 288
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_1f

    .line 289
    const/16 v4, 0x2b

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 291
    :cond_1f
    invoke-virtual {p0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 294
    .end local v1    # "maskValue":I
    .end local v3    # "value":I
    :cond_2b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static collectCurrentSizeRange(Landroid/view/Display;)Ljava/lang/String;
    .registers 10
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 172
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .local v2, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getCurrentSizeRange"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/graphics/Point;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Landroid/graphics/Point;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 175
    .local v0, "getCurrentSizeRange":Ljava/lang/reflect/Method;
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .local v3, "smallest":Landroid/graphics/Point;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 176
    .local v1, "largest":Landroid/graphics/Point;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-virtual {v0, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".currentSizeRange.smallest=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v3, Landroid/graphics/Point;->x:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x5d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 179
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".currentSizeRange.largest=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Landroid/graphics/Point;->x:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x5d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_88
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_88} :catch_95
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_88} :catch_93
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_88} :catch_91
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_88} :catch_8f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_88} :catch_8d

    .line 187
    .end local v0    # "getCurrentSizeRange":Ljava/lang/reflect/Method;
    .end local v1    # "largest":Landroid/graphics/Point;
    .end local v3    # "smallest":Landroid/graphics/Point;
    :goto_88
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 185
    :catch_8d
    move-exception v4

    goto :goto_88

    .line 184
    :catch_8f
    move-exception v4

    goto :goto_88

    .line 183
    :catch_91
    move-exception v4

    goto :goto_88

    .line 182
    :catch_93
    move-exception v4

    goto :goto_88

    .line 181
    :catch_95
    move-exception v4

    goto :goto_88
.end method

.method private static collectDisplayData(Landroid/view/Display;)Ljava/lang/Object;
    .registers 6
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    const/16 v4, 0xa

    .line 65
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 66
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .local v1, "result":Ljava/lang/StringBuilder;
    invoke-static {p0}, Lorg/acra/collector/DisplayManagerCollector;->collectCurrentSizeRange(Landroid/view/Display;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-static {p0}, Lorg/acra/collector/DisplayManagerCollector;->collectFlags(Landroid/view/Display;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".height="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/Display;->getHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    const-string v2, "getMetrics"

    invoke-static {p0, v2}, Lorg/acra/collector/DisplayManagerCollector;->collectMetrics(Landroid/view/Display;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    invoke-static {p0}, Lorg/acra/collector/DisplayManagerCollector;->collectName(Landroid/view/Display;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".orientation="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/Display;->getOrientation()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".pixelFormat="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/Display;->getPixelFormat()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 77
    const-string v2, "getRealMetrics"

    invoke-static {p0, v2}, Lorg/acra/collector/DisplayManagerCollector;->collectMetrics(Landroid/view/Display;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    const-string v2, "getRealSize"

    invoke-static {p0, v2}, Lorg/acra/collector/DisplayManagerCollector;->collectSize(Landroid/view/Display;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    invoke-static {p0}, Lorg/acra/collector/DisplayManagerCollector;->collectRectSize(Landroid/view/Display;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".refreshRate="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/Display;->getRefreshRate()F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    invoke-static {p0}, Lorg/acra/collector/DisplayManagerCollector;->collectRotation(Landroid/view/Display;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    const-string v2, "getSize"

    invoke-static {p0, v2}, Lorg/acra/collector/DisplayManagerCollector;->collectSize(Landroid/view/Display;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".width="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/Display;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 84
    invoke-static {p0}, Lorg/acra/collector/DisplayManagerCollector;->collectIsValid(Landroid/view/Display;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static collectDisplays(Landroid/content/Context;)Ljava/lang/String;
    .registers 15
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v13, 0x0

    .line 24
    const/4 v4, 0x0

    .line 25
    .local v4, "displays":[Landroid/view/Display;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .local v9, "result":Ljava/lang/StringBuilder;
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v11

    const/16 v12, 0x11

    if-ge v11, v12, :cond_31

    .line 30
    const-string v11, "window"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/WindowManager;

    .line 32
    .local v10, "windowManager":Landroid/view/WindowManager;
    const/4 v11, 0x1

    new-array v4, v11, [Landroid/view/Display;

    .line 33
    invoke-interface {v10}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v11

    aput-object v11, v4, v13

    .line 57
    .end local v10    # "windowManager":Landroid/view/WindowManager;
    :goto_20
    move-object v1, v4

    .local v1, "arr$":[Landroid/view/Display;
    array-length v8, v1

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_23
    if-ge v7, v8, :cond_a6

    aget-object v2, v1, v7

    .line 58
    .local v2, "display":Landroid/view/Display;
    invoke-static {v2}, Lorg/acra/collector/DisplayManagerCollector;->collectDisplayData(Landroid/view/Display;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    add-int/lit8 v7, v7, 0x1

    goto :goto_23

    .line 38
    .end local v1    # "arr$":[Landroid/view/Display;
    .end local v2    # "display":Landroid/view/Display;
    .end local v7    # "i$":I
    .end local v8    # "len$":I
    :cond_31
    :try_start_31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "DISPLAY_SERVICE"

    invoke-virtual {v11, v12}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    check-cast v11, Ljava/lang/String;

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 40
    .local v3, "displayManager":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "getDisplays"

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Class;

    invoke-virtual {v11, v12, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 41
    .local v6, "getDisplays":Ljava/lang/reflect/Method;
    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v6, v3, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Landroid/view/Display;

    move-object v0, v11

    check-cast v0, [Landroid/view/Display;

    move-object v4, v0
    :try_end_62
    .catch Ljava/lang/IllegalArgumentException; {:try_start_31 .. :try_end_62} :catch_63
    .catch Ljava/lang/SecurityException; {:try_start_31 .. :try_end_62} :catch_6e
    .catch Ljava/lang/IllegalAccessException; {:try_start_31 .. :try_end_62} :catch_79
    .catch Ljava/lang/NoSuchFieldException; {:try_start_31 .. :try_end_62} :catch_84
    .catch Ljava/lang/NoSuchMethodException; {:try_start_31 .. :try_end_62} :catch_8f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_31 .. :try_end_62} :catch_9a

    goto :goto_20

    .line 42
    .end local v3    # "displayManager":Ljava/lang/Object;
    .end local v6    # "getDisplays":Ljava/lang/reflect/Method;
    :catch_63
    move-exception v5

    .line 43
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while collecting DisplayManager data: "

    invoke-interface {v11, v12, v13, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_20

    .line 44
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    :catch_6e
    move-exception v5

    .line 45
    .local v5, "e":Ljava/lang/SecurityException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while collecting DisplayManager data: "

    invoke-interface {v11, v12, v13, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_20

    .line 46
    .end local v5    # "e":Ljava/lang/SecurityException;
    :catch_79
    move-exception v5

    .line 47
    .local v5, "e":Ljava/lang/IllegalAccessException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while collecting DisplayManager data: "

    invoke-interface {v11, v12, v13, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_20

    .line 48
    .end local v5    # "e":Ljava/lang/IllegalAccessException;
    :catch_84
    move-exception v5

    .line 49
    .local v5, "e":Ljava/lang/NoSuchFieldException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while collecting DisplayManager data: "

    invoke-interface {v11, v12, v13, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_20

    .line 50
    .end local v5    # "e":Ljava/lang/NoSuchFieldException;
    :catch_8f
    move-exception v5

    .line 51
    .local v5, "e":Ljava/lang/NoSuchMethodException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while collecting DisplayManager data: "

    invoke-interface {v11, v12, v13, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_20

    .line 52
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    :catch_9a
    move-exception v5

    .line 53
    .local v5, "e":Ljava/lang/reflect/InvocationTargetException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while collecting DisplayManager data: "

    invoke-interface {v11, v12, v13, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_20

    .line 61
    .end local v5    # "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local v1    # "arr$":[Landroid/view/Display;
    .restart local v7    # "i$":I
    .restart local v8    # "len$":I
    :cond_a6
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11
.end method

.method private static collectFlags(Landroid/view/Display;)Ljava/lang/String;
    .registers 11
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 191
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .local v6, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "getFlags"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 194
    .local v3, "getFlags":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 196
    .local v2, "flags":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_29
    if-ge v4, v5, :cond_4a

    aget-object v1, v0, v4

    .line 197
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "FLAG_"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_47

    .line 198
    sget-object v7, Lorg/acra/collector/DisplayManagerCollector;->mFlagsNames:Landroid/util/SparseArray;

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 196
    :cond_47
    add-int/lit8 v4, v4, 0x1

    goto :goto_29

    .line 202
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_4a
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".flags="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lorg/acra/collector/DisplayManagerCollector;->mFlagsNames:Landroid/util/SparseArray;

    invoke-static {v8, v2}, Lorg/acra/collector/DisplayManagerCollector;->activeFlags(Landroid/util/SparseArray;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_67
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_67} :catch_74
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_67} :catch_72
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_67} :catch_70
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_67} :catch_6e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_67} :catch_6c

    .line 210
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "flags":I
    .end local v3    # "getFlags":Ljava/lang/reflect/Method;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :goto_67
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 208
    :catch_6c
    move-exception v7

    goto :goto_67

    .line 207
    :catch_6e
    move-exception v7

    goto :goto_67

    .line 206
    :catch_70
    move-exception v7

    goto :goto_67

    .line 205
    :catch_72
    move-exception v7

    goto :goto_67

    .line 204
    :catch_74
    move-exception v7

    goto :goto_67
.end method

.method private static collectIsValid(Landroid/view/Display;)Ljava/lang/Object;
    .registers 7
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .local v1, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "isValid"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 93
    .local v0, "isValid":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 94
    .local v2, "value":Ljava/lang/Boolean;
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".isValid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_32
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_32} :catch_3f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_32} :catch_3d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_32} :catch_3b
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_32} :catch_39
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_32} :catch_37

    .line 101
    .end local v0    # "isValid":Ljava/lang/reflect/Method;
    .end local v2    # "value":Ljava/lang/Boolean;
    :goto_32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 99
    :catch_37
    move-exception v3

    goto :goto_32

    .line 98
    :catch_39
    move-exception v3

    goto :goto_32

    .line 97
    :catch_3b
    move-exception v3

    goto :goto_32

    .line 96
    :catch_3d
    move-exception v3

    goto :goto_32

    .line 95
    :catch_3f
    move-exception v3

    goto :goto_32
.end method

.method private static collectMetrics(Landroid/view/Display;Ljava/lang/String;)Ljava/lang/Object;
    .registers 12
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 230
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .local v6, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {v7, p1, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 233
    .local v2, "getMetrics":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/DisplayMetrics;

    .line 235
    .local v5, "metrics":Landroid/util/DisplayMetrics;
    const-class v7, Landroid/util/DisplayMetrics;

    invoke-virtual {v7}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_21
    if-ge v3, v4, :cond_5a

    aget-object v1, v0, v3

    .line 236
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Ljava/lang/Integer;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_57

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "DENSITY_"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_57

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "DENSITY_DEFAULT"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_57

    .line 238
    sget-object v7, Lorg/acra/collector/DisplayManagerCollector;->mDensities:Landroid/util/SparseArray;

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v8

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 235
    :cond_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 242
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_5a
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".density="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v5, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 244
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".densityDpi="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "densityDpi"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 246
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "scaledDensity=x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v5, Landroid/util/DisplayMetrics;->scaledDensity:F

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 248
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".widthPixels="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 250
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".heightPixels="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 252
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".xdpi="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v5, Landroid/util/DisplayMetrics;->xdpi:F

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 254
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".ydpi="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v5, Landroid/util/DisplayMetrics;->ydpi:F

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_157
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_157} :catch_166
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_157} :catch_164
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_157} :catch_162
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_157} :catch_160
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_157} :catch_15e
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_157} :catch_15c

    .line 264
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "getMetrics":Ljava/lang/reflect/Method;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "metrics":Landroid/util/DisplayMetrics;
    :goto_157
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 262
    :catch_15c
    move-exception v7

    goto :goto_157

    .line 261
    :catch_15e
    move-exception v7

    goto :goto_157

    .line 260
    :catch_160
    move-exception v7

    goto :goto_157

    .line 259
    :catch_162
    move-exception v7

    goto :goto_157

    .line 258
    :catch_164
    move-exception v7

    goto :goto_157

    .line 257
    :catch_166
    move-exception v7

    goto :goto_157
.end method

.method private static collectName(Landroid/view/Display;)Ljava/lang/String;
    .registers 7
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 214
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .local v2, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getName"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 217
    .local v0, "getName":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 219
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_32
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_32} :catch_3f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_32} :catch_3d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_32} :catch_3b
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_32} :catch_39
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_32} :catch_37

    .line 226
    .end local v0    # "getName":Ljava/lang/reflect/Method;
    .end local v1    # "name":Ljava/lang/String;
    :goto_32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 224
    :catch_37
    move-exception v3

    goto :goto_32

    .line 223
    :catch_39
    move-exception v3

    goto :goto_32

    .line 222
    :catch_3b
    move-exception v3

    goto :goto_32

    .line 221
    :catch_3d
    move-exception v3

    goto :goto_32

    .line 220
    :catch_3f
    move-exception v3

    goto :goto_32
.end method

.method private static collectRectSize(Landroid/view/Display;)Ljava/lang/Object;
    .registers 9
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .local v1, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getRectSize"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/graphics/Rect;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 141
    .local v0, "getRectSize":Ljava/lang/reflect/Method;
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 142
    .local v2, "size":Landroid/graphics/Rect;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".rectSize=["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_6c
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_6c} :catch_79
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_6c} :catch_77
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_6c} :catch_75
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_6c} :catch_73
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_6c} :catch_71

    .line 151
    .end local v0    # "getRectSize":Ljava/lang/reflect/Method;
    .end local v2    # "size":Landroid/graphics/Rect;
    :goto_6c
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 149
    :catch_71
    move-exception v3

    goto :goto_6c

    .line 148
    :catch_73
    move-exception v3

    goto :goto_6c

    .line 147
    :catch_75
    move-exception v3

    goto :goto_6c

    .line 146
    :catch_77
    move-exception v3

    goto :goto_6c

    .line 145
    :catch_79
    move-exception v3

    goto :goto_6c
.end method

.method private static collectRotation(Landroid/view/Display;)Ljava/lang/Object;
    .registers 7
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .local v1, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getRotation"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 108
    .local v0, "getRotation":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 109
    .local v2, "rotation":I
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".rotation="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    packed-switch v2, :pswitch_data_5e

    .line 124
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    :goto_32
    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_37
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_37} :catch_42
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_37} :catch_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_37} :catch_52
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_37} :catch_5a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_37} :catch_5c

    .line 134
    .end local v0    # "getRotation":Ljava/lang/reflect/Method;
    .end local v2    # "rotation":I
    :goto_37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 112
    .restart local v0    # "getRotation":Ljava/lang/reflect/Method;
    .restart local v2    # "rotation":I
    :pswitch_3c
    :try_start_3c
    const-string v3, "ROTATION_0"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 128
    .end local v0    # "getRotation":Ljava/lang/reflect/Method;
    .end local v2    # "rotation":I
    :catch_42
    move-exception v3

    goto :goto_37

    .line 115
    .restart local v0    # "getRotation":Ljava/lang/reflect/Method;
    .restart local v2    # "rotation":I
    :pswitch_44
    const-string v3, "ROTATION_90"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 129
    .end local v0    # "getRotation":Ljava/lang/reflect/Method;
    .end local v2    # "rotation":I
    :catch_4a
    move-exception v3

    goto :goto_37

    .line 118
    .restart local v0    # "getRotation":Ljava/lang/reflect/Method;
    .restart local v2    # "rotation":I
    :pswitch_4c
    const-string v3, "ROTATION_180"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 130
    .end local v0    # "getRotation":Ljava/lang/reflect/Method;
    .end local v2    # "rotation":I
    :catch_52
    move-exception v3

    goto :goto_37

    .line 121
    .restart local v0    # "getRotation":Ljava/lang/reflect/Method;
    .restart local v2    # "rotation":I
    :pswitch_54
    const-string v3, "ROTATION_270"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_59
    .catch Ljava/lang/SecurityException; {:try_start_3c .. :try_end_59} :catch_42
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3c .. :try_end_59} :catch_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3c .. :try_end_59} :catch_52
    .catch Ljava/lang/IllegalAccessException; {:try_start_3c .. :try_end_59} :catch_5a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3c .. :try_end_59} :catch_5c

    goto :goto_32

    .line 131
    .end local v0    # "getRotation":Ljava/lang/reflect/Method;
    .end local v2    # "rotation":I
    :catch_5a
    move-exception v3

    goto :goto_37

    .line 132
    :catch_5c
    move-exception v3

    goto :goto_37

    .line 110
    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_44
        :pswitch_4c
        :pswitch_54
    .end packed-switch
.end method

.method private static collectSize(Landroid/view/Display;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 157
    .local v1, "result":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/graphics/Point;

    aput-object v6, v4, v5

    invoke-virtual {v3, p1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 158
    .local v0, "getRealSize":Ljava/lang/reflect/Method;
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 159
    .local v2, "size":Landroid/graphics/Point;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "=["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/graphics/Point;->x:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_58
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_58} :catch_65
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_58} :catch_63
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_58} :catch_61
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_58} :catch_5f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_58} :catch_5d

    .line 168
    .end local v0    # "getRealSize":Ljava/lang/reflect/Method;
    .end local v2    # "size":Landroid/graphics/Point;
    :goto_58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 166
    :catch_5d
    move-exception v3

    goto :goto_58

    .line 165
    :catch_5f
    move-exception v3

    goto :goto_58

    .line 164
    :catch_61
    move-exception v3

    goto :goto_58

    .line 163
    :catch_63
    move-exception v3

    goto :goto_58

    .line 162
    :catch_65
    move-exception v3

    goto :goto_58
.end method

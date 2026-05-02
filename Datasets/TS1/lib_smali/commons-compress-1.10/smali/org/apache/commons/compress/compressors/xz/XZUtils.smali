.class public Lorg/apache/commons/compress/compressors/xz/XZUtils;
.super Ljava/lang/Object;
.source "XZUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;
    }
.end annotation


# static fields
.field private static final HEADER_MAGIC:[B

.field private static volatile cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

.field private static final fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 40
    const/4 v2, 0x6

    new-array v2, v2, [B

    fill-array-data v2, :array_3c

    sput-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils;->HEADER_MAGIC:[B

    .line 51
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 52
    .local v1, "uncompressSuffix":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, ".txz"

    const-string v3, ".tar"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-string v2, ".xz"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const-string v2, "-xz"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    new-instance v2, Lorg/apache/commons/compress/compressors/FileNameUtil;

    const-string v3, ".xz"

    invoke-direct {v2, v1, v3}, Lorg/apache/commons/compress/compressors/FileNameUtil;-><init>(Ljava/util/Map;Ljava/lang/String;)V

    sput-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    .line 56
    sget-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    sput-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils;->cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    .line 58
    :try_start_2f
    const-string v2, "org.osgi.framework.BundleEvent"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_34} :catch_35

    .line 62
    :goto_34
    return-void

    .line 59
    :catch_35
    move-exception v0

    .line 60
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v2, 0x1

    invoke-static {v2}, Lorg/apache/commons/compress/compressors/xz/XZUtils;->setCacheXZAvailablity(Z)V

    goto :goto_34

    .line 40
    nop

    :array_3c
    .array-data 1
        -0x3t
        0x37t
        0x7at
        0x58t
        0x5at
        0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    return-void
.end method

.method static getCachedXZAvailability()Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;
    .registers 1

    .prologue
    .line 178
    sget-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils;->cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    return-object v0
.end method

.method public static getCompressedFilename(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 156
    sget-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    invoke-virtual {v0, p0}, Lorg/apache/commons/compress/compressors/FileNameUtil;->getCompressedFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUncompressedFilename(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 141
    sget-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    invoke-virtual {v0, p0}, Lorg/apache/commons/compress/compressors/FileNameUtil;->getUncompressedFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static internalIsXZCompressionAvailable()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 109
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_3
    invoke-static {v2, v3}, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;->matches([BI)Z
    :try_end_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_6} :catch_8

    .line 110
    const/4 v1, 0x1

    .line 112
    .local v0, "error":Ljava/lang/NoClassDefFoundError;
    :goto_7
    return v1

    .line 111
    .end local v0    # "error":Ljava/lang/NoClassDefFoundError;
    :catch_8
    move-exception v0

    .line 112
    .restart local v0    # "error":Ljava/lang/NoClassDefFoundError;
    goto :goto_7
.end method

.method public static isCompressedFilename(Ljava/lang/String;)Z
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 124
    sget-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    invoke-virtual {v0, p0}, Lorg/apache/commons/compress/compressors/FileNameUtil;->isCompressedFilename(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isXZCompressionAvailable()Z
    .registers 2

    .prologue
    .line 100
    sget-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils;->cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    .line 101
    .local v0, "cachedResult":Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;
    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    if-eq v0, v1, :cond_e

    .line 102
    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    if-ne v0, v1, :cond_c

    const/4 v1, 0x1

    .line 104
    :goto_b
    return v1

    .line 102
    :cond_c
    const/4 v1, 0x0

    goto :goto_b

    .line 104
    :cond_e
    invoke-static {}, Lorg/apache/commons/compress/compressors/xz/XZUtils;->internalIsXZCompressionAvailable()Z

    move-result v1

    goto :goto_b
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 81
    sget-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils;->HEADER_MAGIC:[B

    array-length v2, v2

    if-ge p1, v2, :cond_7

    .line 91
    :cond_6
    :goto_6
    return v1

    .line 85
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    sget-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils;->HEADER_MAGIC:[B

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 86
    aget-byte v2, p0, v0

    sget-object v3, Lorg/apache/commons/compress/compressors/xz/XZUtils;->HEADER_MAGIC:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_6

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 91
    :cond_18
    const/4 v1, 0x1

    goto :goto_6
.end method

.method public static setCacheXZAvailablity(Z)V
    .registers 4
    .param p0, "doCache"    # Z

    .prologue
    .line 167
    if-nez p0, :cond_7

    .line 168
    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    sput-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils;->cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    .line 174
    :cond_6
    :goto_6
    return-void

    .line 169
    :cond_7
    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils;->cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    sget-object v2, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    if-ne v1, v2, :cond_6

    .line 170
    invoke-static {}, Lorg/apache/commons/compress/compressors/xz/XZUtils;->internalIsXZCompressionAvailable()Z

    move-result v0

    .line 171
    .local v0, "hasXz":Z
    if-eqz v0, :cond_18

    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    :goto_15
    sput-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils;->cachedXZAvailability:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    goto :goto_6

    :cond_18
    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_UNAVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    goto :goto_15
.end method

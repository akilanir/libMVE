.class public Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;
.super Ljava/lang/Object;
.source "LZMAUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;
    }
.end annotation


# static fields
.field private static final HEADER_MAGIC:[B

.field private static volatile cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

.field private static final fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 37
    const/4 v2, 0x3

    new-array v2, v2, [B

    fill-array-data v2, :array_34

    sput-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->HEADER_MAGIC:[B

    .line 48
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 49
    .local v1, "uncompressSuffix":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, ".lzma"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    const-string v2, "-lzma"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    new-instance v2, Lorg/apache/commons/compress/compressors/FileNameUtil;

    const-string v3, ".lzma"

    invoke-direct {v2, v1, v3}, Lorg/apache/commons/compress/compressors/FileNameUtil;-><init>(Ljava/util/Map;Ljava/lang/String;)V

    sput-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    .line 52
    sget-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    sput-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    .line 54
    :try_start_28
    const-string v2, "org.osgi.framework.BundleEvent"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2d} :catch_2e

    .line 58
    :goto_2d
    return-void

    .line 55
    :catch_2e
    move-exception v0

    .line 56
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v2, 0x1

    invoke-static {v2}, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->setCacheLZMAAvailablity(Z)V

    goto :goto_2d

    .line 37
    :array_34
    .array-data 1
        0x5dt
        0x0t
        0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method static getCachedLZMAAvailability()Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;
    .registers 1

    .prologue
    .line 159
    sget-object v0, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    return-object v0
.end method

.method public static getCompressedFilename(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 138
    sget-object v0, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    invoke-virtual {v0, p0}, Lorg/apache/commons/compress/compressors/FileNameUtil;->getCompressedFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUncompressedFilename(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 127
    sget-object v0, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    invoke-virtual {v0, p0}, Lorg/apache/commons/compress/compressors/FileNameUtil;->getUncompressedFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static internalIsLZMACompressionAvailable()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 98
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_3
    invoke-static {v2, v3}, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->matches([BI)Z
    :try_end_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_6} :catch_8

    .line 99
    const/4 v1, 0x1

    .line 101
    .local v0, "error":Ljava/lang/NoClassDefFoundError;
    :goto_7
    return v1

    .line 100
    .end local v0    # "error":Ljava/lang/NoClassDefFoundError;
    :catch_8
    move-exception v0

    .line 101
    .restart local v0    # "error":Ljava/lang/NoClassDefFoundError;
    goto :goto_7
.end method

.method public static isCompressedFilename(Ljava/lang/String;)Z
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 113
    sget-object v0, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->fileNameUtil:Lorg/apache/commons/compress/compressors/FileNameUtil;

    invoke-virtual {v0, p0}, Lorg/apache/commons/compress/compressors/FileNameUtil;->isCompressedFilename(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isLZMACompressionAvailable()Z
    .registers 2

    .prologue
    .line 89
    sget-object v0, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    .line 90
    .local v0, "cachedResult":Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;
    sget-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    if-eq v0, v1, :cond_e

    .line 91
    sget-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    if-ne v0, v1, :cond_c

    const/4 v1, 0x1

    .line 93
    :goto_b
    return v1

    .line 91
    :cond_c
    const/4 v1, 0x0

    goto :goto_b

    .line 93
    :cond_e
    invoke-static {}, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->internalIsLZMACompressionAvailable()Z

    move-result v1

    goto :goto_b
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 72
    sget-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->HEADER_MAGIC:[B

    array-length v2, v2

    if-ge p1, v2, :cond_7

    .line 82
    :cond_6
    :goto_6
    return v1

    .line 76
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    sget-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->HEADER_MAGIC:[B

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 77
    aget-byte v2, p0, v0

    sget-object v3, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->HEADER_MAGIC:[B

    aget-byte v3, v3, v0

    if-ne v2, v3, :cond_6

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 82
    :cond_18
    const/4 v1, 0x1

    goto :goto_6
.end method

.method public static setCacheLZMAAvailablity(Z)V
    .registers 4
    .param p0, "doCache"    # Z

    .prologue
    .line 148
    if-nez p0, :cond_7

    .line 149
    sget-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    sput-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    .line 155
    :cond_6
    :goto_6
    return-void

    .line 150
    :cond_7
    sget-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    sget-object v2, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    if-ne v1, v2, :cond_6

    .line 151
    invoke-static {}, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->internalIsLZMACompressionAvailable()Z

    move-result v0

    .line 152
    .local v0, "hasLzma":Z
    if-eqz v0, :cond_18

    sget-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    :goto_15
    sput-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->cachedLZMAAvailability:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    goto :goto_6

    :cond_18
    sget-object v1, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;->CACHED_UNAVAILABLE:Lorg/apache/commons/compress/compressors/lzma/LZMAUtils$CachedAvailability;

    goto :goto_15
.end method

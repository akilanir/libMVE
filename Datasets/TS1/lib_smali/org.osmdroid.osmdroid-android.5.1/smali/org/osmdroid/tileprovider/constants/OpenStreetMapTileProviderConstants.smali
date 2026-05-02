.class public Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;
.super Ljava/lang/Object;
.source "OpenStreetMapTileProviderConstants.java"


# static fields
.field public static final CACHE_MAPTILECOUNT_DEFAULT:I = 0x9

.field public static DEBUGMODE:Z = false

.field public static DEBUG_TILE_PROVIDERS:Z = false

.field public static final DEFAULT_MAXIMUM_CACHED_FILE_AGE:J = 0x240c8400L

.field public static final HTTP_EXPIRES_HEADER:Ljava/lang/String; = "Expires"

.field public static final HTTP_EXPIRES_HEADER_FORMAT:Ljava/lang/String; = "EEE, dd MMM yyyy HH:mm:ss z"

.field public static final HTTP_HEADER_SDF:Ljava/text/SimpleDateFormat;

.field public static final MINIMUM_ZOOMLEVEL:I = 0x0

.field private static NUMBER_OF_TILE_DOWNLOAD_THREADS:I = 0x0

.field public static final NUMBER_OF_TILE_FILESYSTEM_THREADS:S = 0x8s

.field public static final ONE_DAY:J = 0x5265c00L

.field public static final ONE_HOUR:J = 0x36ee80L

.field public static final ONE_MINUTE:J = 0xea60L

.field public static final ONE_SECOND:J = 0x3e8L

.field public static final ONE_WEEK:J = 0x240c8400L

.field public static final ONE_YEAR:J = 0x757b12c00L

.field private static OSMDROID_PATH:Ljava/io/File; = null

.field public static final TILE_DOWNLOAD_MAXIMUM_QUEUE_SIZE:S = 0x28s

.field public static final TILE_EXPIRY_TIME_MILLISECONDS:J = 0x9a7ec800L

.field public static final TILE_FILESYSTEM_MAXIMUM_QUEUE_SIZE:S = 0x28s

.field public static TILE_MAX_CACHE_SIZE_BYTES:J = 0x0L

.field public static TILE_PATH_BASE:Ljava/io/File; = null

.field public static final TILE_PATH_EXTENSION:Ljava/lang/String; = ".tile"

.field public static TILE_TRIM_CACHE_SIZE_BYTES:J

.field public static USER_AGENT:Ljava/lang/String;

.field private static USER_AGENT_VALUE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 24
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "osmdroid"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    .line 34
    new-instance v1, Ljava/io/File;

    sget-object v2, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    const-string v3, "tiles"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    .line 38
    :try_start_19
    sget-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 39
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/.nomedia"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_3b} :catch_60

    .line 44
    .local v0, "ex":Ljava/lang/Exception;
    :goto_3b
    sput-boolean v4, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    .line 45
    sput-boolean v4, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    .line 46
    const-string v1, "User-Agent"

    sput-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT:Ljava/lang/String;

    .line 47
    const-string v1, "osmdroid"

    sput-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT_VALUE:Ljava/lang/String;

    .line 85
    const/4 v1, 0x2

    sput v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->NUMBER_OF_TILE_DOWNLOAD_THREADS:I

    .line 126
    const-wide/32 v1, 0x25800000

    sput-wide v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    .line 129
    const-wide/32 v1, 0x1f400000

    sput-wide v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    .line 179
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE, dd MMM yyyy HH:mm:ss z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->HTTP_HEADER_SDF:Ljava/text/SimpleDateFormat;

    return-void

    .line 40
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_60
    move-exception v0

    .line 41
    .restart local v0    # "ex":Ljava/lang/Exception;
    const-string v1, "OsmDroid"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unable to create a nomedia file. downloaded tiles may be visible to the gallery. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3b
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBasePath()Ljava/io/File;
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    return-object v0
.end method

.method public static getNumberOfTileDownloadThreads()I
    .registers 1

    .prologue
    .line 87
    sget v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->NUMBER_OF_TILE_DOWNLOAD_THREADS:I

    return v0
.end method

.method public static getUserAgentValue()Ljava/lang/String;
    .registers 1

    .prologue
    .line 55
    sget-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT_VALUE:Ljava/lang/String;

    return-object v0
.end method

.method public static setCachePath(Ljava/lang/String;)V
    .registers 6
    .param p0, "newFullPath"    # Ljava/lang/String;

    .prologue
    .line 136
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 138
    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v2

    sput-object v2, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    .line 140
    :try_start_11
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/.nomedia"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_2e} :catch_2f

    .line 145
    :cond_2e
    :goto_2e
    return-void

    .line 141
    :catch_2f
    move-exception v0

    .line 142
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "OsmDroid"

    const-string v3, "unable to create a nomedia file. downloaded tiles may be visible to the gallery."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2e
.end method

.method public static setCacheSizes(JJ)V
    .registers 8
    .param p0, "maxCacheSize"    # J
    .param p2, "trimCacheSize"    # J

    .prologue
    const-wide/16 v2, 0x400

    .line 154
    mul-long v0, p0, v2

    mul-long/2addr v0, v2

    sput-wide v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    .line 155
    mul-long v0, p2, v2

    mul-long/2addr v0, v2

    sput-wide v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    .line 156
    return-void
.end method

.method public static setOfflineMapsPath(Ljava/lang/String;)V
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 164
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    .line 165
    return-void
.end method

.method public static setUserAgentValue(Ljava/lang/String;)V
    .registers 1
    .param p0, "val"    # Ljava/lang/String;

    .prologue
    .line 64
    sput-object p0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT_VALUE:Ljava/lang/String;

    .line 65
    return-void
.end method


# virtual methods
.method public setNumberOfTileDownloadThreads(I)V
    .registers 4
    .param p1, "threads"    # I

    .prologue
    const/16 v1, 0xc

    const/4 v0, 0x1

    .line 99
    if-le p1, v1, :cond_8

    .line 100
    sput v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->NUMBER_OF_TILE_DOWNLOAD_THREADS:I

    .line 105
    :goto_7
    return-void

    .line 101
    :cond_8
    if-ge p1, v0, :cond_d

    .line 102
    sput v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->NUMBER_OF_TILE_DOWNLOAD_THREADS:I

    goto :goto_7

    .line 104
    :cond_d
    sput p1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->NUMBER_OF_TILE_DOWNLOAD_THREADS:I

    goto :goto_7
.end method

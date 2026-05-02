.class public Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;
.super Ljava/lang/Object;
.source "OpenStreetMapTileProviderConstants.java"


# static fields
.field public static final CACHE_MAPTILECOUNT_DEFAULT:I = 0x9

.field public static DEBUGMODE:Z = false

.field public static final DEBUG_TILE_PROVIDERS:Z = false

.field public static final DEFAULT_MAXIMUM_CACHED_FILE_AGE:J = 0x240c8400L

.field public static final MINIMUM_ZOOMLEVEL:I = 0x0

.field public static final NUMBER_OF_TILE_DOWNLOAD_THREADS:I = 0x2

.field public static final NUMBER_OF_TILE_FILESYSTEM_THREADS:I = 0x8

.field public static final ONE_DAY:J = 0x5265c00L

.field public static final ONE_HOUR:J = 0x36ee80L

.field public static final ONE_MINUTE:J = 0xea60L

.field public static final ONE_SECOND:J = 0x3e8L

.field public static final ONE_WEEK:J = 0x240c8400L

.field public static final ONE_YEAR:J = 0x757b12c00L

.field private static OSMDROID_PATH:Ljava/io/File; = null

.field public static final TILE_DOWNLOAD_MAXIMUM_QUEUE_SIZE:I = 0x28

.field public static final TILE_EXPIRY_TIME_MILLISECONDS:J = 0x9a7ec800L

.field public static final TILE_FILESYSTEM_MAXIMUM_QUEUE_SIZE:I = 0x28

.field public static TILE_MAX_CACHE_SIZE_BYTES:J = 0x0L

.field public static TILE_PATH_BASE:Ljava/io/File; = null

.field public static final TILE_PATH_EXTENSION:Ljava/lang/String; = ".tile"

.field public static TILE_TRIM_CACHE_SIZE_BYTES:J

.field public static USER_AGENT:Ljava/lang/String;

.field private static USER_AGENT_VALUE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 20
    const/4 v0, 0x0

    sput-boolean v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    .line 22
    const-string v0, "User-Agent"

    sput-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT:Ljava/lang/String;

    .line 23
    const-string v0, "osmdroid"

    sput-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT_VALUE:Ljava/lang/String;

    .line 48
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "osmdroid"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    .line 54
    new-instance v0, Ljava/io/File;

    sget-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    const-string v2, "tiles"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    .line 88
    const-wide/32 v0, 0x25800000

    sput-wide v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    .line 91
    const-wide/32 v0, 0x1f400000

    sput-wide v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getUserAgentValue()Ljava/lang/String;
    .registers 1

    .prologue
    .line 31
    sget-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT_VALUE:Ljava/lang/String;

    return-object v0
.end method

.method public static setCachePath(Ljava/lang/String;)V
    .registers 3
    .param p0, "newFullPath"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 99
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 100
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    sput-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    .line 102
    :cond_11
    return-void
.end method

.method public static setCacheSizes(JJ)V
    .registers 8
    .param p0, "maxCacheSize"    # J
    .param p2, "trimCacheSize"    # J

    .prologue
    const-wide/16 v2, 0x400

    .line 111
    mul-long v0, p0, v2

    mul-long/2addr v0, v2

    sput-wide v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    .line 112
    mul-long v0, p2, v2

    mul-long/2addr v0, v2

    sput-wide v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    .line 113
    return-void
.end method

.method public static setOfflineMapsPath(Ljava/lang/String;)V
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 121
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->OSMDROID_PATH:Ljava/io/File;

    .line 122
    return-void
.end method

.method public static setUserAgentValue(Ljava/lang/String;)V
    .registers 1
    .param p0, "val"    # Ljava/lang/String;

    .prologue
    .line 40
    sput-object p0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT_VALUE:Ljava/lang/String;

    .line 41
    return-void
.end method

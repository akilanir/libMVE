.class public Lorg/osmdroid/tileprovider/modules/TileWriter;
.super Ljava/lang/Object;
.source "TileWriter.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/IFilesystemCache;


# static fields
.field private static mUsedCacheSpace:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lorg/osmdroid/tileprovider/modules/TileWriter$1;

    invoke-direct {v0, p0}, Lorg/osmdroid/tileprovider/modules/TileWriter$1;-><init>(Lorg/osmdroid/tileprovider/modules/TileWriter;)V

    .line 64
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 65
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 66
    return-void
.end method

.method static synthetic access$000()J
    .registers 2

    .prologue
    .line 28
    sget-wide v0, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    return-wide v0
.end method

.method static synthetic access$002(J)J
    .registers 2
    .param p0, "x0"    # J

    .prologue
    .line 28
    sput-wide p0, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    return-wide p0
.end method

.method static synthetic access$100(Lorg/osmdroid/tileprovider/modules/TileWriter;Ljava/io/File;)V
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/TileWriter;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/osmdroid/tileprovider/modules/TileWriter;->calculateDirectorySize(Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$200(Lorg/osmdroid/tileprovider/modules/TileWriter;)V
    .registers 1
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/TileWriter;

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/osmdroid/tileprovider/modules/TileWriter;->cutCurrentCache()V

    return-void
.end method

.method private calculateDirectorySize(Ljava/io/File;)V
    .registers 11
    .param p1, "pDirectory"    # Ljava/io/File;

    .prologue
    .line 150
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 151
    .local v4, "z":[Ljava/io/File;
    if-eqz v4, :cond_2e

    .line 152
    move-object v0, v4

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_9
    if-ge v2, v3, :cond_2e

    aget-object v1, v0, v2

    .line 153
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 154
    sget-wide v5, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v7

    add-long/2addr v5, v7

    sput-wide v5, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    .line 156
    :cond_1c
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2b

    invoke-direct {p0, p1, v1}, Lorg/osmdroid/tileprovider/modules/TileWriter;->isSymbolicDirectoryLink(Ljava/io/File;Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_2b

    .line 157
    invoke-direct {p0, v1}, Lorg/osmdroid/tileprovider/modules/TileWriter;->calculateDirectorySize(Ljava/io/File;)V

    .line 152
    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 161
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_2e
    return-void
.end method

.method private createFolderAndCheckIfExists(Ljava/io/File;)Z
    .registers 6
    .param p1, "pFile"    # Ljava/io/File;

    .prologue
    const/4 v0, 0x1

    .line 123
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 145
    :cond_7
    :goto_7
    return v0

    .line 126
    :cond_8
    sget-boolean v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v1, :cond_2a

    .line 127
    const-string v1, "OsmDroid"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to create "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - wait and check again"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    :cond_2a
    const-wide/16 v1, 0x1f4

    :try_start_2c
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2f
    .catch Ljava/lang/InterruptedException; {:try_start_2c .. :try_end_2f} :catch_70

    .line 136
    :goto_2f
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_52

    .line 137
    sget-boolean v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v1, :cond_7

    .line 138
    const-string v1, "OsmDroid"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Seems like another thread created "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 142
    :cond_52
    sget-boolean v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v0, :cond_6e

    .line 143
    const-string v0, "OsmDroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "File still doesn\'t exist: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_6e
    const/4 v0, 0x0

    goto :goto_7

    .line 133
    :catch_70
    move-exception v1

    goto :goto_2f
.end method

.method private cutCurrentCache()V
    .registers 14

    .prologue
    .line 210
    sget-object v7, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    .line 211
    .local v7, "lock":Ljava/io/File;
    monitor-enter v7

    .line 213
    :try_start_3
    sget-wide v9, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    sget-wide v11, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    cmp-long v9, v9, v11

    if-lez v9, :cond_5e

    .line 215
    const-string v9, "OsmDroid"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Trimming tile cache from "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-wide v11, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-wide v11, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    sget-object v9, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    invoke-direct {p0, v9}, Lorg/osmdroid/tileprovider/modules/TileWriter;->getDirectoryFileList(Ljava/io/File;)Ljava/util/List;

    move-result-object v8

    .line 221
    .local v8, "z":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    const/4 v9, 0x0

    new-array v9, v9, [Ljava/io/File;

    invoke-interface {v8, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/io/File;

    .line 222
    .local v2, "files":[Ljava/io/File;
    new-instance v9, Lorg/osmdroid/tileprovider/modules/TileWriter$2;

    invoke-direct {v9, p0}, Lorg/osmdroid/tileprovider/modules/TileWriter$2;-><init>(Lorg/osmdroid/tileprovider/modules/TileWriter;)V

    invoke-static {v2, v9}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 229
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_4b
    if-ge v3, v4, :cond_57

    aget-object v1, v0, v3

    .line 230
    .local v1, "file":Ljava/io/File;
    sget-wide v9, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    sget-wide v11, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_TRIM_CACHE_SIZE_BYTES:J

    cmp-long v9, v9, v11

    if-gtz v9, :cond_60

    .line 240
    .end local v1    # "file":Ljava/io/File;
    :cond_57
    const-string v9, "OsmDroid"

    const-string v10, "Finished trimming tile cache"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v8    # "z":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :cond_5e
    monitor-exit v7

    .line 243
    return-void

    .line 234
    .restart local v0    # "arr$":[Ljava/io/File;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "files":[Ljava/io/File;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v8    # "z":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :cond_60
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v5

    .line 235
    .local v5, "length":J
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v9

    if-eqz v9, :cond_6f

    .line 236
    sget-wide v9, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    sub-long/2addr v9, v5

    sput-wide v9, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    .line 229
    :cond_6f
    add-int/lit8 v3, v3, 0x1

    goto :goto_4b

    .line 242
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "length":J
    .end local v8    # "z":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :catchall_72
    move-exception v9

    monitor-exit v7
    :try_end_74
    .catchall {:try_start_3 .. :try_end_74} :catchall_72

    throw v9
.end method

.method private getDirectoryFileList(Ljava/io/File;)Ljava/util/List;
    .registers 9
    .param p1, "aDirectory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 187
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 189
    .local v2, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 190
    .local v5, "z":[Ljava/io/File;
    if-eqz v5, :cond_2b

    .line 191
    move-object v0, v5

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_e
    if-ge v3, v4, :cond_2b

    aget-object v1, v0, v3

    .line 192
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 193
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_1b
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_28

    .line 196
    invoke-direct {p0, v1}, Lorg/osmdroid/tileprovider/modules/TileWriter;->getDirectoryFileList(Ljava/io/File;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 191
    :cond_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 201
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_2b
    return-object v2
.end method

.method public static getUsedCacheSpace()J
    .registers 2

    .prologue
    .line 79
    sget-wide v0, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    return-wide v0
.end method

.method private isSymbolicDirectoryLink(Ljava/io/File;Ljava/io/File;)Z
    .registers 8
    .param p1, "pParentDirectory"    # Ljava/io/File;
    .param p2, "pDirectory"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x1

    .line 173
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "canonicalParentPath1":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "canonicalParentPath2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_10} :catch_16
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_10} :catch_18

    move-result v4

    if-nez v4, :cond_14

    .line 181
    .end local v0    # "canonicalParentPath1":Ljava/lang/String;
    .end local v1    # "canonicalParentPath2":Ljava/lang/String;
    :goto_13
    return v3

    .line 175
    .restart local v0    # "canonicalParentPath1":Ljava/lang/String;
    .restart local v1    # "canonicalParentPath2":Ljava/lang/String;
    :cond_14
    const/4 v3, 0x0

    goto :goto_13

    .line 176
    .end local v0    # "canonicalParentPath1":Ljava/lang/String;
    .end local v1    # "canonicalParentPath2":Ljava/lang/String;
    :catch_16
    move-exception v2

    .line 177
    .local v2, "e":Ljava/io/IOException;
    goto :goto_13

    .line 178
    .end local v2    # "e":Ljava/io/IOException;
    :catch_18
    move-exception v2

    .line 181
    .local v2, "e":Ljava/util/NoSuchElementException;
    goto :goto_13
.end method


# virtual methods
.method public saveFile(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;Ljava/io/InputStream;)Z
    .registers 16
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p3, "pStream"    # Ljava/io/InputStream;

    .prologue
    const/4 v7, 0x0

    .line 90
    new-instance v1, Ljava/io/File;

    sget-object v8, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1, p2}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getTileRelativeFilenameString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".tile"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    .line 94
    .local v6, "parent":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_30

    invoke-direct {p0, v6}, Lorg/osmdroid/tileprovider/modules/TileWriter;->createFolderAndCheckIfExists(Ljava/io/File;)Z

    move-result v8

    if-nez v8, :cond_30

    .line 115
    :cond_2f
    :goto_2f
    return v7

    .line 98
    :cond_30
    const/4 v4, 0x0

    .line 100
    .local v4, "outputStream":Ljava/io/BufferedOutputStream;
    :try_start_31
    new-instance v5, Ljava/io/BufferedOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/16 v9, 0x2000

    invoke-direct {v5, v8, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_41} :catch_5c
    .catchall {:try_start_31 .. :try_end_41} :catchall_63

    .line 102
    .end local v4    # "outputStream":Ljava/io/BufferedOutputStream;
    .local v5, "outputStream":Ljava/io/BufferedOutputStream;
    :try_start_41
    invoke-static {p3, v5}, Lorg/osmdroid/tileprovider/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v2

    .line 104
    .local v2, "length":J
    sget-wide v8, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    add-long/2addr v8, v2

    sput-wide v8, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    .line 105
    sget-wide v8, Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J

    sget-wide v10, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    cmp-long v8, v8, v10

    if-lez v8, :cond_55

    .line 106
    invoke-direct {p0}, Lorg/osmdroid/tileprovider/modules/TileWriter;->cutCurrentCache()V
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_55} :catch_6d
    .catchall {:try_start_41 .. :try_end_55} :catchall_6a

    .line 111
    :cond_55
    if-eqz v5, :cond_5a

    .line 112
    invoke-static {v5}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 115
    :cond_5a
    const/4 v7, 0x1

    goto :goto_2f

    .line 108
    .end local v2    # "length":J
    .end local v5    # "outputStream":Ljava/io/BufferedOutputStream;
    .restart local v4    # "outputStream":Ljava/io/BufferedOutputStream;
    :catch_5c
    move-exception v0

    .line 111
    .local v0, "e":Ljava/io/IOException;
    :goto_5d
    if-eqz v4, :cond_2f

    .line 112
    invoke-static {v4}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_2f

    .line 111
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_63
    move-exception v7

    :goto_64
    if-eqz v4, :cond_69

    .line 112
    invoke-static {v4}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    :cond_69
    throw v7

    .line 111
    .end local v4    # "outputStream":Ljava/io/BufferedOutputStream;
    .restart local v5    # "outputStream":Ljava/io/BufferedOutputStream;
    :catchall_6a
    move-exception v7

    move-object v4, v5

    .end local v5    # "outputStream":Ljava/io/BufferedOutputStream;
    .restart local v4    # "outputStream":Ljava/io/BufferedOutputStream;
    goto :goto_64

    .line 108
    .end local v4    # "outputStream":Ljava/io/BufferedOutputStream;
    .restart local v5    # "outputStream":Ljava/io/BufferedOutputStream;
    :catch_6d
    move-exception v0

    move-object v4, v5

    .end local v5    # "outputStream":Ljava/io/BufferedOutputStream;
    .restart local v4    # "outputStream":Ljava/io/BufferedOutputStream;
    goto :goto_5d
.end method

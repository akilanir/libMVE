.class Lorg/osmdroid/tileprovider/modules/TileWriter$1;
.super Ljava/lang/Thread;
.source "TileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/osmdroid/tileprovider/modules/TileWriter;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/TileWriter;


# direct methods
.method constructor <init>(Lorg/osmdroid/tileprovider/modules/TileWriter;)V
    .registers 2

    .prologue
    .line 49
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/TileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/TileWriter;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 52
    const-wide/16 v0, 0x0

    # setter for: Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J
    invoke-static {v0, v1}, Lorg/osmdroid/tileprovider/modules/TileWriter;->access$002(J)J

    .line 54
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/TileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/TileWriter;

    sget-object v1, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    # invokes: Lorg/osmdroid/tileprovider/modules/TileWriter;->calculateDirectorySize(Ljava/io/File;)V
    invoke-static {v0, v1}, Lorg/osmdroid/tileprovider/modules/TileWriter;->access$100(Lorg/osmdroid/tileprovider/modules/TileWriter;Ljava/io/File;)V

    .line 56
    # getter for: Lorg/osmdroid/tileprovider/modules/TileWriter;->mUsedCacheSpace:J
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/TileWriter;->access$000()J

    move-result-wide v0

    sget-wide v2, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1b

    .line 57
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/TileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/TileWriter;

    # invokes: Lorg/osmdroid/tileprovider/modules/TileWriter;->cutCurrentCache()V
    invoke-static {v0}, Lorg/osmdroid/tileprovider/modules/TileWriter;->access$200(Lorg/osmdroid/tileprovider/modules/TileWriter;)V

    .line 59
    :cond_1b
    sget-boolean v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v0, :cond_26

    .line 60
    const-string v0, "OsmDroid"

    const-string v1, "Finished init thread"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    :cond_26
    return-void
.end method

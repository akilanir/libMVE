.class public final Lorg/dmfs/provider/tasks/TaskContract$TaskLists;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/TaskContract$TaskListColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$TaskListSyncColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$CommonSyncColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TaskLists"
.end annotation


# static fields
.field static final CONTENT_URI_PATH:Ljava/lang/String; = "tasklists"

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "account_name, list_name"

.field public static final SYNC_ADAPTER_COLUMNS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "list_access_level"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "_dirty"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "list_owner"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "sync1"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "sync2"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "sync3"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "sync4"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "sync5"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "sync6"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "sync7"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "sync8"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "_sync_id"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "sync_version"

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$TaskLists;->SYNC_ADAPTER_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getContentUri(Ljava/lang/String;)Landroid/net/Uri;
    .registers 3

    # invokes: Lorg/dmfs/provider/tasks/TaskContract;->getUriFactory(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;
    invoke-static {p0}, Lorg/dmfs/provider/tasks/TaskContract;->access$000(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;

    move-result-object v0

    const-string v1, "tasklists"

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/UriFactory;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

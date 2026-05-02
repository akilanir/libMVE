.class public final Lorg/dmfs/provider/tasks/TaskContract$Tasks;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/TaskContract$TaskColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$CommonSyncColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$TaskSyncColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$TaskSearchColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Tasks"
.end annotation


# static fields
.field public static final ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final ACCOUNT_TYPE:Ljava/lang/String; = "account_type"

.field static final CONTENT_URI_PATH:Ljava/lang/String; = "tasks"

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "due"

.field public static final LIST_ACCESS_LEVEL:Ljava/lang/String; = "list_access_level"

.field public static final LIST_COLOR:Ljava/lang/String; = "list_color"

.field public static final LIST_NAME:Ljava/lang/String; = "list_name"

.field public static final LIST_OWNER:Ljava/lang/String; = "list_owner"

.field static final SEARCH_QUERY_PARAMETER:Ljava/lang/String; = "q"

.field static final SEARCH_URI_PATH:Ljava/lang/String; = "tasks_search"

.field public static final SYNC_ADAPTER_COLUMNS:[Ljava/lang/String;

.field public static final VISIBLE:Ljava/lang/String; = "visible"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_dirty"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "sync1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "sync2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "sync3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "sync4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "sync5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "sync6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "sync7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "sync8"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "_sync_id"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "sync_version"

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->SYNC_ADAPTER_COLUMNS:[Ljava/lang/String;

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

    const-string v1, "tasks"

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/UriFactory;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static final getSearchUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .registers 5

    # invokes: Lorg/dmfs/provider/tasks/TaskContract;->getUriFactory(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;
    invoke-static {p0}, Lorg/dmfs/provider/tasks/TaskContract;->access$000(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;

    move-result-object v0

    const-string v1, "tasks_search"

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/UriFactory;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "q"

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

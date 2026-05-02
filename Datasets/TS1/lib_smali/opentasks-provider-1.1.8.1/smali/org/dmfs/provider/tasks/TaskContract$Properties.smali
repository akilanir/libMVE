.class public final Lorg/dmfs/provider/tasks/TaskContract$Properties;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/TaskContract$PropertySyncColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$PropertyColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Properties"
.end annotation


# static fields
.field static final CONTENT_URI_PATH:Ljava/lang/String; = "properties"

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "data0"


# direct methods
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

    const-string v1, "properties"

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/UriFactory;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

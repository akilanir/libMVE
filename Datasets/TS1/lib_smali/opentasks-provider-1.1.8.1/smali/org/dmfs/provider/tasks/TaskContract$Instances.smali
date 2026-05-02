.class public final Lorg/dmfs/provider/tasks/TaskContract$Instances;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/TaskContract$TaskColumns;
.implements Lorg/dmfs/provider/tasks/TaskContract$InstanceColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Instances"
.end annotation


# static fields
.field public static final ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final ACCOUNT_TYPE:Ljava/lang/String; = "account_type"

.field static final CONTENT_URI_PATH:Ljava/lang/String; = "instances"

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "instance_due_sorting"

.field public static final LIST_ACCESS_LEVEL:Ljava/lang/String; = "list_access_level"

.field public static final LIST_COLOR:Ljava/lang/String; = "list_color"

.field public static final LIST_NAME:Ljava/lang/String; = "list_name"

.field public static final LIST_OWNER:Ljava/lang/String; = "list_owner"

.field public static final VISIBLE:Ljava/lang/String; = "visible"


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

    const-string v1, "instances"

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/UriFactory;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

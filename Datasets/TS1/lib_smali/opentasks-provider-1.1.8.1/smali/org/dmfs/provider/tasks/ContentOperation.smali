.class public final enum Lorg/dmfs/provider/tasks/ContentOperation;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/provider/tasks/ContentOperation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/provider/tasks/ContentOperation;

.field private static final BASE_PATH:Ljava/lang/String; = "content_operation"

.field public static final enum POST_NOTIFICATIONS:Lorg/dmfs/provider/tasks/ContentOperation;

.field private static final PREFS_KEY_LAST_ALARM_TIMESTAMP:Ljava/lang/String; = "org.dmfs.provider.tasks.prefs.LAST_ALARM_TIMESTAMP"

.field private static final PREFS_NAME:Ljava/lang/String; = "org.dmfs.provider.tasks"

.field public static final enum UPDATE_NOTIFICATION_ALARM:Lorg/dmfs/provider/tasks/ContentOperation;

.field public static final enum UPDATE_TIMEZONE:Lorg/dmfs/provider/tasks/ContentOperation;

.field private static final mLock:Ljava/lang/Object;


# instance fields
.field private final mHandler:Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lorg/dmfs/provider/tasks/ContentOperation;

    const-string v1, "UPDATE_TIMEZONE"

    new-instance v2, Lorg/dmfs/provider/tasks/ContentOperation$1;

    invoke-direct {v2}, Lorg/dmfs/provider/tasks/ContentOperation$1;-><init>()V

    invoke-direct {v0, v1, v3, v2}, Lorg/dmfs/provider/tasks/ContentOperation;-><init>(Ljava/lang/String;ILorg/dmfs/provider/tasks/ContentOperation$OperationHandler;)V

    sput-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_TIMEZONE:Lorg/dmfs/provider/tasks/ContentOperation;

    new-instance v0, Lorg/dmfs/provider/tasks/ContentOperation;

    const-string v1, "POST_NOTIFICATIONS"

    new-instance v2, Lorg/dmfs/provider/tasks/ContentOperation$2;

    invoke-direct {v2}, Lorg/dmfs/provider/tasks/ContentOperation$2;-><init>()V

    invoke-direct {v0, v1, v4, v2}, Lorg/dmfs/provider/tasks/ContentOperation;-><init>(Ljava/lang/String;ILorg/dmfs/provider/tasks/ContentOperation$OperationHandler;)V

    sput-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->POST_NOTIFICATIONS:Lorg/dmfs/provider/tasks/ContentOperation;

    new-instance v0, Lorg/dmfs/provider/tasks/ContentOperation;

    const-string v1, "UPDATE_NOTIFICATION_ALARM"

    new-instance v2, Lorg/dmfs/provider/tasks/ContentOperation$3;

    invoke-direct {v2}, Lorg/dmfs/provider/tasks/ContentOperation$3;-><init>()V

    invoke-direct {v0, v1, v5, v2}, Lorg/dmfs/provider/tasks/ContentOperation;-><init>(Ljava/lang/String;ILorg/dmfs/provider/tasks/ContentOperation$OperationHandler;)V

    sput-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_NOTIFICATION_ALARM:Lorg/dmfs/provider/tasks/ContentOperation;

    const/4 v0, 0x3

    new-array v0, v0, [Lorg/dmfs/provider/tasks/ContentOperation;

    sget-object v1, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_TIMEZONE:Lorg/dmfs/provider/tasks/ContentOperation;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/provider/tasks/ContentOperation;->POST_NOTIFICATIONS:Lorg/dmfs/provider/tasks/ContentOperation;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_NOTIFICATION_ALARM:Lorg/dmfs/provider/tasks/ContentOperation;

    aput-object v1, v0, v5

    sput-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->$VALUES:[Lorg/dmfs/provider/tasks/ContentOperation;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->mLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILorg/dmfs/provider/tasks/ContentOperation$OperationHandler;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lorg/dmfs/provider/tasks/ContentOperation;->mHandler:Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
    .registers 1

    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lorg/dmfs/provider/tasks/ContentOperation;)Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/ContentOperation;->mHandler:Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;

    return-object v0
.end method

.method public static get(II)Lorg/dmfs/provider/tasks/ContentOperation;
    .registers 5

    const/4 v0, 0x0

    if-ge p0, p1, :cond_4

    :cond_3
    :goto_3
    return-object v0

    :cond_4
    sub-int v1, p0, p1

    invoke-static {}, Lorg/dmfs/provider/tasks/ContentOperation;->values()[Lorg/dmfs/provider/tasks/ContentOperation;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_3

    invoke-static {}, Lorg/dmfs/provider/tasks/ContentOperation;->values()[Lorg/dmfs/provider/tasks/ContentOperation;

    move-result-object v0

    sub-int v1, p0, p1

    aget-object v0, v0, v1

    goto :goto_3
.end method

.method public static register(Landroid/content/UriMatcher;Ljava/lang/String;I)V
    .registers 9

    invoke-static {}, Lorg/dmfs/provider/tasks/ContentOperation;->values()[Lorg/dmfs/provider/tasks/ContentOperation;

    move-result-object v1

    array-length v2, v1

    const/4 v0, 0x0

    :goto_6
    if-ge v0, v2, :cond_22

    aget-object v3, v1, v0

    invoke-direct {v3, p1}, Lorg/dmfs/provider/tasks/ContentOperation;->uri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lorg/dmfs/provider/tasks/ContentOperation;->ordinal()I

    move-result v3

    add-int/2addr v3, p2

    invoke-virtual {p0, p1, v4, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_22
    return-void
.end method

.method private uri(Ljava/lang/String;)Landroid/net/Uri;
    .registers 4

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "content"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "content_operation"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/ContentOperation;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/provider/tasks/ContentOperation;
    .registers 2

    const-class v0, Lorg/dmfs/provider/tasks/ContentOperation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/provider/tasks/ContentOperation;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/provider/tasks/ContentOperation;
    .registers 1

    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->$VALUES:[Lorg/dmfs/provider/tasks/ContentOperation;

    invoke-virtual {v0}, [Lorg/dmfs/provider/tasks/ContentOperation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/provider/tasks/ContentOperation;

    return-object v0
.end method


# virtual methods
.method public fire(Landroid/content/Context;Landroid/content/ContentValues;)V
    .registers 6

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p1}, Lorg/dmfs/provider/tasks/TaskContract;->taskAuthority(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/dmfs/provider/tasks/ContentOperation;->uri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    if-nez p2, :cond_14

    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    :cond_14
    invoke-virtual {v0, v1, p2, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method run(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V
    .registers 12

    new-instance v0, Lorg/dmfs/provider/tasks/ContentOperation$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/provider/tasks/ContentOperation$4;-><init>(Lorg/dmfs/provider/tasks/ContentOperation;Landroid/content/Context;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.class public abstract enum Lorg/dmfs/provider/tasks/ProviderOperation;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/provider/tasks/ProviderOperation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/provider/tasks/ProviderOperation;

.field public static final enum DELETE:Lorg/dmfs/provider/tasks/ProviderOperation;

.field public static final enum INSERT:Lorg/dmfs/provider/tasks/ProviderOperation;

.field private static final TAG:Ljava/lang/String; = "OpenTasks.Operation"

.field public static final enum UPDATE:Lorg/dmfs/provider/tasks/ProviderOperation;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lorg/dmfs/provider/tasks/ProviderOperation$1;

    const-string v1, "INSERT"

    invoke-direct {v0, v1, v2}, Lorg/dmfs/provider/tasks/ProviderOperation$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->INSERT:Lorg/dmfs/provider/tasks/ProviderOperation;

    new-instance v0, Lorg/dmfs/provider/tasks/ProviderOperation$2;

    const-string v1, "UPDATE"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/provider/tasks/ProviderOperation$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->UPDATE:Lorg/dmfs/provider/tasks/ProviderOperation;

    new-instance v0, Lorg/dmfs/provider/tasks/ProviderOperation$3;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/provider/tasks/ProviderOperation$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->DELETE:Lorg/dmfs/provider/tasks/ProviderOperation;

    const/4 v0, 0x3

    new-array v0, v0, [Lorg/dmfs/provider/tasks/ProviderOperation;

    sget-object v1, Lorg/dmfs/provider/tasks/ProviderOperation;->INSERT:Lorg/dmfs/provider/tasks/ProviderOperation;

    aput-object v1, v0, v2

    sget-object v1, Lorg/dmfs/provider/tasks/ProviderOperation;->UPDATE:Lorg/dmfs/provider/tasks/ProviderOperation;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/provider/tasks/ProviderOperation;->DELETE:Lorg/dmfs/provider/tasks/ProviderOperation;

    aput-object v1, v0, v4

    sput-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->$VALUES:[Lorg/dmfs/provider/tasks/ProviderOperation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/dmfs/provider/tasks/ProviderOperation$1;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lorg/dmfs/provider/tasks/ProviderOperation;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/provider/tasks/ProviderOperation;
    .registers 2

    const-class v0, Lorg/dmfs/provider/tasks/ProviderOperation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/provider/tasks/ProviderOperation;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/provider/tasks/ProviderOperation;
    .registers 1

    sget-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->$VALUES:[Lorg/dmfs/provider/tasks/ProviderOperation;

    invoke-virtual {v0}, [Lorg/dmfs/provider/tasks/ProviderOperation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/provider/tasks/ProviderOperation;

    return-object v0
.end method


# virtual methods
.method public execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/dmfs/provider/tasks/model/EntityAdapter",
            "<*>;>(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<TT;>;>;TT;Z",
            "Lorg/dmfs/provider/tasks/ProviderOperationsLog;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/provider/tasks/processors/EntityProcessor;

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/dmfs/provider/tasks/ProviderOperation;->executeBeforeProcessor(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/processors/EntityProcessor;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V

    goto :goto_7

    :cond_17
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/provider/tasks/processors/EntityProcessor;

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/dmfs/provider/tasks/ProviderOperation;->executeAfterProcessor(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/processors/EntityProcessor;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V

    goto :goto_1b

    :cond_2b
    sget-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->UPDATE:Lorg/dmfs/provider/tasks/ProviderOperation;

    if-ne p0, v0, :cond_35

    invoke-interface {p3}, Lorg/dmfs/provider/tasks/model/EntityAdapter;->hasUpdates()Z

    move-result v0

    if-eqz v0, :cond_3c

    :cond_35
    invoke-interface {p3, p6}, Lorg/dmfs/provider/tasks/model/EntityAdapter;->uri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p5, p0, v0}, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->log(Lorg/dmfs/provider/tasks/ProviderOperation;Landroid/net/Uri;)V

    :cond_3c
    return-void
.end method

.method abstract executeAfterProcessor(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/processors/EntityProcessor;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/dmfs/provider/tasks/model/EntityAdapter",
            "<*>;>(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<TT;>;TT;Z)V"
        }
    .end annotation
.end method

.method abstract executeBeforeProcessor(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/processors/EntityProcessor;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/dmfs/provider/tasks/model/EntityAdapter",
            "<*>;>(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<TT;>;TT;Z)V"
        }
    .end annotation
.end method

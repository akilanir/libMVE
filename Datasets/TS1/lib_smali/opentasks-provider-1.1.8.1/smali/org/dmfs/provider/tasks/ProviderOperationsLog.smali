.class public Lorg/dmfs/provider/tasks/ProviderOperationsLog;
.super Ljava/lang/Object;


# instance fields
.field private mOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mUris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    const/16 v1, 0x10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mUris:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mOperations:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mUris:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public log(Lorg/dmfs/provider/tasks/ProviderOperation;Landroid/net/Uri;)V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mUris:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lorg/dmfs/provider/tasks/ProviderOperation;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_15
    move-exception v0

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public toBundle(Landroid/os/Bundle;Z)Landroid/os/Bundle;
    .registers 5

    if-nez p1, :cond_8

    new-instance p1, Landroid/os/Bundle;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Landroid/os/Bundle;-><init>(I)V

    :cond_8
    monitor-enter p0

    :try_start_9
    const-string v0, "org.dmfs.tasks.OPERATIONS_URIS"

    iget-object v1, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mUris:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v0, "org.dmfs.tasks.OPERATIONS"

    iget-object v1, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mOperations:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    if-eqz p2, :cond_2b

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mUris:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->mOperations:Ljava/util/ArrayList;

    :cond_2b
    monitor-exit p0

    return-object p1

    :catchall_2d
    move-exception v0

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_9 .. :try_end_2f} :catchall_2d

    throw v0
.end method

.method public toBundle(Z)Landroid/os/Bundle;
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->toBundle(Landroid/os/Bundle;Z)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

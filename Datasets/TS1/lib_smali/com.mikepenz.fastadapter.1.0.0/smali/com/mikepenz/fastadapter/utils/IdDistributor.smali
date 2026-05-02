.class public Lcom/mikepenz/fastadapter/utils/IdDistributor;
.super Ljava/lang/Object;
.source "IdDistributor.java"


# static fields
.field private static idDistributor:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 14
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide v1, 0x7ce66c50e2840000L

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v0, Lcom/mikepenz/fastadapter/utils/IdDistributor;->idDistributor:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkId(Lcom/mikepenz/fastadapter/IIdentifyable;)Lcom/mikepenz/fastadapter/IIdentifyable;
    .registers 5
    .param p0    # Lcom/mikepenz/fastadapter/IIdentifyable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/mikepenz/fastadapter/IIdentifyable;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "item":Lcom/mikepenz/fastadapter/IIdentifyable;, "TT;"
    invoke-interface {p0}, Lcom/mikepenz/fastadapter/IIdentifyable;->getIdentifier()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_13

    .line 50
    sget-object v0, Lcom/mikepenz/fastadapter/utils/IdDistributor;->idDistributor:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    invoke-interface {p0, v0, v1}, Lcom/mikepenz/fastadapter/IIdentifyable;->withIdentifier(J)Ljava/lang/Object;

    .line 52
    :cond_13
    return-object p0
.end method

.method public static checkIds(Ljava/util/List;)Ljava/util/List;
    .registers 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/mikepenz/fastadapter/IIdentifyable;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IIdentifyable;

    .line 24
    .local v0, "item":Lcom/mikepenz/fastadapter/IIdentifyable;, "TT;"
    invoke-static {v0}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkId(Lcom/mikepenz/fastadapter/IIdentifyable;)Lcom/mikepenz/fastadapter/IIdentifyable;

    goto :goto_4

    .line 26
    .end local v0    # "item":Lcom/mikepenz/fastadapter/IIdentifyable;, "TT;"
    :cond_14
    return-object p0
.end method

.method public static varargs checkIds([Lcom/mikepenz/fastadapter/IIdentifyable;)[Lcom/mikepenz/fastadapter/IIdentifyable;
    .registers 4
    .param p0    # [Lcom/mikepenz/fastadapter/IIdentifyable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/mikepenz/fastadapter/IIdentifyable;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "items":[Lcom/mikepenz/fastadapter/IIdentifyable;, "[TT;"
    array-length v2, p0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_c

    aget-object v0, p0, v1

    .line 37
    .local v0, "item":Lcom/mikepenz/fastadapter/IIdentifyable;, "TT;"
    invoke-static {v0}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkId(Lcom/mikepenz/fastadapter/IIdentifyable;)Lcom/mikepenz/fastadapter/IIdentifyable;

    .line 36
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 39
    .end local v0    # "item":Lcom/mikepenz/fastadapter/IIdentifyable;, "TT;"
    :cond_c
    return-object p0
.end method

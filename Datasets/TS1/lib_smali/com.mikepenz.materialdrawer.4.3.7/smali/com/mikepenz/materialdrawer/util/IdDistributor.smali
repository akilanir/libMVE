.class public Lcom/mikepenz/materialdrawer/util/IdDistributor;
.super Ljava/lang/Object;
.source "IdDistributor.java"


# static fields
.field private static idDistributor:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 14
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const v1, 0x77359400

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/mikepenz/materialdrawer/util/IdDistributor;->idDistributor:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
    .registers 3
    .param p0    # Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "item":Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;, "TT;"
    invoke-interface {p0}, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;->getIdentifier()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    .line 50
    sget-object v0, Lcom/mikepenz/materialdrawer/util/IdDistributor;->idDistributor:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    invoke-interface {p0, v0}, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;->withIdentifier(I)Ljava/lang/Object;

    .line 52
    :cond_10
    return-object p0
.end method

.method public static checkIds(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 4
    .param p0    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;",
            ">(",
            "Ljava/util/ArrayList",
            "<TT;>;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    .line 24
    .local v0, "item":Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;, "TT;"
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    goto :goto_4

    .line 26
    .end local v0    # "item":Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;, "TT;"
    :cond_14
    return-object p0
.end method

.method public static varargs checkIds([Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
    .registers 4
    .param p0    # [Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "items":[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;, "[TT;"
    array-length v2, p0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_c

    aget-object v0, p0, v1

    .line 37
    .local v0, "item":Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;, "TT;"
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    .line 36
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 39
    .end local v0    # "item":Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;, "TT;"
    :cond_c
    return-object p0
.end method

.class public Lorg/achartengine/model/CategorySeries;
.super Ljava/lang/Object;
.source "CategorySeries.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTitle:Ljava/lang/String;

.field private mValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    .line 39
    iput-object p1, p0, Lorg/achartengine/model/CategorySeries;->mTitle:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public declared-synchronized add(D)V
    .registers 5
    .param p1, "value"    # D

    .prologue
    .line 57
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/achartengine/model/CategorySeries;->add(Ljava/lang/String;D)V
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_1f

    .line 58
    monitor-exit p0

    return-void

    .line 57
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized add(Ljava/lang/String;D)V
    .registers 6
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 67
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 69
    monitor-exit p0

    return-void

    .line 67
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 97
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 98
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 99
    monitor-exit p0

    return-void

    .line 97
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCategory(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 118
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getItemCount()I
    .registers 2

    .prologue
    .line 127
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getValue(I)D
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 108
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_f

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 89
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 90
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 91
    monitor-exit p0

    return-void

    .line 89
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set(ILjava/lang/String;D)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "category"    # Ljava/lang/String;
    .param p3, "value"    # D

    .prologue
    .line 79
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mCategories:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 80
    iget-object v0, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 81
    monitor-exit p0

    return-void

    .line 79
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toXYSeries()Lorg/achartengine/model/XYSeries;
    .registers 8

    .prologue
    .line 136
    new-instance v4, Lorg/achartengine/model/XYSeries;

    iget-object v5, p0, Lorg/achartengine/model/CategorySeries;->mTitle:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;)V

    .line 137
    .local v4, "xySeries":Lorg/achartengine/model/XYSeries;
    const/4 v1, 0x0

    .line 138
    .local v1, "k":I
    iget-object v5, p0, Lorg/achartengine/model/CategorySeries;->mValues:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 139
    .local v2, "value":D
    add-int/lit8 v1, v1, 0x1

    int-to-double v5, v1

    invoke-virtual {v4, v5, v6, v2, v3}, Lorg/achartengine/model/XYSeries;->add(DD)V

    goto :goto_e

    .line 141
    .end local v2    # "value":D
    :cond_25
    return-object v4
.end method

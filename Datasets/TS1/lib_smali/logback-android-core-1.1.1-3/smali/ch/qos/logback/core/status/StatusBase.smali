.class public abstract Lch/qos/logback/core/status/StatusBase;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/status/Status;


# static fields
.field private static final EMPTY_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field childrenList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation
.end field

.field date:J

.field level:I

.field final message:Ljava/lang/String;

.field final origin:Ljava/lang/Object;

.field throwable:Ljava/lang/Throwable;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lch/qos/logback/core/status/StatusBase;->EMPTY_LIST:Ljava/util/List;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/Object;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lch/qos/logback/core/status/StatusBase;-><init>(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lch/qos/logback/core/status/StatusBase;->level:I

    iput-object p2, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    iput-object p3, p0, Lch/qos/logback/core/status/StatusBase;->origin:Ljava/lang/Object;

    iput-object p4, p0, Lch/qos/logback/core/status/StatusBase;->throwable:Ljava/lang/Throwable;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lch/qos/logback/core/status/StatusBase;->date:J

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lch/qos/logback/core/status/Status;)V
    .registers 4

    monitor-enter p0

    if-nez p1, :cond_e

    :try_start_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null values are not valid Status."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_e
    :try_start_e
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    if-nez v0, :cond_19

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    :cond_19
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1e
    .catchall {:try_start_e .. :try_end_1e} :catchall_b

    monitor-exit p0

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-nez p1, :cond_9

    move v0, v1

    goto :goto_4

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_15

    move v0, v1

    goto :goto_4

    :cond_15
    check-cast p1, Lch/qos/logback/core/status/StatusBase;

    iget v2, p0, Lch/qos/logback/core/status/StatusBase;->level:I

    iget v3, p1, Lch/qos/logback/core/status/StatusBase;->level:I

    if-eq v2, v3, :cond_1f

    move v0, v1

    goto :goto_4

    :cond_1f
    iget-object v2, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    if-nez v2, :cond_29

    iget-object v2, p1, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4

    :cond_29
    iget-object v2, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    iget-object v3, p1, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public getDate()Ljava/lang/Long;
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/core/status/StatusBase;->date:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getEffectiveLevel()I
    .registers 4

    monitor-enter p0

    :try_start_1
    iget v0, p0, Lch/qos/logback/core/status/StatusBase;->level:I

    invoke-virtual {p0}, Lch/qos/logback/core/status/StatusBase;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :cond_8
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getEffectiveLevel()I
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_1e

    move-result v0

    if-le v0, v1, :cond_8

    move v1, v0

    goto :goto_8

    :cond_1c
    monitor-exit p0

    return v1

    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getLevel()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/status/StatusBase;->level:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getOrigin()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->origin:Ljava/lang/Object;

    return-object v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public declared-synchronized hasChildren()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_12

    move-result v0

    if-lez v0, :cond_10

    const/4 v0, 0x1

    :goto_e
    monitor-exit p0

    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_e

    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public hashCode()I
    .registers 3

    iget v0, p0, Lch/qos/logback/core/status/StatusBase;->level:I

    add-int/lit8 v0, v0, 0x1f

    mul-int/lit8 v1, v0, 0x1f

    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    if-nez v0, :cond_d

    const/4 v0, 0x0

    :goto_b
    add-int/2addr v0, v1

    return v0

    :cond_d
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_b
.end method

.method public declared-synchronized iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_14

    move-result-object v0

    :goto_b
    monitor-exit p0

    return-object v0

    :cond_d
    :try_start_d
    sget-object v0, Lch/qos/logback/core/status/StatusBase;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_14

    move-result-object v0

    goto :goto_b

    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Lch/qos/logback/core/status/Status;)Z
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lch/qos/logback/core/status/StatusBase;->childrenList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_f

    move-result v0

    goto :goto_6

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lch/qos/logback/core/status/StatusBase;->getEffectiveLevel()I

    move-result v1

    packed-switch v1, :pswitch_data_4e

    :goto_c
    iget-object v1, p0, Lch/qos/logback/core/status/StatusBase;->origin:Ljava/lang/Object;

    if-eqz v1, :cond_1f

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lch/qos/logback/core/status/StatusBase;->origin:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v1, " -"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_1f
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lch/qos/logback/core/status/StatusBase;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lch/qos/logback/core/status/StatusBase;->throwable:Ljava/lang/Throwable;

    if-eqz v1, :cond_37

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lch/qos/logback/core/status/StatusBase;->throwable:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_3c
    const-string v1, "INFO"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_c

    :pswitch_42
    const-string v1, "WARN"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_c

    :pswitch_48
    const-string v1, "ERROR"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_c

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_42
        :pswitch_48
    .end packed-switch
.end method

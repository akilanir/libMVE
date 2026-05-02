.class public Lch/qos/logback/core/spi/AppenderAttachableImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/spi/AppenderAttachable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/spi/AppenderAttachable",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final START:J


# instance fields
.field private final appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lch/qos/logback/core/Appender",
            "<TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->START:J

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method


# virtual methods
.method public addAppender(Lch/qos/logback/core/Appender;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Appender",
            "<TE;>;)V"
        }
    .end annotation

    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null argument disallowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->addIfAbsent(Ljava/lang/Object;)Z

    return-void
.end method

.method public appendLoopOnAppenders(Ljava/lang/Object;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)I"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/Appender;

    invoke-interface {v0, p1}, Lch/qos/logback/core/Appender;->doAppend(Ljava/lang/Object;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_8

    :cond_1b
    return v1
.end method

.method public detachAndStopAllAppenders()V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/Appender;

    invoke-interface {v0}, Lch/qos/logback/core/Appender;->stop()V

    goto :goto_6

    :cond_16
    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    return-void
.end method

.method public detachAppender(Lch/qos/logback/core/Appender;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Appender",
            "<TE;>;)Z"
        }
    .end annotation

    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public detachAppender(Ljava/lang/String;)Z
    .registers 6

    const/4 v1, 0x0

    if-nez p1, :cond_4

    :goto_3
    return v1

    :cond_4
    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/Appender;

    invoke-interface {v0}, Lch/qos/logback/core/Appender;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    iget-object v1, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    :goto_26
    move v1, v0

    goto :goto_3

    :cond_28
    move v0, v1

    goto :goto_26
.end method

.method public getAppender(Ljava/lang/String;)Lch/qos/logback/core/Appender;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lch/qos/logback/core/Appender",
            "<TE;>;"
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p1, :cond_5

    move-object v0, v1

    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/Appender;

    invoke-interface {v0}, Lch/qos/logback/core/Appender;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    goto :goto_4

    :cond_22
    move-object v0, v1

    goto :goto_4
.end method

.method public isAttached(Lch/qos/logback/core/Appender;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Appender",
            "<TE;>;)Z"
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p1, :cond_5

    move v0, v1

    :goto_4
    return v0

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/Appender;

    if-ne v0, p1, :cond_b

    const/4 v0, 0x1

    goto :goto_4

    :cond_1b
    move v0, v1

    goto :goto_4
.end method

.method public iteratorForAppenders()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lch/qos/logback/core/Appender",
            "<TE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appenderList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

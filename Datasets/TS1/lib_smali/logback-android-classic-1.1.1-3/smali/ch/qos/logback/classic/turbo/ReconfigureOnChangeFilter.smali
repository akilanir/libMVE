.class public Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;
.super Lch/qos/logback/classic/turbo/TurboFilter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;
    }
.end annotation


# static fields
.field public static final DEFAULT_REFRESH_PERIOD:J = 0xea60L

.field private static final MASK_DECREASE_THRESHOLD:J = 0x320L

.field private static final MASK_INCREASE_THRESHOLD:J = 0x64L

.field private static final MAX_MASK:I = 0xffff


# instance fields
.field configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

.field private invocationCounter:J

.field private volatile lastMaskCheck:J

.field mainConfigurationURL:Ljava/net/URL;

.field private volatile mask:J

.field protected volatile nextCheck:J

.field refreshPeriod:J


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/classic/turbo/TurboFilter;-><init>()V

    const-wide/32 v0, 0xea60

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->refreshPeriod:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->invocationCounter:J

    const-wide/16 v0, 0xf

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->lastMaskCheck:J

    return-void
.end method

.method static synthetic access$000(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method static synthetic access$100(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method static synthetic access$200(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method static synthetic access$300(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method static synthetic access$400(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method static synthetic access$500(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method static synthetic access$600(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method private updateMaskIfNecessary(J)V
    .registers 9

    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->lastMaskCheck:J

    sub-long v0, p1, v0

    iput-wide p1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->lastMaskCheck:J

    const-wide/16 v2, 0x64

    cmp-long v2, v0, v2

    if-gez v2, :cond_1f

    iget-wide v2, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    const-wide/32 v4, 0xffff

    cmp-long v2, v2, v4

    if-gez v2, :cond_1f

    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    const/4 v2, 0x1

    shl-long/2addr v0, v2

    const-wide/16 v2, 0x1

    or-long/2addr v0, v2

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    :cond_1e
    :goto_1e
    return-void

    :cond_1f
    const-wide/16 v2, 0x320

    cmp-long v0, v0, v2

    if-lez v0, :cond_1e

    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    const/4 v2, 0x2

    ushr-long/2addr v0, v2

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    goto :goto_1e
.end method


# virtual methods
.method protected changeDetected(J)Z
    .registers 5

    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->nextCheck:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_10

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->updateNextCheck(J)V

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->changeDetected()Z

    move-result v0

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public decide(Lorg/slf4j/Marker;Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Level;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)Lch/qos/logback/core/spi/FilterReply;
    .registers 11

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->isStarted()Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    :goto_8
    return-object v0

    :cond_9
    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->invocationCounter:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->invocationCounter:J

    iget-wide v2, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    and-long/2addr v0, v2

    iget-wide v2, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mask:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1c

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_8

    :cond_1c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    monitor-enter v2

    :try_start_23
    invoke-direct {p0, v0, v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->updateMaskIfNecessary(J)V

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->changeDetected(J)Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->disableSubsequentReconfiguration()V

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->detachReconfigurationToNewThread()V

    :cond_32
    monitor-exit v2
    :try_end_33
    .catchall {:try_start_23 .. :try_end_33} :catchall_36

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_8

    :catchall_36
    move-exception v0

    :try_start_37
    monitor-exit v2
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_36

    throw v0
.end method

.method detachReconfigurationToNewThread()V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Detected change in ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    invoke-virtual {v1}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->getCopyOfFileWatchList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;

    invoke-direct {v1, p0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread;-><init>(Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method disableSubsequentReconfiguration()V
    .registers 3

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->nextCheck:J

    return-void
.end method

.method public getRefreshPeriod()J
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->refreshPeriod:J

    return-wide v0
.end method

.method public setRefreshPeriod(J)V
    .registers 3

    iput-wide p1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->refreshPeriod:J

    return-void
.end method

.method public start()V
    .registers 6

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->context:Lch/qos/logback/core/Context;

    invoke-static {v0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->getConfigurationWatchList(Lch/qos/logback/core/Context;)Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    if-eqz v0, :cond_61

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->getMainURL()Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mainConfigurationURL:Ljava/net/URL;

    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->mainConfigurationURL:Ljava/net/URL;

    if-nez v0, :cond_1e

    const-string v0, "Due to missing top level configuration file, automatic reconfiguration is impossible."

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addWarn(Ljava/lang/String;)V

    :goto_1d
    return-void

    :cond_1e
    iget-object v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->getCopyOfFileWatchList()Ljava/util/List;

    move-result-object v0

    iget-wide v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->refreshPeriod:J

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Will scan for changes in ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "] every "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " seconds. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addInfo(Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->configurationWatchList:Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    monitor-enter v1

    :try_start_52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->updateNextCheck(J)V

    monitor-exit v1
    :try_end_5a
    .catchall {:try_start_52 .. :try_end_5a} :catchall_5e

    invoke-super {p0}, Lch/qos/logback/classic/turbo/TurboFilter;->start()V

    goto :goto_1d

    :catchall_5e
    move-exception v0

    :try_start_5f
    monitor-exit v1
    :try_end_60
    .catchall {:try_start_5f .. :try_end_60} :catchall_5e

    throw v0

    :cond_61
    const-string v0, "Empty ConfigurationWatchList in context"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->addWarn(Ljava/lang/String;)V

    goto :goto_1d
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ReconfigureOnChangeFilter{invocationCounter="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->invocationCounter:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method updateNextCheck(J)V
    .registers 5

    iget-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->refreshPeriod:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->nextCheck:J

    return-void
.end method

.class public Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;
.super Ljava/lang/Object;


# static fields
.field static final origin:Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;

    invoke-direct {v0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;-><init>()V

    sput-object v0, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->origin:Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addInfo(Lch/qos/logback/core/Context;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/InfoStatus;

    sget-object v1, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->origin:Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, v0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->addStatus(Lch/qos/logback/core/Context;Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method static addStatus(Lch/qos/logback/core/Context;Lch/qos/logback/core/status/Status;)V
    .registers 5

    if-nez p0, :cond_21

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Null context in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_20
    :goto_20
    return-void

    :cond_21
    invoke-interface {p0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-interface {v0, p1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    goto :goto_20
.end method

.method public static addToWatchList(Lch/qos/logback/core/Context;Ljava/net/URL;)V
    .registers 5

    invoke-static {p0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->getConfigurationWatchList(Lch/qos/logback/core/Context;)Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    move-result-object v0

    if-nez v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Null ConfigurationWatchList. Cannot add "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->addWarn(Lch/qos/logback/core/Context;Ljava/lang/String;)V

    :goto_1c
    return-void

    :cond_1d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] to configuration watch list."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->addInfo(Lch/qos/logback/core/Context;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->addToWatchList(Ljava/net/URL;)V

    goto :goto_1c
.end method

.method static addWarn(Lch/qos/logback/core/Context;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    sget-object v1, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->origin:Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p0, v0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->addStatus(Lch/qos/logback/core/Context;Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public static getConfigurationWatchList(Lch/qos/logback/core/Context;)Lch/qos/logback/core/joran/spi/ConfigurationWatchList;
    .registers 2

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    const-string v0, "CONFIGURATION_WATCH_LIST"

    invoke-interface {p0, v0}, Lch/qos/logback/core/Context;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    goto :goto_3
.end method

.method public static getMainWatchURL(Lch/qos/logback/core/Context;)Ljava/net/URL;
    .registers 2

    invoke-static {p0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->getConfigurationWatchList(Lch/qos/logback/core/Context;)Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->getMainURL()Ljava/net/URL;

    move-result-object v0

    goto :goto_7
.end method

.method public static setConfigurationWatchListResetFlag(Lch/qos/logback/core/Context;Z)V
    .registers 4

    const-string v0, "CONFIGURATION_WATCH_LIST_RESET"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Lch/qos/logback/core/Context;->putObject(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static setMainWatchURL(Lch/qos/logback/core/Context;Ljava/net/URL;)V
    .registers 4

    if-nez p0, :cond_3

    :goto_2
    return-void

    :cond_3
    invoke-static {p0}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->getConfigurationWatchList(Lch/qos/logback/core/Context;)Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    move-result-object v0

    if-nez v0, :cond_1e

    new-instance v0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;

    invoke-direct {v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;-><init>()V

    invoke-virtual {v0, p0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->setContext(Lch/qos/logback/core/Context;)V

    const-string v1, "CONFIGURATION_WATCH_LIST"

    invoke-interface {p0, v1, v0}, Lch/qos/logback/core/Context;->putObject(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_16
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->setConfigurationWatchListResetFlag(Lch/qos/logback/core/Context;Z)V

    invoke-virtual {v0, p1}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->setMainURL(Ljava/net/URL;)V

    goto :goto_2

    :cond_1e
    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->clear()V

    goto :goto_16
.end method

.method public static wasConfigurationWatchListReset(Lch/qos/logback/core/Context;)Z
    .registers 3

    const/4 v1, 0x0

    if-nez p0, :cond_5

    move v0, v1

    :goto_4
    return v0

    :cond_5
    const-string v0, "CONFIGURATION_WATCH_LIST_RESET"

    invoke-interface {p0, v0}, Lch/qos/logback/core/Context;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_f

    move v0, v1

    goto :goto_4

    :cond_f
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_4
.end method

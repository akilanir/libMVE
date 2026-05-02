.class public Lch/qos/logback/core/status/StatusUtil;
.super Ljava/lang/Object;


# instance fields
.field sm:Lch/qos/logback/core/status/StatusManager;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/core/status/StatusManager;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    return-void
.end method

.method public static contextHasStatusListener(Lch/qos/logback/core/Context;)Z
    .registers 3

    const/4 v0, 0x0

    invoke-interface {p0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v1

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    invoke-interface {v1}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusListenerList()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method public static filterStatusListByTimeThreshold(Ljava/util/List;J)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;J)",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getDate()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v3, v3, p1

    if-ltz v3, :cond_9

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_25
    return-object v1
.end method


# virtual methods
.method public addError(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Lch/qos/logback/core/status/ErrorStatus;

    invoke-direct {v0, p2, p1, p3}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/status/StatusUtil;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addInfo(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/InfoStatus;

    invoke-direct {v0, p2, p1}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/status/StatusUtil;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addStatus(Lch/qos/logback/core/status/Status;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v0, p1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    :cond_9
    return-void
.end method

.method public addWarn(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    invoke-direct {v0, p2, p1}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/status/StatusUtil;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public containsException(Ljava/lang/Class;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getThrowable()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_2f
    return v0

    :cond_30
    const/4 v0, 0x0

    goto :goto_2f
.end method

.method public containsMatch(ILjava/lang/String;)Z
    .registers 5

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->containsMatch(JILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public containsMatch(JILjava/lang/String;)Z
    .registers 9

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->filterStatusListByTimeThreshold(Ljava/util/List;J)Ljava/util/List;

    move-result-object v0

    invoke-static {p4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getLevel()I

    move-result v3

    if-ne p3, v3, :cond_12

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_33
    return v0

    :cond_34
    const/4 v0, 0x0

    goto :goto_33
.end method

.method public containsMatch(Ljava/lang/String;)Z
    .registers 5

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_29
    return v0

    :cond_2a
    const/4 v0, 0x0

    goto :goto_29
.end method

.method public getHighestLevel(J)I
    .registers 7

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->filterStatusListByTimeThreshold(Ljava/util/List;J)Ljava/util/List;

    move-result-object v1

    const/4 v0, 0x0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getLevel()I

    move-result v3

    if-le v3, v1, :cond_29

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getLevel()I

    move-result v0

    :goto_26
    move v1, v0

    goto :goto_10

    :cond_28
    return v1

    :cond_29
    move v0, v1

    goto :goto_26
.end method

.method public hasXMLParsingErrors(J)Z
    .registers 5

    const/4 v0, 0x2

    const-string v1, "XML_PARSING"

    invoke-virtual {p0, p1, p2, v0, v1}, Lch/qos/logback/core/status/StatusUtil;->containsMatch(JILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isErrorFree(J)Z
    .registers 5

    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->getHighestLevel(J)I

    move-result v1

    if-le v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public matchCount(Ljava/lang/String;)I
    .registers 6

    const/4 v0, 0x0

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    iget-object v1, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v1}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result v0

    if-eqz v0, :cond_2f

    add-int/lit8 v0, v1, 0x1

    :goto_2c
    move v1, v0

    goto :goto_10

    :cond_2e
    return v1

    :cond_2f
    move v0, v1

    goto :goto_2c
.end method

.method public noXMLParsingErrorsOccurred(J)Z
    .registers 4

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/core/status/StatusUtil;->hasXMLParsingErrors(J)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public timeOfLastReset()J
    .registers 8

    const-wide/16 v1, -0x1

    iget-object v0, p0, Lch/qos/logback/core/status/StatusUtil;->sm:Lch/qos/logback/core/status/StatusManager;

    invoke-interface {v0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v4

    if-nez v4, :cond_c

    move-wide v0, v1

    :goto_b
    return-wide v0

    :cond_c
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v3, v0

    :goto_13
    if-ltz v3, :cond_34

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    const-string v5, "Will reset and reconfigure context "

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_30

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getDate()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_b

    :cond_30
    add-int/lit8 v0, v3, -0x1

    move v3, v0

    goto :goto_13

    :cond_34
    move-wide v0, v1

    goto :goto_b
.end method

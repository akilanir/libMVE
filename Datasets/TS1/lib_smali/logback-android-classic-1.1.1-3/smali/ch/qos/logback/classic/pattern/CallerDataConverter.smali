.class public Lch/qos/logback/classic/pattern/CallerDataConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# static fields
.field public static final DEFAULT_CALLER_LINE_PREFIX:Ljava/lang/String; = "Caller+"


# instance fields
.field final MAX_ERROR_COUNT:I

.field depth:I

.field errorCount:I

.field evaluatorList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/boolex/EventEvaluator",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    const/4 v0, 0x5

    iput v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->depth:I

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    const/4 v0, 0x4

    iput v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->MAX_ERROR_COUNT:I

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->errorCount:I

    return-void
.end method

.method private addEvaluator(Lch/qos/logback/core/boolex/EventEvaluator;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/boolex/EventEvaluator",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    :cond_b
    iget-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 11

    const/4 v8, 0x4

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    if-eqz v0, :cond_8b

    move v1, v2

    :goto_c
    iget-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_c5

    iget-object v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->evaluatorList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/boolex/EventEvaluator;

    :try_start_1c
    invoke-interface {v0, p1}, Lch/qos/logback/core/boolex/EventEvaluator;->evaluate(Ljava/lang/Object;)Z
    :try_end_1f
    .catch Lch/qos/logback/core/boolex/EvaluationException; {:try_start_1c .. :try_end_1f} :catch_28

    move-result v0

    if-eqz v0, :cond_53

    const/4 v0, 0x1

    :goto_23
    if-nez v0, :cond_8b

    const-string v0, ""

    :goto_27
    return-object v0

    :catch_28
    move-exception v4

    iget v5, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->errorCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->errorCount:I

    iget v5, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->errorCount:I

    if-ge v5, v8, :cond_57

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception thrown for evaluator named ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Lch/qos/logback/core/boolex/EventEvaluator;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "]"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v4}, Lch/qos/logback/classic/pattern/CallerDataConverter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_53
    :goto_53
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_c

    :cond_57
    iget v5, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->errorCount:I

    if-ne v5, v8, :cond_53

    new-instance v5, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception thrown for evaluator named ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Lch/qos/logback/core/boolex/EventEvaluator;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, "]."

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0, p0, v4}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    new-instance v0, Lch/qos/logback/core/status/ErrorStatus;

    const-string v4, "This was the last warning about this evaluator\'s errors.We don\'t want the StatusManager to get flooded."

    invoke-direct {v0, v4, p0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v5, v0}, Lch/qos/logback/core/status/ErrorStatus;->add(Lch/qos/logback/core/status/Status;)V

    invoke-virtual {p0, v5}, Lch/qos/logback/classic/pattern/CallerDataConverter;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_53

    :cond_8b
    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getCallerData()[Ljava/lang/StackTraceElement;

    move-result-object v1

    if-eqz v1, :cond_c1

    array-length v0, v1

    if-lez v0, :cond_c1

    iget v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->depth:I

    array-length v4, v1

    if-ge v0, v4, :cond_b9

    iget v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->depth:I

    :goto_9b
    if-ge v2, v0, :cond_bb

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/CallerDataConverter;->getCallerLinePrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "\t at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v4, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_9b

    :cond_b9
    array-length v0, v1

    goto :goto_9b

    :cond_bb
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_27

    :cond_c1
    sget-object v0, Lch/qos/logback/classic/spi/CallerData;->CALLER_DATA_NA:Ljava/lang/String;

    goto/16 :goto_27

    :cond_c5
    move v0, v2

    goto/16 :goto_23
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/CallerDataConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCallerLinePrefix()Ljava/lang/String;
    .registers 2

    const-string v0, "Caller+"

    return-object v0
.end method

.method public start()V
    .registers 7

    const/4 v1, 0x1

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/CallerDataConverter;->getFirstOption()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_8

    :cond_7
    return-void

    :cond_8
    :try_start_8
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lch/qos/logback/classic/pattern/CallerDataConverter;->depth:I
    :try_end_e
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_e} :catch_44

    :goto_e
    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/CallerDataConverter;->getOptionList()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v1, :cond_7

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    move v2, v1

    :goto_1f
    if-ge v2, v4, :cond_7

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/CallerDataConverter;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    if-eqz v1, :cond_40

    const-string v5, "EVALUATOR_MAP"

    invoke-interface {v1, v5}, Lch/qos/logback/core/Context;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/boolex/EventEvaluator;

    if-eqz v0, :cond_40

    invoke-direct {p0, v0}, Lch/qos/logback/classic/pattern/CallerDataConverter;->addEvaluator(Lch/qos/logback/core/boolex/EventEvaluator;)V

    :cond_40
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1f

    :catch_44
    move-exception v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to parse depth option ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lch/qos/logback/classic/pattern/CallerDataConverter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_e
.end method

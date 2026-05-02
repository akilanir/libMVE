.class public Lch/qos/logback/classic/selector/DefaultContextSelector;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/classic/selector/ContextSelector;


# instance fields
.field private defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;


# direct methods
.method public constructor <init>(Lch/qos/logback/classic/LoggerContext;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/selector/DefaultContextSelector;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    return-void
.end method


# virtual methods
.method public detachLoggerContext(Ljava/lang/String;)Lch/qos/logback/classic/LoggerContext;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/classic/selector/DefaultContextSelector;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    return-object v0
.end method

.method public getContextNames()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lch/qos/logback/classic/selector/DefaultContextSelector;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-virtual {v2}, Lch/qos/logback/classic/LoggerContext;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultLoggerContext()Lch/qos/logback/classic/LoggerContext;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/selector/DefaultContextSelector;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    return-object v0
.end method

.method public getLoggerContext()Lch/qos/logback/classic/LoggerContext;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/classic/selector/DefaultContextSelector;->getDefaultLoggerContext()Lch/qos/logback/classic/LoggerContext;

    move-result-object v0

    return-object v0
.end method

.method public getLoggerContext(Ljava/lang/String;)Lch/qos/logback/classic/LoggerContext;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/classic/selector/DefaultContextSelector;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-virtual {v0}, Lch/qos/logback/classic/LoggerContext;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lch/qos/logback/classic/selector/DefaultContextSelector;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

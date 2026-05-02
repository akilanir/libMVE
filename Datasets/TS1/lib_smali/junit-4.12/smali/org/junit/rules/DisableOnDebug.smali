.class public Lorg/junit/rules/DisableOnDebug;
.super Ljava/lang/Object;
.source "DisableOnDebug.java"

# interfaces
.implements Lorg/junit/rules/TestRule;


# instance fields
.field private final debugging:Z

.field private final rule:Lorg/junit/rules/TestRule;


# direct methods
.method public constructor <init>(Lorg/junit/rules/TestRule;)V
    .registers 3
    .param p1, "rule"    # Lorg/junit/rules/TestRule;

    .prologue
    .line 57
    invoke-static {}, Ljava/lang/management/ManagementFactory;->getRuntimeMXBean()Ljava/lang/management/RuntimeMXBean;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/management/RuntimeMXBean;->getInputArguments()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/junit/rules/DisableOnDebug;-><init>(Lorg/junit/rules/TestRule;Ljava/util/List;)V

    .line 59
    return-void
.end method

.method constructor <init>(Lorg/junit/rules/TestRule;Ljava/util/List;)V
    .registers 4
    .param p1, "rule"    # Lorg/junit/rules/TestRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/rules/TestRule;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p2, "inputArguments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/junit/rules/DisableOnDebug;->rule:Lorg/junit/rules/TestRule;

    .line 70
    invoke-static {p2}, Lorg/junit/rules/DisableOnDebug;->isDebugging(Ljava/util/List;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/junit/rules/DisableOnDebug;->debugging:Z

    .line 71
    return-void
.end method

.method private static isDebugging(Ljava/util/List;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p0, "arguments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 105
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 106
    .local v0, "argument":Ljava/lang/String;
    const-string v3, "-Xdebug"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 112
    .end local v0    # "argument":Ljava/lang/String;
    :goto_19
    return v2

    .line 108
    .restart local v0    # "argument":Ljava/lang/String;
    :cond_1a
    const-string v3, "-agentlib:jdwp"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_19

    .line 112
    .end local v0    # "argument":Ljava/lang/String;
    :cond_23
    const/4 v2, 0x0

    goto :goto_19
.end method


# virtual methods
.method public apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .registers 4
    .param p1, "base"    # Lorg/junit/runners/model/Statement;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 77
    iget-boolean v0, p0, Lorg/junit/rules/DisableOnDebug;->debugging:Z

    if-eqz v0, :cond_5

    .line 80
    .end local p1    # "base":Lorg/junit/runners/model/Statement;
    :goto_4
    return-object p1

    .restart local p1    # "base":Lorg/junit/runners/model/Statement;
    :cond_5
    iget-object v0, p0, Lorg/junit/rules/DisableOnDebug;->rule:Lorg/junit/rules/TestRule;

    invoke-interface {v0, p1, p2}, Lorg/junit/rules/TestRule;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;

    move-result-object p1

    goto :goto_4
.end method

.method public isDebugging()Z
    .registers 2

    .prologue
    .line 124
    iget-boolean v0, p0, Lorg/junit/rules/DisableOnDebug;->debugging:Z

    return v0
.end method

.class public Lorg/junit/internal/TextListener;
.super Lorg/junit/runner/notification/RunListener;
.source "TextListener.java"


# instance fields
.field private final writer:Ljava/io/PrintStream;


# direct methods
.method public constructor <init>(Ljava/io/PrintStream;)V
    .registers 2
    .param p1, "writer"    # Ljava/io/PrintStream;

    .prologue
    .line 20
    invoke-direct {p0}, Lorg/junit/runner/notification/RunListener;-><init>()V

    .line 21
    iput-object p1, p0, Lorg/junit/internal/TextListener;->writer:Ljava/io/PrintStream;

    .line 22
    return-void
.end method

.method public constructor <init>(Lorg/junit/internal/JUnitSystem;)V
    .registers 3
    .param p1, "system"    # Lorg/junit/internal/JUnitSystem;

    .prologue
    .line 17
    invoke-interface {p1}, Lorg/junit/internal/JUnitSystem;->out()Ljava/io/PrintStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/internal/TextListener;-><init>(Ljava/io/PrintStream;)V

    .line 18
    return-void
.end method

.method private getWriter()Ljava/io/PrintStream;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/junit/internal/TextListener;->writer:Ljava/io/PrintStream;

    return-object v0
.end method


# virtual methods
.method protected elapsedTimeAsString(J)Ljava/lang/String;
    .registers 8
    .param p1, "runTime"    # J

    .prologue
    .line 99
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v0

    long-to-double v1, p1

    const-wide v3, 0x408f400000000000L    # 1000.0

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected printFailure(Lorg/junit/runner/notification/Failure;Ljava/lang/String;)V
    .registers 6
    .param p1, "each"    # Lorg/junit/runner/notification/Failure;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/junit/runner/notification/Failure;->getTestHeader()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {p1}, Lorg/junit/runner/notification/Failure;->getTrace()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method protected printFailures(Lorg/junit/runner/Result;)V
    .registers 10
    .param p1, "result"    # Lorg/junit/runner/Result;

    .prologue
    .line 60
    invoke-virtual {p1}, Lorg/junit/runner/Result;->getFailures()Ljava/util/List;

    move-result-object v1

    .line 61
    .local v1, "failures":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/notification/Failure;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_b

    .line 73
    :cond_a
    return-void

    .line 64
    :cond_b
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_61

    .line 65
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "There was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " failure:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 69
    :goto_36
    const/4 v2, 0x1

    .line 70
    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_3b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/notification/Failure;

    .line 71
    .local v0, "each":Lorg/junit/runner/notification/Failure;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v0, v5}, Lorg/junit/internal/TextListener;->printFailure(Lorg/junit/runner/notification/Failure;Ljava/lang/String;)V

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_3b

    .line 67
    .end local v0    # "each":Lorg/junit/runner/notification/Failure;
    .end local v2    # "i":I
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_61
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "There were "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " failures:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_36
.end method

.method protected printFooter(Lorg/junit/runner/Result;)V
    .registers 6
    .param p1, "result"    # Lorg/junit/runner/Result;

    .prologue
    .line 81
    invoke-virtual {p1}, Lorg/junit/runner/Result;->wasSuccessful()Z

    move-result v0

    if-eqz v0, :cond_58

    .line 82
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 83
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "OK"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 84
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/junit/runner/Result;->getRunCount()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " test"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/junit/runner/Result;->getRunCount()I

    move-result v0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_55

    const-string v0, ""

    :goto_3c
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    :goto_4d
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 92
    return-void

    .line 84
    :cond_55
    const-string v0, "s"

    goto :goto_3c

    .line 87
    :cond_58
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 88
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "FAILURES!!!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Tests run: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/junit/runner/Result;->getRunCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",  Failures: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/junit/runner/Result;->getFailureCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4d
.end method

.method protected printHeader(J)V
    .registers 6
    .param p1, "runTime"    # J

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 56
    invoke-direct {p0}, Lorg/junit/internal/TextListener;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Time: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, p1, p2}, Lorg/junit/internal/TextListener;->elapsedTimeAsString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 4
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;

    .prologue
    .line 38
    iget-object v0, p0, Lorg/junit/internal/TextListener;->writer:Ljava/io/PrintStream;

    const/16 v1, 0x45

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->append(C)Ljava/io/PrintStream;

    .line 39
    return-void
.end method

.method public testIgnored(Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/junit/internal/TextListener;->writer:Ljava/io/PrintStream;

    const/16 v1, 0x49

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->append(C)Ljava/io/PrintStream;

    .line 44
    return-void
.end method

.method public testRunFinished(Lorg/junit/runner/Result;)V
    .registers 4
    .param p1, "result"    # Lorg/junit/runner/Result;

    .prologue
    .line 26
    invoke-virtual {p1}, Lorg/junit/runner/Result;->getRunTime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/junit/internal/TextListener;->printHeader(J)V

    .line 27
    invoke-virtual {p0, p1}, Lorg/junit/internal/TextListener;->printFailures(Lorg/junit/runner/Result;)V

    .line 28
    invoke-virtual {p0, p1}, Lorg/junit/internal/TextListener;->printFooter(Lorg/junit/runner/Result;)V

    .line 29
    return-void
.end method

.method public testStarted(Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/junit/internal/TextListener;->writer:Ljava/io/PrintStream;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->append(C)Ljava/io/PrintStream;

    .line 34
    return-void
.end method

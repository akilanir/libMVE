.class public Ljunit/textui/ResultPrinter;
.super Ljava/lang/Object;
.source "ResultPrinter.java"

# interfaces
.implements Ljunit/framework/TestListener;


# instance fields
.field fColumn:I

.field fWriter:Ljava/io/PrintStream;


# direct methods
.method public constructor <init>(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/PrintStream;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput v0, p0, Ljunit/textui/ResultPrinter;->fColumn:I

    .line 19
    iput-object p1, p0, Ljunit/textui/ResultPrinter;->fWriter:Ljava/io/PrintStream;

    .line 20
    return-void
.end method


# virtual methods
.method public addError(Ljunit/framework/Test;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "test"    # Ljunit/framework/Test;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 110
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "E"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public addFailure(Ljunit/framework/Test;Ljunit/framework/AssertionFailedError;)V
    .registers 5
    .param p1, "test"    # Ljunit/framework/Test;
    .param p2, "t"    # Ljunit/framework/AssertionFailedError;

    .prologue
    .line 117
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "F"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 118
    return-void
.end method

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

.method public endTest(Ljunit/framework/Test;)V
    .registers 2
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 124
    return-void
.end method

.method public getWriter()Ljava/io/PrintStream;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Ljunit/textui/ResultPrinter;->fWriter:Ljava/io/PrintStream;

    return-object v0
.end method

.method declared-synchronized print(Ljunit/framework/TestResult;J)V
    .registers 5
    .param p1, "result"    # Ljunit/framework/TestResult;
    .param p2, "runTime"    # J

    .prologue
    .line 25
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p2, p3}, Ljunit/textui/ResultPrinter;->printHeader(J)V

    .line 26
    invoke-virtual {p0, p1}, Ljunit/textui/ResultPrinter;->printErrors(Ljunit/framework/TestResult;)V

    .line 27
    invoke-virtual {p0, p1}, Ljunit/textui/ResultPrinter;->printFailures(Ljunit/framework/TestResult;)V

    .line 28
    invoke-virtual {p0, p1}, Ljunit/textui/ResultPrinter;->printFooter(Ljunit/framework/TestResult;)V
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 29
    monitor-exit p0

    return-void

    .line 25
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public printDefect(Ljunit/framework/TestFailure;I)V
    .registers 3
    .param p1, "booBoo"    # Ljunit/framework/TestFailure;
    .param p2, "count"    # I

    .prologue
    .line 64
    invoke-virtual {p0, p1, p2}, Ljunit/textui/ResultPrinter;->printDefectHeader(Ljunit/framework/TestFailure;I)V

    .line 65
    invoke-virtual {p0, p1}, Ljunit/textui/ResultPrinter;->printDefectTrace(Ljunit/framework/TestFailure;)V

    .line 66
    return-void
.end method

.method protected printDefectHeader(Ljunit/framework/TestFailure;I)V
    .registers 6
    .param p1, "booBoo"    # Ljunit/framework/TestFailure;
    .param p2, "count"    # I

    .prologue
    .line 71
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljunit/framework/TestFailure;->failedTest()Ljunit/framework/Test;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method protected printDefectTrace(Ljunit/framework/TestFailure;)V
    .registers 4
    .param p1, "booBoo"    # Ljunit/framework/TestFailure;

    .prologue
    .line 75
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {p1}, Ljunit/framework/TestFailure;->trace()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljunit/runner/BaseTestRunner;->getFilteredTrace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method protected printDefects(Ljava/util/Enumeration;ILjava/lang/String;)V
    .registers 8
    .param p2, "count"    # I
    .param p3, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Enumeration",
            "<",
            "Ljunit/framework/TestFailure;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "booBoos":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljunit/framework/TestFailure;>;"
    if-nez p2, :cond_3

    .line 61
    :cond_2
    return-void

    .line 53
    :cond_3
    const/4 v1, 0x1

    if-ne p2, v1, :cond_43

    .line 54
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "There was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 58
    :goto_30
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_31
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 59
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljunit/framework/TestFailure;

    invoke-virtual {p0, v1, v0}, Ljunit/textui/ResultPrinter;->printDefect(Ljunit/framework/TestFailure;I)V

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    .line 56
    .end local v0    # "i":I
    :cond_43
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "There were "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_30
.end method

.method protected printErrors(Ljunit/framework/TestResult;)V
    .registers 5
    .param p1, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 44
    invoke-virtual {p1}, Ljunit/framework/TestResult;->errors()Ljava/util/Enumeration;

    move-result-object v0

    invoke-virtual {p1}, Ljunit/framework/TestResult;->errorCount()I

    move-result v1

    const-string v2, "error"

    invoke-virtual {p0, v0, v1, v2}, Ljunit/textui/ResultPrinter;->printDefects(Ljava/util/Enumeration;ILjava/lang/String;)V

    .line 45
    return-void
.end method

.method protected printFailures(Ljunit/framework/TestResult;)V
    .registers 5
    .param p1, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 48
    invoke-virtual {p1}, Ljunit/framework/TestResult;->failures()Ljava/util/Enumeration;

    move-result-object v0

    invoke-virtual {p1}, Ljunit/framework/TestResult;->failureCount()I

    move-result v1

    const-string v2, "failure"

    invoke-virtual {p0, v0, v1, v2}, Ljunit/textui/ResultPrinter;->printDefects(Ljava/util/Enumeration;ILjava/lang/String;)V

    .line 49
    return-void
.end method

.method protected printFooter(Ljunit/framework/TestResult;)V
    .registers 6
    .param p1, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 79
    invoke-virtual {p1}, Ljunit/framework/TestResult;->wasSuccessful()Z

    move-result v0

    if-eqz v0, :cond_58

    .line 80
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 81
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "OK"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljunit/framework/TestResult;->runCount()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " test"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljunit/framework/TestResult;->runCount()I

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
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 92
    return-void

    .line 82
    :cond_55
    const-string v0, "s"

    goto :goto_3c

    .line 85
    :cond_58
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 86
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "FAILURES!!!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Tests run: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljunit/framework/TestResult;->runCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",  Failures: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljunit/framework/TestResult;->failureCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",  Errors: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljunit/framework/TestResult;->errorCount()I

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
    .line 39
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 40
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Time: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, p1, p2}, Ljunit/textui/ResultPrinter;->elapsedTimeAsString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method printWaitPrompt()V
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 33
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "<RETURN> to continue"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public startTest(Ljunit/framework/Test;)V
    .registers 4
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 130
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 131
    iget v0, p0, Ljunit/textui/ResultPrinter;->fColumn:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Ljunit/textui/ResultPrinter;->fColumn:I

    const/16 v1, 0x28

    if-lt v0, v1, :cond_1d

    .line 132
    invoke-virtual {p0}, Ljunit/textui/ResultPrinter;->getWriter()Ljava/io/PrintStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 133
    const/4 v0, 0x0

    iput v0, p0, Ljunit/textui/ResultPrinter;->fColumn:I

    .line 135
    :cond_1d
    return-void
.end method

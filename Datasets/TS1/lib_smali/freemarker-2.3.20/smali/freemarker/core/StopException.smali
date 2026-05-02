.class public Lfreemarker/core/StopException;
.super Lfreemarker/template/TemplateException;
.source "StopException.java"


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lfreemarker/template/TemplateException;-><init>(Lfreemarker/core/Environment;)V

    .line 67
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0, p2, p1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 71
    return-void
.end method


# virtual methods
.method public printStackTrace(Ljava/io/PrintStream;)V
    .registers 5
    .param p1, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 85
    monitor-enter p1

    .line 86
    :try_start_1
    invoke-virtual {p0}, Lfreemarker/core/StopException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "Encountered stop instruction"

    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 88
    if-eqz v0, :cond_2f

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 89
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "\nCause given: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    :goto_2a
    invoke-super {p0, p1}, Lfreemarker/template/TemplateException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 92
    monitor-exit p1

    .line 93
    return-void

    .line 90
    :cond_2f
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    goto :goto_2a

    .line 92
    .end local v0    # "msg":Ljava/lang/String;
    :catchall_33
    move-exception v1

    monitor-exit p1
    :try_end_35
    .catchall {:try_start_1 .. :try_end_35} :catchall_33

    throw v1
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .registers 5
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 74
    monitor-enter p1

    .line 75
    :try_start_1
    invoke-virtual {p0}, Lfreemarker/core/StopException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "Encountered stop instruction"

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 77
    if-eqz v0, :cond_2f

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 78
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "\nCause given: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 80
    :goto_2a
    invoke-super {p0, p1}, Lfreemarker/template/TemplateException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 81
    monitor-exit p1

    .line 82
    return-void

    .line 79
    :cond_2f
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    goto :goto_2a

    .line 81
    .end local v0    # "msg":Ljava/lang/String;
    :catchall_33
    move-exception v1

    monitor-exit p1
    :try_end_35
    .catchall {:try_start_1 .. :try_end_35} :catchall_33

    throw v1
.end method

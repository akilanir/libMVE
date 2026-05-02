.class public Lfreemarker/template/utility/UndeclaredThrowableException;
.super Ljava/lang/RuntimeException;
.source "UndeclaredThrowableException.java"


# instance fields
.field private final t:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 16
    iput-object p1, p0, Lfreemarker/template/utility/UndeclaredThrowableException;->t:Ljava/lang/Throwable;

    .line 17
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lfreemarker/template/utility/UndeclaredThrowableException;->t:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getUndeclaredThrowable()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lfreemarker/template/utility/UndeclaredThrowableException;->t:Ljava/lang/Throwable;

    return-object v0
.end method

.method public printStackTrace()V
    .registers 2

    .prologue
    .line 21
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 22
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 26
    monitor-enter p1

    .line 28
    :try_start_1
    const-string v0, "Undeclared throwable:"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 29
    iget-object v0, p0, Lfreemarker/template/utility/UndeclaredThrowableException;->t:Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 30
    monitor-exit p1

    .line 31
    return-void

    .line 30
    :catchall_d
    move-exception v0

    monitor-exit p1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 35
    monitor-enter p1

    .line 37
    :try_start_1
    const-string v0, "Undeclared throwable:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lfreemarker/template/utility/UndeclaredThrowableException;->t:Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 39
    monitor-exit p1

    .line 40
    return-void

    .line 39
    :catchall_d
    move-exception v0

    monitor-exit p1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0
.end method

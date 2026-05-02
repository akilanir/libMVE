.class public Lcom/drew/lang/CompoundException;
.super Ljava/lang/Exception;
.source "CompoundException.java"


# static fields
.field private static final serialVersionUID:J = -0x7fc8f98afb126925L


# instance fields
.field private final _innerException:Ljava/lang/Throwable;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/drew/lang/CompoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p2, "innerException"    # Ljava/lang/Throwable;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 56
    iput-object p2, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "exception"    # Ljava/lang/Throwable;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/drew/lang/CompoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    return-void
.end method


# virtual methods
.method public getInnerException()Ljava/lang/Throwable;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    return-object v0
.end method

.method public printStackTrace()V
    .registers 3

    .prologue
    .line 103
    invoke-super {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 104
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    if-eqz v0, :cond_13

    .line 105
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "--- inner exception ---"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 106
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 108
    :cond_13
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "s"    # Ljava/io/PrintStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 83
    invoke-super {p0, p1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 84
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    if-eqz v0, :cond_11

    .line 85
    const-string v0, "--- inner exception ---"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 88
    :cond_11
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "s"    # Ljava/io/PrintWriter;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 93
    invoke-super {p0, p1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 94
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    if-eqz v0, :cond_11

    .line 95
    const-string v0, "--- inner exception ---"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 98
    :cond_11
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .local v0, "string":Ljava/lang/StringBuilder;
    invoke-super {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    iget-object v1, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    if-eqz v1, :cond_28

    .line 72
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    const-string v1, "--- inner exception ---"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    iget-object v1, p0, Lcom/drew/lang/CompoundException;->_innerException:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    :cond_28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

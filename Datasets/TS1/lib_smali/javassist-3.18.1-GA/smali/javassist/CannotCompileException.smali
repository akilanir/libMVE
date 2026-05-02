.class public Ljavassist/CannotCompileException;
.super Ljava/lang/Exception;
.source "CannotCompileException.java"


# instance fields
.field private message:Ljava/lang/String;

.field private myCause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/ClassFormatError;Ljava/lang/String;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/ClassFormatError;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid class format: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassNotFoundException;Ljava/lang/String;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/ClassNotFoundException;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot find "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 63
    iput-object p1, p0, Ljavassist/CannotCompileException;->message:Ljava/lang/String;

    .line 64
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/CannotCompileException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 87
    invoke-direct {p0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    .line 88
    invoke-virtual {p0, p2}, Ljavassist/CannotCompileException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 89
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "by "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/CannotCompileException;->message:Ljava/lang/String;

    .line 76
    invoke-virtual {p0, p1}, Ljavassist/CannotCompileException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 77
    return-void
.end method

.method public constructor <init>(Ljavassist/NotFoundException;)V
    .registers 4
    .param p1, "e"    # Ljavassist/NotFoundException;

    .prologue
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cannot find "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/CompileError;)V
    .registers 4
    .param p1, "e"    # Ljavassist/compiler/CompileError;

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[source error] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/compiler/CompileError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 104
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Ljavassist/CannotCompileException;->myCause:Ljava/lang/Throwable;

    if-ne v0, p0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Ljavassist/CannotCompileException;->myCause:Ljava/lang/Throwable;

    goto :goto_5
.end method

.method public getReason()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Ljavassist/CannotCompileException;->message:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 51
    iget-object v0, p0, Ljavassist/CannotCompileException;->message:Ljava/lang/String;

    .line 53
    :goto_6
    return-object v0

    :cond_7
    invoke-virtual {p0}, Ljavassist/CannotCompileException;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public declared-synchronized initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 40
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Ljavassist/CannotCompileException;->myCause:Ljava/lang/Throwable;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 41
    monitor-exit p0

    return-object p0

    .line 40
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

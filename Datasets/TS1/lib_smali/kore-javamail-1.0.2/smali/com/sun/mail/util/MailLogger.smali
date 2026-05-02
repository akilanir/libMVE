.class public final Lcom/sun/mail/util/MailLogger;
.super Ljava/lang/Object;
.source "MailLogger.java"


# instance fields
.field private final debug:Z

.field private final logger:Ljava/util/logging/Logger;

.field private final out:Ljava/io/PrintStream;

.field private final prefix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V
    .registers 9
    .param p2, "subname"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "debug"    # Z
    .param p5, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/io/PrintStream;",
            ")V"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lcom/sun/mail/util/MailLogger;->packageOf(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "name":Ljava/lang/String;
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    .line 137
    iput-object p3, p0, Lcom/sun/mail/util/MailLogger;->prefix:Ljava/lang/String;

    .line 138
    iput-boolean p4, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    .line 139
    if-eqz p5, :cond_2d

    .end local p5    # "out":Ljava/io/PrintStream;
    :goto_2a
    iput-object p5, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    .line 140
    return-void

    .line 139
    .restart local p5    # "out":Ljava/io/PrintStream;
    :cond_2d
    sget-object p5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    goto :goto_2a
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V
    .registers 6
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "session"    # Lkorex/mail/Session;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Lkorex/mail/Session;",
            ")V"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p3}, Lkorex/mail/Session;->getDebug()Z

    move-result v0

    invoke-virtual {p3}, Lkorex/mail/Session;->getDebugOut()Ljava/io/PrintStream;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;ZLjava/io/PrintStream;)V

    .line 167
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;ZLjava/io/PrintStream;)V
    .registers 7
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "debug"    # Z
    .param p4, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/io/PrintStream;",
            ")V"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    invoke-direct {p0, p1}, Lcom/sun/mail/util/MailLogger;->packageOf(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "name":Ljava/lang/String;
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    .line 117
    iput-object p2, p0, Lcom/sun/mail/util/MailLogger;->prefix:Ljava/lang/String;

    .line 118
    iput-boolean p3, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    .line 119
    if-eqz p4, :cond_16

    .end local p4    # "out":Ljava/io/PrintStream;
    :goto_13
    iput-object p4, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    .line 120
    return-void

    .line 119
    .restart local p4    # "out":Ljava/io/PrintStream;
    :cond_16
    sget-object p4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    goto :goto_13
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lkorex/mail/Session;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "session"    # Lkorex/mail/Session;

    .prologue
    .line 152
    invoke-virtual {p3}, Lkorex/mail/Session;->getDebug()Z

    move-result v0

    invoke-virtual {p3}, Lkorex/mail/Session;->getDebugOut()Ljava/io/PrintStream;

    move-result-object v1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V

    .line 153
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "debug"    # Z
    .param p4, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    invoke-static {p1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    .line 98
    iput-object p2, p0, Lcom/sun/mail/util/MailLogger;->prefix:Ljava/lang/String;

    .line 99
    iput-boolean p3, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    .line 100
    if-eqz p4, :cond_12

    .end local p4    # "out":Ljava/io/PrintStream;
    :goto_f
    iput-object p4, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    .line 101
    return-void

    .line 100
    .restart local p4    # "out":Ljava/io/PrintStream;
    :cond_12
    sget-object p4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    goto :goto_f
.end method

.method private debugOut(Ljava/lang/String;)V
    .registers 5
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 367
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_23

    .line 368
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sun/mail/util/MailLogger;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 371
    :goto_22
    return-void

    .line 370
    :cond_23
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_22
.end method

.method private ifDebugOut(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 358
    iget-boolean v0, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    if-eqz v0, :cond_7

    .line 359
    invoke-direct {p0, p1}, Lcom/sun/mail/util/MailLogger;->debugOut(Ljava/lang/String;)V

    .line 360
    :cond_7
    return-void
.end method

.method private inferCaller()Ljava/lang/StackTraceElement;
    .registers 9

    .prologue
    .line 403
    new-instance v4, Ljava/lang/Throwable;

    invoke-direct {v4}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 405
    .local v3, "stack":[Ljava/lang/StackTraceElement;
    const/4 v2, 0x0

    .line 406
    .local v2, "ix":I
    :goto_a
    array-length v4, v3

    if-ge v2, v4, :cond_19

    .line 407
    aget-object v1, v3, v2

    .line 408
    .local v1, "frame":Ljava/lang/StackTraceElement;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 409
    .local v0, "cname":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/sun/mail/util/MailLogger;->isLoggerImplFrame(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 415
    .end local v0    # "cname":Ljava/lang/String;
    .end local v1    # "frame":Ljava/lang/StackTraceElement;
    :cond_19
    :goto_19
    array-length v4, v3

    if-ge v2, v4, :cond_2f

    .line 416
    aget-object v1, v3, v2

    .line 417
    .restart local v1    # "frame":Ljava/lang/StackTraceElement;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 418
    .restart local v0    # "cname":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/sun/mail/util/MailLogger;->isLoggerImplFrame(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2c

    .line 427
    .end local v0    # "cname":Ljava/lang/String;
    .end local v1    # "frame":Ljava/lang/StackTraceElement;
    :goto_28
    return-object v1

    .line 412
    .restart local v0    # "cname":Ljava/lang/String;
    .restart local v1    # "frame":Ljava/lang/StackTraceElement;
    :cond_29
    add-int/lit8 v2, v2, 0x1

    .line 413
    goto :goto_a

    .line 422
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    .line 423
    goto :goto_19

    .line 426
    .end local v0    # "cname":Ljava/lang/String;
    .end local v1    # "frame":Ljava/lang/StackTraceElement;
    :cond_2f
    new-instance v1, Ljava/lang/StackTraceElement;

    const-class v4, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "log"

    const-class v6, Lcom/sun/mail/util/MailLogger;

    .line 427
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, -0x1

    invoke-direct {v1, v4, v5, v6, v7}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_28
.end method

.method private isLoggerImplFrame(Ljava/lang/String;)Z
    .registers 3
    .param p1, "cname"    # Ljava/lang/String;

    .prologue
    .line 436
    const-class v0, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private packageOf(Ljava/lang/Class;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 381
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v2

    .line 382
    .local v2, "p":Ljava/lang/Package;
    if-eqz v2, :cond_b

    .line 383
    invoke-virtual {v2}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v3

    .line 389
    :goto_a
    return-object v3

    .line 384
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 385
    .local v0, "cname":Ljava/lang/String;
    const/16 v3, 0x2e

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 386
    .local v1, "i":I
    if-lez v1, :cond_1d

    .line 387
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_a

    .line 389
    :cond_1d
    const-string v3, ""

    goto :goto_a
.end method


# virtual methods
.method public config(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 316
    sget-object v0, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {p0, v0, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 317
    return-void
.end method

.method public fine(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 324
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p0, v0, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 325
    return-void
.end method

.method public finer(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 332
    sget-object v0, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {p0, v0, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 333
    return-void
.end method

.method public finest(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 340
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {p0, v0, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 341
    return-void
.end method

.method public getLogger(Ljava/lang/Class;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;
    .registers 6
    .param p2, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sun/mail/util/MailLogger;"
        }
    .end annotation

    .prologue
    .line 193
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    iget-boolean v1, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    iget-object v2, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;ZLjava/io/PrintStream;)V

    return-object v0
.end method

.method public getLogger(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 179
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    iget-boolean v1, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    iget-object v2, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V

    return-object v0
.end method

.method public getSubLogger(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;
    .registers 7
    .param p1, "subname"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 208
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v2}, Ljava/util/logging/Logger;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    iget-object v3, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1, p2, v2, v3}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V

    return-object v0
.end method

.method public getSubLogger(Ljava/lang/String;Ljava/lang/String;Z)Lcom/sun/mail/util/MailLogger;
    .registers 7
    .param p1, "subname"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "debug"    # Z

    .prologue
    .line 226
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v2}, Ljava/util/logging/Logger;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1, p2, p3, v2}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V

    return-object v0
.end method

.method public isLoggable(Ljava/util/logging/Level;)Z
    .registers 3
    .param p1, "level"    # Ljava/util/logging/Level;

    .prologue
    .line 350
    iget-boolean v0, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;)V
    .registers 7
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 236
    invoke-direct {p0, p2}, Lcom/sun/mail/util/MailLogger;->ifDebugOut(Ljava/lang/String;)V

    .line 237
    iget-object v1, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v1, p1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 238
    invoke-direct {p0}, Lcom/sun/mail/util/MailLogger;->inferCaller()Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 239
    .local v0, "frame":Ljava/lang/StackTraceElement;
    iget-object v1, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3, p2}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    .end local v0    # "frame":Ljava/lang/StackTraceElement;
    :cond_1c
    return-void
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 11
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "param1"    # Ljava/lang/Object;

    .prologue
    .line 250
    iget-boolean v0, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    if-eqz v0, :cond_11

    .line 251
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    invoke-static {p2, v0}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 252
    invoke-direct {p0, p2}, Lcom/sun/mail/util/MailLogger;->debugOut(Ljava/lang/String;)V

    .line 255
    :cond_11
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 256
    invoke-direct {p0}, Lcom/sun/mail/util/MailLogger;->inferCaller()Ljava/lang/StackTraceElement;

    move-result-object v6

    .line 257
    .local v6, "frame":Ljava/lang/StackTraceElement;
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 259
    .end local v6    # "frame":Ljava/lang/StackTraceElement;
    :cond_2d
    return-void
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 11
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "thrown"    # Ljava/lang/Throwable;

    .prologue
    .line 296
    iget-boolean v0, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    if-eqz v0, :cond_21

    .line 297
    if-eqz p3, :cond_3e

    .line 298
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", THROW: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sun/mail/util/MailLogger;->debugOut(Ljava/lang/String;)V

    .line 299
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p3, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 305
    :cond_21
    :goto_21
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 306
    invoke-direct {p0}, Lcom/sun/mail/util/MailLogger;->inferCaller()Ljava/lang/StackTraceElement;

    move-result-object v6

    .line 307
    .local v6, "frame":Ljava/lang/StackTraceElement;
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    .end local v6    # "frame":Ljava/lang/StackTraceElement;
    :cond_3d
    return-void

    .line 301
    :cond_3e
    invoke-direct {p0, p2}, Lcom/sun/mail/util/MailLogger;->debugOut(Ljava/lang/String;)V

    goto :goto_21
.end method

.method public log(Ljava/util/logging/Level;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 11
    .param p1, "level"    # Ljava/util/logging/Level;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 268
    iget-boolean v0, p0, Lcom/sun/mail/util/MailLogger;->debug:Z

    if-eqz v0, :cond_b

    .line 269
    invoke-static {p2, p3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 270
    invoke-direct {p0, p2}, Lcom/sun/mail/util/MailLogger;->debugOut(Ljava/lang/String;)V

    .line 273
    :cond_b
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v0, p1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 274
    invoke-direct {p0}, Lcom/sun/mail/util/MailLogger;->inferCaller()Ljava/lang/StackTraceElement;

    move-result-object v6

    .line 275
    .local v6, "frame":Ljava/lang/StackTraceElement;
    iget-object v0, p0, Lcom/sun/mail/util/MailLogger;->logger:Ljava/util/logging/Logger;

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 277
    .end local v6    # "frame":Ljava/lang/StackTraceElement;
    :cond_27
    return-void
.end method

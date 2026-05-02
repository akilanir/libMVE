.class public Lroboguice/util/temp/Ln$Print;
.super Ljava/lang/Object;
.source "Ln.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lroboguice/util/temp/Ln;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Print"
.end annotation


# static fields
.field private static final DEFAULT_STACK_TRACE_LINE_COUNT:I = 0x5


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static getScope()Ljava/lang/String;
    .registers 3

    .prologue
    .line 264
    # getter for: Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;
    invoke-static {}, Lroboguice/util/temp/Ln;->access$000()Lroboguice/util/temp/Ln$BaseConfig;

    move-result-object v1

    iget v1, v1, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    const/4 v2, 0x3

    if-gt v1, v2, :cond_44

    .line 265
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x5

    aget-object v0, v1, v2

    .line 266
    .local v0, "trace":Ljava/lang/StackTraceElement;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    # getter for: Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;
    invoke-static {}, Lroboguice/util/temp/Ln;->access$000()Lroboguice/util/temp/Ln$BaseConfig;

    move-result-object v2

    iget-object v2, v2, Lroboguice/util/temp/Ln$BaseConfig;->scope:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 269
    .end local v0    # "trace":Ljava/lang/StackTraceElement;
    :goto_43
    return-object v1

    :cond_44
    # getter for: Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;
    invoke-static {}, Lroboguice/util/temp/Ln;->access$000()Lroboguice/util/temp/Ln$BaseConfig;

    move-result-object v1

    iget-object v1, v1, Lroboguice/util/temp/Ln$BaseConfig;->scope:Ljava/lang/String;

    goto :goto_43
.end method


# virtual methods
.method public println(ILjava/lang/String;)I
    .registers 5
    .param p1, "priority"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 253
    invoke-static {}, Lroboguice/util/temp/Ln$Print;->getScope()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2}, Lroboguice/util/temp/Ln$Print;->processMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected processMessage(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x3

    .line 257
    # getter for: Lroboguice/util/temp/Ln;->CONFIG:Lroboguice/util/temp/Ln$BaseConfig;
    invoke-static {}, Lroboguice/util/temp/Ln;->access$000()Lroboguice/util/temp/Ln$BaseConfig;

    move-result-object v0

    iget v0, v0, Lroboguice/util/temp/Ln$BaseConfig;->minimumLogLevel:I

    if-gt v0, v1, :cond_35

    .line 258
    const-string v0, "%s %s %s"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "HH:mm:ss.SSS"

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 260
    :cond_35
    return-object p1
.end method

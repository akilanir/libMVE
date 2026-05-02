.class Lorg/slf4j/impl/AndroidLoggerAdapter;
.super Lorg/slf4j/helpers/MarkerIgnoringBase;
.source "AndroidLoggerAdapter.java"


# static fields
.field private static final serialVersionUID:J = -0x110827acc929f301L


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/slf4j/helpers/MarkerIgnoringBase;-><init>()V

    .line 90
    iput-object p1, p0, Lorg/slf4j/impl/AndroidLoggerAdapter;->name:Ljava/lang/String;

    .line 91
    return-void
.end method

.method private _log(ILjava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "priority"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 548
    if-eqz p3, :cond_1d

    .line 549
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 551
    :cond_1d
    iget-object v0, p0, Lorg/slf4j/impl/AndroidLoggerAdapter;->name:Ljava/lang/String;

    invoke-static {p1, v0, p2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 552
    return-void
.end method

.method private varargs formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "priority"    # I
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 531
    invoke-direct {p0, p1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 532
    invoke-static {p2, p3}, Lorg/slf4j/helpers/MessageFormatter;->arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;

    move-result-object v0

    .line 533
    .local v0, "ft":Lorg/slf4j/helpers/FormattingTuple;
    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {p0, p1, v1, v2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->_log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 535
    .end local v0    # "ft":Lorg/slf4j/helpers/FormattingTuple;
    :cond_15
    return-void
.end method

.method private isLoggable(I)Z
    .registers 3
    .param p1, "priority"    # I

    .prologue
    .line 544
    iget-object v0, p0, Lorg/slf4j/impl/AndroidLoggerAdapter;->name:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private log(ILjava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "priority"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 538
    invoke-direct {p0, p1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 539
    invoke-direct {p0, p1, p2, p3}, Lorg/slf4j/impl/AndroidLoggerAdapter;->_log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 541
    :cond_9
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 196
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 213
    const/4 v0, 0x3

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 214
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 233
    const/4 v0, 0x3

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 234
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 263
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 264
    return-void
.end method

.method public varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 251
    const/4 v0, 0x3

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 252
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 458
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 459
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 476
    const/4 v0, 0x6

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 477
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 496
    const/4 v0, 0x6

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 497
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 527
    const/4 v0, 0x6

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 528
    return-void
.end method

.method public varargs error(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 514
    const/4 v0, 0x6

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 515
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 282
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 283
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 299
    const/4 v0, 0x4

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 300
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 319
    const/4 v0, 0x4

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 320
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 350
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 351
    return-void
.end method

.method public varargs info(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 337
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 338
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 186
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 448
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 272
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v0

    return v0
.end method

.method public isTraceEnabled()Z
    .registers 2

    .prologue
    .line 99
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 360
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/slf4j/impl/AndroidLoggerAdapter;->isLoggable(I)Z

    move-result v0

    return v0
.end method

.method public trace(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 109
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 127
    const/4 v0, 0x2

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 128
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x2

    .line 147
    new-array v0, v2, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    invoke-direct {p0, v2, p1, v0}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 148
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 177
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 178
    return-void
.end method

.method public varargs trace(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 165
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 166
    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 370
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 371
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 388
    const/4 v0, 0x5

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 389
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 408
    const/4 v0, 0x5

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 409
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 439
    const/4 v0, 0x5

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 440
    return-void
.end method

.method public varargs warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 426
    const/4 v0, 0x5

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/AndroidLoggerAdapter;->formatAndLog(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 427
    return-void
.end method

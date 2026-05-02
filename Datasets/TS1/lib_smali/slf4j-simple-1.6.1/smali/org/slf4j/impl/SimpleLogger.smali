.class public Lorg/slf4j/impl/SimpleLogger;
.super Lorg/slf4j/helpers/MarkerIgnoringBase;
.source "SimpleLogger.java"


# static fields
.field private static ERROR_STR:Ljava/lang/String; = null

.field private static INFO_STR:Ljava/lang/String; = null

.field public static final LINE_SEPARATOR:Ljava/lang/String;

.field private static WARN_STR:Ljava/lang/String; = null

.field private static final serialVersionUID:J = -0x5b0aab4c5b90a98dL

.field private static startTime:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 72
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lorg/slf4j/impl/SimpleLogger;->startTime:J

    .line 73
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/slf4j/impl/SimpleLogger;->LINE_SEPARATOR:Ljava/lang/String;

    .line 75
    const-string v0, "INFO"

    sput-object v0, Lorg/slf4j/impl/SimpleLogger;->INFO_STR:Ljava/lang/String;

    .line 76
    const-string v0, "WARN"

    sput-object v0, Lorg/slf4j/impl/SimpleLogger;->WARN_STR:Ljava/lang/String;

    .line 77
    const-string v0, "ERROR"

    sput-object v0, Lorg/slf4j/impl/SimpleLogger;->ERROR_STR:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/slf4j/helpers/MarkerIgnoringBase;-><init>()V

    .line 84
    iput-object p1, p0, Lorg/slf4j/impl/SimpleLogger;->name:Ljava/lang/String;

    .line 85
    return-void
.end method

.method private formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 8
    .param p1, "level"    # Ljava/lang/String;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "arg1"    # Ljava/lang/Object;
    .param p4, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 222
    invoke-static {p2, p3, p4}, Lorg/slf4j/helpers/MessageFormatter;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;

    move-result-object v0

    .line 223
    .local v0, "tp":Lorg/slf4j/helpers/FormattingTuple;
    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {p0, p1, v1, v2}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 224
    return-void
.end method

.method private formatAndLog(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "level"    # Ljava/lang/String;
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 234
    invoke-static {p2, p3}, Lorg/slf4j/helpers/MessageFormatter;->arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;

    move-result-object v0

    .line 235
    .local v0, "tp":Lorg/slf4j/helpers/FormattingTuple;
    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {p0, p1, v1, v2}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 236
    return-void
.end method

.method private log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 9
    .param p1, "level"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 186
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 188
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 189
    .local v1, "millis":J
    sget-wide v3, Lorg/slf4j/impl/SimpleLogger;->startTime:J

    sub-long v3, v1, v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 191
    const-string v3, " ["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    const-string v3, "] "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 195
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 196
    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 198
    iget-object v3, p0, Lorg/slf4j/impl/SimpleLogger;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 199
    const-string v3, " - "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 201
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 203
    sget-object v3, Lorg/slf4j/impl/SimpleLogger;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 205
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 206
    if-eqz p3, :cond_4f

    .line 207
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p3, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 209
    :cond_4f
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/io/PrintStream;->flush()V

    .line 210
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 147
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;

    .prologue
    .line 155
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;
    .param p3, "param2"    # Ljava/lang/Object;

    .prologue
    .line 163
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 175
    return-void
.end method

.method public debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 167
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 342
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->ERROR_STR:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 343
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 350
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->ERROR_STR:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 351
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 358
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->ERROR_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 359
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 373
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->ERROR_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 374
    return-void
.end method

.method public error(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 366
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->ERROR_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 367
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 250
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->INFO_STR:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 251
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 258
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->INFO_STR:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 259
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 266
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->INFO_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 267
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 281
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->INFO_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 282
    return-void
.end method

.method public info(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 274
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->INFO_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 275
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 138
    const/4 v0, 0x0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 334
    const/4 v0, 0x1

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 242
    const/4 v0, 0x1

    return v0
.end method

.method public isTraceEnabled()Z
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 288
    const/4 v0, 0x1

    return v0
.end method

.method public trace(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 102
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;

    .prologue
    .line 110
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "param1"    # Ljava/lang/Object;
    .param p3, "param2"    # Ljava/lang/Object;

    .prologue
    .line 118
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 130
    return-void
.end method

.method public trace(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 122
    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 296
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->WARN_STR:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 297
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 304
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->WARN_STR:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 305
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Object;
    .param p3, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 312
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->WARN_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 313
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 327
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->WARN_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/SimpleLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 328
    return-void
.end method

.method public warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "argArray"    # [Ljava/lang/Object;

    .prologue
    .line 320
    sget-object v0, Lorg/slf4j/impl/SimpleLogger;->WARN_STR:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lorg/slf4j/impl/SimpleLogger;->formatAndLog(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 321
    return-void
.end method

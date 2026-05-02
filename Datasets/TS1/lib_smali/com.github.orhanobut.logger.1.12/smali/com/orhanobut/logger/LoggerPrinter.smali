.class final Lcom/orhanobut/logger/LoggerPrinter;
.super Ljava/lang/Object;
.source "LoggerPrinter.java"

# interfaces
.implements Lcom/orhanobut/logger/Printer;


# static fields
.field private static final ASSERT:I = 0x7

.field private static final BOTTOM_BORDER:Ljava/lang/String; = "\u255a\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550"

.field private static final BOTTOM_LEFT_CORNER:C = '\u255a'

.field private static final CHUNK_SIZE:I = 0xfa0

.field private static final DEBUG:I = 0x3

.field private static final DOUBLE_DIVIDER:Ljava/lang/String; = "\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550"

.field private static final ERROR:I = 0x6

.field private static final HORIZONTAL_DOUBLE_LINE:C = '\u2551'

.field private static final INFO:I = 0x4

.field private static final JSON_INDENT:I = 0x4

.field private static final MIDDLE_BORDER:Ljava/lang/String; = "\u255f\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

.field private static final MIDDLE_CORNER:C = '\u255f'

.field private static final MIN_STACK_OFFSET:I = 0x3

.field private static final SINGLE_DIVIDER:Ljava/lang/String; = "\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

.field private static final TOP_BORDER:Ljava/lang/String; = "\u2554\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550"

.field private static final TOP_LEFT_CORNER:C = '\u2554'

.field private static final VERBOSE:I = 0x2

.field private static final WARN:I = 0x5


# instance fields
.field private final localMethodCount:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final localTag:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private settings:Lcom/orhanobut/logger/Settings;

.field private tag:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    .line 73
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->localMethodCount:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private varargs createMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 343
    array-length v0, p2

    if-nez v0, :cond_4

    .end local p1    # "message":Ljava/lang/String;
    :goto_3
    return-object p1

    .restart local p1    # "message":Ljava/lang/String;
    :cond_4
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_3
.end method

.method private formatTag(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 324
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->tag:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    .line 325
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 327
    :goto_27
    return-object v0

    :cond_28
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->tag:Ljava/lang/String;

    goto :goto_27
.end method

.method private getMethodCount()I
    .registers 5

    .prologue
    .line 347
    iget-object v2, p0, Lcom/orhanobut/logger/LoggerPrinter;->localMethodCount:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 348
    .local v0, "count":Ljava/lang/Integer;
    iget-object v2, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v2}, Lcom/orhanobut/logger/Settings;->getMethodCount()I

    move-result v1

    .line 349
    .local v1, "result":I
    if-eqz v0, :cond_19

    .line 350
    iget-object v2, p0, Lcom/orhanobut/logger/LoggerPrinter;->localMethodCount:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 351
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 353
    :cond_19
    if-gez v1, :cond_23

    .line 354
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "methodCount cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 356
    :cond_23
    return v1
.end method

.method private getSimpleClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 319
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 320
    .local v0, "lastIndex":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getStackOffset([Ljava/lang/StackTraceElement;)I
    .registers 6
    .param p1, "trace"    # [Ljava/lang/StackTraceElement;

    .prologue
    .line 366
    const/4 v1, 0x3

    .local v1, "i":I
    :goto_1
    array-length v3, p1

    if-ge v1, v3, :cond_29

    .line 367
    aget-object v0, p1, v1

    .line 368
    .local v0, "e":Ljava/lang/StackTraceElement;
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    .line 369
    .local v2, "name":Ljava/lang/String;
    const-class v3, Lcom/orhanobut/logger/LoggerPrinter;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_26

    const-class v3, Lcom/orhanobut/logger/Logger;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_26

    .line 370
    add-int/lit8 v1, v1, -0x1

    move v3, v1

    .line 373
    .end local v0    # "e":Ljava/lang/StackTraceElement;
    .end local v2    # "name":Ljava/lang/String;
    :goto_25
    return v3

    .line 366
    .restart local v0    # "e":Ljava/lang/StackTraceElement;
    .restart local v2    # "name":Ljava/lang/String;
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 373
    .end local v0    # "e":Ljava/lang/StackTraceElement;
    .end local v2    # "name":Ljava/lang/String;
    :cond_29
    const/4 v3, -0x1

    goto :goto_25
.end method

.method private getTag()Ljava/lang/String;
    .registers 3

    .prologue
    .line 334
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 335
    .local v0, "tag":Ljava/lang/String;
    if-eqz v0, :cond_10

    .line 336
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 339
    .end local v0    # "tag":Ljava/lang/String;
    :goto_f
    return-object v0

    .restart local v0    # "tag":Ljava/lang/String;
    :cond_10
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->tag:Ljava/lang/String;

    goto :goto_f
.end method

.method private varargs declared-synchronized log(ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 14
    .param p1, "logType"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/16 v9, 0xfa0

    .line 204
    monitor-enter p0

    :try_start_3
    iget-object v7, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v7}, Lcom/orhanobut/logger/Settings;->getLogLevel()Lcom/orhanobut/logger/LogLevel;

    move-result-object v7

    sget-object v8, Lcom/orhanobut/logger/LogLevel;->NONE:Lcom/orhanobut/logger/LogLevel;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_34

    if-ne v7, v8, :cond_f

    .line 234
    :goto_d
    monitor-exit p0

    return-void

    .line 207
    :cond_f
    :try_start_f
    invoke-direct {p0}, Lcom/orhanobut/logger/LoggerPrinter;->getTag()Ljava/lang/String;

    move-result-object v6

    .line 208
    .local v6, "tag":Ljava/lang/String;
    invoke-direct {p0, p2, p3}, Lcom/orhanobut/logger/LoggerPrinter;->createMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 209
    .local v4, "message":Ljava/lang/String;
    invoke-direct {p0}, Lcom/orhanobut/logger/LoggerPrinter;->getMethodCount()I

    move-result v5

    .line 211
    .local v5, "methodCount":I
    invoke-direct {p0, p1, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logTopBorder(ILjava/lang/String;)V

    .line 212
    invoke-direct {p0, p1, v6, v5}, Lcom/orhanobut/logger/LoggerPrinter;->logHeaderContent(ILjava/lang/String;I)V

    .line 215
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 216
    .local v0, "bytes":[B
    array-length v3, v0

    .line 217
    .local v3, "length":I
    if-gt v3, v9, :cond_37

    .line 218
    if-lez v5, :cond_2d

    .line 219
    invoke-direct {p0, p1, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logDivider(ILjava/lang/String;)V

    .line 221
    :cond_2d
    invoke-direct {p0, p1, v6, v4}, Lcom/orhanobut/logger/LoggerPrinter;->logContent(ILjava/lang/String;Ljava/lang/String;)V

    .line 222
    invoke-direct {p0, p1, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logBottomBorder(ILjava/lang/String;)V
    :try_end_33
    .catchall {:try_start_f .. :try_end_33} :catchall_34

    goto :goto_d

    .line 204
    .end local v0    # "bytes":[B
    .end local v3    # "length":I
    .end local v4    # "message":Ljava/lang/String;
    .end local v5    # "methodCount":I
    .end local v6    # "tag":Ljava/lang/String;
    :catchall_34
    move-exception v7

    monitor-exit p0

    throw v7

    .line 225
    .restart local v0    # "bytes":[B
    .restart local v3    # "length":I
    .restart local v4    # "message":Ljava/lang/String;
    .restart local v5    # "methodCount":I
    .restart local v6    # "tag":Ljava/lang/String;
    :cond_37
    if-lez v5, :cond_3c

    .line 226
    :try_start_39
    invoke-direct {p0, p1, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logDivider(ILjava/lang/String;)V

    .line 228
    :cond_3c
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3d
    if-ge v2, v3, :cond_52

    .line 229
    sub-int v7, v3, v2

    const/16 v8, 0xfa0

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 231
    .local v1, "count":I
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v0, v2, v1}, Ljava/lang/String;-><init>([BII)V

    invoke-direct {p0, p1, v6, v7}, Lcom/orhanobut/logger/LoggerPrinter;->logContent(ILjava/lang/String;Ljava/lang/String;)V

    .line 228
    add-int/lit16 v2, v2, 0xfa0

    goto :goto_3d

    .line 233
    .end local v1    # "count":I
    :cond_52
    invoke-direct {p0, p1, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logBottomBorder(ILjava/lang/String;)V
    :try_end_55
    .catchall {:try_start_39 .. :try_end_55} :catchall_34

    goto :goto_d
.end method

.method private logBottomBorder(ILjava/lang/String;)V
    .registers 4
    .param p1, "logType"    # I
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 278
    const-string v0, "\u255a\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550"

    invoke-direct {p0, p1, p2, v0}, Lcom/orhanobut/logger/LoggerPrinter;->logChunk(ILjava/lang/String;Ljava/lang/String;)V

    .line 279
    return-void
.end method

.method private logChunk(ILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "logType"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "chunk"    # Ljava/lang/String;

    .prologue
    .line 293
    invoke-direct {p0, p2}, Lcom/orhanobut/logger/LoggerPrinter;->formatTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 294
    .local v0, "finalTag":Ljava/lang/String;
    packed-switch p1, :pswitch_data_44

    .line 313
    :pswitch_7
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v1}, Lcom/orhanobut/logger/Settings;->getLogTool()Lcom/orhanobut/logger/LogTool;

    move-result-object v1

    invoke-interface {v1, v0, p3}, Lcom/orhanobut/logger/LogTool;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    :goto_10
    return-void

    .line 296
    :pswitch_11
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v1}, Lcom/orhanobut/logger/Settings;->getLogTool()Lcom/orhanobut/logger/LogTool;

    move-result-object v1

    invoke-interface {v1, v0, p3}, Lcom/orhanobut/logger/LogTool;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10

    .line 299
    :pswitch_1b
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v1}, Lcom/orhanobut/logger/Settings;->getLogTool()Lcom/orhanobut/logger/LogTool;

    move-result-object v1

    invoke-interface {v1, v0, p3}, Lcom/orhanobut/logger/LogTool;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10

    .line 302
    :pswitch_25
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v1}, Lcom/orhanobut/logger/Settings;->getLogTool()Lcom/orhanobut/logger/LogTool;

    move-result-object v1

    invoke-interface {v1, v0, p3}, Lcom/orhanobut/logger/LogTool;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10

    .line 305
    :pswitch_2f
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v1}, Lcom/orhanobut/logger/Settings;->getLogTool()Lcom/orhanobut/logger/LogTool;

    move-result-object v1

    invoke-interface {v1, v0, p3}, Lcom/orhanobut/logger/LogTool;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10

    .line 308
    :pswitch_39
    iget-object v1, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v1}, Lcom/orhanobut/logger/Settings;->getLogTool()Lcom/orhanobut/logger/LogTool;

    move-result-object v1

    invoke-interface {v1, v0, p3}, Lcom/orhanobut/logger/LogTool;->wtf(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10

    .line 294
    nop

    :pswitch_data_44
    .packed-switch 0x2
        :pswitch_25
        :pswitch_7
        :pswitch_1b
        :pswitch_2f
        :pswitch_11
        :pswitch_39
    .end packed-switch
.end method

.method private logContent(ILjava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "logType"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "chunk"    # Ljava/lang/String;

    .prologue
    .line 286
    const-string v5, "line.separator"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 287
    .local v4, "lines":[Ljava/lang/String;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_d
    if-ge v1, v2, :cond_2a

    aget-object v3, v0, v1

    .line 288
    .local v3, "line":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u2551 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p1, p2, v5}, Lcom/orhanobut/logger/LoggerPrinter;->logChunk(ILjava/lang/String;Ljava/lang/String;)V

    .line 287
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 290
    .end local v3    # "line":Ljava/lang/String;
    :cond_2a
    return-void
.end method

.method private logDivider(ILjava/lang/String;)V
    .registers 4
    .param p1, "logType"    # I
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 282
    const-string v0, "\u255f\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-direct {p0, p1, p2, v0}, Lcom/orhanobut/logger/LoggerPrinter;->logChunk(ILjava/lang/String;Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method private logHeaderContent(ILjava/lang/String;I)V
    .registers 12
    .param p1, "logType"    # I
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "methodCount"    # I

    .prologue
    .line 241
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    .line 242
    .local v5, "trace":[Ljava/lang/StackTraceElement;
    iget-object v6, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v6}, Lcom/orhanobut/logger/Settings;->isShowThreadInfo()Z

    move-result v6

    if-eqz v6, :cond_31

    .line 243
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u2551 Thread: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1, p2, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logChunk(ILjava/lang/String;Ljava/lang/String;)V

    .line 244
    invoke-direct {p0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->logDivider(ILjava/lang/String;)V

    .line 246
    :cond_31
    const-string v2, ""

    .line 248
    .local v2, "level":Ljava/lang/String;
    invoke-direct {p0, v5}, Lcom/orhanobut/logger/LoggerPrinter;->getStackOffset([Ljava/lang/StackTraceElement;)I

    move-result v6

    iget-object v7, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    invoke-virtual {v7}, Lcom/orhanobut/logger/Settings;->getMethodOffset()I

    move-result v7

    add-int v4, v6, v7

    .line 251
    .local v4, "stackOffset":I
    add-int v6, p3, v4

    array-length v7, v5

    if-le v6, v7, :cond_48

    .line 252
    array-length v6, v5

    sub-int/2addr v6, v4

    add-int/lit8 p3, v6, -0x1

    .line 255
    :cond_48
    move v1, p3

    .local v1, "i":I
    :goto_49
    if-lez v1, :cond_c6

    .line 256
    add-int v3, v1, v4

    .line 257
    .local v3, "stackIndex":I
    array-length v6, v5

    if-lt v3, v6, :cond_53

    .line 255
    :goto_50
    add-int/lit8 v1, v1, -0x1

    goto :goto_49

    .line 260
    :cond_53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v6, "\u2551 "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v5, v3

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/orhanobut/logger/LoggerPrinter;->getSimpleClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v5, v3

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v5, v3

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v5, v3

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "   "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 273
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p1, p2, v6}, Lcom/orhanobut/logger/LoggerPrinter;->logChunk(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_50

    .line 275
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "stackIndex":I
    :cond_c6
    return-void
.end method

.method private logTopBorder(ILjava/lang/String;)V
    .registers 4
    .param p1, "logType"    # I
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 237
    const-string v0, "\u2554\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550"

    invoke-direct {p0, p1, p2, v0}, Lcom/orhanobut/logger/LoggerPrinter;->logChunk(ILjava/lang/String;Ljava/lang/String;)V

    .line 238
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    .line 198
    return-void
.end method

.method public varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 110
    const/4 v0, 0x3

    invoke-direct {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    return-void
.end method

.method public varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 118
    if-eqz p1, :cond_1f

    if-eqz p2, :cond_1f

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 121
    :cond_1f
    if-eqz p1, :cond_27

    if-nez p2, :cond_27

    .line 122
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p2

    .line 124
    :cond_27
    if-nez p2, :cond_2b

    .line 125
    const-string p2, "No message/exception is set"

    .line 127
    :cond_2b
    const/4 v0, 0x6

    invoke-direct {p0, v0, p2, p3}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 128
    return-void
.end method

.method public getSettings()Lcom/orhanobut/logger/Settings;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    return-object v0
.end method

.method public varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 135
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public init(Ljava/lang/String;)Lcom/orhanobut/logger/Settings;
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 86
    if-nez p1, :cond_a

    .line 87
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "tag may not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1c

    .line 90
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "tag may not be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_1c
    iput-object p1, p0, Lcom/orhanobut/logger/LoggerPrinter;->tag:Ljava/lang/String;

    .line 93
    new-instance v0, Lcom/orhanobut/logger/Settings;

    invoke-direct {v0}, Lcom/orhanobut/logger/Settings;-><init>()V

    iput-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    .line 94
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->settings:Lcom/orhanobut/logger/Settings;

    return-object v0
.end method

.method public json(Ljava/lang/String;)V
    .registers 9
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 152
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 153
    const-string v4, "Empty/Null json content"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 171
    :cond_e
    :goto_e
    return-void

    .line 157
    :cond_f
    :try_start_f
    const-string v4, "{"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 158
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 159
    .local v2, "jsonObject":Lorg/json/JSONObject;
    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 160
    .local v3, "message":Ljava/lang/String;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p0, v3, v4}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_27} :catch_28

    goto :goto_e

    .line 168
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v3    # "message":Ljava/lang/String;
    :catch_28
    move-exception v0

    .line 169
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_e

    .line 163
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_4e
    :try_start_4e
    const-string v4, "["

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 164
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 165
    .local v1, "jsonArray":Lorg/json/JSONArray;
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v3

    .line 166
    .restart local v3    # "message":Ljava/lang/String;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p0, v3, v4}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_66
    .catch Lorg/json/JSONException; {:try_start_4e .. :try_end_66} :catch_28

    goto :goto_e
.end method

.method public t(Ljava/lang/String;I)Lcom/orhanobut/logger/Printer;
    .registers 5
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "methodCount"    # I

    .prologue
    .line 102
    if-eqz p1, :cond_7

    .line 103
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->localTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 105
    :cond_7
    iget-object v0, p0, Lcom/orhanobut/logger/LoggerPrinter;->localMethodCount:Ljava/lang/ThreadLocal;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 106
    return-object p0
.end method

.method public varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 139
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 140
    return-void
.end method

.method public varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 131
    const/4 v0, 0x5

    invoke-direct {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 132
    return-void
.end method

.method public varargs wtf(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 143
    const/4 v0, 0x7

    invoke-direct {p0, v0, p1, p2}, Lcom/orhanobut/logger/LoggerPrinter;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 144
    return-void
.end method

.method public xml(Ljava/lang/String;)V
    .registers 10
    .param p1, "xml"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 179
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 180
    const-string v4, "Empty/Null xml content"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 194
    :goto_e
    return-void

    .line 184
    :cond_f
    :try_start_f
    new-instance v2, Ljavax/xml/transform/stream/StreamSource;

    new-instance v4, Ljava/io/StringReader;

    invoke-direct {v4, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v4}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/Reader;)V

    .line 185
    .local v2, "xmlInput":Ljavax/xml/transform/Source;
    new-instance v3, Ljavax/xml/transform/stream/StreamResult;

    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    invoke-direct {v3, v4}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 186
    .local v3, "xmlOutput":Ljavax/xml/transform/stream/StreamResult;
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 187
    .local v1, "transformer":Ljavax/xml/transform/Transformer;
    const-string v4, "indent"

    const-string v5, "yes"

    invoke-virtual {v1, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    const-string v4, "{http://xml.apache.org/xslt}indent-amount"

    const-string v5, "2"

    invoke-virtual {v1, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    invoke-virtual {v1, v2, v3}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 190
    invoke-virtual {v3}, Ljavax/xml/transform/stream/StreamResult;->getWriter()Ljava/io/Writer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ">"

    const-string v6, ">\n"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_52
    .catch Ljavax/xml/transform/TransformerException; {:try_start_f .. :try_end_52} :catch_53

    goto :goto_e

    .line 191
    .end local v1    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v2    # "xmlInput":Ljavax/xml/transform/Source;
    .end local v3    # "xmlOutput":Ljavax/xml/transform/stream/StreamResult;
    :catch_53
    move-exception v0

    .line 192
    .local v0, "e":Ljavax/xml/transform/TransformerException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljavax/xml/transform/TransformerException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v7, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/orhanobut/logger/LoggerPrinter;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_e
.end method

.class public abstract Ltimber/log/Timber$Tree;
.super Ljava/lang/Object;
.source "Timber.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltimber/log/Timber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Tree"
.end annotation


# instance fields
.field final explicitTag:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Ltimber/log/Timber$Tree;->explicitTag:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 392
    new-instance v1, Ljava/io/StringWriter;

    const/16 v2, 0x100

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 393
    .local v1, "sw":Ljava/io/StringWriter;
    new-instance v0, Ljava/io/PrintWriter;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 394
    .local v0, "pw":Ljava/io/PrintWriter;
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 395
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 396
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private varargs prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "priority"    # I
    .param p2, "t"    # Ljava/lang/Throwable;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 366
    invoke-virtual {p0, p1}, Ltimber/log/Timber$Tree;->isLoggable(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 387
    :cond_6
    :goto_6
    return-void

    .line 369
    :cond_7
    if-eqz p3, :cond_10

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_10

    .line 370
    const/4 p3, 0x0

    .line 372
    :cond_10
    if-nez p3, :cond_20

    .line 373
    if-eqz p2, :cond_6

    .line 376
    invoke-direct {p0, p2}, Ltimber/log/Timber$Tree;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    .line 386
    :cond_18
    :goto_18
    invoke-virtual {p0}, Ltimber/log/Timber$Tree;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p3, p2}, Ltimber/log/Timber$Tree;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 378
    :cond_20
    array-length v0, p4

    if-lez v0, :cond_27

    .line 379
    invoke-static {p3, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 381
    :cond_27
    if-eqz p2, :cond_18

    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p2}, Ltimber/log/Timber$Tree;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_18
.end method


# virtual methods
.method public varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 302
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 303
    return-void
.end method

.method public varargs d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 307
    const/4 v0, 0x3

    invoke-direct {p0, v0, p1, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 308
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 332
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 333
    return-void
.end method

.method public varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 337
    const/4 v0, 0x6

    invoke-direct {p0, v0, p1, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 338
    return-void
.end method

.method getTag()Ljava/lang/String;
    .registers 3

    .prologue
    .line 283
    iget-object v1, p0, Ltimber/log/Timber$Tree;->explicitTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 284
    .local v0, "tag":Ljava/lang/String;
    if-eqz v0, :cond_f

    .line 285
    iget-object v1, p0, Ltimber/log/Timber$Tree;->explicitTag:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 287
    :cond_f
    return-object v0
.end method

.method public varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 312
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 313
    return-void
.end method

.method public varargs i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 317
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 318
    return-void
.end method

.method protected isLoggable(I)Z
    .registers 3
    .param p1, "priority"    # I

    .prologue
    .line 362
    const/4 v0, 0x1

    return v0
.end method

.method protected abstract log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public varargs log(ILjava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "priority"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 352
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 353
    return-void
.end method

.method public varargs log(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "priority"    # I
    .param p2, "t"    # Ljava/lang/Throwable;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 357
    invoke-direct {p0, p1, p2, p3, p4}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 358
    return-void
.end method

.method public varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 292
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 293
    return-void
.end method

.method public varargs v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 297
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 298
    return-void
.end method

.method public varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 322
    const/4 v0, 0x5

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 323
    return-void
.end method

.method public varargs w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 327
    const/4 v0, 0x5

    invoke-direct {p0, v0, p1, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 328
    return-void
.end method

.method public varargs wtf(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 342
    const/4 v0, 0x7

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 343
    return-void
.end method

.method public varargs wtf(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 347
    const/4 v0, 0x7

    invoke-direct {p0, v0, p1, p2, p3}, Ltimber/log/Timber$Tree;->prepareLog(ILjava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 348
    return-void
.end method

.class Ljavassist/util/HotSwapper$1;
.super Ljava/lang/Thread;
.source "HotSwapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/util/HotSwapper;->startDaemon()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/util/HotSwapper;


# direct methods
.method constructor <init>(Ljavassist/util/HotSwapper;)V
    .registers 2

    .prologue
    .line 210
    iput-object p1, p0, Ljavassist/util/HotSwapper$1;->this$0:Ljavassist/util/HotSwapper;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method private errorMsg(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 212
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Exception in thread \"HotSwap\" "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 213
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 214
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 217
    const/4 v2, 0x0

    .line 219
    .local v2, "events":Lcom/sun/jdi/event/EventSet;
    :try_start_1
    iget-object v4, p0, Ljavassist/util/HotSwapper$1;->this$0:Ljavassist/util/HotSwapper;

    invoke-virtual {v4}, Ljavassist/util/HotSwapper;->waitEvent()Lcom/sun/jdi/event/EventSet;

    move-result-object v2

    .line 220
    invoke-interface {v2}, Lcom/sun/jdi/event/EventSet;->eventIterator()Lcom/sun/jdi/event/EventIterator;

    move-result-object v3

    .line 221
    .local v3, "iter":Lcom/sun/jdi/event/EventIterator;
    :cond_b
    invoke-interface {v3}, Lcom/sun/jdi/event/EventIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 222
    invoke-interface {v3}, Lcom/sun/jdi/event/EventIterator;->nextEvent()Lcom/sun/jdi/event/Event;

    move-result-object v1

    .line 223
    .local v1, "event":Lcom/sun/jdi/event/Event;
    instance-of v4, v1, Lcom/sun/jdi/event/MethodEntryEvent;

    if-eqz v4, :cond_b

    .line 224
    iget-object v4, p0, Ljavassist/util/HotSwapper$1;->this$0:Ljavassist/util/HotSwapper;

    invoke-virtual {v4}, Ljavassist/util/HotSwapper;->hotswap()V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1e} :catch_24

    .line 233
    .end local v1    # "event":Lcom/sun/jdi/event/Event;
    .end local v3    # "iter":Lcom/sun/jdi/event/EventIterator;
    :cond_1e
    :goto_1e
    if-eqz v2, :cond_23

    .line 234
    :try_start_20
    invoke-interface {v2}, Lcom/sun/jdi/event/EventSet;->resume()V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_23} :catch_29

    .line 239
    :cond_23
    :goto_23
    return-void

    .line 229
    :catch_24
    move-exception v0

    .line 230
    .local v0, "e":Ljava/lang/Throwable;
    invoke-direct {p0, v0}, Ljavassist/util/HotSwapper$1;->errorMsg(Ljava/lang/Throwable;)V

    goto :goto_1e

    .line 236
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_29
    move-exception v0

    .line 237
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-direct {p0, v0}, Ljavassist/util/HotSwapper$1;->errorMsg(Ljava/lang/Throwable;)V

    goto :goto_23
.end method

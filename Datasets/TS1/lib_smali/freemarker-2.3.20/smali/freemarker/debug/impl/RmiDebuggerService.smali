.class Lfreemarker/debug/impl/RmiDebuggerService;
.super Lfreemarker/debug/impl/DebuggerService;
.source "RmiDebuggerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/debug/impl/RmiDebuggerService$1;,
        Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;,
        Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    }
.end annotation


# instance fields
.field private final debugger:Lfreemarker/debug/impl/RmiDebuggerImpl;

.field private final listeners:Ljava/util/Map;

.field private final refQueue:Ljava/lang/ref/ReferenceQueue;

.field private server:Lfreemarker/debug/impl/DebuggerServer;

.field private final suspendedEnvironments:Ljava/util/HashSet;

.field private final templateDebugInfos:Ljava/util/Map;


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 98
    invoke-direct {p0}, Lfreemarker/debug/impl/DebuggerService;-><init>()V

    .line 88
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    .line 89
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    .line 90
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    .line 91
    new-instance v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->refQueue:Ljava/lang/ref/ReferenceQueue;

    .line 101
    :try_start_1f
    new-instance v1, Lfreemarker/debug/impl/RmiDebuggerImpl;

    invoke-direct {v1, p0}, Lfreemarker/debug/impl/RmiDebuggerImpl;-><init>(Lfreemarker/debug/impl/RmiDebuggerService;)V

    iput-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->debugger:Lfreemarker/debug/impl/RmiDebuggerImpl;

    .line 102
    new-instance v2, Lfreemarker/debug/impl/DebuggerServer;

    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->debugger:Lfreemarker/debug/impl/RmiDebuggerImpl;

    invoke-static {v1}, Ljava/rmi/server/RemoteObject;->toStub(Ljava/rmi/Remote;)Ljava/rmi/Remote;

    move-result-object v1

    check-cast v1, Ljava/io/Serializable;

    invoke-direct {v2, v1}, Lfreemarker/debug/impl/DebuggerServer;-><init>(Ljava/io/Serializable;)V

    iput-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->server:Lfreemarker/debug/impl/DebuggerServer;

    .line 103
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->server:Lfreemarker/debug/impl/DebuggerServer;

    invoke-virtual {v1}, Lfreemarker/debug/impl/DebuggerServer;->start()V
    :try_end_3a
    .catch Ljava/rmi/RemoteException; {:try_start_1f .. :try_end_3a} :catch_3b

    .line 110
    return-void

    .line 105
    :catch_3b
    move-exception v0

    .line 107
    .local v0, "e":Ljava/rmi/RemoteException;
    invoke-virtual {v0}, Ljava/rmi/RemoteException;->printStackTrace()V

    .line 108
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private createTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    .registers 4
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 322
    invoke-direct {p0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v0

    .line 323
    .local v0, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    if-nez v0, :cond_11

    .line 325
    new-instance v0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    .end local v0    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;-><init>(Lfreemarker/debug/impl/RmiDebuggerService$1;)V

    .line 326
    .restart local v0    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    :cond_11
    return-object v0
.end method

.method private findTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-direct {p0}, Lfreemarker/debug/impl/RmiDebuggerService;->processRefQueue()V

    .line 317
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    return-object v0
.end method

.method private static findTemplateElement(Lfreemarker/core/TemplateElement;I)Lfreemarker/core/TemplateElement;
    .registers 11
    .param p0, "te"    # Lfreemarker/core/TemplateElement;
    .param p1, "line"    # I

    .prologue
    .line 269
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->getBeginLine()I

    move-result v7

    if-gt v7, p1, :cond_c

    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->getEndLine()I

    move-result v7

    if-ge v7, p1, :cond_e

    .line 271
    :cond_c
    const/4 v0, 0x0

    .line 311
    :cond_d
    :goto_d
    return-object v0

    .line 274
    :cond_e
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 275
    .local v2, "childMatches":Ljava/util/List;
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->children()Ljava/util/Enumeration;

    move-result-object v4

    .local v4, "children":Ljava/util/Enumeration;
    :cond_17
    :goto_17
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_2d

    .line 277
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/TemplateElement;

    .line 278
    .local v1, "child":Lfreemarker/core/TemplateElement;
    invoke-static {v1, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateElement(Lfreemarker/core/TemplateElement;I)Lfreemarker/core/TemplateElement;

    move-result-object v3

    .line 279
    .local v3, "childmatch":Lfreemarker/core/TemplateElement;
    if-eqz v3, :cond_17

    .line 281
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 285
    .end local v1    # "child":Lfreemarker/core/TemplateElement;
    .end local v3    # "childmatch":Lfreemarker/core/TemplateElement;
    :cond_2d
    const/4 v0, 0x0

    .line 286
    .local v0, "bestMatch":Lfreemarker/core/TemplateElement;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2f
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_5c

    .line 288
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfreemarker/core/TemplateElement;

    .line 290
    .local v5, "e":Lfreemarker/core/TemplateElement;
    if-nez v0, :cond_3e

    .line 292
    move-object v0, v5

    .line 295
    :cond_3e
    invoke-virtual {v5}, Lfreemarker/core/TemplateElement;->getBeginLine()I

    move-result v7

    if-ne v7, p1, :cond_4b

    invoke-virtual {v5}, Lfreemarker/core/TemplateElement;->getEndLine()I

    move-result v7

    if-le v7, p1, :cond_4b

    .line 297
    move-object v0, v5

    .line 300
    :cond_4b
    invoke-virtual {v5}, Lfreemarker/core/TemplateElement;->getBeginLine()I

    move-result v7

    invoke-virtual {v5}, Lfreemarker/core/TemplateElement;->getEndLine()I

    move-result v8

    if-ne v7, v8, :cond_60

    invoke-virtual {v5}, Lfreemarker/core/TemplateElement;->getBeginLine()I

    move-result v7

    if-ne v7, p1, :cond_60

    .line 302
    move-object v0, v5

    .line 306
    .end local v5    # "e":Lfreemarker/core/TemplateElement;
    :cond_5c
    if-nez v0, :cond_d

    move-object v0, p0

    .line 311
    goto :goto_d

    .line 286
    .restart local v5    # "e":Lfreemarker/core/TemplateElement;
    :cond_60
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f
.end method

.method private static insertDebugBreak(Lfreemarker/template/Template;Lfreemarker/debug/Breakpoint;)V
    .registers 7
    .param p0, "t"    # Lfreemarker/template/Template;
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;

    .prologue
    .line 254
    invoke-virtual {p0}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v3

    invoke-virtual {p1}, Lfreemarker/debug/Breakpoint;->getLine()I

    move-result v4

    invoke-static {v3, v4}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateElement(Lfreemarker/core/TemplateElement;I)Lfreemarker/core/TemplateElement;

    move-result-object v2

    .line 255
    .local v2, "te":Lfreemarker/core/TemplateElement;
    if-nez v2, :cond_f

    .line 265
    :goto_e
    return-void

    .line 259
    :cond_f
    invoke-virtual {v2}, Lfreemarker/core/TemplateElement;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v1

    check-cast v1, Lfreemarker/core/TemplateElement;

    .line 260
    .local v1, "parent":Lfreemarker/core/TemplateElement;
    new-instance v0, Lfreemarker/core/DebugBreak;

    invoke-direct {v0, v2}, Lfreemarker/core/DebugBreak;-><init>(Lfreemarker/core/TemplateElement;)V

    .line 264
    .local v0, "db":Lfreemarker/core/DebugBreak;
    invoke-virtual {v1, v2}, Lfreemarker/core/TemplateElement;->getIndex(Ljavax/swing/tree/TreeNode;)I

    move-result v3

    invoke-virtual {v1, v3, v0}, Lfreemarker/core/TemplateElement;->setChildAt(ILfreemarker/core/TemplateElement;)V

    goto :goto_e
.end method

.method private processRefQueue()V
    .registers 5

    .prologue
    .line 488
    :cond_0
    :goto_0
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v2}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;

    .line 489
    .local v0, "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    if-nez v0, :cond_b

    .line 503
    return-void

    .line 493
    :cond_b
    iget-object v2, v0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->templateName:Ljava/lang/String;

    invoke-direct {p0, v2}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v1

    .line 494
    .local v1, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    if-eqz v1, :cond_0

    .line 496
    iget-object v2, v1, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->templates:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 497
    invoke-virtual {v1}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 499
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    iget-object v3, v0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->templateName:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private removeBreakpoints(Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;)V
    .registers 6
    .param p1, "tdi"    # Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    .prologue
    .line 425
    iget-object v3, p1, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->breakpoints:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 426
    iget-object v3, p1, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->templates:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 428
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;

    .line 429
    .local v1, "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    invoke-virtual {v1}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->getTemplate()Lfreemarker/template/Template;

    move-result-object v2

    .line 430
    .local v2, "t":Lfreemarker/template/Template;
    if-nez v2, :cond_21

    .line 432
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_b

    .line 436
    :cond_21
    invoke-virtual {v2}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v3

    invoke-direct {p0, v3}, Lfreemarker/debug/impl/RmiDebuggerService;->removeDebugBreaks(Lfreemarker/core/TemplateElement;)V

    goto :goto_b

    .line 439
    .end local v1    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .end local v2    # "t":Lfreemarker/template/Template;
    :cond_29
    return-void
.end method

.method private removeDebugBreak(Lfreemarker/template/Template;Lfreemarker/debug/Breakpoint;)V
    .registers 8
    .param p1, "t"    # Lfreemarker/template/Template;
    .param p2, "breakpoint"    # Lfreemarker/debug/Breakpoint;

    .prologue
    .line 368
    invoke-virtual {p1}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v3

    invoke-virtual {p2}, Lfreemarker/debug/Breakpoint;->getLine()I

    move-result v4

    invoke-static {v3, v4}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateElement(Lfreemarker/core/TemplateElement;I)Lfreemarker/core/TemplateElement;

    move-result-object v2

    .line 369
    .local v2, "te":Lfreemarker/core/TemplateElement;
    if-nez v2, :cond_f

    .line 389
    :cond_e
    :goto_e
    return-void

    .line 373
    :cond_f
    const/4 v0, 0x0

    .line 374
    .local v0, "db":Lfreemarker/core/DebugBreak;
    :goto_10
    if-eqz v2, :cond_19

    .line 376
    instance-of v3, v2, Lfreemarker/core/DebugBreak;

    if-eqz v3, :cond_30

    move-object v0, v2

    .line 378
    check-cast v0, Lfreemarker/core/DebugBreak;

    .line 383
    :cond_19
    if-eqz v0, :cond_e

    .line 387
    invoke-virtual {v0}, Lfreemarker/core/DebugBreak;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v1

    check-cast v1, Lfreemarker/core/TemplateElement;

    .line 388
    .local v1, "parent":Lfreemarker/core/TemplateElement;
    invoke-virtual {v1, v0}, Lfreemarker/core/TemplateElement;->getIndex(Ljavax/swing/tree/TreeNode;)I

    move-result v4

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lfreemarker/core/DebugBreak;->getChildAt(I)Ljavax/swing/tree/TreeNode;

    move-result-object v3

    check-cast v3, Lfreemarker/core/TemplateElement;

    invoke-virtual {v1, v4, v3}, Lfreemarker/core/TemplateElement;->setChildAt(ILfreemarker/core/TemplateElement;)V

    goto :goto_e

    .line 381
    .end local v1    # "parent":Lfreemarker/core/TemplateElement;
    :cond_30
    invoke-virtual {v2}, Lfreemarker/core/TemplateElement;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object v2

    .end local v2    # "te":Lfreemarker/core/TemplateElement;
    check-cast v2, Lfreemarker/core/TemplateElement;

    .restart local v2    # "te":Lfreemarker/core/TemplateElement;
    goto :goto_10
.end method

.method private removeDebugBreaks(Lfreemarker/core/TemplateElement;)V
    .registers 7
    .param p1, "te"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 443
    invoke-virtual {p1}, Lfreemarker/core/TemplateElement;->getChildCount()I

    move-result v1

    .line 444
    .local v1, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    if-ge v3, v1, :cond_23

    .line 446
    invoke-virtual {p1, v3}, Lfreemarker/core/TemplateElement;->getChildAt(I)Ljavax/swing/tree/TreeNode;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    .line 447
    .local v0, "child":Lfreemarker/core/TemplateElement;
    :goto_d
    instance-of v4, v0, Lfreemarker/core/DebugBreak;

    if-eqz v4, :cond_1d

    .line 449
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lfreemarker/core/TemplateElement;->getChildAt(I)Ljavax/swing/tree/TreeNode;

    move-result-object v2

    check-cast v2, Lfreemarker/core/TemplateElement;

    .line 450
    .local v2, "dbchild":Lfreemarker/core/TemplateElement;
    invoke-virtual {p1, v3, v2}, Lfreemarker/core/TemplateElement;->setChildAt(ILfreemarker/core/TemplateElement;)V

    .line 451
    move-object v0, v2

    .line 452
    goto :goto_d

    .line 453
    .end local v2    # "dbchild":Lfreemarker/core/TemplateElement;
    :cond_1d
    invoke-direct {p0, v0}, Lfreemarker/debug/impl/RmiDebuggerService;->removeDebugBreaks(Lfreemarker/core/TemplateElement;)V

    .line 444
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 455
    .end local v0    # "child":Lfreemarker/core/TemplateElement;
    :cond_23
    return-void
.end method


# virtual methods
.method addBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 11
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;

    .prologue
    .line 224
    invoke-virtual {p1}, Lfreemarker/debug/Breakpoint;->getTemplateName()Ljava/lang/String;

    move-result-object v6

    .line 225
    .local v6, "templateName":Ljava/lang/String;
    iget-object v8, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v8

    .line 227
    :try_start_7
    invoke-direct {p0, v6}, Lfreemarker/debug/impl/RmiDebuggerService;->createTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v5

    .line 228
    .local v5, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    iget-object v0, v5, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->breakpoints:Ljava/util/List;

    .line 229
    .local v0, "breakpoints":Ljava/util/List;
    invoke-static {v0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v2

    .line 230
    .local v2, "pos":I
    if-gez v2, :cond_3c

    .line 233
    neg-int v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v0, v7, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 235
    iget-object v7, v5, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->templates:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 237
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;

    .line 238
    .local v3, "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    invoke-virtual {v3}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->getTemplate()Lfreemarker/template/Template;

    move-result-object v4

    .line 239
    .local v4, "t":Lfreemarker/template/Template;
    if-nez v4, :cond_38

    .line 241
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1f

    .line 249
    .end local v0    # "breakpoints":Ljava/util/List;
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v2    # "pos":I
    .end local v3    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .end local v4    # "t":Lfreemarker/template/Template;
    .end local v5    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :catchall_35
    move-exception v7

    monitor-exit v8
    :try_end_37
    .catchall {:try_start_7 .. :try_end_37} :catchall_35

    throw v7

    .line 245
    .restart local v0    # "breakpoints":Ljava/util/List;
    .restart local v1    # "iter":Ljava/util/Iterator;
    .restart local v2    # "pos":I
    .restart local v3    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .restart local v4    # "t":Lfreemarker/template/Template;
    .restart local v5    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :cond_38
    :try_start_38
    invoke-static {v4, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->insertDebugBreak(Lfreemarker/template/Template;Lfreemarker/debug/Breakpoint;)V

    goto :goto_1f

    .line 249
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v3    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .end local v4    # "t":Lfreemarker/template/Template;
    :cond_3c
    monitor-exit v8
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_35

    .line 250
    return-void
.end method

.method addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;
    .registers 7
    .param p1, "listener"    # Lfreemarker/debug/DebuggerListener;

    .prologue
    .line 206
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    monitor-enter v2

    .line 208
    :try_start_3
    new-instance v0, Ljava/lang/Long;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v0, v3, v4}, Ljava/lang/Long;-><init>(J)V

    .line 209
    .local v0, "id":Ljava/lang/Long;
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    monitor-exit v2

    .line 211
    return-object v0

    .line 210
    .end local v0    # "id":Ljava/lang/Long;
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v1
.end method

.method getBreakpointsSpi()Ljava/util/List;
    .registers 5

    .prologue
    .line 123
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .local v1, "sumlist":Ljava/util/List;
    iget-object v3, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v3

    .line 126
    :try_start_8
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 128
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    iget-object v2, v2, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->breakpoints:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_12

    .line 130
    .end local v0    # "iter":Ljava/util/Iterator;
    :catchall_24
    move-exception v2

    monitor-exit v3
    :try_end_26
    .catchall {:try_start_8 .. :try_end_26} :catchall_24

    throw v2

    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_27
    :try_start_27
    monitor-exit v3
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_24

    .line 131
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 132
    return-object v1
.end method

.method getBreakpointsSpi(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 114
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v2

    .line 116
    :try_start_3
    invoke-direct {p0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v0

    .line 117
    .local v0, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    if-nez v0, :cond_d

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_b
    monitor-exit v2

    return-object v1

    :cond_d
    iget-object v1, v0, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->breakpoints:Ljava/util/List;

    goto :goto_b

    .line 118
    .end local v0    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :catchall_10
    move-exception v1

    monitor-exit v2
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v1
.end method

.method getSuspendedEnvironments()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    return-object v0
.end method

.method registerTemplateSpi(Lfreemarker/template/Template;)V
    .registers 10
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 184
    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v3

    .line 185
    .local v3, "templateName":Ljava/lang/String;
    iget-object v5, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v5

    .line 187
    :try_start_7
    invoke-direct {p0, v3}, Lfreemarker/debug/impl/RmiDebuggerService;->createTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v2

    .line 188
    .local v2, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    iget-object v4, v2, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->templates:Ljava/util/List;

    new-instance v6, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;

    iget-object v7, p0, Lfreemarker/debug/impl/RmiDebuggerService;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v6, v3, p1, v7}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;-><init>(Ljava/lang/String;Lfreemarker/template/Template;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    iget-object v4, v2, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->breakpoints:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 192
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/debug/Breakpoint;

    .line 193
    .local v0, "breakpoint":Lfreemarker/debug/Breakpoint;
    invoke-static {p1, v0}, Lfreemarker/debug/impl/RmiDebuggerService;->insertDebugBreak(Lfreemarker/template/Template;Lfreemarker/debug/Breakpoint;)V

    goto :goto_1d

    .line 195
    .end local v0    # "breakpoint":Lfreemarker/debug/Breakpoint;
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v2    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :catchall_2d
    move-exception v4

    monitor-exit v5
    :try_end_2f
    .catchall {:try_start_7 .. :try_end_2f} :catchall_2d

    throw v4

    .restart local v1    # "iter":Ljava/util/Iterator;
    .restart local v2    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :cond_30
    :try_start_30
    monitor-exit v5
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2d

    .line 196
    return-void
.end method

.method removeBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 11
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;

    .prologue
    .line 333
    invoke-virtual {p1}, Lfreemarker/debug/Breakpoint;->getTemplateName()Ljava/lang/String;

    move-result-object v6

    .line 334
    .local v6, "templateName":Ljava/lang/String;
    iget-object v8, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v8

    .line 336
    :try_start_7
    invoke-direct {p0, v6}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v5

    .line 337
    .local v5, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    if-eqz v5, :cond_46

    .line 339
    iget-object v0, v5, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->breakpoints:Ljava/util/List;

    .line 340
    .local v0, "breakpoints":Ljava/util/List;
    invoke-static {v0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v2

    .line 341
    .local v2, "pos":I
    if-ltz v2, :cond_3b

    .line 343
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 344
    iget-object v7, v5, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->templates:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3b

    .line 346
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;

    .line 347
    .local v3, "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    invoke-virtual {v3}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;->getTemplate()Lfreemarker/template/Template;

    move-result-object v4

    .line 348
    .local v4, "t":Lfreemarker/template/Template;
    if-nez v4, :cond_37

    .line 350
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1e

    .line 363
    .end local v0    # "breakpoints":Ljava/util/List;
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v2    # "pos":I
    .end local v3    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .end local v4    # "t":Lfreemarker/template/Template;
    .end local v5    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :catchall_34
    move-exception v7

    monitor-exit v8
    :try_end_36
    .catchall {:try_start_7 .. :try_end_36} :catchall_34

    throw v7

    .line 354
    .restart local v0    # "breakpoints":Ljava/util/List;
    .restart local v1    # "iter":Ljava/util/Iterator;
    .restart local v2    # "pos":I
    .restart local v3    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .restart local v4    # "t":Lfreemarker/template/Template;
    .restart local v5    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :cond_37
    :try_start_37
    invoke-direct {p0, v4, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->removeDebugBreak(Lfreemarker/template/Template;Lfreemarker/debug/Breakpoint;)V

    goto :goto_1e

    .line 358
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v3    # "ref":Lfreemarker/debug/impl/RmiDebuggerService$TemplateReference;
    .end local v4    # "t":Lfreemarker/template/Template;
    :cond_3b
    invoke-virtual {v5}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_46

    .line 360
    iget-object v7, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    .end local v0    # "breakpoints":Ljava/util/List;
    .end local v2    # "pos":I
    :cond_46
    monitor-exit v8
    :try_end_47
    .catchall {:try_start_37 .. :try_end_47} :catchall_34

    .line 364
    return-void
.end method

.method removeBreakpoints()V
    .registers 5

    .prologue
    .line 409
    iget-object v3, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v3

    .line 411
    :try_start_3
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 413
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    .line 414
    .local v1, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    invoke-direct {p0, v1}, Lfreemarker/debug/impl/RmiDebuggerService;->removeBreakpoints(Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;)V

    .line 415
    invoke-virtual {v1}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 417
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_d

    .line 420
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :catchall_26
    move-exception v2

    monitor-exit v3
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_26

    throw v2

    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_29
    :try_start_29
    monitor-exit v3
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_26

    .line 421
    return-void
.end method

.method removeBreakpoints(Ljava/lang/String;)V
    .registers 5
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 393
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    monitor-enter v2

    .line 395
    :try_start_3
    invoke-direct {p0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->findTemplateDebugInfo(Ljava/lang/String;)Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;

    move-result-object v0

    .line 396
    .local v0, "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    if-eqz v0, :cond_17

    .line 398
    invoke-direct {p0, v0}, Lfreemarker/debug/impl/RmiDebuggerService;->removeBreakpoints(Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;)V

    .line 399
    invoke-virtual {v0}, Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 401
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->templateDebugInfos:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    :cond_17
    monitor-exit v2

    .line 405
    return-void

    .line 404
    .end local v0    # "tdi":Lfreemarker/debug/impl/RmiDebuggerService$TemplateDebugInfo;
    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method removeDebuggerListener(Ljava/lang/Object;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 216
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    monitor-enter v1

    .line 218
    :try_start_3
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    monitor-exit v1

    .line 220
    return-void

    .line 219
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method shutdownSpi()V
    .registers 3

    .prologue
    .line 507
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerService;->server:Lfreemarker/debug/impl/DebuggerServer;

    invoke-virtual {v0}, Lfreemarker/debug/impl/DebuggerServer;->stop()V

    .line 510
    :try_start_5
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerService;->debugger:Lfreemarker/debug/impl/RmiDebuggerImpl;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/rmi/server/UnicastRemoteObject;->unexportObject(Ljava/rmi/Remote;Z)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_b} :catch_f

    .line 516
    :goto_b
    invoke-static {}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->cleanup()V

    .line 517
    return-void

    .line 512
    :catch_f
    move-exception v0

    goto :goto_b
.end method

.method suspendEnvironmentSpi(Lfreemarker/core/Environment;Ljava/lang/String;I)Z
    .registers 11
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "templateName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-static {p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->getCachedWrapperFor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;

    .line 143
    .local v1, "denv":Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
    iget-object v5, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    monitor-enter v5

    .line 145
    :try_start_9
    iget-object v4, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    invoke-virtual {v4, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 146
    monitor-exit v5
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_3f

    .line 149
    :try_start_f
    new-instance v0, Lfreemarker/debug/EnvironmentSuspendedEvent;

    invoke-direct {v0, p0, p2, p3, v1}, Lfreemarker/debug/EnvironmentSuspendedEvent;-><init>(Ljava/lang/Object;Ljava/lang/String;ILfreemarker/debug/DebuggedEnvironment;)V

    .line 152
    .local v0, "breakpointEvent":Lfreemarker/debug/EnvironmentSuspendedEvent;
    iget-object v5, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    monitor-enter v5
    :try_end_17
    .catchall {:try_start_f .. :try_end_17} :catchall_34

    .line 154
    :try_start_17
    iget-object v4, p0, Lfreemarker/debug/impl/RmiDebuggerService;->listeners:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_42

    .line 156
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/debug/DebuggerListener;

    .line 157
    .local v3, "listener":Lfreemarker/debug/DebuggerListener;
    invoke-interface {v3, v0}, Lfreemarker/debug/DebuggerListener;->environmentSuspended(Lfreemarker/debug/EnvironmentSuspendedEvent;)V

    goto :goto_21

    .line 159
    .end local v2    # "iter":Ljava/util/Iterator;
    .end local v3    # "listener":Lfreemarker/debug/DebuggerListener;
    :catchall_31
    move-exception v4

    monitor-exit v5
    :try_end_33
    .catchall {:try_start_17 .. :try_end_33} :catchall_31

    :try_start_33
    throw v4
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_34

    .line 175
    .end local v0    # "breakpointEvent":Lfreemarker/debug/EnvironmentSuspendedEvent;
    :catchall_34
    move-exception v4

    iget-object v5, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    monitor-enter v5

    .line 177
    :try_start_38
    iget-object v6, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 178
    monitor-exit v5
    :try_end_3e
    .catchall {:try_start_38 .. :try_end_3e} :catchall_5c

    throw v4

    .line 146
    :catchall_3f
    move-exception v4

    :try_start_40
    monitor-exit v5
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    throw v4

    .line 159
    .restart local v0    # "breakpointEvent":Lfreemarker/debug/EnvironmentSuspendedEvent;
    .restart local v2    # "iter":Ljava/util/Iterator;
    :cond_42
    :try_start_42
    monitor-exit v5
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_31

    .line 160
    :try_start_43
    monitor-enter v1
    :try_end_44
    .catchall {:try_start_43 .. :try_end_44} :catchall_34

    .line 164
    :try_start_44
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_47
    .catch Ljava/lang/InterruptedException; {:try_start_44 .. :try_end_47} :catch_5f
    .catchall {:try_start_44 .. :try_end_47} :catchall_56

    .line 170
    :goto_47
    :try_start_47
    monitor-exit v1
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_56

    .line 171
    :try_start_48
    invoke-virtual {v1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->isStopped()Z
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_34

    move-result v4

    .line 175
    iget-object v5, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    monitor-enter v5

    .line 177
    :try_start_4f
    iget-object v6, p0, Lfreemarker/debug/impl/RmiDebuggerService;->suspendedEnvironments:Ljava/util/HashSet;

    invoke-virtual {v6, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 178
    monitor-exit v5
    :try_end_55
    .catchall {:try_start_4f .. :try_end_55} :catchall_59

    return v4

    .line 170
    :catchall_56
    move-exception v4

    :try_start_57
    monitor-exit v1
    :try_end_58
    .catchall {:try_start_57 .. :try_end_58} :catchall_56

    :try_start_58
    throw v4
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_34

    .line 178
    :catchall_59
    move-exception v4

    :try_start_5a
    monitor-exit v5
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_59

    throw v4

    .end local v0    # "breakpointEvent":Lfreemarker/debug/EnvironmentSuspendedEvent;
    .end local v2    # "iter":Ljava/util/Iterator;
    :catchall_5c
    move-exception v4

    :try_start_5d
    monitor-exit v5
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_5c

    throw v4

    .line 166
    .restart local v0    # "breakpointEvent":Lfreemarker/debug/EnvironmentSuspendedEvent;
    .restart local v2    # "iter":Ljava/util/Iterator;
    :catch_5f
    move-exception v4

    goto :goto_47
.end method

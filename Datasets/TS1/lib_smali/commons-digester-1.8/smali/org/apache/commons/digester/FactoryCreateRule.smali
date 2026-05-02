.class public Lorg/apache/commons/digester/FactoryCreateRule;
.super Lorg/apache/commons/digester/Rule;
.source "FactoryCreateRule.java"


# instance fields
.field protected attributeName:Ljava/lang/String;

.field protected className:Ljava/lang/String;

.field protected creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

.field private exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

.field private ignoreCreateExceptions:Z


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 174
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;Z)V

    .line 176
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 212
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 214
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "attributeName"    # Ljava/lang/String;
    .param p3, "ignoreCreateExceptions"    # Z

    .prologue
    .line 306
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 308
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Z)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "ignoreCreateExceptions"    # Z

    .prologue
    .line 260
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 262
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 158
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Z)V

    .line 160
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 195
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "attributeName"    # Ljava/lang/String;
    .param p3, "ignoreCreateExceptions"    # Z

    .prologue
    const/4 v0, 0x0

    .line 280
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 333
    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    .line 340
    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->className:Ljava/lang/String;

    .line 348
    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    .line 282
    iput-object p1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->className:Ljava/lang/String;

    .line 283
    iput-object p2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    .line 284
    iput-boolean p3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->ignoreCreateExceptions:Z

    .line 286
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "ignoreCreateExceptions"    # Z

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 245
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 81
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/ObjectCreationFactory;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "creationFactory"    # Lorg/apache/commons/digester/ObjectCreationFactory;

    .prologue
    .line 143
    invoke-direct {p0, p2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/ObjectCreationFactory;)V
    .registers 3
    .param p1, "creationFactory"    # Lorg/apache/commons/digester/ObjectCreationFactory;

    .prologue
    .line 227
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Lorg/apache/commons/digester/ObjectCreationFactory;Z)V

    .line 229
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/ObjectCreationFactory;Z)V
    .registers 4
    .param p1, "creationFactory"    # Lorg/apache/commons/digester/ObjectCreationFactory;
    .param p2, "ignoreCreateExceptions"    # Z

    .prologue
    const/4 v0, 0x0

    .line 321
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 333
    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    .line 340
    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->className:Ljava/lang/String;

    .line 348
    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    .line 323
    iput-object p1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    .line 324
    iput-boolean p2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->ignoreCreateExceptions:Z

    .line 325
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 9
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 361
    iget-boolean v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->ignoreCreateExceptions:Z

    if-eqz v2, :cond_b1

    .line 363
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    if-nez v2, :cond_f

    .line 364
    new-instance v2, Lorg/apache/commons/collections/ArrayStack;

    invoke-direct {v2}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    .line 368
    :cond_f
    :try_start_f
    invoke-virtual {p0, p3}, Lorg/apache/commons/digester/FactoryCreateRule;->getFactory(Lorg/xml/sax/Attributes;)Lorg/apache/commons/digester/ObjectCreationFactory;

    move-result-object v2

    invoke-interface {v2, p3}, Lorg/apache/commons/digester/ObjectCreationFactory;->createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;

    move-result-object v1

    .line 370
    .local v1, "instance":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_51

    .line 371
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "[FactoryCreateRule]{"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v4, v4, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "} New "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 374
    :cond_51
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v2, v1}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 375
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_5d} :catch_5e

    .line 398
    .end local v1    # "instance":Ljava/lang/Object;
    :goto_5d
    return-void

    .line 379
    :catch_5e
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v2

    if-eqz v2, :cond_a4

    .line 380
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "[FactoryCreateRule] Create exception ignored: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_ac

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    :goto_86
    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 382
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_a4

    .line 383
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "[FactoryCreateRule] Ignored exception:"

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 386
    :cond_a4
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Lorg/apache/commons/collections/ArrayStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5d

    .line 380
    :cond_ac
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_86

    .line 390
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_b1
    invoke-virtual {p0, p3}, Lorg/apache/commons/digester/FactoryCreateRule;->getFactory(Lorg/xml/sax/Attributes;)Lorg/apache/commons/digester/ObjectCreationFactory;

    move-result-object v2

    invoke-interface {v2, p3}, Lorg/apache/commons/digester/ObjectCreationFactory;->createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;

    move-result-object v1

    .line 392
    .restart local v1    # "instance":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_f3

    .line 393
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v2, v2, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "[FactoryCreateRule]{"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v4, v4, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "} New "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 396
    :cond_f3
    iget-object v2, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v2, v1}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    goto/16 :goto_5d
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 408
    iget-boolean v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->ignoreCreateExceptions:Z

    if-eqz v1, :cond_32

    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    if-eqz v1, :cond_32

    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->empty()Z

    move-result v1

    if-nez v1, :cond_32

    .line 413
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->exceptionIgnoredStack:Lorg/apache/commons/collections/ArrayStack;

    invoke-virtual {v1}, Lorg/apache/commons/collections/ArrayStack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 416
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v1, v1, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 417
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v1, v1, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "[FactoryCreateRule] No creation so no push so no pop"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 429
    :cond_31
    :goto_31
    return-void

    .line 423
    :cond_32
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v1}, Lorg/apache/commons/digester/Digester;->pop()Ljava/lang/Object;

    move-result-object v0

    .line 424
    .local v0, "top":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v1, v1, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 425
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v1, v1, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "[FactoryCreateRule]{"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "} Pop "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_31
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 437
    iget-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 438
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    .line 441
    :cond_7
    return-void
.end method

.method protected getFactory(Lorg/xml/sax/Attributes;)Lorg/apache/commons/digester/ObjectCreationFactory;
    .registers 8
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 478
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    if-nez v3, :cond_5e

    .line 479
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->className:Ljava/lang/String;

    .line 480
    .local v1, "realClassName":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    if-eqz v3, :cond_13

    .line 481
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 482
    .local v2, "value":Ljava/lang/String;
    if-eqz v2, :cond_13

    .line 483
    move-object v1, v2

    .line 486
    .end local v2    # "value":Ljava/lang/String;
    :cond_13
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_45

    .line 487
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v3, v3, Lorg/apache/commons/digester/Digester;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "[FactoryCreateRule]{"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v5, v5, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "} New factory "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 490
    :cond_45
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 491
    .local v0, "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/digester/ObjectCreationFactory;

    iput-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    .line 493
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    iget-object v4, p0, Lorg/apache/commons/digester/FactoryCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-interface {v3, v4}, Lorg/apache/commons/digester/ObjectCreationFactory;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 495
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v1    # "realClassName":Ljava/lang/String;
    :cond_5e
    iget-object v3, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 449
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "FactoryCreateRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 450
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "className="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 451
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->className:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    const-string v1, ", attributeName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 453
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->attributeName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 454
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    if-eqz v1, :cond_29

    .line 455
    const-string v1, ", creationFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 456
    iget-object v1, p0, Lorg/apache/commons/digester/FactoryCreateRule;->creationFactory:Lorg/apache/commons/digester/ObjectCreationFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 458
    :cond_29
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 459
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

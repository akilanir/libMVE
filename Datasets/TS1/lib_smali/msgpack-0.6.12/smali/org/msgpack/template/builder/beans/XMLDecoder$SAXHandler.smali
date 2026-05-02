.class Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "XMLDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/beans/XMLDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SAXHandler"
.end annotation


# instance fields
.field idObjMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field inJavaElem:Z

.field final synthetic this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;


# direct methods
.method private constructor <init>(Lorg/msgpack/template/builder/beans/XMLDecoder;)V
    .registers 3

    .prologue
    .line 57
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->inJavaElem:Z

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->idObjMap:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lorg/msgpack/template/builder/beans/XMLDecoder;Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder;
    .param p2, "x1"    # Lorg/msgpack/template/builder/beans/XMLDecoder$1;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder;)V

    return-void
.end method

.method private capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 467
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 468
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 469
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private classForName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 179
    const-string v0, "boolean"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 180
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 196
    :goto_a
    return-object v0

    .line 181
    :cond_b
    const-string v0, "byte"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 182
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 183
    :cond_16
    const-string v0, "char"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 184
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 185
    :cond_21
    const-string v0, "double"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 186
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 187
    :cond_2c
    const-string v0, "float"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 188
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 189
    :cond_37
    const-string v0, "int"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 190
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 191
    :cond_42
    const-string v0, "long"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 192
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 193
    :cond_4d
    const-string v0, "short"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 194
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 196
    :cond_58
    const/4 v1, 0x1

    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->defaultClassLoader:Ljava/lang/ClassLoader;
    invoke-static {v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$400(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/ClassLoader;

    move-result-object v0

    if-nez v0, :cond_6e

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :goto_69
    invoke-static {p1, v1, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    :cond_6e
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->defaultClassLoader:Ljava/lang/ClassLoader;
    invoke-static {v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$400(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_69
.end method

.method private execute(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;
    .registers 6
    .param p1, "elem"    # Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    .prologue
    .line 307
    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExecuted:Z

    if-eqz v1, :cond_7

    .line 308
    iget-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;

    .line 330
    :goto_6
    return-object v1

    .line 313
    :cond_7
    :try_start_7
    iget-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->idref:Ljava/lang/String;

    if-eqz v1, :cond_28

    .line 314
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->idObjMap:Ljava/util/HashMap;

    iget-object v2, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->idref:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_15} :catch_33

    .line 325
    :goto_15
    iget-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->id:Ljava/lang/String;

    if-eqz v1, :cond_22

    .line 326
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->idObjMap:Ljava/util/HashMap;

    iget-object v2, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->id:Ljava/lang/String;

    iget-object v3, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    :cond_22
    const/4 v1, 0x1

    iput-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExecuted:Z

    .line 330
    iget-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;

    goto :goto_6

    .line 315
    :cond_28
    :try_start_28
    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isBasicType:Z

    if-eqz v1, :cond_3e

    .line 316
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->executeBasic(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_32} :catch_33

    goto :goto_15

    .line 320
    :catch_33
    move-exception v0

    .line 321
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v1}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    goto :goto_15

    .line 318
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3e
    :try_start_3e
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->executeCommon(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_44} :catch_33

    goto :goto_15
.end method

.method private executeBasic(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;
    .registers 8
    .param p1, "elem"    # Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 474
    iget-object v2, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .line 475
    .local v2, "tag":Ljava/lang/String;
    iget-object v3, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 477
    .local v3, "value":Ljava/lang/String;
    const-string v4, "null"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 478
    const/4 v3, 0x0

    .line 507
    .end local v3    # "value":Ljava/lang/String;
    :cond_f
    :goto_f
    return-object v3

    .line 479
    .restart local v3    # "value":Ljava/lang/String;
    :cond_10
    const-string v4, "string"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 480
    if-nez v3, :cond_f

    const-string v3, ""

    goto :goto_f

    .line 481
    :cond_1d
    const-string v4, "class"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 482
    invoke-direct {p0, v3}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->classForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    goto :goto_f

    .line 483
    :cond_2a
    const-string v4, "boolean"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_37

    .line 484
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_f

    .line 485
    :cond_37
    const-string v4, "byte"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 486
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object v3

    goto :goto_f

    .line 487
    :cond_44
    const-string v4, "char"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_83

    .line 488
    if-nez v3, :cond_79

    iget-object v4, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->attributes:Lorg/xml/sax/Attributes;

    if-eqz v4, :cond_79

    .line 489
    iget-object v4, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->attributes:Lorg/xml/sax/Attributes;

    const-string v5, "code"

    invoke-interface {v4, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 490
    .local v1, "codeAttr":Ljava/lang/String;
    if-eqz v1, :cond_79

    .line 491
    new-instance v0, Ljava/lang/Character;

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-char v4, v4

    invoke-direct {v0, v4}, Ljava/lang/Character;-><init>(C)V

    .line 493
    .local v0, "character":Ljava/lang/Character;
    invoke-virtual {v0}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    move-object v3, v0

    .line 494
    goto :goto_f

    .line 497
    .end local v0    # "character":Ljava/lang/Character;
    .end local v1    # "codeAttr":Ljava/lang/String;
    :cond_79
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    goto :goto_f

    .line 498
    :cond_83
    const-string v4, "double"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_90

    .line 499
    invoke-static {v3}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v3

    goto :goto_f

    .line 500
    :cond_90
    const-string v4, "float"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9e

    .line 501
    invoke-static {v3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v3

    goto/16 :goto_f

    .line 502
    :cond_9e
    const-string v4, "int"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ac

    .line 503
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_f

    .line 504
    :cond_ac
    const-string v4, "long"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    .line 505
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    goto/16 :goto_f

    .line 506
    :cond_ba
    const-string v4, "short"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c8

    .line 507
    invoke-static {v3}, Ljava/lang/Short;->valueOf(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object v3

    goto/16 :goto_f

    .line 509
    :cond_c8
    new-instance v4, Ljava/lang/Exception;

    const-string v5, "custom.beans.71"

    invoke-static {v5, v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private executeCommon(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;
    .registers 19
    .param p1, "elem"    # Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 336
    new-instance v3, Ljava/util/ArrayList;

    const/4 v12, 0x5

    invoke-direct {v3, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 337
    .local v3, "args":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :goto_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v0, p1

    if-eq v12, v0, :cond_2b

    .line 338
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    .line 339
    .local v2, "argElem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    const/4 v12, 0x0

    iget-object v13, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;

    invoke-virtual {v3, v12, v13}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_6

    .line 342
    .end local v2    # "argElem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    :cond_2b
    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 343
    .local v10, "method":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromProperty:Z

    if-eqz v12, :cond_54

    .line 344
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-nez v12, :cond_8f

    const-string v12, "get"

    :goto_42
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 347
    :cond_54
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromIndex:Z

    if-eqz v12, :cond_6b

    .line 348
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    .line 349
    .local v8, "index":Ljava/lang/Integer;
    const/4 v12, 0x0

    invoke-virtual {v3, v12, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 350
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_92

    const-string v10, "get"

    .line 352
    .end local v8    # "index":Ljava/lang/Integer;
    :cond_6b
    :goto_6b
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromField:Z

    if-eqz v12, :cond_95

    .line 353
    move-object/from16 v0, p1

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    check-cast v12, Ljava/lang/Class;

    invoke-virtual {v12, v10}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 354
    .local v6, "f":Ljava/lang/reflect/Field;
    new-instance v12, Lorg/msgpack/template/builder/beans/Expression;

    const-string v13, "get"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput-object v16, v14, v15

    invoke-direct {v12, v6, v13, v14}, Lorg/msgpack/template/builder/beans/Expression;-><init>(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v12}, Lorg/msgpack/template/builder/beans/Expression;->getValue()Ljava/lang/Object;

    move-result-object v12

    .line 389
    .end local v6    # "f":Ljava/lang/reflect/Field;
    :goto_8e
    return-object v12

    .line 344
    :cond_8f
    const-string v12, "set"

    goto :goto_42

    .line 350
    .restart local v8    # "index":Ljava/lang/Integer;
    :cond_92
    const-string v10, "set"

    goto :goto_6b

    .line 357
    .end local v8    # "index":Ljava/lang/Integer;
    :cond_95
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromOwner:Z

    if-eqz v12, :cond_a4

    .line 358
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    goto :goto_8e

    .line 361
    :cond_a4
    move-object/from16 v0, p1

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v13}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v13

    if-ne v12, v13, :cond_13e

    .line 362
    const-string v12, "getOwner"

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c3

    .line 363
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    goto :goto_8e

    .line 365
    :cond_c3
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v12

    new-array v4, v12, [Ljava/lang/Class;

    .line 366
    .local v4, "c":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_ca
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v7, v12, :cond_e1

    .line 367
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 368
    .local v1, "arg":Ljava/lang/Object;
    if-nez v1, :cond_dc

    const/4 v12, 0x0

    :goto_d7
    aput-object v12, v4, v7

    .line 366
    add-int/lit8 v7, v7, 0x1

    goto :goto_ca

    .line 368
    :cond_dc
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    goto :goto_d7

    .line 373
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_e1
    :try_start_e1
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12, v10, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 374
    .local v9, "m":Ljava/lang/reflect/Method;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v9, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_100
    .catch Ljava/lang/NoSuchMethodException; {:try_start_e1 .. :try_end_100} :catch_102

    move-result-object v12

    goto :goto_8e

    .line 375
    .end local v9    # "m":Ljava/lang/reflect/Method;
    :catch_102
    move-exception v12

    .line 380
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    instance-of v12, v12, Ljava/lang/Class;

    if-eqz v12, :cond_131

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Class;

    :goto_119
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v10, v4}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 384
    .local v11, "mostSpecificMethod":Ljava/lang/reflect/Method;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    goto/16 :goto_8e

    .line 380
    .end local v11    # "mostSpecificMethod":Ljava/lang/reflect/Method;
    :cond_131
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v12}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    goto :goto_119

    .line 388
    .end local v4    # "c":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v7    # "i":I
    :cond_13e
    new-instance v5, Lorg/msgpack/template/builder/beans/Expression;

    move-object/from16 v0, p1

    iget-object v12, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v13

    invoke-direct {v5, v12, v10, v13}, Lorg/msgpack/template/builder/beans/Expression;-><init>(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 389
    .local v5, "exp":Lorg/msgpack/template/builder/beans/Expression;
    invoke-virtual {v5}, Lorg/msgpack/template/builder/beans/Expression;->getValue()Ljava/lang/Object;

    move-result-object v12

    goto/16 :goto_8e
.end method

.method private findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 26
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 394
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "clazzes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v17

    .line 395
    .local v17, "methods":[Ljava/lang/reflect/Method;
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 398
    .local v14, "matchMethods":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    move-object/from16 v3, v17

    .local v3, "arr$":[Ljava/lang/reflect/Method;
    array-length v12, v3

    .local v12, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_d
    if-ge v8, v12, :cond_73

    aget-object v15, v3, v8

    .line 399
    .local v15, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v15}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_22

    .line 398
    :cond_1f
    :goto_1f
    add-int/lit8 v8, v8, 0x1

    goto :goto_d

    .line 402
    :cond_22
    invoke-virtual {v15}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v18

    .line 403
    .local v18, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1f

    .line 406
    const/4 v13, 0x1

    .line 407
    .local v13, "match":Z
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_38
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_6d

    .line 408
    aget-object v20, p3, v7

    if-nez v20, :cond_60

    const/4 v10, 0x1

    .line 409
    .local v10, "isNull":Z
    :goto_46
    aget-object v20, p3, v7

    aget-object v21, v18, v7

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->isPrimitiveWrapper(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v11

    .line 410
    .local v11, "isPrimitive":Z
    if-eqz v10, :cond_62

    const/4 v9, 0x0

    .line 411
    .local v9, "isAssignable":Z
    :goto_57
    if-nez v10, :cond_5d

    if-nez v11, :cond_5d

    if-eqz v9, :cond_6b

    .line 407
    :cond_5d
    :goto_5d
    add-int/lit8 v7, v7, 0x1

    goto :goto_38

    .line 408
    .end local v9    # "isAssignable":Z
    .end local v10    # "isNull":Z
    .end local v11    # "isPrimitive":Z
    :cond_60
    const/4 v10, 0x0

    goto :goto_46

    .line 410
    .restart local v10    # "isNull":Z
    .restart local v11    # "isPrimitive":Z
    :cond_62
    aget-object v20, v18, v7

    aget-object v21, p3, v7

    invoke-virtual/range {v20 .. v21}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    goto :goto_57

    .line 414
    .restart local v9    # "isAssignable":Z
    :cond_6b
    const/4 v13, 0x0

    goto :goto_5d

    .line 416
    .end local v9    # "isAssignable":Z
    .end local v10    # "isNull":Z
    .end local v11    # "isPrimitive":Z
    :cond_6d
    if-eqz v13, :cond_1f

    .line 417
    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    .line 421
    .end local v7    # "i":I
    .end local v13    # "match":Z
    .end local v15    # "method":Ljava/lang/reflect/Method;
    .end local v18    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_73
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v19

    .line 422
    .local v19, "size":I
    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_8a

    .line 424
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/reflect/Method;

    .line 452
    .end local v8    # "i$":I
    :goto_89
    return-object v20

    .line 425
    .restart local v8    # "i$":I
    :cond_8a
    if-nez v19, :cond_9c

    .line 427
    new-instance v20, Ljava/lang/NoSuchMethodException;

    const-string v21, "custom.beans.41"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 433
    :cond_9c
    new-instance v5, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {v5, v0, v1}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 435
    .local v5, "comparator":Lorg/msgpack/template/builder/beans/Statement$MethodComparator;
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Method;

    .line 436
    .local v4, "chosenOne":Ljava/lang/reflect/Method;
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 437
    const/16 v16, 0x1

    .line 438
    .local v16, "methodCounter":I
    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_bc
    :goto_bc
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_d7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/reflect/Method;

    .line 439
    .restart local v15    # "method":Ljava/lang/reflect/Method;
    invoke-virtual {v5, v4, v15}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I

    move-result v6

    .line 440
    .local v6, "difference":I
    if-lez v6, :cond_d2

    .line 441
    move-object v4, v15

    .line 442
    const/16 v16, 0x1

    goto :goto_bc

    .line 443
    :cond_d2
    if-nez v6, :cond_bc

    .line 444
    add-int/lit8 v16, v16, 0x1

    goto :goto_bc

    .line 447
    .end local v6    # "difference":I
    .end local v15    # "method":Ljava/lang/reflect/Method;
    :cond_d7
    const/16 v20, 0x1

    move/from16 v0, v16

    move/from16 v1, v20

    if-le v0, v1, :cond_ef

    .line 449
    new-instance v20, Ljava/lang/NoSuchMethodException;

    const-string v21, "custom.beans.62"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v20

    :cond_ef
    move-object/from16 v20, v4

    .line 452
    goto :goto_89
.end method

.method private isPrimitiveWrapper(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 456
    .local p1, "wrapper":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "base":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_8

    const-class v0, Ljava/lang/Boolean;

    if-eq p1, v0, :cond_40

    :cond_8
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_10

    const-class v0, Ljava/lang/Byte;

    if-eq p1, v0, :cond_40

    :cond_10
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_18

    const-class v0, Ljava/lang/Character;

    if-eq p1, v0, :cond_40

    :cond_18
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_20

    const-class v0, Ljava/lang/Short;

    if-eq p1, v0, :cond_40

    :cond_20
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_28

    const-class v0, Ljava/lang/Integer;

    if-eq p1, v0, :cond_40

    :cond_28
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_30

    const-class v0, Ljava/lang/Long;

    if-eq p1, v0, :cond_40

    :cond_30
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_38

    const-class v0, Ljava/lang/Float;

    if-eq p1, v0, :cond_40

    :cond_38
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_42

    const-class v0, Ljava/lang/Double;

    if-ne p1, v0, :cond_42

    :cond_40
    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method

.method private latestUnclosedElem()Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    .registers 4

    .prologue
    .line 297
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v2}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_c
    if-ltz v1, :cond_22

    .line 298
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v2}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Stack;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    .line 299
    .local v0, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    iget-boolean v2, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isClosed:Z

    if-nez v2, :cond_1f

    .line 303
    .end local v0    # "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    :goto_1e
    return-object v0

    .line 297
    .restart local v0    # "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    :cond_1f
    add-int/lit8 v1, v1, -0x1

    goto :goto_c

    .line 303
    .end local v0    # "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    :cond_22
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method private obtainMethod(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;Lorg/xml/sax/Attributes;)V
    .registers 5
    .param p1, "elem"    # Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    .param p2, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    const/4 v1, 0x1

    .line 144
    const-string v0, "method"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 145
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-eqz v0, :cond_e

    .line 174
    :goto_d
    return-void

    .line 149
    :cond_e
    const-string v0, "property"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 150
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-eqz v0, :cond_1d

    .line 151
    iput-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromProperty:Z

    goto :goto_d

    .line 155
    :cond_1d
    const-string v0, "index"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 156
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-eqz v0, :cond_2c

    .line 157
    iput-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromIndex:Z

    goto :goto_d

    .line 161
    :cond_2c
    const-string v0, "field"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 162
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-eqz v0, :cond_3b

    .line 163
    iput-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromField:Z

    goto :goto_d

    .line 167
    :cond_3b
    const-string v0, "owner"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 168
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-eqz v0, :cond_4a

    .line 169
    iput-boolean v1, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->fromOwner:Z

    goto :goto_d

    .line 173
    :cond_4a
    const-string v0, "new"

    iput-object v0, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    goto :goto_d
.end method

.method private obtainTarget(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;Lorg/xml/sax/Attributes;)V
    .registers 7
    .param p1, "elem"    # Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    .param p2, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 125
    const-string v3, "class"

    invoke-interface {p2, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_1a

    .line 128
    :try_start_8
    invoke-direct {p0, v0}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->classForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8 .. :try_end_e} :catch_f

    .line 140
    :goto_e
    return-void

    .line 129
    :catch_f
    move-exception v1

    .line 130
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v3}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v3

    invoke-interface {v3, v1}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    goto :goto_e

    .line 133
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :cond_1a
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->latestUnclosedElem()Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    move-result-object v2

    .line 134
    .local v2, "parent":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    if-nez v2, :cond_29

    .line 135
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->owner:Ljava/lang/Object;
    invoke-static {v3}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$300(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    goto :goto_e

    .line 138
    :cond_29
    invoke-direct {p0, v2}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->execute(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p1, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    goto :goto_e
.end method

.method private startArrayElem(Lorg/xml/sax/Attributes;)V
    .registers 9
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    const/4 v6, 0x1

    .line 203
    new-instance v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    const/4 v5, 0x0

    invoke-direct {v2, v5}, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V

    .line 204
    .local v2, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    iput-boolean v6, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExpression:Z

    .line 205
    const-string v5, "id"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->id:Ljava/lang/String;

    .line 206
    iput-object p1, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->attributes:Lorg/xml/sax/Attributes;

    .line 209
    :try_start_13
    const-string v5, "class"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->classForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 210
    .local v0, "compClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v5, "length"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 211
    .local v4, "lengthValue":Ljava/lang/String;
    if-eqz v4, :cond_42

    .line 213
    const-string v5, "length"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 216
    .local v3, "length":I
    invoke-static {v0, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    iput-object v5, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->result:Ljava/lang/Object;

    .line 217
    const/4 v5, 0x1

    iput-boolean v5, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExecuted:Z
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_38} :catch_4c

    .line 229
    .end local v0    # "compClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "length":I
    .end local v4    # "lengthValue":Ljava/lang/String;
    :goto_38
    iget-object v5, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v5}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    return-void

    .line 222
    .restart local v0    # "compClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "lengthValue":Ljava/lang/String;
    :cond_42
    :try_start_42
    iput-object v0, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    .line 223
    const-string v5, "newArray"

    iput-object v5, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 224
    const/4 v5, 0x0

    iput-boolean v5, v2, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExecuted:Z
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_4b} :catch_4c

    goto :goto_38

    .line 226
    .end local v0    # "compClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "lengthValue":Ljava/lang/String;
    :catch_4c
    move-exception v1

    .line 227
    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v5}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v5

    invoke-interface {v5, v1}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    goto :goto_38
.end method

.method private startBasicElem(Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "tagName"    # Ljava/lang/String;
    .param p2, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    const/4 v2, 0x1

    .line 244
    new-instance v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V

    .line 245
    .local v0, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    iput-boolean v2, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isBasicType:Z

    .line 246
    iput-boolean v2, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExpression:Z

    .line 247
    const-string v1, "id"

    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->id:Ljava/lang/String;

    .line 248
    const-string v1, "idref"

    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->idref:Ljava/lang/String;

    .line 249
    iput-object p2, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->attributes:Lorg/xml/sax/Attributes;

    .line 250
    iput-object p1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    .line 251
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v1}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    return-void
.end method

.method private startObjectElem(Lorg/xml/sax/Attributes;)V
    .registers 4
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 111
    new-instance v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V

    .line 112
    .local v0, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExpression:Z

    .line 113
    const-string v1, "id"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->id:Ljava/lang/String;

    .line 114
    const-string v1, "idref"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->idref:Ljava/lang/String;

    .line 115
    iput-object p1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->attributes:Lorg/xml/sax/Attributes;

    .line 116
    iget-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->idref:Ljava/lang/String;

    if-nez v1, :cond_25

    .line 117
    invoke-direct {p0, v0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->obtainTarget(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;Lorg/xml/sax/Attributes;)V

    .line 118
    invoke-direct {p0, v0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->obtainMethod(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;Lorg/xml/sax/Attributes;)V

    .line 121
    :cond_25
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v1}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    return-void
.end method

.method private startVoidElem(Lorg/xml/sax/Attributes;)V
    .registers 4
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 234
    new-instance v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;-><init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V

    .line 235
    .local v0, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    const-string v1, "id"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->id:Ljava/lang/String;

    .line 236
    iput-object p1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->attributes:Lorg/xml/sax/Attributes;

    .line 237
    invoke-direct {p0, v0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->obtainTarget(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;Lorg/xml/sax/Attributes;)V

    .line 238
    invoke-direct {p0, v0, p1}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->obtainMethod(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;Lorg/xml/sax/Attributes;)V

    .line 239
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v1}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 8
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 66
    iget-boolean v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->inJavaElem:Z

    if-nez v2, :cond_5

    .line 77
    :cond_4
    :goto_4
    return-void

    .line 69
    :cond_5
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v2}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v2

    if-lez v2, :cond_4

    .line 70
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v2}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    .line 71
    .local v0, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    iget-boolean v2, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isBasicType:Z

    if-eqz v2, :cond_4

    .line 72
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 73
    .local v1, "str":Ljava/lang/String;
    iget-object v2, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-nez v2, :cond_2d

    .end local v1    # "str":Ljava/lang/String;
    :goto_2a
    iput-object v1, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    goto :goto_4

    .restart local v1    # "str":Ljava/lang/String;
    :cond_2d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2a
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 257
    iget-boolean v4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->inJavaElem:Z

    if-nez v4, :cond_6

    .line 294
    :cond_5
    :goto_5
    return-void

    .line 260
    :cond_6
    const-string v4, "java"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 261
    iput-boolean v6, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->inJavaElem:Z

    goto :goto_5

    .line 265
    :cond_11
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->latestUnclosedElem()Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    move-result-object v3

    .line 266
    .local v3, "toClose":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    const-string v4, "string"

    iget-object v5, v3, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 267
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 268
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v4}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Stack;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "index":I
    :goto_30
    if-ltz v1, :cond_40

    .line 269
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v4}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/Stack;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;

    .line 270
    .local v0, "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    if-ne v3, v0, :cond_7d

    .line 277
    .end local v0    # "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    :cond_40
    iget-object v4, v3, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    if-eqz v4, :cond_8f

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v3, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_5b
    iput-object v4, v3, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    .line 282
    .end local v1    # "index":I
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_5d
    invoke-direct {p0, v3}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->execute(Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;)Ljava/lang/Object;

    .line 284
    const/4 v4, 0x1

    iput-boolean v4, v3, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isClosed:Z

    .line 286
    :cond_63
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v4}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v3, :cond_63

    .line 290
    iget-boolean v4, v3, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->isExpression:Z

    if-eqz v4, :cond_5

    .line 292
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->readObjs:Ljava/util/Stack;
    invoke-static {v4}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$000(Lorg/msgpack/template/builder/beans/XMLDecoder;)Ljava/util/Stack;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 273
    .restart local v0    # "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    .restart local v1    # "index":I
    .restart local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_7d
    const-string v4, "char"

    iget-object v5, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->target:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8c

    .line 274
    iget-object v4, v0, Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;->methodName:Ljava/lang/String;

    invoke-virtual {v2, v6, v4}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    :cond_8c
    add-int/lit8 v1, v1, -0x1

    goto :goto_30

    .line 277
    .end local v0    # "elem":Lorg/msgpack/template/builder/beans/XMLDecoder$Elem;
    :cond_8f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_5b
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .registers 3
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 515
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    .line 516
    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .registers 3
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 520
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    .line 521
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 83
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->inJavaElem:Z

    if-nez v0, :cond_25

    .line 84
    const-string v0, "java"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->inJavaElem:Z

    .line 107
    :cond_f
    :goto_f
    return-void

    .line 87
    :cond_10
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v0

    new-instance v1, Ljava/lang/Exception;

    const-string v2, "custom.beans.72"

    invoke-static {v2, p3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    goto :goto_f

    .line 93
    :cond_25
    const-string v0, "object"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 94
    invoke-direct {p0, p4}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->startObjectElem(Lorg/xml/sax/Attributes;)V

    goto :goto_f

    .line 95
    :cond_31
    const-string v0, "array"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 96
    invoke-direct {p0, p4}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->startArrayElem(Lorg/xml/sax/Attributes;)V

    goto :goto_f

    .line 97
    :cond_3d
    const-string v0, "void"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 98
    invoke-direct {p0, p4}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->startVoidElem(Lorg/xml/sax/Attributes;)V

    goto :goto_f

    .line 99
    :cond_49
    const-string v0, "boolean"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "byte"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "char"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "class"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "double"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "float"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "int"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "long"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "short"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "string"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a1

    const-string v0, "null"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 105
    :cond_a1
    invoke-direct {p0, p3, p4}, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->startBasicElem(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    goto/16 :goto_f
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .registers 3
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 525
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/XMLDecoder$SAXHandler;->this$0:Lorg/msgpack/template/builder/beans/XMLDecoder;

    # getter for: Lorg/msgpack/template/builder/beans/XMLDecoder;->listener:Lorg/msgpack/template/builder/beans/ExceptionListener;
    invoke-static {v0}, Lorg/msgpack/template/builder/beans/XMLDecoder;->access$100(Lorg/msgpack/template/builder/beans/XMLDecoder;)Lorg/msgpack/template/builder/beans/ExceptionListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/template/builder/beans/ExceptionListener;->exceptionThrown(Ljava/lang/Exception;)V

    .line 526
    return-void
.end method

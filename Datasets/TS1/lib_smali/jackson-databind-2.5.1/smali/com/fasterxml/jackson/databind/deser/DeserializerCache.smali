.class public final Lcom/fasterxml/jackson/databind/deser/DeserializerCache;
.super Ljava/lang/Object;
.source "DeserializerCache.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final _cachedDeserializers:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field protected final _incompleteDeserializers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x40

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_cachedDeserializers:Ljava/util/concurrent/ConcurrentHashMap;

    .line 51
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    .line 60
    return-void
.end method

.method private _verifyAsClass(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 8
    .param p1, "src"    # Ljava/lang/Object;
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .local p3, "noneClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 549
    if-nez p1, :cond_5

    move-object v0, v1

    .line 559
    :cond_4
    :goto_4
    return-object v0

    .line 552
    :cond_5
    instance-of v2, p1, Ljava/lang/Class;

    if-nez v2, :cond_3a

    .line 553
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AnnotationIntrospector."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() returned value of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": expected type JsonSerializer or Class<JsonSerializer> instead"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3a
    move-object v0, p1

    .line 555
    check-cast v0, Ljava/lang/Class;

    .line 556
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq v0, p3, :cond_45

    invoke-static {v0}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isBogusClass(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_45
    move-object v0, v1

    .line 557
    goto :goto_4
.end method

.method private modifyTypeByAnnotation(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 21
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 475
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v8

    .line 476
    .local v8, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v8, v0, v1}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findDeserializationType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;

    move-result-object v13

    .line 477
    .local v13, "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v13, :cond_14

    .line 479
    :try_start_e
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/fasterxml/jackson/databind/JavaType;->narrowBy(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    :try_end_13
    .catch Ljava/lang/IllegalArgumentException; {:try_start_e .. :try_end_13} :catch_4d

    move-result-object p3

    .line 486
    :cond_14
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v14

    if-eqz v14, :cond_fd

    .line 487
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/JavaType;->getKeyType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v8, v0, v14}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findDeserializationKeyType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;

    move-result-object v11

    .line 488
    .local v11, "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v11, :cond_a0

    .line 490
    move-object/from16 v0, p3

    instance-of v14, v0, Lcom/fasterxml/jackson/databind/type/MapLikeType;

    if-nez v14, :cond_97

    .line 491
    new-instance v14, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Illegal key-type annotation: type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " is not a Map(-like) type"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 480
    .end local v11    # "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_4d
    move-exception v7

    .line 481
    .local v7, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v14, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Failed to narrow type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " with concrete-type annotation (value "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "), method \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/introspect/Annotated;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "\': "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v7}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V

    throw v14

    .line 494
    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v11    # "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_97
    :try_start_97
    move-object/from16 v0, p3

    check-cast v0, Lcom/fasterxml/jackson/databind/type/MapLikeType;

    move-object v14, v0

    invoke-virtual {v14, v11}, Lcom/fasterxml/jackson/databind/type/MapLikeType;->narrowKey(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    :try_end_9f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_97 .. :try_end_9f} :catch_fe

    move-result-object p3

    .line 499
    :cond_a0
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/JavaType;->getKeyType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v12

    .line 504
    .local v12, "keyType":Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v12, :cond_ca

    invoke-virtual {v12}, Lcom/fasterxml/jackson/databind/JavaType;->getValueHandler()Ljava/lang/Object;

    move-result-object v14

    if-nez v14, :cond_ca

    .line 505
    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findKeyDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v10

    .line 506
    .local v10, "kdDef":Ljava/lang/Object;
    if-eqz v10, :cond_ca

    .line 507
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v10}, Lcom/fasterxml/jackson/databind/DeserializationContext;->keyDeserializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/KeyDeserializer;

    move-result-object v9

    .line 508
    .local v9, "kd":Lcom/fasterxml/jackson/databind/KeyDeserializer;
    if-eqz v9, :cond_ca

    .line 509
    check-cast p3, Lcom/fasterxml/jackson/databind/type/MapLikeType;

    .end local p3    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    move-object/from16 v0, p3

    invoke-virtual {v0, v9}, Lcom/fasterxml/jackson/databind/type/MapLikeType;->withKeyValueHandler(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/type/MapLikeType;

    move-result-object p3

    .line 510
    .restart local p3    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/JavaType;->getKeyType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v12

    .line 516
    .end local v9    # "kd":Lcom/fasterxml/jackson/databind/KeyDeserializer;
    .end local v10    # "kdDef":Ljava/lang/Object;
    :cond_ca
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v8, v0, v14}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findDeserializationContentType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;

    move-result-object v2

    .line 517
    .local v2, "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v2, :cond_dc

    .line 519
    :try_start_d6
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/databind/JavaType;->narrowContentsBy(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    :try_end_db
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d6 .. :try_end_db} :catch_13a

    move-result-object p3

    .line 525
    :cond_dc
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 526
    .local v6, "contentType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/JavaType;->getValueHandler()Ljava/lang/Object;

    move-result-object v14

    if-nez v14, :cond_fd

    .line 527
    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findContentDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v5

    .line 528
    .local v5, "cdDef":Ljava/lang/Object;
    if-eqz v5, :cond_fd

    .line 529
    const/4 v3, 0x0

    .line 530
    .local v3, "cd":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    instance-of v14, v5, Lcom/fasterxml/jackson/databind/JsonDeserializer;

    if-eqz v14, :cond_176

    .line 531
    check-cast v5, Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 538
    .end local v5    # "cdDef":Ljava/lang/Object;
    :cond_f5
    :goto_f5
    if-eqz v3, :cond_fd

    .line 539
    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/JavaType;->withContentValueHandler(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p3

    .line 544
    .end local v2    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "cd":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    .end local v6    # "contentType":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v11    # "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "keyType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_fd
    return-object p3

    .line 495
    .restart local v11    # "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_fe
    move-exception v7

    .line 496
    .restart local v7    # "iae":Ljava/lang/IllegalArgumentException;
    new-instance v14, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Failed to narrow key type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " with key-type annotation ("

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "): "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v7}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V

    throw v14

    .line 520
    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v12    # "keyType":Lcom/fasterxml/jackson/databind/JavaType;
    :catch_13a
    move-exception v7

    .line 521
    .restart local v7    # "iae":Ljava/lang/IllegalArgumentException;
    new-instance v14, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Failed to narrow content type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " with content-type annotation ("

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "): "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v7}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V

    throw v14

    .line 533
    .end local v7    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v3    # "cd":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    .restart local v5    # "cdDef":Ljava/lang/Object;
    .restart local v6    # "contentType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_176
    const-string v14, "findContentDeserializer"

    const-class v15, Lcom/fasterxml/jackson/databind/JsonDeserializer$None;

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v14, v15}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_verifyAsClass(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v4

    .line 534
    .local v4, "cdClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v4, :cond_f5

    .line 535
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v4}, Lcom/fasterxml/jackson/databind/DeserializationContext;->deserializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v3

    goto/16 :goto_f5
.end method


# virtual methods
.method protected _createAndCache2(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 11
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 262
    :try_start_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_createDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_4} :catch_9

    move-result-object v1

    .line 269
    .local v1, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-nez v1, :cond_14

    move-object v1, v4

    .line 299
    .end local v1    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :cond_8
    :goto_8
    return-object v1

    .line 263
    :catch_9
    move-exception v2

    .line 267
    .local v2, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v5, Lcom/fasterxml/jackson/databind/JsonMappingException;

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v4, v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V

    throw v5

    .line 276
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :cond_14
    instance-of v3, v1, Lcom/fasterxml/jackson/databind/deser/ResolvableDeserializer;

    .line 277
    .local v3, "isResolvable":Z
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->isCachable()Z

    move-result v0

    .line 291
    .local v0, "addToCache":Z
    if-eqz v3, :cond_2c

    .line 292
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v4, p3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v1

    .line 293
    check-cast v4, Lcom/fasterxml/jackson/databind/deser/ResolvableDeserializer;

    invoke-interface {v4, p1}, Lcom/fasterxml/jackson/databind/deser/ResolvableDeserializer;->resolve(Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    .line 294
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v4, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    :cond_2c
    if-eqz v0, :cond_8

    .line 297
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_cachedDeserializers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8
.end method

.method protected _createAndCacheValueDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 9
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 226
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    monitor-enter v3

    .line 228
    :try_start_3
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_findCachedDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v1

    .line 229
    .local v1, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-eqz v1, :cond_c

    .line 230
    monitor-exit v3

    move-object v2, v1

    .line 246
    :goto_b
    return-object v2

    .line 232
    :cond_c
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v0

    .line 234
    .local v0, "count":I
    if-lez v0, :cond_21

    .line 235
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    check-cast v1, Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 236
    .restart local v1    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-eqz v1, :cond_21

    .line 237
    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_36

    move-object v2, v1

    goto :goto_b

    .line 242
    :cond_21
    :try_start_21
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_createAndCache2(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_39

    move-result-object v2

    .line 245
    if-nez v0, :cond_34

    :try_start_27
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    if-lez v4, :cond_34

    .line 246
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    :cond_34
    monitor-exit v3

    goto :goto_b

    .line 249
    .end local v0    # "count":I
    .end local v1    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :catchall_36
    move-exception v2

    monitor-exit v3
    :try_end_38
    .catchall {:try_start_27 .. :try_end_38} :catchall_36

    throw v2

    .line 245
    .restart local v0    # "count":I
    .restart local v1    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :catchall_39
    move-exception v2

    if-nez v0, :cond_49

    :try_start_3c
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    if-lez v4, :cond_49

    .line 246
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    :cond_49
    throw v2
    :try_end_4a
    .catchall {:try_start_3c .. :try_end_4a} :catchall_36
.end method

.method protected _createDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 13
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 318
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getConfig()Lcom/fasterxml/jackson/databind/DeserializationConfig;

    move-result-object v2

    .line 321
    .local v2, "config":Lcom/fasterxml/jackson/databind/DeserializationConfig;
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isAbstract()Z

    move-result v8

    if-nez v8, :cond_16

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isMapLikeType()Z

    move-result v8

    if-nez v8, :cond_16

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isCollectionLikeType()Z

    move-result v8

    if-eqz v8, :cond_1a

    .line 322
    :cond_16
    invoke-virtual {p2, v2, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->mapAbstractType(Lcom/fasterxml/jackson/databind/DeserializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p3

    .line 326
    :cond_1a
    :try_start_1a
    invoke-virtual {v2, p3}, Lcom/fasterxml/jackson/databind/DeserializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;
    :try_end_1d
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1a .. :try_end_1d} :catch_29

    move-result-object v0

    .line 331
    .local v0, "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v8

    invoke-virtual {p0, p1, v8}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->findDeserializerFromAnnotation(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v5

    .line 333
    .local v5, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-eqz v5, :cond_30

    .line 362
    .end local v0    # "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    .end local v5    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :goto_28
    return-object v5

    .line 327
    :catch_29
    move-exception v6

    .line 328
    .local v6, "error":Ljava/lang/NoClassDefFoundError;
    new-instance v5, Lcom/fasterxml/jackson/databind/deser/impl/NoClassDefFoundDeserializer;

    invoke-direct {v5, v6}, Lcom/fasterxml/jackson/databind/deser/impl/NoClassDefFoundDeserializer;-><init>(Ljava/lang/NoClassDefFoundError;)V

    goto :goto_28

    .line 338
    .end local v6    # "error":Ljava/lang/NoClassDefFoundError;
    .restart local v0    # "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    .restart local v5    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :cond_30
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v8

    invoke-direct {p0, p1, v8, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->modifyTypeByAnnotation(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v7

    .line 339
    .local v7, "newType":Lcom/fasterxml/jackson/databind/JavaType;
    if-eq v7, p3, :cond_3f

    .line 340
    move-object p3, v7

    .line 341
    invoke-virtual {v2, v7}, Lcom/fasterxml/jackson/databind/DeserializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v0

    .line 345
    :cond_3f
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->findPOJOBuilder()Ljava/lang/Class;

    move-result-object v1

    .line 346
    .local v1, "builder":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_4a

    .line 347
    invoke-virtual {p2, p1, p3, v0, v1}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createBuilderBasedDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v5

    goto :goto_28

    .line 352
    :cond_4a
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->findDeserializationConverter()Lcom/fasterxml/jackson/databind/util/Converter;

    move-result-object v3

    .line 353
    .local v3, "conv":Lcom/fasterxml/jackson/databind/util/Converter;, "Lcom/fasterxml/jackson/databind/util/Converter<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v3, :cond_55

    .line 354
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_createDeserializer2(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v5

    goto :goto_28

    .line 357
    :cond_55
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v8

    invoke-interface {v3, v8}, Lcom/fasterxml/jackson/databind/util/Converter;->getInputType(Lcom/fasterxml/jackson/databind/type/TypeFactory;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 359
    .local v4, "delegateType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/fasterxml/jackson/databind/JavaType;->hasRawClass(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_6b

    .line 360
    invoke-virtual {v2, v4}, Lcom/fasterxml/jackson/databind/DeserializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v0

    .line 362
    :cond_6b
    new-instance v5, Lcom/fasterxml/jackson/databind/deser/std/StdDelegatingDeserializer;

    .end local v5    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, p2, v4, v0}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_createDeserializer2(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v8

    invoke-direct {v5, v3, v4, v8}, Lcom/fasterxml/jackson/databind/deser/std/StdDelegatingDeserializer;-><init>(Lcom/fasterxml/jackson/databind/util/Converter;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonDeserializer;)V

    goto :goto_28
.end method

.method protected _createDeserializer2(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 11
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p4, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 370
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getConfig()Lcom/fasterxml/jackson/databind/DeserializationConfig;

    move-result-object v1

    .line 372
    .local v1, "config":Lcom/fasterxml/jackson/databind/DeserializationConfig;
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isEnumType()Z

    move-result v4

    if-eqz v4, :cond_f

    .line 373
    invoke-virtual {p2, p1, p3, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createEnumDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    .line 405
    .end local p3    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_e
    return-object v4

    .line 375
    .restart local p3    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v4

    if-eqz v4, :cond_67

    .line 376
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isArrayType()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 377
    check-cast p3, Lcom/fasterxml/jackson/databind/type/ArrayType;

    .end local p3    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p2, p1, p3, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createArrayDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/type/ArrayType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e

    .line 379
    .restart local p3    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isMapLikeType()Z

    move-result v4

    if-eqz v4, :cond_3d

    move-object v3, p3

    .line 380
    check-cast v3, Lcom/fasterxml/jackson/databind/type/MapLikeType;

    .line 381
    .local v3, "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/type/MapLikeType;->isTrueMapType()Z

    move-result v4

    if-eqz v4, :cond_38

    .line 382
    check-cast v3, Lcom/fasterxml/jackson/databind/type/MapType;

    .end local v3    # "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    invoke-virtual {p2, p1, v3, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createMapDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/type/MapType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e

    .line 384
    .restart local v3    # "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    :cond_38
    invoke-virtual {p2, p1, v3, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createMapLikeDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/type/MapLikeType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e

    .line 386
    .end local v3    # "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    :cond_3d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isCollectionLikeType()Z

    move-result v4

    if-eqz v4, :cond_67

    .line 392
    const/4 v4, 0x0

    invoke-virtual {p4, v4}, Lcom/fasterxml/jackson/databind/BeanDescription;->findExpectedFormat(Lcom/fasterxml/jackson/annotation/JsonFormat$Value;)Lcom/fasterxml/jackson/annotation/JsonFormat$Value;

    move-result-object v2

    .line 393
    .local v2, "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    if-eqz v2, :cond_52

    invoke-virtual {v2}, Lcom/fasterxml/jackson/annotation/JsonFormat$Value;->getShape()Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    move-result-object v4

    sget-object v5, Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;->OBJECT:Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    if-eq v4, v5, :cond_67

    :cond_52
    move-object v0, p3

    .line 394
    check-cast v0, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;

    .line 395
    .local v0, "clt":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;->isTrueCollectionType()Z

    move-result v4

    if-eqz v4, :cond_62

    .line 396
    check-cast v0, Lcom/fasterxml/jackson/databind/type/CollectionType;

    .end local v0    # "clt":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    invoke-virtual {p2, p1, v0, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createCollectionDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/type/CollectionType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e

    .line 398
    .restart local v0    # "clt":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    :cond_62
    invoke-virtual {p2, p1, v0, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createCollectionLikeDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/type/CollectionLikeType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e

    .line 402
    .end local v0    # "clt":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    .end local v2    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    :cond_67
    const-class v4, Lcom/fasterxml/jackson/databind/JsonNode;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_78

    .line 403
    invoke-virtual {p2, v1, p3, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createTreeDeserializer(Lcom/fasterxml/jackson/databind/DeserializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e

    .line 405
    :cond_78
    invoke-virtual {p2, p1, p3, p4}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createBeanDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v4

    goto :goto_e
.end method

.method protected _findCachedDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 4
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 205
    if-nez p1, :cond_a

    .line 206
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null JavaType passed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :cond_a
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_cachedDeserializers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/JsonDeserializer;

    return-object v0
.end method

.method protected _handleUnknownKeyDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/KeyDeserializer;
    .registers 5
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 584
    new-instance v0, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not find a (Map) Key deserializer for type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected _handleUnknownValueDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 6
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 574
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v0

    .line 575
    .local v0, "rawClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isConcrete(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_23

    .line 576
    new-instance v1, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can not find a Value deserializer for abstract type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 578
    :cond_23
    new-instance v1, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can not find a Value deserializer for type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public cachedDeserializersCount()I
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_cachedDeserializers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method

.method protected findConverter(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/util/Converter;
    .registers 5
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Lcom/fasterxml/jackson/databind/util/Converter",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 448
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findDeserializationConverter(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v0

    .line 449
    .local v0, "convDef":Ljava/lang/Object;
    if-nez v0, :cond_c

    .line 450
    const/4 v1, 0x0

    .line 452
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {p1, p2, v0}, Lcom/fasterxml/jackson/databind/DeserializationContext;->converterInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/util/Converter;

    move-result-object v1

    goto :goto_b
.end method

.method protected findConvertingDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JsonDeserializer;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 7
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 436
    .local p3, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->findConverter(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/util/Converter;

    move-result-object v0

    .line 437
    .local v0, "conv":Lcom/fasterxml/jackson/databind/util/Converter;, "Lcom/fasterxml/jackson/databind/util/Converter<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v0, :cond_7

    .line 441
    .end local p3    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :goto_6
    return-object p3

    .line 440
    .restart local p3    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :cond_7
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/fasterxml/jackson/databind/util/Converter;->getInputType(Lcom/fasterxml/jackson/databind/type/TypeFactory;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    .line 441
    .local v1, "delegateType":Lcom/fasterxml/jackson/databind/JavaType;
    new-instance v2, Lcom/fasterxml/jackson/databind/deser/std/StdDelegatingDeserializer;

    invoke-direct {v2, v0, v1, p3}, Lcom/fasterxml/jackson/databind/deser/std/StdDelegatingDeserializer;-><init>(Lcom/fasterxml/jackson/databind/util/Converter;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonDeserializer;)V

    move-object p3, v2

    goto :goto_6
.end method

.method protected findDeserializerFromAnnotation(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 6
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 417
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v1

    .line 418
    .local v1, "deserDef":Ljava/lang/Object;
    if-nez v1, :cond_c

    .line 419
    const/4 v2, 0x0

    .line 423
    :goto_b
    return-object v2

    .line 421
    :cond_c
    invoke-virtual {p1, p2, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->deserializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 423
    .local v0, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->findConvertingDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JsonDeserializer;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v2

    goto :goto_b
.end method

.method public findKeyDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/KeyDeserializer;
    .registers 6
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-virtual {p2, p1, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;->createKeyDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/KeyDeserializer;

    move-result-object v0

    .line 168
    .local v0, "kd":Lcom/fasterxml/jackson/databind/KeyDeserializer;
    if-nez v0, :cond_b

    .line 169
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_handleUnknownKeyDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/KeyDeserializer;

    move-result-object v0

    .line 175
    .end local v0    # "kd":Lcom/fasterxml/jackson/databind/KeyDeserializer;
    :cond_a
    :goto_a
    return-object v0

    .line 172
    .restart local v0    # "kd":Lcom/fasterxml/jackson/databind/KeyDeserializer;
    :cond_b
    instance-of v1, v0, Lcom/fasterxml/jackson/databind/deser/ResolvableDeserializer;

    if-eqz v1, :cond_a

    move-object v1, v0

    .line 173
    check-cast v1, Lcom/fasterxml/jackson/databind/deser/ResolvableDeserializer;

    invoke-interface {v1, p1}, Lcom/fasterxml/jackson/databind/deser/ResolvableDeserializer;->resolve(Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_a
.end method

.method public findValueDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 5
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "propertyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_findCachedDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 141
    .local v0, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_10

    .line 143
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_createAndCacheValueDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 144
    if-nez v0, :cond_10

    .line 149
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_handleUnknownValueDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 152
    :cond_10
    return-object v0
.end method

.method public flushCachedDeserializers()V
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_cachedDeserializers:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 106
    return-void
.end method

.method public hasValueDeserializerFor(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Z
    .registers 6
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "factory"    # Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;
    .param p3, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_findCachedDeserializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 191
    .local v0, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_a

    .line 192
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_createAndCacheValueDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/DeserializerFactory;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 194
    :cond_a
    if-eqz v0, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/DeserializerCache;->_incompleteDeserializers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 72
    return-object p0
.end method

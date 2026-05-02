.class public Lorg/msgpack/template/TemplateRegistry;
.super Ljava/lang/Object;
.source "TemplateRegistry.java"


# instance fields
.field cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/reflect/Type;",
            ">;>;"
        }
    .end annotation
.end field

.field private chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

.field private genericCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lorg/msgpack/template/GenericTemplate;",
            ">;"
        }
    .end annotation
.end field

.field private parent:Lorg/msgpack/template/TemplateRegistry;


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    .line 77
    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    .line 78
    invoke-virtual {p0}, Lorg/msgpack/template/TemplateRegistry;->createTemplateBuilderChain()Lorg/msgpack/template/builder/TemplateBuilderChain;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->genericCache:Ljava/util/Map;

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    .line 81
    invoke-direct {p0}, Lorg/msgpack/template/TemplateRegistry;->registerTemplates()V

    .line 82
    iget-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    .line 83
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    .line 90
    if-eqz p1, :cond_22

    .line 91
    iput-object p1, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    .line 95
    :goto_a
    invoke-virtual {p0}, Lorg/msgpack/template/TemplateRegistry;->createTemplateBuilderChain()Lorg/msgpack/template/builder/TemplateBuilderChain;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

    .line 96
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->genericCache:Ljava/util/Map;

    .line 98
    invoke-virtual {p0}, Lorg/msgpack/template/TemplateRegistry;->registerTemplatesWhichRefersRegistry()V

    .line 99
    return-void

    .line 93
    :cond_22
    new-instance v0, Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v0}, Lorg/msgpack/template/TemplateRegistry;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    goto :goto_a
.end method

.method private declared-synchronized buildAndRegister(Lorg/msgpack/template/builder/TemplateBuilder;Ljava/lang/Class;ZLorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;
    .registers 12
    .param p1, "builder"    # Lorg/msgpack/template/builder/TemplateBuilder;
    .param p2, "targetClass"    # Ljava/lang/Class;
    .param p3, "hasAnnotation"    # Z
    .param p4, "flist"    # Lorg/msgpack/template/FieldList;

    .prologue
    .line 551
    monitor-enter p0

    const/4 v2, 0x0

    .line 552
    .local v2, "newTmpl":Lorg/msgpack/template/Template;
    const/4 v4, 0x0

    .line 554
    .local v4, "oldTmpl":Lorg/msgpack/template/Template;
    :try_start_3
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 555
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lorg/msgpack/template/Template;

    move-object v4, v0

    .line 557
    :cond_15
    new-instance v3, Lorg/msgpack/template/TemplateReference;

    invoke-direct {v3, p0, p2}, Lorg/msgpack/template/TemplateReference;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/reflect/Type;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_1a} :catch_3b
    .catchall {:try_start_3 .. :try_end_1a} :catchall_4b

    .line 558
    .end local v2    # "newTmpl":Lorg/msgpack/template/Template;
    .local v3, "newTmpl":Lorg/msgpack/template/Template;
    :try_start_1a
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v5, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    if-nez p1, :cond_27

    .line 560
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

    invoke-virtual {v5, p2, p3}, Lorg/msgpack/template/builder/TemplateBuilderChain;->select(Ljava/lang/reflect/Type;Z)Lorg/msgpack/template/builder/TemplateBuilder;

    move-result-object p1

    .line 562
    :cond_27
    if-eqz p4, :cond_36

    invoke-interface {p1, p2, p4}, Lorg/msgpack/template/builder/TemplateBuilder;->buildTemplate(Ljava/lang/Class;Lorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_2c} :catch_66
    .catchall {:try_start_1a .. :try_end_2c} :catchall_63

    move-result-object v2

    .line 578
    .end local v3    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v2    # "newTmpl":Lorg/msgpack/template/Template;
    :goto_2d
    if-eqz v2, :cond_34

    .line 579
    :try_start_2f
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v5, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_34
    .catchall {:try_start_2f .. :try_end_34} :catchall_54

    :cond_34
    monitor-exit p0

    return-object v2

    .line 562
    .end local v2    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v3    # "newTmpl":Lorg/msgpack/template/Template;
    :cond_36
    :try_start_36
    invoke-interface {p1, p2}, Lorg/msgpack/template/builder/TemplateBuilder;->buildTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_39} :catch_66
    .catchall {:try_start_36 .. :try_end_39} :catchall_63

    move-result-object v2

    goto :goto_2d

    .line 565
    .end local v3    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v2    # "newTmpl":Lorg/msgpack/template/Template;
    :catch_3b
    move-exception v1

    .line 566
    .local v1, "e":Ljava/lang/Exception;
    :goto_3c
    if-eqz v4, :cond_57

    .line 567
    :try_start_3e
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v5, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    :goto_43
    const/4 v2, 0x0

    .line 572
    instance-of v5, v1, Lorg/msgpack/MessageTypeException;

    if-eqz v5, :cond_5d

    .line 573
    check-cast v1, Lorg/msgpack/MessageTypeException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1
    :try_end_4b
    .catchall {:try_start_3e .. :try_end_4b} :catchall_4b

    .line 578
    :catchall_4b
    move-exception v5

    :goto_4c
    if-eqz v2, :cond_53

    .line 579
    :try_start_4e
    iget-object v6, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v6, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_53
    throw v5
    :try_end_54
    .catchall {:try_start_4e .. :try_end_54} :catchall_54

    .line 551
    :catchall_54
    move-exception v5

    monitor-exit p0

    throw v5

    .line 569
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_57
    :try_start_57
    iget-object v5, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v5, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_43

    .line 575
    :cond_5d
    new-instance v5, Lorg/msgpack/MessageTypeException;

    invoke-direct {v5, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_63
    .catchall {:try_start_57 .. :try_end_63} :catchall_4b

    .line 578
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v3    # "newTmpl":Lorg/msgpack/template/Template;
    :catchall_63
    move-exception v5

    move-object v2, v3

    .end local v3    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v2    # "newTmpl":Lorg/msgpack/template/Template;
    goto :goto_4c

    .line 565
    .end local v2    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v3    # "newTmpl":Lorg/msgpack/template/Template;
    :catch_66
    move-exception v1

    move-object v2, v3

    .end local v3    # "newTmpl":Lorg/msgpack/template/Template;
    .restart local v2    # "newTmpl":Lorg/msgpack/template/Template;
    goto :goto_3c
.end method

.method private static isPrimitiveType(Ljava/lang/String;)Z
    .registers 2
    .param p0, "genericCompTypeName"    # Ljava/lang/String;

    .prologue
    .line 585
    const-string v0, "byte"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "short"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "int"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "long"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "float"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "double"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "boolean"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_40

    const-string v0, "char"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    :cond_40
    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method

.method private lookupAfterBuilding(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v4, 0x1

    .line 463
    iget-object v3, p0, Lorg/msgpack/template/TemplateRegistry;->chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

    invoke-virtual {v3, p1, v4}, Lorg/msgpack/template/builder/TemplateBuilderChain;->select(Ljava/lang/reflect/Type;Z)Lorg/msgpack/template/builder/TemplateBuilder;

    move-result-object v0

    .line 464
    .local v0, "builder":Lorg/msgpack/template/builder/TemplateBuilder;
    const/4 v1, 0x0

    .line 465
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    if-eqz v0, :cond_20

    .line 467
    iget-object v3, p0, Lorg/msgpack/template/TemplateRegistry;->chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

    invoke-virtual {v3}, Lorg/msgpack/template/builder/TemplateBuilderChain;->getForceBuilder()Lorg/msgpack/template/builder/TemplateBuilder;

    move-result-object v3

    invoke-interface {v3, p1}, Lorg/msgpack/template/builder/TemplateBuilder;->loadTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 468
    if-eqz v1, :cond_1b

    .line 469
    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v2, v1

    .line 474
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local v2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :goto_1a
    return-object v2

    .line 472
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :cond_1b
    const/4 v3, 0x0

    invoke-direct {p0, v0, p1, v4, v3}, Lorg/msgpack/template/TemplateRegistry;->buildAndRegister(Lorg/msgpack/template/builder/TemplateBuilder;Ljava/lang/Class;ZLorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;

    move-result-object v1

    :cond_20
    move-object v2, v1

    .line 474
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_1a
.end method

.method private lookupCache(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 5
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 450
    iget-object v2, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/Template;

    .line 451
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    if-eqz v0, :cond_c

    move-object v1, v0

    .line 459
    .end local v0    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    :goto_b
    return-object v1

    .line 456
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    .restart local v0    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    :cond_c
    :try_start_c
    iget-object v2, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v2, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupCache(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    :try_end_11
    .catch Ljava/lang/NullPointerException; {:try_start_c .. :try_end_11} :catch_14

    move-result-object v0

    :goto_12
    move-object v1, v0

    .line 459
    .end local v0    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    goto :goto_b

    .line 457
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    .restart local v0    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    :catch_14
    move-exception v2

    goto :goto_12
.end method

.method private lookupGenericArrayType(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 6
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 369
    instance-of v3, p1, Ljava/lang/reflect/GenericArrayType;

    if-nez v3, :cond_7

    move-object v1, v2

    .line 387
    :cond_6
    :goto_6
    return-object v1

    :cond_7
    move-object v0, p1

    .line 373
    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    .line 374
    .local v0, "genericArrayType":Ljava/lang/reflect/GenericArrayType;
    invoke-direct {p0, v0}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericArrayTypeImpl(Ljava/lang/reflect/GenericArrayType;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 375
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    if-nez v1, :cond_6

    .line 380
    :try_start_10
    iget-object v3, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v3, v0}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericArrayTypeImpl(Ljava/lang/reflect/GenericArrayType;)Lorg/msgpack/template/Template;
    :try_end_15
    .catch Ljava/lang/NullPointerException; {:try_start_10 .. :try_end_15} :catch_1a

    move-result-object v1

    .line 381
    if-nez v1, :cond_6

    :goto_18
    move-object v1, v2

    .line 387
    goto :goto_6

    .line 384
    :catch_1a
    move-exception v3

    goto :goto_18
.end method

.method private lookupGenericArrayTypeImpl(Ljava/lang/reflect/GenericArrayType;)Lorg/msgpack/template/Template;
    .registers 15
    .param p1, "genericArrayType"    # Ljava/lang/reflect/GenericArrayType;

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 391
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 392
    .local v2, "genericArrayTypeName":Ljava/lang/String;
    const-string v9, "\\["

    invoke-virtual {v2, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    array-length v9, v9

    add-int/lit8 v1, v9, -0x1

    .line 393
    .local v1, "dim":I
    if-gtz v1, :cond_30

    .line 394
    new-instance v9, Lorg/msgpack/MessageTypeException;

    const-string v10, "fatal error: type="

    new-array v11, v11, [Ljava/lang/Object;

    aput-object v2, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 396
    :cond_30
    if-le v1, v11, :cond_42

    .line 397
    new-instance v9, Ljava/lang/UnsupportedOperationException;

    const-string v10, "Not implemented template generation of %s"

    new-array v11, v11, [Ljava/lang/Object;

    aput-object v2, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 401
    :cond_42
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 402
    .local v3, "genericCompTypeName":Ljava/lang/String;
    invoke-static {v3}, Lorg/msgpack/template/TemplateRegistry;->isPrimitiveType(Ljava/lang/String;)Z

    move-result v5

    .line 403
    .local v5, "isPrimitiveType":Z
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    .line 404
    .local v8, "sbuf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_63
    if-ge v4, v1, :cond_6d

    .line 405
    const/16 v9, 0x5b

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 404
    add-int/lit8 v4, v4, 0x1

    goto :goto_63

    .line 407
    :cond_6d
    if-nez v5, :cond_9b

    .line 408
    const/16 v9, 0x4c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 409
    invoke-static {v3}, Lorg/msgpack/template/TemplateRegistry;->toJvmReferenceTypeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 410
    const/16 v9, 0x3b

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 415
    :goto_80
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 416
    .local v7, "jvmArrayClassName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 417
    .local v6, "jvmArrayClass":Ljava/lang/Class;
    const/4 v0, 0x0

    .line 419
    .local v0, "cl":Ljava/lang/ClassLoader;
    :try_start_86
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 420
    if-eqz v0, :cond_a4

    .line 421
    invoke-virtual {v0, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 422
    if-eqz v6, :cond_a4

    .line 423
    invoke-direct {p0, v6}, Lorg/msgpack/template/TemplateRegistry;->lookupAfterBuilding(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    :try_end_99
    .catch Ljava/lang/ClassNotFoundException; {:try_start_86 .. :try_end_99} :catch_a3

    move-result-object v9

    .line 441
    :goto_9a
    return-object v9

    .line 412
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v6    # "jvmArrayClass":Ljava/lang/Class;
    .end local v7    # "jvmArrayClassName":Ljava/lang/String;
    :cond_9b
    invoke-static {v3}, Lorg/msgpack/template/TemplateRegistry;->toJvmPrimitiveTypeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_80

    .line 426
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v6    # "jvmArrayClass":Ljava/lang/Class;
    .restart local v7    # "jvmArrayClassName":Ljava/lang/String;
    :catch_a3
    move-exception v9

    .line 429
    :cond_a4
    :try_start_a4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 430
    if-eqz v0, :cond_ba

    .line 431
    invoke-virtual {v0, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 432
    if-eqz v6, :cond_ba

    .line 433
    invoke-direct {p0, v6}, Lorg/msgpack/template/TemplateRegistry;->lookupAfterBuilding(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    :try_end_b7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a4 .. :try_end_b7} :catch_b9

    move-result-object v9

    goto :goto_9a

    .line 436
    :catch_b9
    move-exception v9

    .line 439
    :cond_ba
    :try_start_ba
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 440
    if-eqz v6, :cond_c6

    .line 441
    invoke-direct {p0, v6}, Lorg/msgpack/template/TemplateRegistry;->lookupAfterBuilding(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    :try_end_c3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_ba .. :try_end_c3} :catch_c5

    move-result-object v9

    goto :goto_9a

    .line 443
    :catch_c5
    move-exception v9

    .line 445
    :cond_c6
    new-instance v9, Lorg/msgpack/MessageTypeException;

    const-string v10, "cannot find template of %s"

    new-array v11, v11, [Ljava/lang/Object;

    aput-object v7, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method private lookupGenericInterfaceTypes(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;
    .registers 11
    .param p1, "targetType"    # Ljava/lang/reflect/ParameterizedType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/ParameterizedType;",
            ")",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 327
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v5

    .line 328
    .local v5, "rawType":Ljava/lang/reflect/Type;
    const/4 v6, 0x0

    .line 331
    .local v6, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :try_start_5
    check-cast v5, Ljava/lang/Class;

    .end local v5    # "rawType":Ljava/lang/reflect/Type;
    invoke-virtual {v5}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v3

    .line 332
    .local v3, "infTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_e
    if-ge v1, v4, :cond_1e

    aget-object v2, v0, v1

    .line 333
    .local v2, "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, v2}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericTypeImpl0(Ljava/lang/reflect/ParameterizedType;Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    :try_end_15
    .catch Ljava/lang/ClassCastException; {:try_start_5 .. :try_end_15} :catch_1d

    move-result-object v6

    .line 334
    if-eqz v6, :cond_1a

    move-object v7, v6

    .line 341
    .end local v0    # "arr$":[Ljava/lang/Class;
    .end local v1    # "i$":I
    .end local v2    # "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "infTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v4    # "len$":I
    .end local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local v7, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :goto_19
    return-object v7

    .line 332
    .end local v7    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v0    # "arr$":[Ljava/lang/Class;
    .restart local v1    # "i$":I
    .restart local v2    # "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "infTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v4    # "len$":I
    .restart local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 338
    .end local v0    # "arr$":[Ljava/lang/Class;
    .end local v1    # "i$":I
    .end local v2    # "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "infTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v4    # "len$":I
    :catch_1d
    move-exception v8

    :cond_1e
    move-object v7, v6

    .line 341
    .end local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v7    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_19
.end method

.method private lookupGenericSuperclasses(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;
    .registers 6
    .param p1, "targetType"    # Ljava/lang/reflect/ParameterizedType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/ParameterizedType;",
            ")",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 345
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 346
    .local v0, "rawType":Ljava/lang/reflect/Type;
    const/4 v2, 0x0

    .line 349
    .local v2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :try_start_5
    check-cast v0, Ljava/lang/Class;

    .end local v0    # "rawType":Ljava/lang/reflect/Type;
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 350
    .local v1, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v1, :cond_13

    .line 351
    const/4 v3, 0x0

    .line 364
    .end local v1    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_e
    return-object v3

    .line 354
    .restart local v1    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_f
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    :cond_13
    const-class v3, Ljava/lang/Object;

    if-eq v1, v3, :cond_23

    .line 355
    invoke-direct {p0, p1, v1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericTypeImpl0(Ljava/lang/reflect/ParameterizedType;Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v2

    .line 356
    if-eqz v2, :cond_f

    .line 357
    invoke-virtual {p0, p1, v2}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V
    :try_end_20
    .catch Ljava/lang/ClassCastException; {:try_start_5 .. :try_end_20} :catch_22

    move-object v3, v2

    .line 358
    goto :goto_e

    .line 361
    .end local v1    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_22
    move-exception v3

    :cond_23
    move-object v3, v2

    .line 364
    goto :goto_e
.end method

.method private lookupGenericType(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;
    .registers 4
    .param p1, "paramedType"    # Ljava/lang/reflect/ParameterizedType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/ParameterizedType;",
            ")",
            "Lorg/msgpack/template/Template",
            "<",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 280
    invoke-direct {p0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericTypeImpl(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 281
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    if-eqz v0, :cond_8

    move-object v1, v0

    .line 303
    :goto_7
    return-object v1

    .line 286
    :cond_8
    :try_start_8
    iget-object v1, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v1, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericTypeImpl(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;
    :try_end_d
    .catch Ljava/lang/NullPointerException; {:try_start_8 .. :try_end_d} :catch_12

    move-result-object v0

    .line 287
    if-eqz v0, :cond_13

    move-object v1, v0

    .line 288
    goto :goto_7

    .line 290
    :catch_12
    move-exception v1

    .line 293
    :cond_13
    invoke-direct {p0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericInterfaceTypes(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 294
    if-eqz v0, :cond_1b

    move-object v1, v0

    .line 295
    goto :goto_7

    .line 298
    :cond_1b
    invoke-direct {p0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericSuperclasses(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 299
    if-eqz v0, :cond_23

    move-object v1, v0

    .line 300
    goto :goto_7

    .line 303
    :cond_23
    const/4 v1, 0x0

    goto :goto_7
.end method

.method private lookupGenericTypeImpl(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;
    .registers 4
    .param p1, "targetType"    # Ljava/lang/reflect/ParameterizedType;

    .prologue
    .line 307
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 308
    .local v0, "rawType":Ljava/lang/reflect/Type;
    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericTypeImpl0(Ljava/lang/reflect/ParameterizedType;Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    return-object v1
.end method

.method private lookupGenericTypeImpl0(Ljava/lang/reflect/ParameterizedType;Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/ParameterizedType;
    .param p2, "rawType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 312
    iget-object v4, p0, Lorg/msgpack/template/TemplateRegistry;->genericCache:Ljava/util/Map;

    invoke-interface {v4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/GenericTemplate;

    .line 313
    .local v0, "gtmpl":Lorg/msgpack/template/GenericTemplate;
    if-nez v0, :cond_c

    .line 314
    const/4 v4, 0x0

    .line 323
    :goto_b
    return-object v4

    .line 317
    :cond_c
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 318
    .local v3, "types":[Ljava/lang/reflect/Type;
    array-length v4, v3

    new-array v2, v4, [Lorg/msgpack/template/Template;

    .line 319
    .local v2, "tmpls":[Lorg/msgpack/template/Template;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v4, v3

    if-ge v1, v4, :cond_22

    .line 320
    aget-object v4, v3, v1

    invoke-virtual {p0, v4}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v4

    aput-object v4, v2, v1

    .line 319
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 323
    :cond_22
    invoke-interface {v0, v2}, Lorg/msgpack/template/GenericTemplate;->build([Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;

    move-result-object v4

    goto :goto_b
.end method

.method private lookupInterfaceTypes(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 478
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v3

    .line 479
    .local v3, "infTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 480
    .local v5, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v4, :cond_2c

    aget-object v2, v0, v1

    .line 481
    .local v2, "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v7, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    check-cast v5, Lorg/msgpack/template/Template;

    .line 482
    .restart local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    if-eqz v5, :cond_1b

    .line 483
    invoke-virtual {p0, p1, v5}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v6, v5

    .line 496
    .end local v2    # "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local v6, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :goto_1a
    return-object v6

    .line 487
    .end local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v2    # "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :cond_1b
    :try_start_1b
    iget-object v7, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v7, v2}, Lorg/msgpack/template/TemplateRegistry;->lookupCache(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v5

    .line 488
    if-eqz v5, :cond_29

    .line 489
    invoke-virtual {p0, p1, v5}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V
    :try_end_26
    .catch Ljava/lang/NullPointerException; {:try_start_1b .. :try_end_26} :catch_28

    move-object v6, v5

    .line 490
    .end local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_1a

    .line 492
    .end local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :catch_28
    move-exception v7

    .line 480
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .end local v2    # "infType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2c
    move-object v6, v5

    .line 496
    .end local v5    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v6    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_1a
.end method

.method private lookupSuperclassInterfaceTypes(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 525
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 526
    .local v0, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 527
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    if-eqz v0, :cond_29

    .line 528
    :goto_7
    const-class v3, Ljava/lang/Object;

    if-eq v0, v3, :cond_29

    .line 529
    invoke-direct {p0, v0}, Lorg/msgpack/template/TemplateRegistry;->lookupInterfaceTypes(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 530
    if-eqz v1, :cond_16

    .line 531
    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v2, v1

    .line 545
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local v2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :goto_15
    return-object v2

    .line 535
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :cond_16
    :try_start_16
    iget-object v3, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v3, v0}, Lorg/msgpack/template/TemplateRegistry;->lookupCache(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 536
    if-eqz v1, :cond_24

    .line 537
    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V
    :try_end_21
    .catch Ljava/lang/NullPointerException; {:try_start_16 .. :try_end_21} :catch_23

    move-object v2, v1

    .line 538
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_15

    .line 540
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :catch_23
    move-exception v3

    .line 528
    :cond_24
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_7

    :cond_29
    move-object v2, v1

    .line 545
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_15
.end method

.method private lookupSuperclasses(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 500
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 501
    .local v0, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 502
    .local v1, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    if-eqz v0, :cond_2d

    .line 503
    :goto_7
    const-class v3, Ljava/lang/Object;

    if-eq v0, v3, :cond_2d

    .line 505
    iget-object v3, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    check-cast v1, Lorg/msgpack/template/Template;

    .line 506
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    if-eqz v1, :cond_1a

    .line 507
    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v2, v1

    .line 521
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .local v2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :goto_19
    return-object v2

    .line 511
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :cond_1a
    :try_start_1a
    iget-object v3, p0, Lorg/msgpack/template/TemplateRegistry;->parent:Lorg/msgpack/template/TemplateRegistry;

    invoke-direct {v3, v0}, Lorg/msgpack/template/TemplateRegistry;->lookupCache(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v1

    .line 512
    if-eqz v1, :cond_28

    .line 513
    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V
    :try_end_25
    .catch Ljava/lang/NullPointerException; {:try_start_1a .. :try_end_25} :catch_27

    move-object v2, v1

    .line 514
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_19

    .line 516
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    :catch_27
    move-exception v3

    .line 503
    :cond_28
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_7

    :cond_2d
    move-object v2, v1

    .line 521
    .end local v1    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    .restart local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<TT;>;"
    goto :goto_19
.end method

.method private registerTemplates()V
    .registers 3

    .prologue
    .line 110
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/BooleanTemplate;->getInstance()Lorg/msgpack/template/BooleanTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 111
    const-class v0, Ljava/lang/Boolean;

    invoke-static {}, Lorg/msgpack/template/BooleanTemplate;->getInstance()Lorg/msgpack/template/BooleanTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 112
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/ByteTemplate;->getInstance()Lorg/msgpack/template/ByteTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 113
    const-class v0, Ljava/lang/Byte;

    invoke-static {}, Lorg/msgpack/template/ByteTemplate;->getInstance()Lorg/msgpack/template/ByteTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 114
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/ShortTemplate;->getInstance()Lorg/msgpack/template/ShortTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 115
    const-class v0, Ljava/lang/Short;

    invoke-static {}, Lorg/msgpack/template/ShortTemplate;->getInstance()Lorg/msgpack/template/ShortTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 116
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/IntegerTemplate;->getInstance()Lorg/msgpack/template/IntegerTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 117
    const-class v0, Ljava/lang/Integer;

    invoke-static {}, Lorg/msgpack/template/IntegerTemplate;->getInstance()Lorg/msgpack/template/IntegerTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 118
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/LongTemplate;->getInstance()Lorg/msgpack/template/LongTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 119
    const-class v0, Ljava/lang/Long;

    invoke-static {}, Lorg/msgpack/template/LongTemplate;->getInstance()Lorg/msgpack/template/LongTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 120
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/FloatTemplate;->getInstance()Lorg/msgpack/template/FloatTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 121
    const-class v0, Ljava/lang/Float;

    invoke-static {}, Lorg/msgpack/template/FloatTemplate;->getInstance()Lorg/msgpack/template/FloatTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 122
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/DoubleTemplate;->getInstance()Lorg/msgpack/template/DoubleTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 123
    const-class v0, Ljava/lang/Double;

    invoke-static {}, Lorg/msgpack/template/DoubleTemplate;->getInstance()Lorg/msgpack/template/DoubleTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 124
    const-class v0, Ljava/math/BigInteger;

    invoke-static {}, Lorg/msgpack/template/BigIntegerTemplate;->getInstance()Lorg/msgpack/template/BigIntegerTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 125
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {}, Lorg/msgpack/template/CharacterTemplate;->getInstance()Lorg/msgpack/template/CharacterTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 126
    const-class v0, Ljava/lang/Character;

    invoke-static {}, Lorg/msgpack/template/CharacterTemplate;->getInstance()Lorg/msgpack/template/CharacterTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 127
    const-class v0, [Z

    invoke-static {}, Lorg/msgpack/template/BooleanArrayTemplate;->getInstance()Lorg/msgpack/template/BooleanArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 128
    const-class v0, [S

    invoke-static {}, Lorg/msgpack/template/ShortArrayTemplate;->getInstance()Lorg/msgpack/template/ShortArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 129
    const-class v0, [I

    invoke-static {}, Lorg/msgpack/template/IntegerArrayTemplate;->getInstance()Lorg/msgpack/template/IntegerArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 130
    const-class v0, [J

    invoke-static {}, Lorg/msgpack/template/LongArrayTemplate;->getInstance()Lorg/msgpack/template/LongArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 131
    const-class v0, [F

    invoke-static {}, Lorg/msgpack/template/FloatArrayTemplate;->getInstance()Lorg/msgpack/template/FloatArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 132
    const-class v0, [D

    invoke-static {}, Lorg/msgpack/template/DoubleArrayTemplate;->getInstance()Lorg/msgpack/template/DoubleArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 133
    const-class v0, Ljava/lang/String;

    invoke-static {}, Lorg/msgpack/template/StringTemplate;->getInstance()Lorg/msgpack/template/StringTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 134
    const-class v0, [B

    invoke-static {}, Lorg/msgpack/template/ByteArrayTemplate;->getInstance()Lorg/msgpack/template/ByteArrayTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 135
    const-class v0, Ljava/nio/ByteBuffer;

    invoke-static {}, Lorg/msgpack/template/ByteBufferTemplate;->getInstance()Lorg/msgpack/template/ByteBufferTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 136
    const-class v0, Lorg/msgpack/type/Value;

    invoke-static {}, Lorg/msgpack/template/ValueTemplate;->getInstance()Lorg/msgpack/template/ValueTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 137
    const-class v0, Ljava/math/BigDecimal;

    invoke-static {}, Lorg/msgpack/template/BigDecimalTemplate;->getInstance()Lorg/msgpack/template/BigDecimalTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 138
    const-class v0, Ljava/util/Date;

    invoke-static {}, Lorg/msgpack/template/DateTemplate;->getInstance()Lorg/msgpack/template/DateTemplate;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 140
    invoke-virtual {p0}, Lorg/msgpack/template/TemplateRegistry;->registerTemplatesWhichRefersRegistry()V

    .line 142
    return-void
.end method

.method private static toJvmPrimitiveTypeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "typeName"    # Ljava/lang/String;

    .prologue
    .line 602
    const-string v0, "byte"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 603
    const-string v0, "B"

    .line 617
    :goto_a
    return-object v0

    .line 604
    :cond_b
    const-string v0, "short"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 605
    const-string v0, "S"

    goto :goto_a

    .line 606
    :cond_16
    const-string v0, "int"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 607
    const-string v0, "I"

    goto :goto_a

    .line 608
    :cond_21
    const-string v0, "long"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 609
    const-string v0, "J"

    goto :goto_a

    .line 610
    :cond_2c
    const-string v0, "float"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 611
    const-string v0, "F"

    goto :goto_a

    .line 612
    :cond_37
    const-string v0, "double"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 613
    const-string v0, "D"

    goto :goto_a

    .line 614
    :cond_42
    const-string v0, "boolean"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 615
    const-string v0, "Z"

    goto :goto_a

    .line 616
    :cond_4d
    const-string v0, "char"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 617
    const-string v0, "C"

    goto :goto_a

    .line 619
    :cond_58
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "fatal error: type=%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static toJvmReferenceTypeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "typeName"    # Ljava/lang/String;

    .prologue
    .line 598
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected createTemplateBuilderChain()Lorg/msgpack/template/builder/TemplateBuilderChain;
    .registers 2

    .prologue
    .line 102
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuilderChain;

    invoke-direct {v0, p0}, Lorg/msgpack/template/builder/TemplateBuilderChain;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    return-object v0
.end method

.method public declared-synchronized lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 10
    .param p1, "targetType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 202
    monitor-enter p0

    :try_start_1
    instance-of v5, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_16

    .line 204
    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    move-object v1, v0

    .line 205
    .local v1, "paramedType":Ljava/lang/reflect/ParameterizedType;
    invoke-direct {p0, v1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericType(Ljava/lang/reflect/ParameterizedType;)Lorg/msgpack/template/Template;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_a3

    move-result-object v3

    .line 206
    .local v3, "tmpl":Lorg/msgpack/template/Template;
    if-eqz v3, :cond_12

    move-object v4, v3

    .line 271
    .end local v1    # "paramedType":Ljava/lang/reflect/ParameterizedType;
    .end local v3    # "tmpl":Lorg/msgpack/template/Template;
    .local v4, "tmpl":Ljava/lang/Object;
    :goto_10
    monitor-exit p0

    return-object v4

    .line 209
    .end local v4    # "tmpl":Ljava/lang/Object;
    .restart local v1    # "paramedType":Ljava/lang/reflect/ParameterizedType;
    .restart local v3    # "tmpl":Lorg/msgpack/template/Template;
    :cond_12
    :try_start_12
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object p1

    .line 212
    .end local v1    # "paramedType":Ljava/lang/reflect/ParameterizedType;
    .end local v3    # "tmpl":Lorg/msgpack/template/Template;
    :cond_16
    invoke-direct {p0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupGenericArrayType(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v3

    .line 213
    .restart local v3    # "tmpl":Lorg/msgpack/template/Template;
    if-eqz v3, :cond_1e

    move-object v4, v3

    .line 214
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 217
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_1e
    invoke-direct {p0, p1}, Lorg/msgpack/template/TemplateRegistry;->lookupCache(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v3

    .line 218
    if-eqz v3, :cond_26

    move-object v4, v3

    .line 219
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 222
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_26
    instance-of v5, p1, Ljava/lang/reflect/WildcardType;

    if-nez v5, :cond_2e

    instance-of v5, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v5, :cond_38

    .line 225
    :cond_2e
    new-instance v3, Lorg/msgpack/template/AnyTemplate;

    .end local v3    # "tmpl":Lorg/msgpack/template/Template;
    invoke-direct {v3, p0}, Lorg/msgpack/template/AnyTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 226
    .restart local v3    # "tmpl":Lorg/msgpack/template/Template;
    invoke-virtual {p0, p1, v3}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v4, v3

    .line 227
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 230
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_38
    move-object v0, p1

    check-cast v0, Ljava/lang/Class;

    move-object v2, v0

    .line 233
    .local v2, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v5, Lorg/msgpack/MessagePackable;

    invoke-virtual {v5, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 237
    new-instance v3, Lorg/msgpack/template/MessagePackableTemplate;

    .end local v3    # "tmpl":Lorg/msgpack/template/Template;
    invoke-direct {v3, v2}, Lorg/msgpack/template/MessagePackableTemplate;-><init>(Ljava/lang/Class;)V

    .line 238
    .restart local v3    # "tmpl":Lorg/msgpack/template/Template;
    invoke-virtual {p0, v2, v3}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v4, v3

    .line 239
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 242
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_4e
    invoke-virtual {v2}, Ljava/lang/Class;->isInterface()Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 245
    new-instance v3, Lorg/msgpack/template/AnyTemplate;

    .end local v3    # "tmpl":Lorg/msgpack/template/Template;
    invoke-direct {v3, p0}, Lorg/msgpack/template/AnyTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 246
    .restart local v3    # "tmpl":Lorg/msgpack/template/Template;
    invoke-virtual {p0, p1, v3}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    move-object v4, v3

    .line 247
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 251
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_5e
    invoke-direct {p0, v2}, Lorg/msgpack/template/TemplateRegistry;->lookupAfterBuilding(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v3

    .line 252
    if-eqz v3, :cond_66

    move-object v4, v3

    .line 253
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 257
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_66
    invoke-direct {p0, v2}, Lorg/msgpack/template/TemplateRegistry;->lookupInterfaceTypes(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v3

    .line 258
    if-eqz v3, :cond_6e

    move-object v4, v3

    .line 259
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 263
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_6e
    invoke-direct {p0, v2}, Lorg/msgpack/template/TemplateRegistry;->lookupSuperclasses(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v3

    .line 264
    if-eqz v3, :cond_76

    move-object v4, v3

    .line 265
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 269
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_76
    invoke-direct {p0, v2}, Lorg/msgpack/template/TemplateRegistry;->lookupSuperclassInterfaceTypes(Ljava/lang/Class;)Lorg/msgpack/template/Template;

    move-result-object v3

    .line 270
    if-eqz v3, :cond_7e

    move-object v4, v3

    .line 271
    .restart local v4    # "tmpl":Ljava/lang/Object;
    goto :goto_10

    .line 274
    .end local v4    # "tmpl":Ljava/lang/Object;
    :cond_7e
    new-instance v5, Lorg/msgpack/MessageTypeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cannot find template for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " class.  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "Try to add @Message annotation to the class or call MessagePack.register(Type)."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_a3
    .catchall {:try_start_12 .. :try_end_a3} :catchall_a3

    .line 202
    .end local v2    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "tmpl":Lorg/msgpack/template/Template;
    :catchall_a3
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public register(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 158
    const/4 v0, 0x0

    invoke-direct {p0, v1, p1, v0, v1}, Lorg/msgpack/template/TemplateRegistry;->buildAndRegister(Lorg/msgpack/template/builder/TemplateBuilder;Ljava/lang/Class;ZLorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;

    .line 159
    return-void
.end method

.method public register(Ljava/lang/Class;Lorg/msgpack/template/FieldList;)V
    .registers 5
    .param p2, "flist"    # Lorg/msgpack/template/FieldList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/msgpack/template/FieldList;",
            ")V"
        }
    .end annotation

    .prologue
    .line 162
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p2, :cond_a

    .line 163
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "FieldList object is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_a
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lorg/msgpack/template/TemplateRegistry;->buildAndRegister(Lorg/msgpack/template/builder/TemplateBuilder;Ljava/lang/Class;ZLorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;

    .line 167
    return-void
.end method

.method public declared-synchronized register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V
    .registers 5
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "tmpl"    # Lorg/msgpack/template/Template;

    .prologue
    .line 170
    monitor-enter p0

    if-nez p2, :cond_e

    .line 171
    :try_start_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Template object is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 170
    .end local p1    # "targetType":Ljava/lang/reflect/Type;
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 174
    .restart local p1    # "targetType":Ljava/lang/reflect/Type;
    :cond_e
    :try_start_e
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_1f

    .line 175
    iget-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "targetType":Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_e .. :try_end_1d} :catchall_b

    .line 179
    :goto_1d
    monitor-exit p0

    return-void

    .line 177
    .restart local p1    # "targetType":Ljava/lang/reflect/Type;
    :cond_1f
    :try_start_1f
    iget-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catchall {:try_start_1f .. :try_end_24} :catchall_b

    goto :goto_1d
.end method

.method public declared-synchronized registerGeneric(Ljava/lang/reflect/Type;Lorg/msgpack/template/GenericTemplate;)V
    .registers 5
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "tmpl"    # Lorg/msgpack/template/GenericTemplate;

    .prologue
    .line 182
    monitor-enter p0

    :try_start_1
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_12

    .line 183
    iget-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->genericCache:Ljava/util/Map;

    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "targetType":Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_18

    .line 188
    :goto_10
    monitor-exit p0

    return-void

    .line 186
    .restart local p1    # "targetType":Ljava/lang/reflect/Type;
    :cond_12
    :try_start_12
    iget-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->genericCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_18

    goto :goto_10

    .line 182
    .end local p1    # "targetType":Ljava/lang/reflect/Type;
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected registerTemplatesWhichRefersRegistry()V
    .registers 5

    .prologue
    .line 145
    new-instance v0, Lorg/msgpack/template/AnyTemplate;

    invoke-direct {v0, p0}, Lorg/msgpack/template/AnyTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 147
    .local v0, "anyTemplate":Lorg/msgpack/template/AnyTemplate;
    const-class v1, Ljava/util/List;

    new-instance v2, Lorg/msgpack/template/ListTemplate;

    invoke-direct {v2, v0}, Lorg/msgpack/template/ListTemplate;-><init>(Lorg/msgpack/template/Template;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 148
    const-class v1, Ljava/util/Set;

    new-instance v2, Lorg/msgpack/template/SetTemplate;

    invoke-direct {v2, v0}, Lorg/msgpack/template/SetTemplate;-><init>(Lorg/msgpack/template/Template;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 149
    const-class v1, Ljava/util/Collection;

    new-instance v2, Lorg/msgpack/template/CollectionTemplate;

    invoke-direct {v2, v0}, Lorg/msgpack/template/CollectionTemplate;-><init>(Lorg/msgpack/template/Template;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 150
    const-class v1, Ljava/util/Map;

    new-instance v2, Lorg/msgpack/template/MapTemplate;

    invoke-direct {v2, v0, v0}, Lorg/msgpack/template/MapTemplate;-><init>(Lorg/msgpack/template/Template;Lorg/msgpack/template/Template;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->register(Ljava/lang/reflect/Type;Lorg/msgpack/template/Template;)V

    .line 151
    const-class v1, Ljava/util/List;

    new-instance v2, Lorg/msgpack/template/GenericCollectionTemplate;

    const-class v3, Lorg/msgpack/template/ListTemplate;

    invoke-direct {v2, p0, v3}, Lorg/msgpack/template/GenericCollectionTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->registerGeneric(Ljava/lang/reflect/Type;Lorg/msgpack/template/GenericTemplate;)V

    .line 152
    const-class v1, Ljava/util/Set;

    new-instance v2, Lorg/msgpack/template/GenericCollectionTemplate;

    const-class v3, Lorg/msgpack/template/SetTemplate;

    invoke-direct {v2, p0, v3}, Lorg/msgpack/template/GenericCollectionTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->registerGeneric(Ljava/lang/reflect/Type;Lorg/msgpack/template/GenericTemplate;)V

    .line 153
    const-class v1, Ljava/util/Collection;

    new-instance v2, Lorg/msgpack/template/GenericCollectionTemplate;

    const-class v3, Lorg/msgpack/template/CollectionTemplate;

    invoke-direct {v2, p0, v3}, Lorg/msgpack/template/GenericCollectionTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->registerGeneric(Ljava/lang/reflect/Type;Lorg/msgpack/template/GenericTemplate;)V

    .line 154
    const-class v1, Ljava/util/Map;

    new-instance v2, Lorg/msgpack/template/GenericMapTemplate;

    const-class v3, Lorg/msgpack/template/MapTemplate;

    invoke-direct {v2, p0, v3}, Lorg/msgpack/template/GenericMapTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V

    invoke-virtual {p0, v1, v2}, Lorg/msgpack/template/TemplateRegistry;->registerGeneric(Ljava/lang/reflect/Type;Lorg/msgpack/template/GenericTemplate;)V

    .line 155
    return-void
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 106
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuilderChain;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/template/builder/TemplateBuilderChain;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    iput-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->chain:Lorg/msgpack/template/builder/TemplateBuilderChain;

    .line 107
    return-void
.end method

.method public declared-synchronized unregister()V
    .registers 2

    .prologue
    .line 196
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 197
    monitor-exit p0

    return-void

    .line 196
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregister(Ljava/lang/reflect/Type;)Z
    .registers 4
    .param p1, "targetType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 191
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lorg/msgpack/template/TemplateRegistry;->cache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/Template;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_10

    .line 192
    .local v0, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    if-eqz v0, :cond_e

    const/4 v1, 0x1

    :goto_c
    monitor-exit p0

    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_c

    .line 191
    .end local v0    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<Ljava/lang/reflect/Type;>;"
    :catchall_10
    move-exception v1

    monitor-exit p0

    throw v1
.end method

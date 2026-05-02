.class public Lorg/apache/commons/validator/Field;
.super Ljava/lang/Object;
.source "Field.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final DEFAULT_ARG:Ljava/lang/String; = "org.apache.commons.validator.Field.DEFAULT"

.field protected static final TOKEN_END:Ljava/lang/String; = "}"

.field public static final TOKEN_INDEXED:Ljava/lang/String; = "[]"

.field protected static final TOKEN_START:Ljava/lang/String; = "${"

.field protected static final TOKEN_VAR:Ljava/lang/String; = "var:"

.field private static final serialVersionUID:J = -0x75ff790dffb23b39L


# instance fields
.field protected args:[Ljava/util/Map;

.field protected clientValidation:Z

.field private dependencyList:Ljava/util/List;

.field protected depends:Ljava/lang/String;

.field protected fieldOrder:I

.field protected hMsgs:Lorg/apache/commons/collections/FastHashMap;

.field protected hVars:Lorg/apache/commons/collections/FastHashMap;

.field protected indexedListProperty:Ljava/lang/String;

.field protected indexedProperty:Ljava/lang/String;

.field protected key:Ljava/lang/String;

.field protected page:I

.field protected property:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object v0, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    .line 87
    iput-object v0, p0, Lorg/apache/commons/validator/Field;->indexedProperty:Ljava/lang/String;

    .line 92
    iput-object v0, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    .line 97
    iput-object v0, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    .line 102
    iput-object v0, p0, Lorg/apache/commons/validator/Field;->depends:Ljava/lang/String;

    .line 107
    iput v1, p0, Lorg/apache/commons/validator/Field;->page:I

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/validator/Field;->clientValidation:Z

    .line 119
    iput v1, p0, Lorg/apache/commons/validator/Field;->fieldOrder:I

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/Field;->dependencyList:Ljava/util/List;

    .line 132
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    .line 137
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    .line 145
    new-array v0, v1, [Ljava/util/Map;

    iput-object v0, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    return-void
.end method

.method private determineArgPosition(Lorg/apache/commons/validator/Arg;)V
    .registers 9
    .param p1, "arg"    # Lorg/apache/commons/validator/Arg;

    .prologue
    .line 355
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getPosition()I

    move-result v4

    .line 358
    .local v4, "position":I
    if-ltz v4, :cond_7

    .line 389
    :goto_6
    return-void

    .line 363
    :cond_7
    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    if-eqz v5, :cond_10

    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v5, v5

    if-nez v5, :cond_15

    .line 364
    :cond_10
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lorg/apache/commons/validator/Arg;->setPosition(I)V

    goto :goto_6

    .line 370
    :cond_15
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getName()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4c

    const-string v1, "org.apache.commons.validator.Field.DEFAULT"

    .line 371
    .local v1, "key":Ljava/lang/String;
    :goto_1d
    const/4 v3, -0x1

    .line 372
    .local v3, "lastPosition":I
    const/4 v2, -0x1

    .line 373
    .local v2, "lastDefault":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v5, v5

    if-ge v0, v5, :cond_51

    .line 374
    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v5, v5, v0

    if-eqz v5, :cond_36

    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v5, v5, v0

    invoke-interface {v5, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_36

    .line 375
    move v3, v0

    .line 377
    :cond_36
    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v5, v5, v0

    if-eqz v5, :cond_49

    iget-object v5, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v5, v5, v0

    const-string v6, "org.apache.commons.validator.Field.DEFAULT"

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    .line 378
    move v2, v0

    .line 373
    :cond_49
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 370
    .end local v0    # "i":I
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "lastDefault":I
    .end local v3    # "lastPosition":I
    :cond_4c
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_1d

    .line 382
    .restart local v0    # "i":I
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "lastDefault":I
    .restart local v3    # "lastPosition":I
    :cond_51
    if-gez v3, :cond_54

    .line 383
    move v3, v2

    .line 387
    :cond_54
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1, v3}, Lorg/apache/commons/validator/Arg;->setPosition(I)V

    goto :goto_6
.end method

.method private ensureArgsCapacity(Lorg/apache/commons/validator/Arg;)V
    .registers 6
    .param p1, "arg"    # Lorg/apache/commons/validator/Arg;

    .prologue
    const/4 v3, 0x0

    .line 398
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getPosition()I

    move-result v1

    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v2, v2

    if-lt v1, v2, :cond_1c

    .line 399
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getPosition()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Ljava/util/Map;

    .line 400
    .local v0, "newArgs":[Ljava/util/Map;
    iget-object v1, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 401
    iput-object v0, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    .line 403
    .end local v0    # "newArgs":[Ljava/util/Map;
    :cond_1c
    return-void
.end method

.method private getIndexedPropertySize(Ljava/lang/Object;)I
    .registers 7
    .param p1, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 783
    const/4 v1, 0x0

    .line 786
    .local v1, "indexedProperty":Ljava/lang/Object;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getIndexedListProperty()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_8} :catch_d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_8} :catch_18
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_8} :catch_23

    move-result-object v1

    .line 797
    if-nez v1, :cond_2e

    .line 798
    const/4 v2, 0x0

    .line 802
    .end local v1    # "indexedProperty":Ljava/lang/Object;
    :goto_c
    return v2

    .line 789
    .restart local v1    # "indexedProperty":Ljava/lang/Object;
    :catch_d
    move-exception v0

    .line 790
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 791
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_18
    move-exception v0

    .line 792
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 793
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_23
    move-exception v0

    .line 794
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 799
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_2e
    instance-of v2, v1, Ljava/util/Collection;

    if-eqz v2, :cond_39

    .line 800
    check-cast v1, Ljava/util/Collection;

    .end local v1    # "indexedProperty":Ljava/lang/Object;
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v2

    goto :goto_c

    .line 801
    .restart local v1    # "indexedProperty":Ljava/lang/Object;
    :cond_39
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_49

    .line 802
    check-cast v1, [Ljava/lang/Object;

    .end local v1    # "indexedProperty":Ljava/lang/Object;
    check-cast v1, [Ljava/lang/Object;

    array-length v2, v1

    goto :goto_c

    .line 804
    .restart local v1    # "indexedProperty":Ljava/lang/Object;
    :cond_49
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not indexed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private handleMissingAction(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 932
    new-instance v0, Lorg/apache/commons/validator/ValidatorException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "No ValidatorAction named "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " found for field "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getProperty()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private processArg(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "replaceValue"    # Ljava/lang/String;

    .prologue
    .line 640
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v4, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v4, v4

    if-ge v2, v4, :cond_31

    .line 642
    iget-object v4, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v1, v4, v2

    .line 643
    .local v1, "argMap":Ljava/util/Map;
    if-nez v1, :cond_f

    .line 640
    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 647
    :cond_f
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 648
    .local v3, "iter":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 649
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Arg;

    .line 651
    .local v0, "arg":Lorg/apache/commons/validator/Arg;
    if-eqz v0, :cond_17

    .line 652
    invoke-virtual {v0}, Lorg/apache/commons/validator/Arg;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1, p2}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/apache/commons/validator/Arg;->setKey(Ljava/lang/String;)V

    goto :goto_17

    .line 657
    .end local v0    # "arg":Lorg/apache/commons/validator/Arg;
    .end local v1    # "argMap":Ljava/util/Map;
    .end local v3    # "iter":Ljava/util/Iterator;
    :cond_31
    return-void
.end method

.method private processMessageComponents(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "replaceValue"    # Ljava/lang/String;

    .prologue
    .line 623
    const-string v2, "${var:"

    .line 625
    .local v2, "varKey":Ljava/lang/String;
    if-eqz p1, :cond_2c

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 626
    iget-object v3, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3}, Lorg/apache/commons/collections/FastHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 627
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/Msg;

    .line 628
    .local v1, "msg":Lorg/apache/commons/validator/Msg;
    invoke-virtual {v1}, Lorg/apache/commons/validator/Msg;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/commons/validator/Msg;->setKey(Ljava/lang/String;)V

    goto :goto_14

    .line 632
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "msg":Lorg/apache/commons/validator/Msg;
    :cond_2c
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/validator/Field;->processArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 633
    return-void
.end method

.method private processVars(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "replaceValue"    # Ljava/lang/String;

    .prologue
    .line 609
    iget-object v3, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3}, Lorg/apache/commons/collections/FastHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 610
    .local v0, "i":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 611
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 612
    .local v2, "varKey":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/Field;->getVar(Ljava/lang/String;)Lorg/apache/commons/validator/Var;

    move-result-object v1

    .line 614
    .local v1, "var":Lorg/apache/commons/validator/Var;
    invoke-virtual {v1}, Lorg/apache/commons/validator/Var;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/commons/validator/Var;->setValue(Ljava/lang/String;)V

    goto :goto_a

    .line 617
    .end local v1    # "var":Lorg/apache/commons/validator/Var;
    .end local v2    # "varKey":Ljava/lang/String;
    :cond_26
    return-void
.end method

.method private runDependentValidators(Lorg/apache/commons/validator/ValidatorAction;Lorg/apache/commons/validator/ValidatorResults;Ljava/util/Map;Ljava/util/Map;I)Z
    .registers 16
    .param p1, "va"    # Lorg/apache/commons/validator/ValidatorAction;
    .param p2, "results"    # Lorg/apache/commons/validator/ValidatorResults;
    .param p3, "actions"    # Ljava/util/Map;
    .param p4, "params"    # Ljava/util/Map;
    .param p5, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 852
    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->getDependencyList()Ljava/util/List;

    move-result-object v7

    .line 854
    .local v7, "dependentValidators":Ljava/util/List;
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    move v0, v9

    .line 872
    :goto_c
    return v0

    .line 858
    :cond_d
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 859
    .local v8, "iter":Ljava/util/Iterator;
    :cond_11
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 860
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 862
    .local v6, "depend":Ljava/lang/String;
    invoke-interface {p3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/ValidatorAction;

    .line 863
    .local v1, "action":Lorg/apache/commons/validator/ValidatorAction;
    if-nez v1, :cond_28

    .line 864
    invoke-direct {p0, v6}, Lorg/apache/commons/validator/Field;->handleMissingAction(Ljava/lang/String;)V

    :cond_28
    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    .line 867
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/validator/Field;->validateForRule(Lorg/apache/commons/validator/ValidatorAction;Lorg/apache/commons/validator/ValidatorResults;Ljava/util/Map;Ljava/util/Map;I)Z

    move-result v0

    if-nez v0, :cond_11

    .line 868
    const/4 v0, 0x0

    goto :goto_c

    .end local v1    # "action":Lorg/apache/commons/validator/ValidatorAction;
    .end local v6    # "depend":Ljava/lang/String;
    :cond_35
    move v0, v9

    .line 872
    goto :goto_c
.end method

.method private validateForRule(Lorg/apache/commons/validator/ValidatorAction;Lorg/apache/commons/validator/ValidatorResults;Ljava/util/Map;Ljava/util/Map;I)Z
    .registers 8
    .param p1, "va"    # Lorg/apache/commons/validator/ValidatorAction;
    .param p2, "results"    # Lorg/apache/commons/validator/ValidatorResults;
    .param p3, "actions"    # Ljava/util/Map;
    .param p4, "params"    # Ljava/util/Map;
    .param p5, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 822
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/apache/commons/validator/ValidatorResults;->getValidatorResult(Ljava/lang/String;)Lorg/apache/commons/validator/ValidatorResult;

    move-result-object v0

    .line 823
    .local v0, "result":Lorg/apache/commons/validator/ValidatorResult;
    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/validator/ValidatorResult;->containsAction(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 824
    invoke-virtual {p1}, Lorg/apache/commons/validator/ValidatorAction;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/validator/ValidatorResult;->isValid(Ljava/lang/String;)Z

    move-result v1

    .line 831
    :goto_1c
    return v1

    .line 827
    :cond_1d
    invoke-direct/range {p0 .. p5}, Lorg/apache/commons/validator/Field;->runDependentValidators(Lorg/apache/commons/validator/ValidatorAction;Lorg/apache/commons/validator/ValidatorResults;Ljava/util/Map;Ljava/util/Map;I)Z

    move-result v1

    if-nez v1, :cond_25

    .line 828
    const/4 v1, 0x0

    goto :goto_1c

    .line 831
    :cond_25
    invoke-virtual {p1, p0, p4, p2, p5}, Lorg/apache/commons/validator/ValidatorAction;->executeValidationMethod(Lorg/apache/commons/validator/Field;Ljava/util/Map;Lorg/apache/commons/validator/ValidatorResults;I)Z

    move-result v1

    goto :goto_1c
.end method


# virtual methods
.method public addArg(Lorg/apache/commons/validator/Arg;)V
    .registers 5
    .param p1, "arg"    # Lorg/apache/commons/validator/Arg;

    .prologue
    .line 329
    if-eqz p1, :cond_12

    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getKey()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_12

    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_13

    .line 348
    :cond_12
    :goto_12
    return-void

    .line 333
    :cond_13
    invoke-direct {p0, p1}, Lorg/apache/commons/validator/Field;->determineArgPosition(Lorg/apache/commons/validator/Arg;)V

    .line 334
    invoke-direct {p0, p1}, Lorg/apache/commons/validator/Field;->ensureArgsCapacity(Lorg/apache/commons/validator/Arg;)V

    .line 336
    iget-object v1, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getPosition()I

    move-result v2

    aget-object v0, v1, v2

    .line 337
    .local v0, "argMap":Ljava/util/Map;
    if-nez v0, :cond_30

    .line 338
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "argMap":Ljava/util/Map;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 339
    .restart local v0    # "argMap":Ljava/util/Map;
    iget-object v1, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getPosition()I

    move-result v2

    aput-object v0, v1, v2

    .line 342
    :cond_30
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getName()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3c

    .line 343
    const-string v1, "org.apache.commons.validator.Field.DEFAULT"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 345
    :cond_3c
    invoke-virtual {p1}, Lorg/apache/commons/validator/Arg;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12
.end method

.method public addMsg(Lorg/apache/commons/validator/Msg;)V
    .registers 4
    .param p1, "msg"    # Lorg/apache/commons/validator/Msg;

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Msg;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    return-void
.end method

.method public addVar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "jsType"    # Ljava/lang/String;

    .prologue
    .line 474
    new-instance v0, Lorg/apache/commons/validator/Var;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/commons/validator/Var;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/validator/Field;->addVar(Lorg/apache/commons/validator/Var;)V

    .line 475
    return-void
.end method

.method public addVar(Lorg/apache/commons/validator/Var;)V
    .registers 4
    .param p1, "v"    # Lorg/apache/commons/validator/Var;

    .prologue
    .line 463
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Var;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 11

    .prologue
    .line 682
    const/4 v4, 0x0

    .line 684
    .local v4, "field":Lorg/apache/commons/validator/Field;
    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "field":Lorg/apache/commons/validator/Field;
    check-cast v4, Lorg/apache/commons/validator/Field;
    :try_end_7
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_7} :catch_1d

    .line 689
    .restart local v4    # "field":Lorg/apache/commons/validator/Field;
    iget-object v8, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v8, v8

    new-array v8, v8, [Ljava/util/Map;

    iput-object v8, v4, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    .line 690
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_f
    iget-object v8, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v8, v8

    if-ge v5, v8, :cond_5e

    .line 691
    iget-object v8, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v8, v8, v5

    if-nez v8, :cond_28

    .line 690
    :goto_1a
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 685
    .end local v4    # "field":Lorg/apache/commons/validator/Field;
    .end local v5    # "i":I
    :catch_1d
    move-exception v2

    .line 686
    .local v2, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-virtual {v2}, Ljava/lang/CloneNotSupportedException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 695
    .end local v2    # "e":Ljava/lang/CloneNotSupportedException;
    .restart local v4    # "field":Lorg/apache/commons/validator/Field;
    .restart local v5    # "i":I
    :cond_28
    new-instance v1, Ljava/util/HashMap;

    iget-object v8, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v8, v8, v5

    invoke-direct {v1, v8}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 696
    .local v1, "argMap":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 697
    .local v6, "iter":Ljava/util/Iterator;
    :goto_39
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_59

    .line 698
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 699
    .local v3, "entry":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 700
    .local v7, "validatorName":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Arg;

    .line 701
    .local v0, "arg":Lorg/apache/commons/validator/Arg;
    invoke-virtual {v0}, Lorg/apache/commons/validator/Arg;->clone()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v1, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_39

    .line 703
    .end local v0    # "arg":Lorg/apache/commons/validator/Arg;
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v7    # "validatorName":Ljava/lang/String;
    :cond_59
    iget-object v8, v4, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aput-object v1, v8, v5

    goto :goto_1a

    .line 706
    .end local v1    # "argMap":Ljava/util/Map;
    .end local v6    # "iter":Ljava/util/Iterator;
    :cond_5e
    iget-object v8, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-static {v8}, Lorg/apache/commons/validator/util/ValidatorUtils;->copyFastHashMap(Lorg/apache/commons/collections/FastHashMap;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v8

    iput-object v8, v4, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    .line 707
    iget-object v8, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    invoke-static {v8}, Lorg/apache/commons/validator/util/ValidatorUtils;->copyFastHashMap(Lorg/apache/commons/collections/FastHashMap;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v8

    iput-object v8, v4, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    .line 709
    return-object v4
.end method

.method public generateKey()V
    .registers 3

    .prologue
    .line 547
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->isIndexed()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 548
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "[]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    .line 552
    :goto_29
    return-void

    .line 550
    :cond_2a
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    goto :goto_29
.end method

.method public getArg(I)Lorg/apache/commons/validator/Arg;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 412
    const-string v0, "org.apache.commons.validator.Field.DEFAULT"

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/validator/Field;->getArg(Ljava/lang/String;I)Lorg/apache/commons/validator/Arg;

    move-result-object v0

    return-object v0
.end method

.method public getArg(Ljava/lang/String;I)Lorg/apache/commons/validator/Arg;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "position"    # I

    .prologue
    const/4 v1, 0x0

    .line 426
    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v2, v2

    if-ge p2, v2, :cond_c

    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v2, v2, p2

    if-nez v2, :cond_e

    :cond_c
    move-object v0, v1

    .line 438
    :cond_d
    :goto_d
    return-object v0

    .line 430
    :cond_e
    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    aget-object v2, v2, p2

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Arg;

    .line 434
    .local v0, "arg":Lorg/apache/commons/validator/Arg;
    if-nez v0, :cond_24

    const-string v2, "org.apache.commons.validator.Field.DEFAULT"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    move-object v0, v1

    .line 435
    goto :goto_d

    .line 438
    :cond_24
    if-nez v0, :cond_d

    invoke-virtual {p0, p2}, Lorg/apache/commons/validator/Field;->getArg(I)Lorg/apache/commons/validator/Arg;

    move-result-object v0

    goto :goto_d
.end method

.method public getArgs(Ljava/lang/String;)[Lorg/apache/commons/validator/Arg;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 449
    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v2, v2

    new-array v0, v2, [Lorg/apache/commons/validator/Arg;

    .line 451
    .local v0, "args":[Lorg/apache/commons/validator/Arg;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v2, p0, Lorg/apache/commons/validator/Field;->args:[Ljava/util/Map;

    array-length v2, v2

    if-ge v1, v2, :cond_14

    .line 452
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/validator/Field;->getArg(Ljava/lang/String;I)Lorg/apache/commons/validator/Arg;

    move-result-object v2

    aput-object v2, v0, v1

    .line 451
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 455
    :cond_14
    return-object v0
.end method

.method public getDependencyList()Ljava/util/List;
    .registers 2

    .prologue
    .line 674
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->dependencyList:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDepends()Ljava/lang/String;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->depends:Ljava/lang/String;

    return-object v0
.end method

.method public getFieldOrder()I
    .registers 2

    .prologue
    .line 170
    iget v0, p0, Lorg/apache/commons/validator/Field;->fieldOrder:I

    return v0
.end method

.method public getIndexedListProperty()Ljava/lang/String;
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    return-object v0
.end method

.method public getIndexedProperty()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->indexedProperty:Ljava/lang/String;

    return-object v0
.end method

.method getIndexedProperty(Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 7
    .param p1, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 750
    const/4 v1, 0x0

    .line 753
    .local v1, "indexedProperty":Ljava/lang/Object;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getIndexedListProperty()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_8} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_8} :catch_1f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_8} :catch_2a

    move-result-object v1

    .line 764
    instance-of v2, v1, Ljava/util/Collection;

    if-eqz v2, :cond_35

    .line 765
    check-cast v1, Ljava/util/Collection;

    .end local v1    # "indexedProperty":Ljava/lang/Object;
    invoke-interface {v1}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 768
    :goto_13
    return-object v1

    .line 756
    .restart local v1    # "indexedProperty":Ljava/lang/Object;
    :catch_14
    move-exception v0

    .line 757
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 758
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1f
    move-exception v0

    .line 759
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 760
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2a
    move-exception v0

    .line 761
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 767
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_35
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_44

    .line 768
    check-cast v1, [Ljava/lang/Object;

    .end local v1    # "indexedProperty":Ljava/lang/Object;
    check-cast v1, [Ljava/lang/Object;

    goto :goto_13

    .line 771
    .restart local v1    # "indexedProperty":Ljava/lang/Object;
    :cond_44
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not indexed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 517
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 518
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->generateKey()V

    .line 521
    :cond_7
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage(Ljava/lang/String;)Lorg/apache/commons/validator/Msg;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 287
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Msg;

    return-object v0
.end method

.method public getMessages()Ljava/util/Map;
    .registers 2

    .prologue
    .line 297
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getMsg(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 276
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/Field;->getMessage(Ljava/lang/String;)Lorg/apache/commons/validator/Msg;

    move-result-object v0

    .line 277
    .local v0, "msg":Lorg/apache/commons/validator/Msg;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Lorg/apache/commons/validator/Msg;->getKey()Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method protected getMsgMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 942
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method

.method public getPage()I
    .registers 2

    .prologue
    .line 153
    iget v0, p0, Lorg/apache/commons/validator/Field;->page:I

    return v0
.end method

.method public getProperty()Ljava/lang/String;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    return-object v0
.end method

.method public getVar(Ljava/lang/String;)Lorg/apache/commons/validator/Var;
    .registers 3
    .param p1, "mainKey"    # Ljava/lang/String;

    .prologue
    .line 483
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Var;

    return-object v0
.end method

.method protected getVarMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 951
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method

.method public getVarValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "mainKey"    # Ljava/lang/String;

    .prologue
    .line 492
    const/4 v2, 0x0

    .line 494
    .local v2, "value":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 495
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_14

    instance-of v3, v0, Lorg/apache/commons/validator/Var;

    if-eqz v3, :cond_14

    move-object v1, v0

    .line 496
    check-cast v1, Lorg/apache/commons/validator/Var;

    .line 497
    .local v1, "v":Lorg/apache/commons/validator/Var;
    invoke-virtual {v1}, Lorg/apache/commons/validator/Var;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 500
    .end local v1    # "v":Lorg/apache/commons/validator/Var;
    :cond_14
    return-object v2
.end method

.method public getVars()Ljava/util/Map;
    .registers 2

    .prologue
    .line 509
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public isClientValidation()Z
    .registers 2

    .prologue
    .line 308
    iget-boolean v0, p0, Lorg/apache/commons/validator/Field;->clientValidation:Z

    return v0
.end method

.method public isDependency(Ljava/lang/String;)Z
    .registers 3
    .param p1, "validatorName"    # Ljava/lang/String;

    .prologue
    .line 665
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->dependencyList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isIndexed()Z
    .registers 2

    .prologue
    .line 540
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method process(Ljava/util/Map;Ljava/util/Map;)V
    .registers 12
    .param p1, "globalConstants"    # Ljava/util/Map;
    .param p2, "constants"    # Ljava/util/Map;

    .prologue
    const/4 v8, 0x1

    .line 559
    iget-object v6, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 560
    iget-object v6, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v6, v8}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 562
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->generateKey()V

    .line 565
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_57

    .line 566
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 567
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 568
    .local v2, "key":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "${"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 569
    .local v3, "key2":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 571
    .local v4, "replaceValue":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    invoke-static {v6, v3, v4}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    .line 573
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/validator/Field;->processVars(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/validator/Field;->processMessageComponents(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_17

    .line 579
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "key2":Ljava/lang/String;
    .end local v4    # "replaceValue":Ljava/lang/String;
    :cond_57
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9f

    .line 580
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 581
    .restart local v0    # "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 582
    .restart local v2    # "key":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "${"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 583
    .restart local v3    # "key2":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 585
    .restart local v4    # "replaceValue":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    invoke-static {v6, v3, v4}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    .line 587
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/validator/Field;->processVars(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/validator/Field;->processMessageComponents(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5f

    .line 593
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "key2":Ljava/lang/String;
    .end local v4    # "replaceValue":Ljava/lang/String;
    :cond_9f
    iget-object v6, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v6}, Lorg/apache/commons/collections/FastHashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_da

    .line 594
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 595
    .restart local v2    # "key":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "${var:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 596
    .restart local v3    # "key2":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/Field;->getVar(Ljava/lang/String;)Lorg/apache/commons/validator/Var;

    move-result-object v5

    .line 597
    .local v5, "var":Lorg/apache/commons/validator/Var;
    invoke-virtual {v5}, Lorg/apache/commons/validator/Var;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 599
    .restart local v4    # "replaceValue":Ljava/lang/String;
    invoke-direct {p0, v3, v4}, Lorg/apache/commons/validator/Field;->processMessageComponents(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a9

    .line 602
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "key2":Ljava/lang/String;
    .end local v4    # "replaceValue":Ljava/lang/String;
    .end local v5    # "var":Lorg/apache/commons/validator/Var;
    :cond_da
    iget-object v6, p0, Lorg/apache/commons/validator/Field;->hMsgs:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v6, v8}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 603
    return-void
.end method

.method public setClientValidation(Z)V
    .registers 2
    .param p1, "clientValidation"    # Z

    .prologue
    .line 319
    iput-boolean p1, p0, Lorg/apache/commons/validator/Field;->clientValidation:Z

    .line 320
    return-void
.end method

.method public setDepends(Ljava/lang/String;)V
    .registers 5
    .param p1, "depends"    # Ljava/lang/String;

    .prologue
    .line 248
    iput-object p1, p0, Lorg/apache/commons/validator/Field;->depends:Ljava/lang/String;

    .line 250
    iget-object v2, p0, Lorg/apache/commons/validator/Field;->dependencyList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 252
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v2, ","

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .local v1, "st":Ljava/util/StringTokenizer;
    :cond_e
    :goto_e
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 254
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, "depend":Ljava/lang/String;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_e

    .line 257
    iget-object v2, p0, Lorg/apache/commons/validator/Field;->dependencyList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 260
    .end local v0    # "depend":Ljava/lang/String;
    :cond_2a
    return-void
.end method

.method public setFieldOrder(I)V
    .registers 2
    .param p1, "fieldOrder"    # I

    .prologue
    .line 178
    iput p1, p0, Lorg/apache/commons/validator/Field;->fieldOrder:I

    .line 179
    return-void
.end method

.method public setIndexedListProperty(Ljava/lang/String;)V
    .registers 2
    .param p1, "indexedListProperty"    # Ljava/lang/String;

    .prologue
    .line 232
    iput-object p1, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public setIndexedProperty(Ljava/lang/String;)V
    .registers 2
    .param p1, "indexedProperty"    # Ljava/lang/String;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/apache/commons/validator/Field;->indexedProperty:Ljava/lang/String;

    .line 213
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 530
    iput-object p1, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    .line 531
    return-void
.end method

.method public setPage(I)V
    .registers 2
    .param p1, "page"    # I

    .prologue
    .line 162
    iput p1, p0, Lorg/apache/commons/validator/Field;->page:I

    .line 163
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .registers 2
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 194
    iput-object p1, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    .line 195
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 717
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 719
    .local v2, "results":Ljava/lang/StringBuffer;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tkey = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/validator/Field;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 720
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tproperty = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/validator/Field;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 721
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tindexedProperty = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/validator/Field;->indexedProperty:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 722
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tindexedListProperty = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/validator/Field;->indexedListProperty:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 723
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tdepends = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/validator/Field;->depends:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 724
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tpage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/commons/validator/Field;->page:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 725
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\t\tfieldOrder = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/commons/validator/Field;->fieldOrder:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 727
    iget-object v3, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    if-eqz v3, :cond_110

    .line 728
    const-string v3, "\t\tVars:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 729
    iget-object v3, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3}, Lorg/apache/commons/collections/FastHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_ea
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_110

    .line 730
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 731
    .local v1, "key":Ljava/lang/Object;
    const-string v3, "\t\t\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 732
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 733
    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 734
    iget-object v3, p0, Lorg/apache/commons/validator/Field;->hVars:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3, v1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 735
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_ea

    .line 739
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/Object;
    :cond_110
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public validate(Ljava/util/Map;Ljava/util/Map;)Lorg/apache/commons/validator/ValidatorResults;
    .registers 15
    .param p1, "params"    # Ljava/util/Map;
    .param p2, "actions"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 889
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->getDepends()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_c

    .line 890
    new-instance v6, Lorg/apache/commons/validator/ValidatorResults;

    invoke-direct {v6}, Lorg/apache/commons/validator/ValidatorResults;-><init>()V

    .line 922
    :cond_b
    :goto_b
    return-object v6

    .line 893
    :cond_c
    new-instance v6, Lorg/apache/commons/validator/ValidatorResults;

    invoke-direct {v6}, Lorg/apache/commons/validator/ValidatorResults;-><init>()V

    .line 895
    .local v6, "allResults":Lorg/apache/commons/validator/ValidatorResults;
    const-string v0, "java.lang.Object"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 896
    .local v7, "bean":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/validator/Field;->isIndexed()Z

    move-result v0

    if-eqz v0, :cond_53

    invoke-direct {p0, v7}, Lorg/apache/commons/validator/Field;->getIndexedPropertySize(Ljava/lang/Object;)I

    move-result v11

    .line 899
    .local v11, "numberOfFieldsToValidate":I
    :goto_21
    const/4 v5, 0x0

    .local v5, "fieldNumber":I
    :goto_22
    if-ge v5, v11, :cond_b

    .line 901
    iget-object v0, p0, Lorg/apache/commons/validator/Field;->dependencyList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 902
    .local v9, "dependencies":Ljava/util/Iterator;
    new-instance v2, Lorg/apache/commons/validator/ValidatorResults;

    invoke-direct {v2}, Lorg/apache/commons/validator/ValidatorResults;-><init>()V

    .line 903
    .local v2, "results":Lorg/apache/commons/validator/ValidatorResults;
    :cond_2f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_55

    .line 904
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 906
    .local v8, "depend":Ljava/lang/String;
    invoke-interface {p2, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/ValidatorAction;

    .line 907
    .local v1, "action":Lorg/apache/commons/validator/ValidatorAction;
    if-nez v1, :cond_46

    .line 908
    invoke-direct {p0, v8}, Lorg/apache/commons/validator/Field;->handleMissingAction(Ljava/lang/String;)V

    :cond_46
    move-object v0, p0

    move-object v3, p2

    move-object v4, p1

    .line 911
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/validator/Field;->validateForRule(Lorg/apache/commons/validator/ValidatorAction;Lorg/apache/commons/validator/ValidatorResults;Ljava/util/Map;Ljava/util/Map;I)Z

    move-result v10

    .line 914
    .local v10, "good":Z
    if-nez v10, :cond_2f

    .line 915
    invoke-virtual {v6, v2}, Lorg/apache/commons/validator/ValidatorResults;->merge(Lorg/apache/commons/validator/ValidatorResults;)V

    goto :goto_b

    .line 896
    .end local v1    # "action":Lorg/apache/commons/validator/ValidatorAction;
    .end local v2    # "results":Lorg/apache/commons/validator/ValidatorResults;
    .end local v5    # "fieldNumber":I
    .end local v8    # "depend":Ljava/lang/String;
    .end local v9    # "dependencies":Ljava/util/Iterator;
    .end local v10    # "good":Z
    .end local v11    # "numberOfFieldsToValidate":I
    :cond_53
    const/4 v11, 0x1

    goto :goto_21

    .line 919
    .restart local v2    # "results":Lorg/apache/commons/validator/ValidatorResults;
    .restart local v5    # "fieldNumber":I
    .restart local v9    # "dependencies":Ljava/util/Iterator;
    .restart local v11    # "numberOfFieldsToValidate":I
    :cond_55
    invoke-virtual {v6, v2}, Lorg/apache/commons/validator/ValidatorResults;->merge(Lorg/apache/commons/validator/ValidatorResults;)V

    .line 899
    add-int/lit8 v5, v5, 0x1

    goto :goto_22
.end method

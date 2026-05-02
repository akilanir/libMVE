.class public Lorg/apache/commons/validator/ValidatorResults;
.super Ljava/lang/Object;
.source "ValidatorResults.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x259b89c4bf060aa7L


# instance fields
.field protected hResults:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/commons/validator/Field;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "field"    # Lorg/apache/commons/validator/Field;
    .param p2, "validatorName"    # Ljava/lang/String;
    .param p3, "result"    # Z

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/ValidatorResults;->add(Lorg/apache/commons/validator/Field;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 59
    return-void
.end method

.method public add(Lorg/apache/commons/validator/Field;Ljava/lang/String;ZLjava/lang/Object;)V
    .registers 8
    .param p1, "field"    # Lorg/apache/commons/validator/Field;
    .param p2, "validatorName"    # Ljava/lang/String;
    .param p3, "result"    # Z
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 75
    invoke-virtual {p1}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/validator/ValidatorResults;->getValidatorResult(Ljava/lang/String;)Lorg/apache/commons/validator/ValidatorResult;

    move-result-object v0

    .line 77
    .local v0, "validatorResult":Lorg/apache/commons/validator/ValidatorResult;
    if-nez v0, :cond_18

    .line 78
    new-instance v0, Lorg/apache/commons/validator/ValidatorResult;

    .end local v0    # "validatorResult":Lorg/apache/commons/validator/ValidatorResult;
    invoke-direct {v0, p1}, Lorg/apache/commons/validator/ValidatorResult;-><init>(Lorg/apache/commons/validator/Field;)V

    .line 79
    .restart local v0    # "validatorResult":Lorg/apache/commons/validator/ValidatorResult;
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_18
    invoke-virtual {v0, p2, p3, p4}, Lorg/apache/commons/validator/ValidatorResult;->add(Ljava/lang/String;ZLjava/lang/Object;)V

    .line 83
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 90
    return-void
.end method

.method public getPropertyNames()Ljava/util/Set;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getResultValueMap()Ljava/util/Map;
    .registers 9

    .prologue
    .line 132
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 134
    .local v4, "results":Ljava/util/Map;
    iget-object v7, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 135
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 136
    .local v2, "propertyKey":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/ValidatorResults;->getValidatorResult(Ljava/lang/String;)Lorg/apache/commons/validator/ValidatorResult;

    move-result-object v5

    .line 138
    .local v5, "vr":Lorg/apache/commons/validator/ValidatorResult;
    invoke-virtual {v5}, Lorg/apache/commons/validator/ValidatorResult;->getActions()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "x":Ljava/util/Iterator;
    :cond_23
    :goto_23
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 139
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 140
    .local v0, "actionKey":Ljava/lang/String;
    invoke-virtual {v5, v0}, Lorg/apache/commons/validator/ValidatorResult;->getResult(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 142
    .local v3, "result":Ljava/lang/Object;
    if-eqz v3, :cond_23

    instance-of v7, v3, Ljava/lang/Boolean;

    if-nez v7, :cond_23

    .line 143
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23

    .line 148
    .end local v0    # "actionKey":Ljava/lang/String;
    .end local v2    # "propertyKey":Ljava/lang/String;
    .end local v3    # "result":Ljava/lang/Object;
    .end local v5    # "vr":Lorg/apache/commons/validator/ValidatorResult;
    .end local v6    # "x":Ljava/util/Iterator;
    :cond_3d
    return-object v4
.end method

.method public getValidatorResult(Ljava/lang/String;)Lorg/apache/commons/validator/ValidatorResult;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/ValidatorResult;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public merge(Lorg/apache/commons/validator/ValidatorResults;)V
    .registers 4
    .param p1, "results"    # Lorg/apache/commons/validator/ValidatorResults;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    iget-object v1, p1, Lorg/apache/commons/validator/ValidatorResults;->hResults:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 48
    return-void
.end method

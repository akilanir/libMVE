.class public Lorg/apache/commons/validator/ValidatorResult;
.super Ljava/lang/Object;
.source "ValidatorResult.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/validator/ValidatorResult$ResultStatus;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x33888580f310dc63L


# instance fields
.field protected field:Lorg/apache/commons/validator/Field;

.field protected hAction:Ljava/util/Map;


# direct methods
.method public constructor <init>(Lorg/apache/commons/validator/Field;)V
    .registers 3
    .param p1, "field"    # Lorg/apache/commons/validator/Field;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->field:Lorg/apache/commons/validator/Field;

    .line 53
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorResult;->field:Lorg/apache/commons/validator/Field;

    .line 54
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "validatorName"    # Ljava/lang/String;
    .param p2, "result"    # Z

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/ValidatorResult;->add(Ljava/lang/String;ZLjava/lang/Object;)V

    .line 63
    return-void
.end method

.method public add(Ljava/lang/String;ZLjava/lang/Object;)V
    .registers 6
    .param p1, "validatorName"    # Ljava/lang/String;
    .param p2, "result"    # Z
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    new-instance v1, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;

    invoke-direct {v1, p2, p3}, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;-><init>(ZLjava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    return-void
.end method

.method public containsAction(Ljava/lang/String;)Z
    .registers 3
    .param p1, "validatorName"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getActionMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getActions()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getField()Lorg/apache/commons/validator/Field;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResult;->field:Lorg/apache/commons/validator/Field;

    return-object v0
.end method

.method public getResult(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "validatorName"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;

    .line 101
    .local v0, "status":Lorg/apache/commons/validator/ValidatorResult$ResultStatus;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->getResult()Ljava/lang/Object;

    move-result-object v1

    goto :goto_b
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 4
    .param p1, "validatorName"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorResult;->hAction:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;

    .line 91
    .local v0, "status":Lorg/apache/commons/validator/ValidatorResult$ResultStatus;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return v1

    :cond_c
    invoke-virtual {v0}, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->isValid()Z

    move-result v1

    goto :goto_b
.end method

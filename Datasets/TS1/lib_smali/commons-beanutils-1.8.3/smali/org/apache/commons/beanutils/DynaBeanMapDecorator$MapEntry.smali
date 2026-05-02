.class Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;
.super Ljava/lang/Object;
.source "DynaBeanMapDecorator.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/DynaBeanMapDecorator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MapEntry"
.end annotation


# instance fields
.field private key:Ljava/lang/Object;

.field private value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 368
    iput-object p1, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->key:Ljava/lang/Object;

    .line 369
    iput-object p2, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->value:Ljava/lang/Object;

    .line 370
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 372
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-nez v2, :cond_6

    .line 376
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 375
    check-cast v0, Ljava/util/Map$Entry;

    .line 376
    .local v0, "e":Ljava/util/Map$Entry;
    iget-object v2, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->key:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->value:Ljava/lang/Object;

    if-nez v2, :cond_21

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_5

    :goto_1f
    const/4 v1, 0x1

    goto :goto_5

    :cond_21
    iget-object v2, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->value:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_1f
.end method

.method public getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->key:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 387
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 381
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->key:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->value:Ljava/lang/Object;

    if-nez v0, :cond_d

    const/4 v0, 0x0

    :goto_b
    add-int/2addr v0, v1

    return v0

    :cond_d
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_b
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 390
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

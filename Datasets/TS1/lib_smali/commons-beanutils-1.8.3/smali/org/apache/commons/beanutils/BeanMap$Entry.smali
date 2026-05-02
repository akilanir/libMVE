.class public Lorg/apache/commons/beanutils/BeanMap$Entry;
.super Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;
.source "BeanMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/BeanMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Entry"
.end annotation


# instance fields
.field private owner:Lorg/apache/commons/beanutils/BeanMap;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/beanutils/BeanMap;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "owner"    # Lorg/apache/commons/beanutils/BeanMap;
    .param p2, "key"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 722
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 723
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanMap$Entry;->owner:Lorg/apache/commons/beanutils/BeanMap;

    .line 724
    return-void
.end method


# virtual methods
.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 733
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 734
    .local v0, "key":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanMap$Entry;->owner:Lorg/apache/commons/beanutils/BeanMap;

    invoke-virtual {v3, v0}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 736
    .local v2, "oldValue":Ljava/lang/Object;
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanMap$Entry;->owner:Lorg/apache/commons/beanutils/BeanMap;

    invoke-virtual {v3, v0, p1}, Lorg/apache/commons/beanutils/BeanMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 737
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanMap$Entry;->owner:Lorg/apache/commons/beanutils/BeanMap;

    invoke-virtual {v3, v0}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 738
    .local v1, "newValue":Ljava/lang/Object;
    invoke-super {p0, v1}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 739
    return-object v2
.end method

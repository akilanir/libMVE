.class Lorg/apache/commons/beanutils/BeanMap$11;
.super Ljava/lang/Object;
.source "BeanMap.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private final this$0:Lorg/apache/commons/beanutils/BeanMap;

.field private final val$iter:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/apache/commons/beanutils/BeanMap;Ljava/util/Iterator;)V
    .registers 3

    .prologue
    .line 538
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanMap$11;->this$0:Lorg/apache/commons/beanutils/BeanMap;

    iput-object p2, p0, Lorg/apache/commons/beanutils/BeanMap$11;->val$iter:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 540
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap$11;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 543
    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanMap$11;->val$iter:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 544
    .local v0, "key":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanMap$11;->this$0:Lorg/apache/commons/beanutils/BeanMap;

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 547
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "remove() not supported for BeanMap"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.class Lorg/apache/commons/beanutils/BeanMap$10;
.super Ljava/util/AbstractSet;
.source "BeanMap.java"


# instance fields
.field private final this$0:Lorg/apache/commons/beanutils/BeanMap;


# direct methods
.method constructor <init>(Lorg/apache/commons/beanutils/BeanMap;)V
    .registers 2

    .prologue
    .line 481
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanMap$10;->this$0:Lorg/apache/commons/beanutils/BeanMap;

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 483
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap$10;->this$0:Lorg/apache/commons/beanutils/BeanMap;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/BeanMap;->entryIterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 486
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap$10;->this$0:Lorg/apache/commons/beanutils/BeanMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/BeanMap;->access$100(Lorg/apache/commons/beanutils/BeanMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

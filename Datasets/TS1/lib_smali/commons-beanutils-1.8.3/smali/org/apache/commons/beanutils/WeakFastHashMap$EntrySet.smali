.class Lorg/apache/commons/beanutils/WeakFastHashMap$EntrySet;
.super Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;
.source "WeakFastHashMap.java"

# interfaces
.implements Ljava/util/Set;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/WeakFastHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EntrySet"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;


# direct methods
.method private constructor <init>(Lorg/apache/commons/beanutils/WeakFastHashMap;)V
    .registers 2

    .prologue
    .line 732
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;-><init>(Lorg/apache/commons/beanutils/WeakFastHashMap;)V

    iput-object p1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$EntrySet;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/beanutils/WeakFastHashMap;Lorg/apache/commons/beanutils/WeakFastHashMap$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/apache/commons/beanutils/WeakFastHashMap;
    .param p2, "x1"    # Lorg/apache/commons/beanutils/WeakFastHashMap$1;

    .prologue
    .line 732
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap$EntrySet;-><init>(Lorg/apache/commons/beanutils/WeakFastHashMap;)V

    return-void
.end method


# virtual methods
.method protected get(Ljava/util/Map;)Ljava/util/Collection;
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 735
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected iteratorNext(Ljava/util/Map$Entry;)Ljava/lang/Object;
    .registers 2
    .param p1, "entry"    # Ljava/util/Map$Entry;

    .prologue
    .line 739
    return-object p1
.end method

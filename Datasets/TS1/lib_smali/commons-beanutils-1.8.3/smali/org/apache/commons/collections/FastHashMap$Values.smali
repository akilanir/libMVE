.class Lorg/apache/commons/collections/FastHashMap$Values;
.super Lorg/apache/commons/collections/FastHashMap$CollectionView;
.source "FastHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/collections/FastHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Values"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/collections/FastHashMap;


# direct methods
.method private constructor <init>(Lorg/apache/commons/collections/FastHashMap;)V
    .registers 2

    .prologue
    .line 694
    invoke-direct {p0, p1}, Lorg/apache/commons/collections/FastHashMap$CollectionView;-><init>(Lorg/apache/commons/collections/FastHashMap;)V

    iput-object p1, p0, Lorg/apache/commons/collections/FastHashMap$Values;->this$0:Lorg/apache/commons/collections/FastHashMap;

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/collections/FastHashMap;Lorg/apache/commons/collections/FastHashMap$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/apache/commons/collections/FastHashMap;
    .param p2, "x1"    # Lorg/apache/commons/collections/FastHashMap$1;

    .prologue
    .line 694
    invoke-direct {p0, p1}, Lorg/apache/commons/collections/FastHashMap$Values;-><init>(Lorg/apache/commons/collections/FastHashMap;)V

    return-void
.end method


# virtual methods
.method protected get(Ljava/util/Map;)Ljava/util/Collection;
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 697
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method protected iteratorNext(Ljava/util/Map$Entry;)Ljava/lang/Object;
    .registers 3
    .param p1, "entry"    # Ljava/util/Map$Entry;

    .prologue
    .line 701
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.class final Ljavassist/util/proxy/ProxyFactory$3;
.super Ljava/lang/Object;
.source "ProxyFactory.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/util/proxy/ProxyFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 814
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 8
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 817
    move-object v0, p1

    check-cast v0, Ljava/util/Map$Entry;

    .local v0, "e1":Ljava/util/Map$Entry;
    move-object v1, p2

    .line 818
    check-cast v1, Ljava/util/Map$Entry;

    .line 819
    .local v1, "e2":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 820
    .local v2, "key1":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 821
    .local v3, "key2":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    return v4
.end method

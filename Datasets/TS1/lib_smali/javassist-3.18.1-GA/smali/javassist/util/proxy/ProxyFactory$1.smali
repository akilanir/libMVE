.class final Ljavassist/util/proxy/ProxyFactory$1;
.super Ljava/lang/Object;
.source "ProxyFactory.java"

# interfaces
.implements Ljavassist/util/proxy/ProxyFactory$ClassLoaderProvider;


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
    .line 606
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljavassist/util/proxy/ProxyFactory;)Ljava/lang/ClassLoader;
    .registers 3
    .param p1, "pf"    # Ljavassist/util/proxy/ProxyFactory;

    .prologue
    .line 608
    invoke-virtual {p1}, Ljavassist/util/proxy/ProxyFactory;->getClassLoader0()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

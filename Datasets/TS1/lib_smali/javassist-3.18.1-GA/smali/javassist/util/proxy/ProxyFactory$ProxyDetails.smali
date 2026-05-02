.class Ljavassist/util/proxy/ProxyFactory$ProxyDetails;
.super Ljava/lang/Object;
.source "ProxyFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/util/proxy/ProxyFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProxyDetails"
.end annotation


# instance fields
.field isUseWriteReplace:Z

.field proxyClass:Ljava/lang/ref/WeakReference;

.field signature:[B


# direct methods
.method constructor <init>([BLjava/lang/Class;Z)V
    .registers 5
    .param p1, "signature"    # [B
    .param p2, "proxyClass"    # Ljava/lang/Class;
    .param p3, "isUseWriteReplace"    # Z

    .prologue
    .line 328
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 329
    iput-object p1, p0, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;->signature:[B

    .line 330
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;->proxyClass:Ljava/lang/ref/WeakReference;

    .line 331
    iput-boolean p3, p0, Ljavassist/util/proxy/ProxyFactory$ProxyDetails;->isUseWriteReplace:Z

    .line 332
    return-void
.end method

.class public Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;
.super Ljava/lang/Object;
.source "NetworkAvailabliltyCheck.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;


# instance fields
.field final isX86:Z

.field private final mConnectionManager:Landroid/net/ConnectivityManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "aContext"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    .line 25
    const-string v0, "Android-x86"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->isX86:Z

    .line 26
    return-void
.end method


# virtual methods
.method public getCellularDataNetworkAvailable()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 42
    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 44
    .local v0, "mobile":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_10

    const/4 v1, 0x1

    :cond_10
    return v1
.end method

.method public getNetworkAvailable()Z
    .registers 4

    .prologue
    .line 30
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 31
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_1c

    iget-boolean v1, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->isX86:Z

    if-eqz v1, :cond_1c

    :cond_1a
    const/4 v1, 0x1

    :goto_1b
    return v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method public getRouteToPathExists(I)Z
    .registers 5
    .param p1, "hostAddress"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 49
    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2, v1, p1}, Landroid/net/ConnectivityManager;->requestRouteToHost(II)Z

    move-result v2

    if-nez v2, :cond_12

    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2, v0, p1}, Landroid/net/ConnectivityManager;->requestRouteToHost(II)Z

    move-result v2

    if-eqz v2, :cond_13

    :cond_12
    move v0, v1

    :cond_13
    return v0
.end method

.method public getWiFiNetworkAvailable()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 36
    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 37
    .local v0, "wifi":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_10

    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

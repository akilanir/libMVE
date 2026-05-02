.class public Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;
.super Ljava/lang/Object;
.source "NetworkAvailabliltyCheck.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;


# instance fields
.field private final mConnectionManager:Landroid/net/ConnectivityManager;

.field private final mHasNetworkStatePermission:Z

.field private final mIsX86:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
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

    iput-boolean v0, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mIsX86:Z

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2b

    const/4 v0, 0x1

    :goto_28
    iput-boolean v0, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mHasNetworkStatePermission:Z

    .line 30
    return-void

    .line 27
    :cond_2b
    const/4 v0, 0x0

    goto :goto_28
.end method


# virtual methods
.method public getCellularDataNetworkAvailable()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 61
    iget-boolean v3, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mHasNetworkStatePermission:Z

    if-nez v3, :cond_7

    .line 67
    :cond_6
    :goto_6
    return v1

    .line 65
    :cond_7
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v3, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 67
    .local v0, "mobile":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_6

    :cond_15
    move v1, v2

    goto :goto_6
.end method

.method public getNetworkAvailable()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 34
    iget-boolean v3, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mHasNetworkStatePermission:Z

    if-nez v3, :cond_7

    .line 45
    :cond_6
    :goto_6
    return v1

    .line 38
    :cond_7
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v3}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 39
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-nez v0, :cond_11

    move v1, v2

    .line 40
    goto :goto_6

    .line 42
    :cond_11
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_6

    .line 45
    iget-boolean v3, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mIsX86:Z

    if-eqz v3, :cond_23

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    const/16 v4, 0x9

    if-eq v3, v4, :cond_6

    :cond_23
    move v1, v2

    goto :goto_6
.end method

.method public getRouteToPathExists(I)Z
    .registers 5
    .param p1, "hostAddress"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 73
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

    .line 50
    iget-boolean v2, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mHasNetworkStatePermission:Z

    if-nez v2, :cond_6

    .line 56
    :cond_5
    :goto_5
    return v1

    .line 54
    :cond_6
    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;->mConnectionManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 56
    .local v0, "wifi":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v2

    if-nez v2, :cond_5

    :cond_14
    const/4 v1, 0x0

    goto :goto_5
.end method

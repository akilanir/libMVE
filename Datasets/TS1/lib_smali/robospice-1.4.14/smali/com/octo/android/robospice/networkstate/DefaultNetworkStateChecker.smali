.class public Lcom/octo/android/robospice/networkstate/DefaultNetworkStateChecker;
.super Ljava/lang/Object;
.source "DefaultNetworkStateChecker.java"

# interfaces
.implements Lcom/octo/android/robospice/networkstate/NetworkStateChecker;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private checkHasPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "permissionName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p2, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_31

    move v0, v1

    .line 38
    .local v0, "hasPermission":Z
    :goto_10
    if-nez v0, :cond_33

    .line 39
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Application doesn\'t declare <uses-permission android:name=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" />"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 37
    .end local v0    # "hasPermission":Z
    :cond_31
    const/4 v0, 0x0

    goto :goto_10

    .line 41
    .restart local v0    # "hasPermission":Z
    :cond_33
    return v1
.end method


# virtual methods
.method public checkPermissions(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/networkstate/DefaultNetworkStateChecker;->checkHasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    .line 33
    const-string v0, "android.permission.INTERNET"

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/networkstate/DefaultNetworkStateChecker;->checkHasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    .line 34
    return-void
.end method

.method public isNetworkAvailable(Landroid/content/Context;)Z
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    const-string v6, "connectivity"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 21
    .local v2, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v0

    .line 22
    .local v0, "allNetworkInfos":[Landroid/net/NetworkInfo;
    move-object v1, v0

    .local v1, "arr$":[Landroid/net/NetworkInfo;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_f
    if-ge v3, v4, :cond_28

    aget-object v5, v1, v3

    .line 23
    .local v5, "networkInfo":Landroid/net/NetworkInfo;
    invoke-virtual {v5}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v6, v7, :cond_23

    invoke-virtual {v5}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTING:Landroid/net/NetworkInfo$State;

    if-ne v6, v7, :cond_25

    .line 24
    :cond_23
    const/4 v6, 0x1

    .line 27
    .end local v5    # "networkInfo":Landroid/net/NetworkInfo;
    :goto_24
    return v6

    .line 22
    .restart local v5    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 27
    .end local v5    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_28
    const/4 v6, 0x0

    goto :goto_24
.end method

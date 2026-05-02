.class public Lorg/openintents/openpgp/util/OpenPgpServiceConnection;
.super Ljava/lang/Object;
.source "OpenPgpServiceConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;
    }
.end annotation


# instance fields
.field private mApplicationContext:Landroid/content/Context;

.field private mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

.field private mProviderPackageName:Ljava/lang/String;

.field private mService:Lorg/openintents/openpgp/IOpenPgpService2;

.field private mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "providerPackageName"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;

    invoke-direct {v0, p0}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$1;-><init>(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)V

    iput-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mApplicationContext:Landroid/content/Context;

    .line 52
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mProviderPackageName:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "providerPackageName"    # Ljava/lang/String;
    .param p3, "onBoundListener"    # Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 66
    iput-object p3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    .line 67
    return-void
.end method

.method static synthetic access$000(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)Lorg/openintents/openpgp/IOpenPgpService2;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    .prologue
    .line 27
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    return-object v0
.end method

.method static synthetic access$002(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;Lorg/openintents/openpgp/IOpenPgpService2;)Lorg/openintents/openpgp/IOpenPgpService2;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpServiceConnection;
    .param p1, "x1"    # Lorg/openintents/openpgp/IOpenPgpService2;

    .prologue
    .line 27
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    return-object p1
.end method

.method static synthetic access$100(Lorg/openintents/openpgp/util/OpenPgpServiceConnection;)Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpServiceConnection;

    .prologue
    .line 27
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    return-object v0
.end method


# virtual methods
.method public bindToService()V
    .registers 7

    .prologue
    .line 97
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    if-nez v3, :cond_2e

    .line 99
    :try_start_4
    new-instance v2, Landroid/content/Intent;

    const-string v3, "org.openintents.openpgp.IOpenPgpService2"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 101
    .local v2, "serviceIntent":Landroid/content/Intent;
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mProviderPackageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mApplicationContext:Landroid/content/Context;

    iget-object v4, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v5, 0x1

    invoke-virtual {v3, v2, v4, v5}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 104
    .local v0, "connect":Z
    if-nez v0, :cond_2d

    .line 105
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "bindService() returned false!"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_23} :catch_23

    .line 107
    .end local v0    # "connect":Z
    .end local v2    # "serviceIntent":Landroid/content/Intent;
    :catch_23
    move-exception v1

    .line 108
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    if-eqz v3, :cond_2d

    .line 109
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    invoke-interface {v3, v1}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;->onError(Ljava/lang/Exception;)V

    .line 118
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2d
    :goto_2d
    return-void

    .line 114
    :cond_2e
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    if-eqz v3, :cond_2d

    .line 115
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mOnBoundListener:Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;

    iget-object v4, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    invoke-interface {v3, v4}, Lorg/openintents/openpgp/util/OpenPgpServiceConnection$OnBound;->onBound(Lorg/openintents/openpgp/IOpenPgpService2;)V

    goto :goto_2d
.end method

.method public getService()Lorg/openintents/openpgp/IOpenPgpService2;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    return-object v0
.end method

.method public isBound()Z
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public unbindFromService()V
    .registers 3

    .prologue
    .line 121
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mApplicationContext:Landroid/content/Context;

    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpServiceConnection;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 122
    return-void
.end method

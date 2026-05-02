.class Lcom/google/android/apps/dashclock/api/DashClockExtension$1;
.super Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub;
.source "DashClockExtension.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/dashclock/api/DashClockExtension;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;


# direct methods
.method constructor <init>(Lcom/google/android/apps/dashclock/api/DashClockExtension;)V
    .registers 2

    .prologue
    .line 263
    iput-object p1, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    invoke-direct {p0}, Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onInitialize(Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;Z)V
    .registers 11
    .param p1, "host"    # Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;
    .param p2, "isReconnect"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 267
    iget-object v4, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    # getter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->mIsWorldReadable:Z
    invoke-static {v4}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$000(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Z

    move-result v4

    if-nez v4, :cond_50

    .line 270
    const/4 v3, 0x0

    .line 271
    .local v3, "verified":Z
    iget-object v4, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    invoke-virtual {v4}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 272
    .local v2, "pm":Landroid/content/pm/PackageManager;
    invoke-static {}, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->getCallingUid()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v0

    .line 273
    .local v0, "packages":[Ljava/lang/String;
    if-eqz v0, :cond_3f

    array-length v4, v0

    if-lez v4, :cond_3f

    .line 275
    const/4 v4, 0x0

    :try_start_1e
    aget-object v4, v0, v4

    const/16 v5, 0x40

    invoke-virtual {v2, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 277
    .local v1, "pi":Landroid/content/pm/PackageInfo;
    iget-object v4, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v4, :cond_3f

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v4, v4

    if-ne v4, v7, :cond_3f

    # getter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->DASHCLOCK_SIGNATURE:Landroid/content/pm/Signature;
    invoke-static {}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$100()Landroid/content/pm/Signature;

    move-result-object v4

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z
    :try_end_3b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1e .. :try_end_3b} :catch_68

    move-result v4

    if-eqz v4, :cond_3f

    .line 280
    const/4 v3, 0x1

    .line 286
    .end local v1    # "pi":Landroid/content/pm/PackageInfo;
    :cond_3f
    :goto_3f
    if-nez v3, :cond_50

    .line 287
    const-string v4, "DashClockExtension"

    const-string v5, "Caller is not official DashClock app and this extension is not world-readable."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    new-instance v4, Ljava/lang/SecurityException;

    const-string v5, "Caller is not official DashClock app and this extension is not world-readable."

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 294
    .end local v0    # "packages":[Ljava/lang/String;
    .end local v2    # "pm":Landroid/content/pm/PackageManager;
    .end local v3    # "verified":Z
    :cond_50
    iget-object v4, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    # setter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->mHost:Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;
    invoke-static {v4, p1}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$202(Lcom/google/android/apps/dashclock/api/DashClockExtension;Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;)Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    .line 296
    iget-object v4, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    # getter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->mInitialized:Z
    invoke-static {v4}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$300(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Z

    move-result v4

    if-nez v4, :cond_67

    .line 297
    iget-object v4, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    invoke-virtual {v4, p2}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->onInitialize(Z)V

    .line 298
    iget-object v4, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    # setter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->mInitialized:Z
    invoke-static {v4, v7}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$302(Lcom/google/android/apps/dashclock/api/DashClockExtension;Z)Z

    .line 300
    :cond_67
    return-void

    .line 282
    .restart local v0    # "packages":[Ljava/lang/String;
    .restart local v2    # "pm":Landroid/content/pm/PackageManager;
    .restart local v3    # "verified":Z
    :catch_68
    move-exception v4

    goto :goto_3f
.end method

.method public onUpdate(I)V
    .registers 4
    .param p1, "reason"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 304
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    # getter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->mInitialized:Z
    invoke-static {v0}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$300(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 315
    :goto_8
    return-void

    .line 309
    :cond_9
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/DashClockExtension$1;->this$0:Lcom/google/android/apps/dashclock/api/DashClockExtension;

    # getter for: Lcom/google/android/apps/dashclock/api/DashClockExtension;->mServiceHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/google/android/apps/dashclock/api/DashClockExtension;->access$400(Lcom/google/android/apps/dashclock/api/DashClockExtension;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/android/apps/dashclock/api/DashClockExtension$1$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/apps/dashclock/api/DashClockExtension$1$1;-><init>(Lcom/google/android/apps/dashclock/api/DashClockExtension$1;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_8
.end method

.class Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub$Proxy;
.super Ljava/lang/Object;
.source "IExtension.java"

# interfaces
.implements Lcom/google/android/apps/dashclock/api/internal/IExtension;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2
    .param p1, "remote"    # Landroid/os/IBinder;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 72
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    const-string v0, "com.google.android.apps.dashclock.api.internal.IExtension"

    return-object v0
.end method

.method public onInitialize(Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;Z)V
    .registers 8
    .param p1, "host"    # Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;
    .param p2, "isReconnect"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 93
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 95
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_6
    const-string v3, "com.google.android.apps.dashclock.api.internal.IExtension"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 96
    if-eqz p1, :cond_11

    invoke-interface {p1}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    :cond_11
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 97
    if-eqz p2, :cond_25

    :goto_16
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 98
    iget-object v1, p0, Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_21
    .catchall {:try_start_6 .. :try_end_21} :catchall_27

    .line 101
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 103
    return-void

    .line 97
    :cond_25
    const/4 v1, 0x0

    goto :goto_16

    .line 101
    :catchall_27
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

.method public onUpdate(I)V
    .registers 7
    .param p1, "reason"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 108
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_4
    const-string v1, "com.google.android.apps.dashclock.api.internal.IExtension"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 110
    iget-object v1, p0, Lcom/google/android/apps/dashclock/api/internal/IExtension$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v2, v0, v3, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_18

    .line 113
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 115
    return-void

    .line 113
    :catchall_18
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v1
.end method

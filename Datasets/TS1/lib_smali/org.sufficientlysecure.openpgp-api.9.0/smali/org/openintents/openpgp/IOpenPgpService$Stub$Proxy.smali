.class Lorg/openintents/openpgp/IOpenPgpService$Stub$Proxy;
.super Ljava/lang/Object;
.source "IOpenPgpService.java"

# interfaces
.implements Lorg/openintents/openpgp/IOpenPgpService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/IOpenPgpService$Stub;
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
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lorg/openintents/openpgp/IOpenPgpService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 89
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/openintents/openpgp/IOpenPgpService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;)Landroid/content/Intent;
    .registers 10
    .param p1, "data"    # Landroid/content/Intent;
    .param p2, "input"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "output"    # Landroid/os/ParcelFileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 104
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 105
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 108
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "org.openintents.openpgp.IOpenPgpService"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 109
    if-eqz p1, :cond_4a

    .line 110
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 111
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 116
    :goto_17
    if-eqz p2, :cond_57

    .line 117
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 118
    const/4 v3, 0x0

    invoke-virtual {p2, v0, v3}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    .line 123
    :goto_21
    if-eqz p3, :cond_5c

    .line 124
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 125
    const/4 v3, 0x0

    invoke-virtual {p3, v0, v3}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    .line 130
    :goto_2b
    iget-object v3, p0, Lorg/openintents/openpgp/IOpenPgpService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 131
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 132
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_61

    .line 133
    sget-object v3, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;
    :try_end_43
    .catchall {:try_start_8 .. :try_end_43} :catchall_4f

    .line 140
    .local v2, "_result":Landroid/content/Intent;
    :goto_43
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 141
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 143
    return-object v2

    .line 114
    .end local v2    # "_result":Landroid/content/Intent;
    :cond_4a
    const/4 v3, 0x0

    :try_start_4b
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_4e
    .catchall {:try_start_4b .. :try_end_4e} :catchall_4f

    goto :goto_17

    .line 140
    :catchall_4f
    move-exception v3

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 141
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v3

    .line 121
    :cond_57
    const/4 v3, 0x0

    :try_start_58
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_21

    .line 128
    :cond_5c
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_60
    .catchall {:try_start_58 .. :try_end_60} :catchall_4f

    goto :goto_2b

    .line 136
    :cond_61
    const/4 v2, 0x0

    .restart local v2    # "_result":Landroid/content/Intent;
    goto :goto_43
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    const-string v0, "org.openintents.openpgp.IOpenPgpService"

    return-object v0
.end method

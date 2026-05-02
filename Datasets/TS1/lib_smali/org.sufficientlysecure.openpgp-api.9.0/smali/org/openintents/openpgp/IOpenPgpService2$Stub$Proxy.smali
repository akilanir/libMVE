.class Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;
.super Ljava/lang/Object;
.source "IOpenPgpService2.java"

# interfaces
.implements Lorg/openintents/openpgp/IOpenPgpService2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/IOpenPgpService2$Stub;
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
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 100
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public createOutputPipe(I)Landroid/os/ParcelFileDescriptor;
    .registers 8
    .param p1, "pipeId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 115
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 118
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "org.openintents.openpgp.IOpenPgpService2"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 119
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 120
    iget-object v3, p0, Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 121
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 122
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_2f

    .line 123
    sget-object v3, Landroid/os/ParcelFileDescriptor;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/ParcelFileDescriptor;
    :try_end_28
    .catchall {:try_start_8 .. :try_end_28} :catchall_31

    .line 130
    .local v2, "_result":Landroid/os/ParcelFileDescriptor;
    :goto_28
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 131
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 133
    return-object v2

    .line 126
    .end local v2    # "_result":Landroid/os/ParcelFileDescriptor;
    :cond_2f
    const/4 v2, 0x0

    .restart local v2    # "_result":Landroid/os/ParcelFileDescriptor;
    goto :goto_28

    .line 130
    .end local v2    # "_result":Landroid/os/ParcelFileDescriptor;
    :catchall_31
    move-exception v3

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 131
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v3
.end method

.method public execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;I)Landroid/content/Intent;
    .registers 10
    .param p1, "data"    # Landroid/content/Intent;
    .param p2, "input"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "pipeId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 141
    .local v0, "_data":Landroid/os/Parcel;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 144
    .local v1, "_reply":Landroid/os/Parcel;
    :try_start_8
    const-string v3, "org.openintents.openpgp.IOpenPgpService2"

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 145
    if-eqz p1, :cond_43

    .line 146
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 147
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 152
    :goto_17
    if-eqz p2, :cond_50

    .line 153
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 154
    const/4 v3, 0x0

    invoke-virtual {p2, v0, v3}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    .line 159
    :goto_21
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 160
    iget-object v3, p0, Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-interface {v3, v4, v0, v1, v5}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 161
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 162
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_55

    .line 163
    sget-object v3, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;
    :try_end_3c
    .catchall {:try_start_8 .. :try_end_3c} :catchall_48

    .line 170
    .local v2, "_result":Landroid/content/Intent;
    :goto_3c
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 171
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 173
    return-object v2

    .line 150
    .end local v2    # "_result":Landroid/content/Intent;
    :cond_43
    const/4 v3, 0x0

    :try_start_44
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_48

    goto :goto_17

    .line 170
    :catchall_48
    move-exception v3

    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 171
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    throw v3

    .line 157
    :cond_50
    const/4 v3, 0x0

    :try_start_51
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInt(I)V
    :try_end_54
    .catchall {:try_start_51 .. :try_end_54} :catchall_48

    goto :goto_21

    .line 166
    :cond_55
    const/4 v2, 0x0

    .restart local v2    # "_result":Landroid/content/Intent;
    goto :goto_3c
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 107
    const-string v0, "org.openintents.openpgp.IOpenPgpService2"

    return-object v0
.end method

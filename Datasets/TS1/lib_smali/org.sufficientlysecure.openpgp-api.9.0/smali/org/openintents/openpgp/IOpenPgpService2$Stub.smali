.class public abstract Lorg/openintents/openpgp/IOpenPgpService2$Stub;
.super Landroid/os/Binder;
.source "IOpenPgpService2.java"

# interfaces
.implements Lorg/openintents/openpgp/IOpenPgpService2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/IOpenPgpService2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "org.openintents.openpgp.IOpenPgpService2"

.field static final TRANSACTION_createOutputPipe:I = 0x1

.field static final TRANSACTION_execute:I = 0x2


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "org.openintents.openpgp.IOpenPgpService2"

    invoke-virtual {p0, p0, v0}, Lorg/openintents/openpgp/IOpenPgpService2$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lorg/openintents/openpgp/IOpenPgpService2;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .prologue
    .line 23
    if-nez p0, :cond_4

    .line 24
    const/4 v0, 0x0

    .line 30
    :goto_3
    return-object v0

    .line 26
    :cond_4
    const-string v1, "org.openintents.openpgp.IOpenPgpService2"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lorg/openintents/openpgp/IOpenPgpService2;

    if-eqz v1, :cond_13

    .line 28
    check-cast v0, Lorg/openintents/openpgp/IOpenPgpService2;

    goto :goto_3

    .line 30
    :cond_13
    new-instance v0, Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lorg/openintents/openpgp/IOpenPgpService2$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_3
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .prologue
    .line 34
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 12
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_6a

    .line 92
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    :goto_9
    return v4

    .line 42
    :sswitch_a
    const-string v5, "org.openintents.openpgp.IOpenPgpService2"

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_9

    .line 47
    :sswitch_10
    const-string v5, "org.openintents.openpgp.IOpenPgpService2"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 50
    .local v0, "_arg0":I
    invoke-virtual {p0, v0}, Lorg/openintents/openpgp/IOpenPgpService2$Stub;->createOutputPipe(I)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    .line 51
    .local v3, "_result":Landroid/os/ParcelFileDescriptor;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 52
    if-eqz v3, :cond_29

    .line 53
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    invoke-virtual {v3, p3, v4}, Landroid/os/ParcelFileDescriptor;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_9

    .line 57
    :cond_29
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 63
    .end local v0    # "_arg0":I
    .end local v3    # "_result":Landroid/os/ParcelFileDescriptor;
    :sswitch_2d
    const-string v5, "org.openintents.openpgp.IOpenPgpService2"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_62

    .line 66
    sget-object v5, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v5, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 72
    .local v0, "_arg0":Landroid/content/Intent;
    :goto_40
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_64

    .line 73
    sget-object v5, Landroid/os/ParcelFileDescriptor;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v5, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/ParcelFileDescriptor;

    .line 79
    .local v1, "_arg1":Landroid/os/ParcelFileDescriptor;
    :goto_4e
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 80
    .local v2, "_arg2":I
    invoke-virtual {p0, v0, v1, v2}, Lorg/openintents/openpgp/IOpenPgpService2$Stub;->execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;I)Landroid/content/Intent;

    move-result-object v3

    .line 81
    .local v3, "_result":Landroid/content/Intent;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 82
    if-eqz v3, :cond_66

    .line 83
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 84
    invoke-virtual {v3, p3, v4}, Landroid/content/Intent;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_9

    .line 69
    .end local v0    # "_arg0":Landroid/content/Intent;
    .end local v1    # "_arg1":Landroid/os/ParcelFileDescriptor;
    .end local v2    # "_arg2":I
    .end local v3    # "_result":Landroid/content/Intent;
    :cond_62
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Landroid/content/Intent;
    goto :goto_40

    .line 76
    :cond_64
    const/4 v1, 0x0

    .restart local v1    # "_arg1":Landroid/os/ParcelFileDescriptor;
    goto :goto_4e

    .line 87
    .restart local v2    # "_arg2":I
    .restart local v3    # "_result":Landroid/content/Intent;
    :cond_66
    invoke-virtual {p3, v6}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_9

    .line 38
    :sswitch_data_6a
    .sparse-switch
        0x1 -> :sswitch_10
        0x2 -> :sswitch_2d
        0x5f4e5446 -> :sswitch_a
    .end sparse-switch
.end method

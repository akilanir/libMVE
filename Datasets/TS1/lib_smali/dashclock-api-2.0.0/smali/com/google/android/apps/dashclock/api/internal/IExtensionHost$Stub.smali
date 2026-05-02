.class public abstract Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub;
.super Landroid/os/Binder;
.source "IExtensionHost.java"

# interfaces
.implements Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.google.android.apps.dashclock.api.internal.IExtensionHost"

.field static final TRANSACTION_addWatchContentUris:I = 0x2

.field static final TRANSACTION_publishUpdate:I = 0x1

.field static final TRANSACTION_removeAllWatchContentUris:I = 0x4

.field static final TRANSACTION_setUpdateWhenScreenOn:I = 0x3


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-virtual {p0, p0, v0}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;
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
    const-string v1, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    if-eqz v1, :cond_13

    .line 28
    check-cast v0, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost;

    goto :goto_3

    .line 30
    :cond_13
    new-instance v0, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    .registers 8
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
    const/4 v1, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_50

    .line 81
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    :goto_8
    return v1

    .line 42
    :sswitch_9
    const-string v2, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_8

    .line 47
    :sswitch_f
    const-string v2, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_26

    .line 50
    sget-object v2, Lcom/google/android/apps/dashclock/api/ExtensionData;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v2, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/dashclock/api/ExtensionData;

    .line 55
    .local v0, "_arg0":Lcom/google/android/apps/dashclock/api/ExtensionData;
    :goto_22
    invoke-virtual {p0, v0}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub;->publishUpdate(Lcom/google/android/apps/dashclock/api/ExtensionData;)V

    goto :goto_8

    .line 53
    .end local v0    # "_arg0":Lcom/google/android/apps/dashclock/api/ExtensionData;
    :cond_26
    const/4 v0, 0x0

    .restart local v0    # "_arg0":Lcom/google/android/apps/dashclock/api/ExtensionData;
    goto :goto_22

    .line 60
    .end local v0    # "_arg0":Lcom/google/android/apps/dashclock/api/ExtensionData;
    :sswitch_28
    const-string v2, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p2}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "_arg0":[Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub;->addWatchContentUris([Ljava/lang/String;)V

    goto :goto_8

    .line 68
    .end local v0    # "_arg0":[Ljava/lang/String;
    :sswitch_35
    const-string v2, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_45

    move v0, v1

    .line 71
    .local v0, "_arg0":Z
    :goto_41
    invoke-virtual {p0, v0}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub;->setUpdateWhenScreenOn(Z)V

    goto :goto_8

    .line 70
    .end local v0    # "_arg0":Z
    :cond_45
    const/4 v0, 0x0

    goto :goto_41

    .line 76
    :sswitch_47
    const-string v2, "com.google.android.apps.dashclock.api.internal.IExtensionHost"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p0}, Lcom/google/android/apps/dashclock/api/internal/IExtensionHost$Stub;->removeAllWatchContentUris()V

    goto :goto_8

    .line 38
    :sswitch_data_50
    .sparse-switch
        0x1 -> :sswitch_f
        0x2 -> :sswitch_28
        0x3 -> :sswitch_35
        0x4 -> :sswitch_47
        0x5f4e5446 -> :sswitch_9
    .end sparse-switch
.end method

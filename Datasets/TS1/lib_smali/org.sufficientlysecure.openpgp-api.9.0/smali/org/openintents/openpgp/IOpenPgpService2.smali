.class public interface abstract Lorg/openintents/openpgp/IOpenPgpService2;
.super Ljava/lang/Object;
.source "IOpenPgpService2.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/IOpenPgpService2$Stub;
    }
.end annotation


# virtual methods
.method public abstract createOutputPipe(I)Landroid/os/ParcelFileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;I)Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

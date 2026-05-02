.class public interface abstract Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;
.super Ljava/lang/Object;
.source "Permiso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/greysonparrelli/permiso/Permiso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IOnPermissionResult"
.end annotation


# virtual methods
.method public abstract onPermissionResult(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)V
.end method

.method public varargs abstract onRationaleRequested(Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;[Ljava/lang/String;)V
.end method

.class public interface abstract Lzmq/Address$IZAddress;
.super Ljava/lang/Object;
.source "Address.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Address;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IZAddress"
.end annotation


# virtual methods
.method public abstract address()Ljava/net/SocketAddress;
.end method

.method public abstract resolve(Ljava/lang/String;Z)V
.end method

.method public abstract toString()Ljava/lang/String;
.end method

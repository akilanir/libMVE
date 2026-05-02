.class public interface abstract Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;
.super Ljava/lang/Object;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnObjectResultListener"
.end annotation


# virtual methods
.method public abstract manageResult(Ljava/lang/Object;)V
.end method

.method public abstract sendError(Ljava/lang/Exception;)V
.end method

.method public abstract sendErrorMessageNull()V
.end method

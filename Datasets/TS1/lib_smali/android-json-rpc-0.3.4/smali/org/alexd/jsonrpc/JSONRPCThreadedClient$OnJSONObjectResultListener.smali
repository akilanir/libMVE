.class public interface abstract Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;
.super Ljava/lang/Object;
.source "JSONRPCThreadedClient.java"

# interfaces
.implements Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnJSONObjectResultListener"
.end annotation


# virtual methods
.method public abstract manageResult(Lorg/json/JSONObject;)V
.end method

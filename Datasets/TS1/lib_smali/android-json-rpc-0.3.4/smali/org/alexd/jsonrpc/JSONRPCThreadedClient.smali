.class public abstract Lorg/alexd/jsonrpc/JSONRPCThreadedClient;
.super Ljava/lang/Object;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;,
        Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;
    }
.end annotation


# static fields
.field protected static final JSON_RESULT:Ljava/lang/String; = "result"


# instance fields
.field protected _debug:Z

.field protected connectionTimeout:I

.field protected soTimeout:I

.field protected version:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-boolean v0, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->_debug:Z

    .line 154
    iput v0, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->soTimeout:I

    iput v0, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->connectionTimeout:I

    .line 13
    return-void
.end method

.method public static create(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCParams$Versions;)Lorg/alexd/jsonrpc/JSONRPCClient;
    .registers 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "version"    # Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    .prologue
    .line 77
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCHttpClient;

    invoke-direct {v0, p0}, Lorg/alexd/jsonrpc/JSONRPCHttpClient;-><init>(Ljava/lang/String;)V

    .line 78
    .local v0, "client":Lorg/alexd/jsonrpc/JSONRPCClient;
    iput-object p1, v0, Lorg/alexd/jsonrpc/JSONRPCClient;->version:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    .line 79
    return-object v0
.end method

.method protected static getJSONArray([Ljava/lang/Object;)Lorg/json/JSONArray;
    .registers 6
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 101
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 102
    .local v0, "arr":Lorg/json/JSONArray;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_7
    if-lt v2, v3, :cond_a

    .line 110
    return-object v0

    .line 102
    :cond_a
    aget-object v1, p0, v2

    .line 103
    .local v1, "item":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 104
    check-cast v1, [Ljava/lang/Object;

    .end local v1    # "item":Ljava/lang/Object;
    invoke-static {v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->getJSONArray([Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 102
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 107
    .restart local v1    # "item":Ljava/lang/Object;
    :cond_22
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1f
.end method


# virtual methods
.method public call(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "onResultListener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 238
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$3;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$3;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;)V

    .line 253
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$4;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$4;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 268
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 269
    return-void
.end method

.method public varargs call(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 198
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;)V

    .line 213
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$2;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$2;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 228
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 229
    return-void
.end method

.method public callBoolean(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 639
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$19;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$19;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;)V

    .line 657
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$20;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$20;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 679
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 680
    return-void
.end method

.method public varargs callBoolean(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 588
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;)V

    .line 606
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$18;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$18;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 628
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 629
    return-void
.end method

.method public callDouble(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 744
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$23;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$23;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;)V

    .line 761
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$24;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$24;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 785
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 786
    return-void
.end method

.method public varargs callDouble(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 691
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$21;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$21;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;)V

    .line 709
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 732
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 733
    return-void
.end method

.method public callInt(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 415
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$11;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$11;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;)V

    .line 433
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 463
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 464
    return-void
.end method

.method public varargs callInt(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 361
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$9;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$9;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;)V

    .line 376
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 404
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 405
    return-void
.end method

.method public callJSONArray(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 937
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$31;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$31;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;)V

    .line 955
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$32;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$32;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 972
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 973
    return-void
.end method

.method public varargs callJSONArray(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 890
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$29;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$29;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener;)V

    .line 908
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$30;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$30;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 925
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 926
    return-void
.end method

.method public callJSONObject(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 796
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;)V

    .line 814
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 831
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 832
    return-void
.end method

.method public varargs callJSONObject(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 843
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$27;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$27;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;)V

    .line 861
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$28;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$28;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 878
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 879
    return-void
.end method

.method public callLong(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 534
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$15;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$15;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;)V

    .line 552
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$16;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$16;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 576
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 577
    return-void
.end method

.method public varargs callLong(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 475
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$13;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$13;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;)V

    .line 492
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 522
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 523
    return-void
.end method

.method public callString(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;Lorg/json/JSONObject;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;
    .param p3, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 320
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$7;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$7;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;)V

    .line 335
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V

    .line 350
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 351
    return-void
.end method

.method public varargs callString(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "listener"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;
    .param p3, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 279
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$5;

    invoke-direct {v0, p0, p2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$5;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;)V

    .line 294
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$6;

    invoke-direct {v1, p0, p1, p3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$6;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V

    .line 309
    .local v1, "thread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 310
    return-void
.end method

.method protected abstract doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation
.end method

.method protected doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 7
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 142
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 144
    .local v1, "jsonRequest":Lorg/json/JSONObject;
    :try_start_5
    const-string v2, "id"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->hashCode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 145
    const-string v2, "method"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 146
    const-string v2, "params"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_23
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_23} :catch_28

    .line 151
    invoke-virtual {p0, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2

    .line 148
    :catch_28
    move-exception v0

    .line 149
    .local v0, "e1":Lorg/json/JSONException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v3, "Invalid JSON request"

    invoke-direct {v2, v3, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;
    .registers 9
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 117
    .local v2, "jsonParams":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v4, p2

    if-lt v1, v4, :cond_2a

    .line 126
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 129
    .local v3, "jsonRequest":Lorg/json/JSONObject;
    :try_start_e
    const-string v4, "id"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->hashCode()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 130
    const-string v4, "method"

    invoke-virtual {v3, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 131
    const-string v4, "params"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_25} :catch_49

    .line 137
    invoke-virtual {p0, v3}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v4

    return-object v4

    .line 119
    .end local v3    # "jsonRequest":Lorg/json/JSONObject;
    :cond_2a
    aget-object v4, p2, v1

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 120
    aget-object v4, p2, v1

    check-cast v4, [Ljava/lang/Object;

    invoke-static {v4}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->getJSONArray([Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 122
    :cond_41
    aget-object v4, p2, v1

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 117
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 133
    .restart local v3    # "jsonRequest":Lorg/json/JSONObject;
    :catch_49
    move-exception v0

    .line 135
    .local v0, "e1":Lorg/json/JSONException;
    new-instance v4, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v5, "Invalid JSON request"

    invoke-direct {v4, v5, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getConnectionTimeout()I
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->connectionTimeout:I

    return v0
.end method

.method public getSoTimeout()I
    .registers 2

    .prologue
    .line 161
    iget v0, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->soTimeout:I

    return v0
.end method

.method public isDebug()Z
    .registers 2

    .prologue
    .line 95
    iget-boolean v0, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->_debug:Z

    return v0
.end method

.method public setConnectionTimeout(I)V
    .registers 2
    .param p1, "connectionTimeout"    # I

    .prologue
    .line 187
    iput p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->connectionTimeout:I

    .line 188
    return-void
.end method

.method public setDebug(Z)V
    .registers 2
    .param p1, "_debug"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->_debug:Z

    .line 89
    return-void
.end method

.method public setSoTimeout(I)V
    .registers 2
    .param p1, "soTimeout"    # I

    .prologue
    .line 170
    iput p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->soTimeout:I

    .line 171
    return-void
.end method

.class public final enum Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;
.super Ljava/lang/Enum;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "Description"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

.field public static final enum ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

.field public static final enum NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    const-string v1, "NORMAL_RESPONSE"

    invoke-direct {v0, v1, v2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 17
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v3}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 15
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    sget-object v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    aput-object v1, v0, v2

    sget-object v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    aput-object v1, v0, v3

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ENUM$VALUES:[Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    return-object v0
.end method

.method public static values()[Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ENUM$VALUES:[Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    array-length v1, v0

    new-array v2, v1, [Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method

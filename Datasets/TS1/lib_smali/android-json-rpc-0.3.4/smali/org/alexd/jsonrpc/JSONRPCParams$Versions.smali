.class public final enum Lorg/alexd/jsonrpc/JSONRPCParams$Versions;
.super Ljava/lang/Enum;
.source "JSONRPCParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/alexd/jsonrpc/JSONRPCParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Versions"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/alexd/jsonrpc/JSONRPCParams$Versions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

.field public static final enum VERSION_1:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

.field public static final enum VERSION_2:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    const-string v1, "VERSION_1"

    invoke-direct {v0, v1, v2}, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;->VERSION_1:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    .line 6
    new-instance v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    const-string v1, "VERSION_2"

    invoke-direct {v0, v1, v3}, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;->VERSION_2:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    .line 4
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    sget-object v1, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;->VERSION_1:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    aput-object v1, v0, v2

    sget-object v1, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;->VERSION_2:Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    aput-object v1, v0, v3

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;->ENUM$VALUES:[Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/alexd/jsonrpc/JSONRPCParams$Versions;
    .registers 2

    .prologue
    .line 1
    const-class v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    return-object v0
.end method

.method public static values()[Lorg/alexd/jsonrpc/JSONRPCParams$Versions;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/alexd/jsonrpc/JSONRPCParams$Versions;->ENUM$VALUES:[Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    array-length v1, v0

    new-array v2, v1, [Lorg/alexd/jsonrpc/JSONRPCParams$Versions;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method

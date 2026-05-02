.class final enum Lzmq/Req$ReqSession$State;
.super Ljava/lang/Enum;
.source "Req.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Req$ReqSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lzmq/Req$ReqSession$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lzmq/Req$ReqSession$State;

.field public static final enum BODY:Lzmq/Req$ReqSession$State;

.field public static final enum BOTTOM:Lzmq/Req$ReqSession$State;

.field public static final enum IDENTITY:Lzmq/Req$ReqSession$State;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 141
    new-instance v0, Lzmq/Req$ReqSession$State;

    const-string v1, "IDENTITY"

    invoke-direct {v0, v1, v2}, Lzmq/Req$ReqSession$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Req$ReqSession$State;->IDENTITY:Lzmq/Req$ReqSession$State;

    .line 142
    new-instance v0, Lzmq/Req$ReqSession$State;

    const-string v1, "BOTTOM"

    invoke-direct {v0, v1, v3}, Lzmq/Req$ReqSession$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Req$ReqSession$State;->BOTTOM:Lzmq/Req$ReqSession$State;

    .line 143
    new-instance v0, Lzmq/Req$ReqSession$State;

    const-string v1, "BODY"

    invoke-direct {v0, v1, v4}, Lzmq/Req$ReqSession$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Req$ReqSession$State;->BODY:Lzmq/Req$ReqSession$State;

    .line 140
    const/4 v0, 0x3

    new-array v0, v0, [Lzmq/Req$ReqSession$State;

    sget-object v1, Lzmq/Req$ReqSession$State;->IDENTITY:Lzmq/Req$ReqSession$State;

    aput-object v1, v0, v2

    sget-object v1, Lzmq/Req$ReqSession$State;->BOTTOM:Lzmq/Req$ReqSession$State;

    aput-object v1, v0, v3

    sget-object v1, Lzmq/Req$ReqSession$State;->BODY:Lzmq/Req$ReqSession$State;

    aput-object v1, v0, v4

    sput-object v0, Lzmq/Req$ReqSession$State;->$VALUES:[Lzmq/Req$ReqSession$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 140
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzmq/Req$ReqSession$State;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 140
    const-class v0, Lzmq/Req$ReqSession$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lzmq/Req$ReqSession$State;

    return-object v0
.end method

.method public static values()[Lzmq/Req$ReqSession$State;
    .registers 1

    .prologue
    .line 140
    sget-object v0, Lzmq/Req$ReqSession$State;->$VALUES:[Lzmq/Req$ReqSession$State;

    invoke-virtual {v0}, [Lzmq/Req$ReqSession$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Req$ReqSession$State;

    return-object v0
.end method

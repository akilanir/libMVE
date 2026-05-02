.class final enum Lzmq/Msg$Type;
.super Ljava/lang/Enum;
.source "Msg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Msg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lzmq/Msg$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lzmq/Msg$Type;

.field public static final enum DATA:Lzmq/Msg$Type;

.field public static final enum DELIMITER:Lzmq/Msg$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 28
    new-instance v0, Lzmq/Msg$Type;

    const-string v1, "DATA"

    invoke-direct {v0, v1, v2}, Lzmq/Msg$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Msg$Type;->DATA:Lzmq/Msg$Type;

    .line 29
    new-instance v0, Lzmq/Msg$Type;

    const-string v1, "DELIMITER"

    invoke-direct {v0, v1, v3}, Lzmq/Msg$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Msg$Type;->DELIMITER:Lzmq/Msg$Type;

    .line 27
    const/4 v0, 0x2

    new-array v0, v0, [Lzmq/Msg$Type;

    sget-object v1, Lzmq/Msg$Type;->DATA:Lzmq/Msg$Type;

    aput-object v1, v0, v2

    sget-object v1, Lzmq/Msg$Type;->DELIMITER:Lzmq/Msg$Type;

    aput-object v1, v0, v3

    sput-object v0, Lzmq/Msg$Type;->$VALUES:[Lzmq/Msg$Type;

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
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzmq/Msg$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lzmq/Msg$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lzmq/Msg$Type;

    return-object v0
.end method

.method public static values()[Lzmq/Msg$Type;
    .registers 1

    .prologue
    .line 27
    sget-object v0, Lzmq/Msg$Type;->$VALUES:[Lzmq/Msg$Type;

    invoke-virtual {v0}, [Lzmq/Msg$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Msg$Type;

    return-object v0
.end method

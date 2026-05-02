.class final enum Lzmq/Pipe$State;
.super Ljava/lang/Enum;
.source "Pipe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Pipe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lzmq/Pipe$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lzmq/Pipe$State;

.field public static final enum ACTIVE:Lzmq/Pipe$State;

.field public static final enum DELIMITED:Lzmq/Pipe$State;

.field public static final enum DOUBLE_TERMINATED:Lzmq/Pipe$State;

.field public static final enum PENDING:Lzmq/Pipe$State;

.field public static final enum TERMINATED:Lzmq/Pipe$State;

.field public static final enum TERMINATING:Lzmq/Pipe$State;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 73
    new-instance v0, Lzmq/Pipe$State;

    const-string v1, "ACTIVE"

    invoke-direct {v0, v1, v3}, Lzmq/Pipe$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    .line 74
    new-instance v0, Lzmq/Pipe$State;

    const-string v1, "DELIMITED"

    invoke-direct {v0, v1, v4}, Lzmq/Pipe$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Pipe$State;->DELIMITED:Lzmq/Pipe$State;

    .line 75
    new-instance v0, Lzmq/Pipe$State;

    const-string v1, "PENDING"

    invoke-direct {v0, v1, v5}, Lzmq/Pipe$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    .line 76
    new-instance v0, Lzmq/Pipe$State;

    const-string v1, "TERMINATING"

    invoke-direct {v0, v1, v6}, Lzmq/Pipe$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    .line 77
    new-instance v0, Lzmq/Pipe$State;

    const-string v1, "TERMINATED"

    invoke-direct {v0, v1, v7}, Lzmq/Pipe$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    .line 78
    new-instance v0, Lzmq/Pipe$State;

    const-string v1, "DOUBLE_TERMINATED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lzmq/Pipe$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Pipe$State;->DOUBLE_TERMINATED:Lzmq/Pipe$State;

    .line 72
    const/4 v0, 0x6

    new-array v0, v0, [Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    aput-object v1, v0, v3

    sget-object v1, Lzmq/Pipe$State;->DELIMITED:Lzmq/Pipe$State;

    aput-object v1, v0, v4

    sget-object v1, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    aput-object v1, v0, v5

    sget-object v1, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    aput-object v1, v0, v6

    sget-object v1, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lzmq/Pipe$State;->DOUBLE_TERMINATED:Lzmq/Pipe$State;

    aput-object v2, v0, v1

    sput-object v0, Lzmq/Pipe$State;->$VALUES:[Lzmq/Pipe$State;

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
    .line 72
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzmq/Pipe$State;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 72
    const-class v0, Lzmq/Pipe$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lzmq/Pipe$State;

    return-object v0
.end method

.method public static values()[Lzmq/Pipe$State;
    .registers 1

    .prologue
    .line 72
    sget-object v0, Lzmq/Pipe$State;->$VALUES:[Lzmq/Pipe$State;

    invoke-virtual {v0}, [Lzmq/Pipe$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Pipe$State;

    return-object v0
.end method

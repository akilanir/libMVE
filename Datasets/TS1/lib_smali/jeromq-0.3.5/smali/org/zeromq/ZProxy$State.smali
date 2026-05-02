.class public final enum Lorg/zeromq/ZProxy$State;
.super Ljava/lang/Enum;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/zeromq/ZProxy$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/zeromq/ZProxy$State;

.field public static final enum ALIVE:Lorg/zeromq/ZProxy$State;

.field public static final enum EXITED:Lorg/zeromq/ZProxy$State;

.field public static final enum PAUSED:Lorg/zeromq/ZProxy$State;

.field public static final enum STARTED:Lorg/zeromq/ZProxy$State;

.field public static final enum STOPPED:Lorg/zeromq/ZProxy$State;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 577
    new-instance v0, Lorg/zeromq/ZProxy$State;

    const-string v1, "ALIVE"

    invoke-direct {v0, v1, v2}, Lorg/zeromq/ZProxy$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$State;->ALIVE:Lorg/zeromq/ZProxy$State;

    .line 578
    new-instance v0, Lorg/zeromq/ZProxy$State;

    const-string v1, "STARTED"

    invoke-direct {v0, v1, v3}, Lorg/zeromq/ZProxy$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$State;->STARTED:Lorg/zeromq/ZProxy$State;

    .line 579
    new-instance v0, Lorg/zeromq/ZProxy$State;

    const-string v1, "PAUSED"

    invoke-direct {v0, v1, v4}, Lorg/zeromq/ZProxy$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$State;->PAUSED:Lorg/zeromq/ZProxy$State;

    .line 580
    new-instance v0, Lorg/zeromq/ZProxy$State;

    const-string v1, "STOPPED"

    invoke-direct {v0, v1, v5}, Lorg/zeromq/ZProxy$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$State;->STOPPED:Lorg/zeromq/ZProxy$State;

    .line 581
    new-instance v0, Lorg/zeromq/ZProxy$State;

    const-string v1, "EXITED"

    invoke-direct {v0, v1, v6}, Lorg/zeromq/ZProxy$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$State;->EXITED:Lorg/zeromq/ZProxy$State;

    .line 575
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/zeromq/ZProxy$State;

    sget-object v1, Lorg/zeromq/ZProxy$State;->ALIVE:Lorg/zeromq/ZProxy$State;

    aput-object v1, v0, v2

    sget-object v1, Lorg/zeromq/ZProxy$State;->STARTED:Lorg/zeromq/ZProxy$State;

    aput-object v1, v0, v3

    sget-object v1, Lorg/zeromq/ZProxy$State;->PAUSED:Lorg/zeromq/ZProxy$State;

    aput-object v1, v0, v4

    sget-object v1, Lorg/zeromq/ZProxy$State;->STOPPED:Lorg/zeromq/ZProxy$State;

    aput-object v1, v0, v5

    sget-object v1, Lorg/zeromq/ZProxy$State;->EXITED:Lorg/zeromq/ZProxy$State;

    aput-object v1, v0, v6

    sput-object v0, Lorg/zeromq/ZProxy$State;->$VALUES:[Lorg/zeromq/ZProxy$State;

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
    .line 575
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/zeromq/ZProxy$State;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 575
    const-class v0, Lorg/zeromq/ZProxy$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZProxy$State;

    return-object v0
.end method

.method public static values()[Lorg/zeromq/ZProxy$State;
    .registers 1

    .prologue
    .line 575
    sget-object v0, Lorg/zeromq/ZProxy$State;->$VALUES:[Lorg/zeromq/ZProxy$State;

    invoke-virtual {v0}, [Lorg/zeromq/ZProxy$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/zeromq/ZProxy$State;

    return-object v0
.end method

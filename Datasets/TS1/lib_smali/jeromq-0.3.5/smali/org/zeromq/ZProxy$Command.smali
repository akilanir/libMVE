.class public final enum Lorg/zeromq/ZProxy$Command;
.super Ljava/lang/Enum;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Command"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/zeromq/ZProxy$Command;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/zeromq/ZProxy$Command;

.field public static final enum CONFIG:Lorg/zeromq/ZProxy$Command;

.field public static final enum EXIT:Lorg/zeromq/ZProxy$Command;

.field public static final enum PAUSE:Lorg/zeromq/ZProxy$Command;

.field public static final enum RESTART:Lorg/zeromq/ZProxy$Command;

.field public static final enum START:Lorg/zeromq/ZProxy$Command;

.field public static final enum STATUS:Lorg/zeromq/ZProxy$Command;

.field public static final enum STOP:Lorg/zeromq/ZProxy$Command;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 556
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "START"

    invoke-direct {v0, v1, v3}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->START:Lorg/zeromq/ZProxy$Command;

    .line 557
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "PAUSE"

    invoke-direct {v0, v1, v4}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->PAUSE:Lorg/zeromq/ZProxy$Command;

    .line 558
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "STOP"

    invoke-direct {v0, v1, v5}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->STOP:Lorg/zeromq/ZProxy$Command;

    .line 559
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "RESTART"

    invoke-direct {v0, v1, v6}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->RESTART:Lorg/zeromq/ZProxy$Command;

    .line 560
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "EXIT"

    invoke-direct {v0, v1, v7}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->EXIT:Lorg/zeromq/ZProxy$Command;

    .line 561
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "STATUS"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->STATUS:Lorg/zeromq/ZProxy$Command;

    .line 562
    new-instance v0, Lorg/zeromq/ZProxy$Command;

    const-string v1, "CONFIG"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/zeromq/ZProxy$Command;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Command;->CONFIG:Lorg/zeromq/ZProxy$Command;

    .line 554
    const/4 v0, 0x7

    new-array v0, v0, [Lorg/zeromq/ZProxy$Command;

    sget-object v1, Lorg/zeromq/ZProxy$Command;->START:Lorg/zeromq/ZProxy$Command;

    aput-object v1, v0, v3

    sget-object v1, Lorg/zeromq/ZProxy$Command;->PAUSE:Lorg/zeromq/ZProxy$Command;

    aput-object v1, v0, v4

    sget-object v1, Lorg/zeromq/ZProxy$Command;->STOP:Lorg/zeromq/ZProxy$Command;

    aput-object v1, v0, v5

    sget-object v1, Lorg/zeromq/ZProxy$Command;->RESTART:Lorg/zeromq/ZProxy$Command;

    aput-object v1, v0, v6

    sget-object v1, Lorg/zeromq/ZProxy$Command;->EXIT:Lorg/zeromq/ZProxy$Command;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/zeromq/ZProxy$Command;->STATUS:Lorg/zeromq/ZProxy$Command;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/zeromq/ZProxy$Command;->CONFIG:Lorg/zeromq/ZProxy$Command;

    aput-object v2, v0, v1

    sput-object v0, Lorg/zeromq/ZProxy$Command;->$VALUES:[Lorg/zeromq/ZProxy$Command;

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
    .line 554
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/zeromq/ZProxy$Command;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 554
    const-class v0, Lorg/zeromq/ZProxy$Command;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZProxy$Command;

    return-object v0
.end method

.method public static values()[Lorg/zeromq/ZProxy$Command;
    .registers 1

    .prologue
    .line 554
    sget-object v0, Lorg/zeromq/ZProxy$Command;->$VALUES:[Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, [Lorg/zeromq/ZProxy$Command;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/zeromq/ZProxy$Command;

    return-object v0
.end method

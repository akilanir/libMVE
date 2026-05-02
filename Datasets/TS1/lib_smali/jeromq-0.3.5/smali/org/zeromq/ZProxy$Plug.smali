.class public final enum Lorg/zeromq/ZProxy$Plug;
.super Ljava/lang/Enum;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Plug"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/zeromq/ZProxy$Plug;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/zeromq/ZProxy$Plug;

.field public static final enum BACK:Lorg/zeromq/ZProxy$Plug;

.field public static final enum CAPTURE:Lorg/zeromq/ZProxy$Plug;

.field public static final enum FRONT:Lorg/zeromq/ZProxy$Plug;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 143
    new-instance v0, Lorg/zeromq/ZProxy$Plug;

    const-string v1, "FRONT"

    invoke-direct {v0, v1, v2}, Lorg/zeromq/ZProxy$Plug;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    .line 144
    new-instance v0, Lorg/zeromq/ZProxy$Plug;

    const-string v1, "BACK"

    invoke-direct {v0, v1, v3}, Lorg/zeromq/ZProxy$Plug;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    .line 145
    new-instance v0, Lorg/zeromq/ZProxy$Plug;

    const-string v1, "CAPTURE"

    invoke-direct {v0, v1, v4}, Lorg/zeromq/ZProxy$Plug;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/zeromq/ZProxy$Plug;->CAPTURE:Lorg/zeromq/ZProxy$Plug;

    .line 141
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/zeromq/ZProxy$Plug;

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    aput-object v1, v0, v2

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    aput-object v1, v0, v3

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->CAPTURE:Lorg/zeromq/ZProxy$Plug;

    aput-object v1, v0, v4

    sput-object v0, Lorg/zeromq/ZProxy$Plug;->$VALUES:[Lorg/zeromq/ZProxy$Plug;

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
    .line 141
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/zeromq/ZProxy$Plug;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 141
    const-class v0, Lorg/zeromq/ZProxy$Plug;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZProxy$Plug;

    return-object v0
.end method

.method public static values()[Lorg/zeromq/ZProxy$Plug;
    .registers 1

    .prologue
    .line 141
    sget-object v0, Lorg/zeromq/ZProxy$Plug;->$VALUES:[Lorg/zeromq/ZProxy$Plug;

    invoke-virtual {v0}, [Lorg/zeromq/ZProxy$Plug;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/zeromq/ZProxy$Plug;

    return-object v0
.end method

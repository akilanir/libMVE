.class public final enum Lzmq/Command$Type;
.super Ljava/lang/Enum;
.source "Command.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Command;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lzmq/Command$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lzmq/Command$Type;

.field public static final enum ACTIVATE_READ:Lzmq/Command$Type;

.field public static final enum ACTIVATE_WRITE:Lzmq/Command$Type;

.field public static final enum ATTACH:Lzmq/Command$Type;

.field public static final enum BIND:Lzmq/Command$Type;

.field public static final enum DONE:Lzmq/Command$Type;

.field public static final enum HICCUP:Lzmq/Command$Type;

.field public static final enum OWN:Lzmq/Command$Type;

.field public static final enum PIPE_TERM:Lzmq/Command$Type;

.field public static final enum PIPE_TERM_ACK:Lzmq/Command$Type;

.field public static final enum PLUG:Lzmq/Command$Type;

.field public static final enum REAP:Lzmq/Command$Type;

.field public static final enum REAPED:Lzmq/Command$Type;

.field public static final enum STOP:Lzmq/Command$Type;

.field public static final enum TERM:Lzmq/Command$Type;

.field public static final enum TERM_ACK:Lzmq/Command$Type;

.field public static final enum TERM_REQ:Lzmq/Command$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "STOP"

    invoke-direct {v0, v1, v3}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->STOP:Lzmq/Command$Type;

    .line 34
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "PLUG"

    invoke-direct {v0, v1, v4}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->PLUG:Lzmq/Command$Type;

    .line 36
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "OWN"

    invoke-direct {v0, v1, v5}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->OWN:Lzmq/Command$Type;

    .line 39
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "ATTACH"

    invoke-direct {v0, v1, v6}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->ATTACH:Lzmq/Command$Type;

    .line 42
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "BIND"

    invoke-direct {v0, v1, v7}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->BIND:Lzmq/Command$Type;

    .line 45
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "ACTIVATE_READ"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->ACTIVATE_READ:Lzmq/Command$Type;

    .line 48
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "ACTIVATE_WRITE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->ACTIVATE_WRITE:Lzmq/Command$Type;

    .line 52
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "HICCUP"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->HICCUP:Lzmq/Command$Type;

    .line 55
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "PIPE_TERM"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->PIPE_TERM:Lzmq/Command$Type;

    .line 57
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "PIPE_TERM_ACK"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->PIPE_TERM_ACK:Lzmq/Command$Type;

    .line 60
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "TERM_REQ"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->TERM_REQ:Lzmq/Command$Type;

    .line 62
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "TERM"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->TERM:Lzmq/Command$Type;

    .line 65
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "TERM_ACK"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->TERM_ACK:Lzmq/Command$Type;

    .line 68
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "REAP"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->REAP:Lzmq/Command$Type;

    .line 70
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "REAPED"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->REAPED:Lzmq/Command$Type;

    .line 73
    new-instance v0, Lzmq/Command$Type;

    const-string v1, "DONE"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lzmq/Command$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lzmq/Command$Type;->DONE:Lzmq/Command$Type;

    .line 29
    const/16 v0, 0x10

    new-array v0, v0, [Lzmq/Command$Type;

    sget-object v1, Lzmq/Command$Type;->STOP:Lzmq/Command$Type;

    aput-object v1, v0, v3

    sget-object v1, Lzmq/Command$Type;->PLUG:Lzmq/Command$Type;

    aput-object v1, v0, v4

    sget-object v1, Lzmq/Command$Type;->OWN:Lzmq/Command$Type;

    aput-object v1, v0, v5

    sget-object v1, Lzmq/Command$Type;->ATTACH:Lzmq/Command$Type;

    aput-object v1, v0, v6

    sget-object v1, Lzmq/Command$Type;->BIND:Lzmq/Command$Type;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lzmq/Command$Type;->ACTIVATE_READ:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lzmq/Command$Type;->ACTIVATE_WRITE:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lzmq/Command$Type;->HICCUP:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lzmq/Command$Type;->PIPE_TERM:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lzmq/Command$Type;->PIPE_TERM_ACK:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lzmq/Command$Type;->TERM_REQ:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lzmq/Command$Type;->TERM:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lzmq/Command$Type;->TERM_ACK:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lzmq/Command$Type;->REAP:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lzmq/Command$Type;->REAPED:Lzmq/Command$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lzmq/Command$Type;->DONE:Lzmq/Command$Type;

    aput-object v2, v0, v1

    sput-object v0, Lzmq/Command$Type;->$VALUES:[Lzmq/Command$Type;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzmq/Command$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lzmq/Command$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lzmq/Command$Type;

    return-object v0
.end method

.method public static values()[Lzmq/Command$Type;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lzmq/Command$Type;->$VALUES:[Lzmq/Command$Type;

    invoke-virtual {v0}, [Lzmq/Command$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Command$Type;

    return-object v0
.end method

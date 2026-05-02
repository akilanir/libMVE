.class public final enum Lorg/dmfs/rfc5545/Weekday;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/rfc5545/Weekday;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/rfc5545/Weekday;

.field public static final enum FR:Lorg/dmfs/rfc5545/Weekday;

.field public static final enum MO:Lorg/dmfs/rfc5545/Weekday;

.field public static final enum SA:Lorg/dmfs/rfc5545/Weekday;

.field public static final enum SU:Lorg/dmfs/rfc5545/Weekday;

.field public static final enum TH:Lorg/dmfs/rfc5545/Weekday;

.field public static final enum TU:Lorg/dmfs/rfc5545/Weekday;

.field public static final enum WE:Lorg/dmfs/rfc5545/Weekday;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "SU"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->SU:Lorg/dmfs/rfc5545/Weekday;

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "MO"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "TU"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->TU:Lorg/dmfs/rfc5545/Weekday;

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "WE"

    invoke-direct {v0, v1, v6}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->WE:Lorg/dmfs/rfc5545/Weekday;

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "TH"

    invoke-direct {v0, v1, v7}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->TH:Lorg/dmfs/rfc5545/Weekday;

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "FR"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->FR:Lorg/dmfs/rfc5545/Weekday;

    new-instance v0, Lorg/dmfs/rfc5545/Weekday;

    const-string v1, "SA"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/Weekday;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->SA:Lorg/dmfs/rfc5545/Weekday;

    const/4 v0, 0x7

    new-array v0, v0, [Lorg/dmfs/rfc5545/Weekday;

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->SU:Lorg/dmfs/rfc5545/Weekday;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->TU:Lorg/dmfs/rfc5545/Weekday;

    aput-object v1, v0, v5

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->WE:Lorg/dmfs/rfc5545/Weekday;

    aput-object v1, v0, v6

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->TH:Lorg/dmfs/rfc5545/Weekday;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/dmfs/rfc5545/Weekday;->FR:Lorg/dmfs/rfc5545/Weekday;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/dmfs/rfc5545/Weekday;->SA:Lorg/dmfs/rfc5545/Weekday;

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/rfc5545/Weekday;->$VALUES:[Lorg/dmfs/rfc5545/Weekday;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/Weekday;
    .registers 2

    const-class v0, Lorg/dmfs/rfc5545/Weekday;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/Weekday;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/rfc5545/Weekday;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/Weekday;->$VALUES:[Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0}, [Lorg/dmfs/rfc5545/Weekday;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/Weekday;

    return-object v0
.end method

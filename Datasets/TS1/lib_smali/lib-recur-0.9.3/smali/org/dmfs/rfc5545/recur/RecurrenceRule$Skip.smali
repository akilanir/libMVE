.class public final enum Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Skip"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

.field public static final enum BACKWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

.field public static final enum FORWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

.field public static final enum OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    const-string v1, "OMIT"

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    const-string v1, "BACKWARD"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->BACKWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    const-string v1, "FORWARD"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->FORWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    const/4 v0, 0x3

    new-array v0, v0, [Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    aput-object v1, v0, v2

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->BACKWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->FORWARD:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    aput-object v1, v0, v4

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->$VALUES:[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

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

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;
    .registers 2

    const-class v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->$VALUES:[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    invoke-virtual {v0}, [Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    return-object v0
.end method

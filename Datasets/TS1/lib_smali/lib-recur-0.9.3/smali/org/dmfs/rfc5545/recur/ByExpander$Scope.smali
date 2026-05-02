.class public final enum Lorg/dmfs/rfc5545/recur/ByExpander$Scope;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/ByExpander;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "Scope"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/rfc5545/recur/ByExpander$Scope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

.field public static final enum MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

.field public static final enum WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

.field public static final enum WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

.field public static final enum YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    const-string v1, "WEEKLY"

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    new-instance v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    const-string v1, "MONTHLY"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    new-instance v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    const-string v1, "WEEKLY_AND_MONTHLY"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    new-instance v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    const-string v1, "YEARLY"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    const/4 v0, 0x4

    new-array v0, v0, [Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    aput-object v1, v0, v2

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->YEARLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    aput-object v1, v0, v5

    sput-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->$VALUES:[Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

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

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/recur/ByExpander$Scope;
    .registers 2

    const-class v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/rfc5545/recur/ByExpander$Scope;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->$VALUES:[Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v0}, [Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    return-object v0
.end method

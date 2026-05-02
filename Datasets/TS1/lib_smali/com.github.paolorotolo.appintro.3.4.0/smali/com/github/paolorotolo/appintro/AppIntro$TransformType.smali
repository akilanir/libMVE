.class final enum Lcom/github/paolorotolo/appintro/AppIntro$TransformType;
.super Ljava/lang/Enum;
.source "AppIntro.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/paolorotolo/appintro/AppIntro;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TransformType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/github/paolorotolo/appintro/AppIntro$TransformType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

.field public static final enum DEPTH:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

.field public static final enum FADE:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

.field public static final enum FLOW:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

.field public static final enum SLIDE_OVER:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

.field public static final enum ZOOM:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 57
    new-instance v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    const-string v1, "FLOW"

    invoke-direct {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->FLOW:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    .line 58
    new-instance v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    const-string v1, "DEPTH"

    invoke-direct {v0, v1, v3}, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->DEPTH:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    .line 59
    new-instance v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    const-string v1, "ZOOM"

    invoke-direct {v0, v1, v4}, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->ZOOM:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    .line 60
    new-instance v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    const-string v1, "SLIDE_OVER"

    invoke-direct {v0, v1, v5}, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->SLIDE_OVER:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    .line 61
    new-instance v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    const-string v1, "FADE"

    invoke-direct {v0, v1, v6}, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->FADE:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    .line 56
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    sget-object v1, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->FLOW:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->DEPTH:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->ZOOM:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->SLIDE_OVER:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->FADE:Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->$VALUES:[Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

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
    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/paolorotolo/appintro/AppIntro$TransformType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 56
    const-class v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    return-object v0
.end method

.method public static values()[Lcom/github/paolorotolo/appintro/AppIntro$TransformType;
    .registers 1

    .prologue
    .line 56
    sget-object v0, Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->$VALUES:[Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    invoke-virtual {v0}, [Lcom/github/paolorotolo/appintro/AppIntro$TransformType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/paolorotolo/appintro/AppIntro$TransformType;

    return-object v0
.end method

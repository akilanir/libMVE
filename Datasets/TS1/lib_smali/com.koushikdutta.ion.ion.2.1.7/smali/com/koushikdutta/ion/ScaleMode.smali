.class final enum Lcom/koushikdutta/ion/ScaleMode;
.super Ljava/lang/Enum;
.source "ScaleMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/koushikdutta/ion/ScaleMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/koushikdutta/ion/ScaleMode;

.field public static final enum CenterCrop:Lcom/koushikdutta/ion/ScaleMode;

.field public static final enum CenterInside:Lcom/koushikdutta/ion/ScaleMode;

.field public static final enum FitCenter:Lcom/koushikdutta/ion/ScaleMode;

.field public static final enum FitXY:Lcom/koushikdutta/ion/ScaleMode;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/koushikdutta/ion/ScaleMode;

    const-string v1, "FitXY"

    invoke-direct {v0, v1, v2}, Lcom/koushikdutta/ion/ScaleMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitXY:Lcom/koushikdutta/ion/ScaleMode;

    .line 5
    new-instance v0, Lcom/koushikdutta/ion/ScaleMode;

    const-string v1, "CenterCrop"

    invoke-direct {v0, v1, v3}, Lcom/koushikdutta/ion/ScaleMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/koushikdutta/ion/ScaleMode;->CenterCrop:Lcom/koushikdutta/ion/ScaleMode;

    .line 6
    new-instance v0, Lcom/koushikdutta/ion/ScaleMode;

    const-string v1, "FitCenter"

    invoke-direct {v0, v1, v4}, Lcom/koushikdutta/ion/ScaleMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitCenter:Lcom/koushikdutta/ion/ScaleMode;

    .line 7
    new-instance v0, Lcom/koushikdutta/ion/ScaleMode;

    const-string v1, "CenterInside"

    invoke-direct {v0, v1, v5}, Lcom/koushikdutta/ion/ScaleMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/koushikdutta/ion/ScaleMode;->CenterInside:Lcom/koushikdutta/ion/ScaleMode;

    .line 3
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/koushikdutta/ion/ScaleMode;

    sget-object v1, Lcom/koushikdutta/ion/ScaleMode;->FitXY:Lcom/koushikdutta/ion/ScaleMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/koushikdutta/ion/ScaleMode;->CenterCrop:Lcom/koushikdutta/ion/ScaleMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/koushikdutta/ion/ScaleMode;->FitCenter:Lcom/koushikdutta/ion/ScaleMode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/koushikdutta/ion/ScaleMode;->CenterInside:Lcom/koushikdutta/ion/ScaleMode;

    aput-object v1, v0, v5

    sput-object v0, Lcom/koushikdutta/ion/ScaleMode;->$VALUES:[Lcom/koushikdutta/ion/ScaleMode;

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
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/koushikdutta/ion/ScaleMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/koushikdutta/ion/ScaleMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/ScaleMode;

    return-object v0
.end method

.method public static values()[Lcom/koushikdutta/ion/ScaleMode;
    .registers 1

    .prologue
    .line 3
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->$VALUES:[Lcom/koushikdutta/ion/ScaleMode;

    invoke-virtual {v0}, [Lcom/koushikdutta/ion/ScaleMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/koushikdutta/ion/ScaleMode;

    return-object v0
.end method

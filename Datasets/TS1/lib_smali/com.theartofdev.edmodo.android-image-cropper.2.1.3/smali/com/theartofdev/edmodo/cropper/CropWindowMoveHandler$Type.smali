.class public final enum Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
.super Ljava/lang/Enum;
.source "CropWindowMoveHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum BOTTOM:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum BOTTOM_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum BOTTOM_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum TOP:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum TOP_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

.field public static final enum TOP_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 686
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "TOP_LEFT"

    invoke-direct {v0, v1, v3}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 687
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "TOP_RIGHT"

    invoke-direct {v0, v1, v4}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 688
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "BOTTOM_LEFT"

    invoke-direct {v0, v1, v5}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 689
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "BOTTOM_RIGHT"

    invoke-direct {v0, v1, v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 690
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "LEFT"

    invoke-direct {v0, v1, v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 691
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "TOP"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 692
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "RIGHT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 693
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "BOTTOM"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 694
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    const-string v1, "CENTER"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 685
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    aput-object v2, v0, v1

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->$VALUES:[Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

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
    .line 685
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 685
    const-class v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    return-object v0
.end method

.method public static values()[Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    .registers 1

    .prologue
    .line 685
    sget-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->$VALUES:[Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    invoke-virtual {v0}, [Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    return-object v0
.end method

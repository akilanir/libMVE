.class public final enum Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;
.super Ljava/lang/Enum;
.source "CropImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/CropImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CropShape"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

.field public static final enum OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

.field public static final enum RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1331
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    const-string v1, "RECTANGLE"

    invoke-direct {v0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 1332
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    const-string v1, "OVAL"

    invoke-direct {v0, v1, v3}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 1330
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    aput-object v1, v0, v2

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    aput-object v1, v0, v3

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->$VALUES:[Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

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
    .line 1330
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1330
    const-class v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    return-object v0
.end method

.method public static values()[Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;
    .registers 1

    .prologue
    .line 1330
    sget-object v0, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->$VALUES:[Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    invoke-virtual {v0}, [Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    return-object v0
.end method

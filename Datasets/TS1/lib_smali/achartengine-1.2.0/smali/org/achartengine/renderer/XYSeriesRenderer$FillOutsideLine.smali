.class public Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
.super Ljava/lang/Object;
.source "XYSeriesRenderer.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/achartengine/renderer/XYSeriesRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FillOutsideLine"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;
    }
.end annotation


# instance fields
.field private mColor:I

.field private mFillRange:[I

.field private final mType:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;


# direct methods
.method public constructor <init>(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;)V
    .registers 5
    .param p1, "type"    # Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    .prologue
    const/4 v2, 0x0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const/16 v0, 0x7d

    const/16 v1, 0xc8

    invoke-static {v0, v2, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mColor:I

    .line 80
    iput-object p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mType:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    .line 81
    return-void
.end method


# virtual methods
.method public getColor()I
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mColor:I

    return v0
.end method

.method public getFillRange()[I
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mFillRange:[I

    return-object v0
.end method

.method public getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mType:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    return-object v0
.end method

.method public setColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 98
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mColor:I

    .line 99
    return-void
.end method

.method public setFillRange([I)V
    .registers 2
    .param p1, "range"    # [I

    .prologue
    .line 127
    iput-object p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->mFillRange:[I

    .line 128
    return-void
.end method

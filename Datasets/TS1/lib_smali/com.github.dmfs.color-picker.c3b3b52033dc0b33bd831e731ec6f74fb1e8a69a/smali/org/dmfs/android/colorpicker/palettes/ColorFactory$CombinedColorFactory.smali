.class public Lorg/dmfs/android/colorpicker/palettes/ColorFactory$CombinedColorFactory;
.super Ljava/lang/Object;
.source "ColorFactory.java"

# interfaces
.implements Lorg/dmfs/android/colorpicker/palettes/ColorFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/colorpicker/palettes/ColorFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CombinedColorFactory"
.end annotation


# instance fields
.field private final mFactories:[Lorg/dmfs/android/colorpicker/palettes/ColorFactory;


# direct methods
.method public varargs constructor <init>([Lorg/dmfs/android/colorpicker/palettes/ColorFactory;)V
    .registers 2
    .param p1, "factories"    # [Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .prologue
    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$CombinedColorFactory;->mFactories:[Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 142
    return-void
.end method


# virtual methods
.method public getColor(II)I
    .registers 7
    .param p1, "index"    # I
    .param p2, "count"    # I

    .prologue
    .line 148
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$CombinedColorFactory;->mFactories:[Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    array-length v0, v1

    .line 149
    .local v0, "factoryCount":I
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$CombinedColorFactory;->mFactories:[Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    mul-int v2, p1, v0

    div-int/2addr v2, p2

    aget-object v1, v1, v2

    div-int v2, p2, v0

    rem-int v2, p1, v2

    div-int v3, p2, v0

    invoke-interface {v1, v2, v3}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->getColor(II)I

    move-result v1

    return v1
.end method

.class Lcom/makeramen/RoundedTransformationBuilder$1;
.super Ljava/lang/Object;
.source "RoundedTransformationBuilder.java"

# interfaces
.implements Lcom/squareup/picasso/Transformation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/makeramen/RoundedTransformationBuilder;->build()Lcom/squareup/picasso/Transformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/makeramen/RoundedTransformationBuilder;


# direct methods
.method constructor <init>(Lcom/makeramen/RoundedTransformationBuilder;)V
    .registers 2
    .param p1, "this$0"    # Lcom/makeramen/RoundedTransformationBuilder;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .registers 3

    .prologue
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "r:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mCornerRadius:F
    invoke-static {v1}, Lcom/makeramen/RoundedTransformationBuilder;->access$300(Lcom/makeramen/RoundedTransformationBuilder;)F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "b:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 101
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mBorderWidth:F
    invoke-static {v1}, Lcom/makeramen/RoundedTransformationBuilder;->access$200(Lcom/makeramen/RoundedTransformationBuilder;)F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "c:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 102
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;
    invoke-static {v1}, Lcom/makeramen/RoundedTransformationBuilder;->access$100(Lcom/makeramen/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "o:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 103
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mOval:Z
    invoke-static {v1}, Lcom/makeramen/RoundedTransformationBuilder;->access$000(Lcom/makeramen/RoundedTransformationBuilder;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "source"    # Landroid/graphics/Bitmap;

    .prologue
    .line 86
    invoke-static {p1}, Lcom/makeramen/RoundedDrawable;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/makeramen/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 87
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;
    invoke-static {v2}, Lcom/makeramen/RoundedTransformationBuilder;->access$400(Lcom/makeramen/RoundedTransformationBuilder;)Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/makeramen/RoundedDrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 88
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mCornerRadius:F
    invoke-static {v2}, Lcom/makeramen/RoundedTransformationBuilder;->access$300(Lcom/makeramen/RoundedTransformationBuilder;)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/makeramen/RoundedDrawable;->setCornerRadius(F)Lcom/makeramen/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 89
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mBorderWidth:F
    invoke-static {v2}, Lcom/makeramen/RoundedTransformationBuilder;->access$200(Lcom/makeramen/RoundedTransformationBuilder;)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/makeramen/RoundedDrawable;->setBorderWidth(F)Lcom/makeramen/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 90
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;
    invoke-static {v2}, Lcom/makeramen/RoundedTransformationBuilder;->access$100(Lcom/makeramen/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/makeramen/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/RoundedTransformationBuilder;

    .line 91
    # getter for: Lcom/makeramen/RoundedTransformationBuilder;->mOval:Z
    invoke-static {v2}, Lcom/makeramen/RoundedTransformationBuilder;->access$000(Lcom/makeramen/RoundedTransformationBuilder;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/makeramen/RoundedDrawable;->setOval(Z)Lcom/makeramen/RoundedDrawable;

    move-result-object v1

    .line 92
    invoke-virtual {v1}, Lcom/makeramen/RoundedDrawable;->toBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 93
    .local v0, "transformed":Landroid/graphics/Bitmap;
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    .line 94
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 96
    :cond_43
    return-object v0
.end method

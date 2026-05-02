.class Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;
.super Lcom/koushikdutta/ion/ContextReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ContextReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImageViewContextReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/ContextReference",
        "<",
        "Landroid/widget/ImageView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 2
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 144
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/ContextReference;-><init>(Ljava/lang/Object;)V

    .line 145
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 3

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 158
    .local v0, "iv":Landroid/widget/ImageView;
    if-nez v0, :cond_a

    .line 159
    const/4 v1, 0x0

    .line 160
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    goto :goto_9
.end method

.method public isAlive()Ljava/lang/String;
    .registers 3

    .prologue
    .line 149
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 150
    .local v0, "iv":Landroid/widget/ImageView;
    if-nez v0, :cond_b

    .line 151
    const-string v1, "ImageView reference null"

    .line 152
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/ion/ContextReference$NormalContextReference;->isAlive(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

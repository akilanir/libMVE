.class public Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;
.super Ljava/lang/Object;
.source "DisplayConfiguration.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private center:Z

.field private rotation:I

.field private viewfinderSize:Lcom/journeyapps/barcodescanner/Size;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    const-class v0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "rotation"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->center:Z

    .line 24
    iput p1, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->rotation:I

    .line 25
    return-void
.end method

.method public constructor <init>(ILcom/journeyapps/barcodescanner/Size;)V
    .registers 4
    .param p1, "rotation"    # I
    .param p2, "viewfinderSize"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->center:Z

    .line 28
    iput p1, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->rotation:I

    .line 29
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    .line 30
    return-void
.end method

.method public static scale(Lcom/journeyapps/barcodescanner/Size;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;
    .registers 11
    .param p0, "from"    # Lcom/journeyapps/barcodescanner/Size;
    .param p1, "to"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x1

    const/4 v6, 0x2

    .line 135
    move-object v0, p0

    .line 137
    .local v0, "current":Lcom/journeyapps/barcodescanner/Size;
    invoke-virtual {p1, v0}, Lcom/journeyapps/barcodescanner/Size;->fitsIn(Lcom/journeyapps/barcodescanner/Size;)Z

    move-result v5

    if-nez v5, :cond_24

    .line 140
    :goto_a
    invoke-virtual {v0, v8, v6}, Lcom/journeyapps/barcodescanner/Size;->scale(II)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v1

    .line 141
    .local v1, "scaled150":Lcom/journeyapps/barcodescanner/Size;
    invoke-virtual {v0, v6, v7}, Lcom/journeyapps/barcodescanner/Size;->scale(II)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v2

    .line 142
    .local v2, "scaled200":Lcom/journeyapps/barcodescanner/Size;
    invoke-virtual {p1, v1}, Lcom/journeyapps/barcodescanner/Size;->fitsIn(Lcom/journeyapps/barcodescanner/Size;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 165
    .end local v1    # "scaled150":Lcom/journeyapps/barcodescanner/Size;
    .end local v2    # "scaled200":Lcom/journeyapps/barcodescanner/Size;
    :goto_18
    return-object v1

    .line 145
    .restart local v1    # "scaled150":Lcom/journeyapps/barcodescanner/Size;
    .restart local v2    # "scaled200":Lcom/journeyapps/barcodescanner/Size;
    :cond_19
    invoke-virtual {p1, v2}, Lcom/journeyapps/barcodescanner/Size;->fitsIn(Lcom/journeyapps/barcodescanner/Size;)Z

    move-result v5

    if-eqz v5, :cond_21

    move-object v1, v2

    .line 147
    goto :goto_18

    .line 150
    :cond_21
    move-object v0, v2

    .line 152
    goto :goto_a

    .line 169
    .end local v1    # "scaled150":Lcom/journeyapps/barcodescanner/Size;
    .end local v2    # "scaled200":Lcom/journeyapps/barcodescanner/Size;
    .local v3, "scaled50":Lcom/journeyapps/barcodescanner/Size;
    .local v4, "scaled66":Lcom/journeyapps/barcodescanner/Size;
    :cond_23
    move-object v0, v3

    .line 156
    .end local v3    # "scaled50":Lcom/journeyapps/barcodescanner/Size;
    .end local v4    # "scaled66":Lcom/journeyapps/barcodescanner/Size;
    :cond_24
    invoke-virtual {v0, v6, v8}, Lcom/journeyapps/barcodescanner/Size;->scale(II)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v4

    .line 157
    .restart local v4    # "scaled66":Lcom/journeyapps/barcodescanner/Size;
    invoke-virtual {v0, v7, v6}, Lcom/journeyapps/barcodescanner/Size;->scale(II)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v3

    .line 159
    .restart local v3    # "scaled50":Lcom/journeyapps/barcodescanner/Size;
    invoke-virtual {p1, v3}, Lcom/journeyapps/barcodescanner/Size;->fitsIn(Lcom/journeyapps/barcodescanner/Size;)Z

    move-result v5

    if-nez v5, :cond_23

    .line 160
    invoke-virtual {p1, v4}, Lcom/journeyapps/barcodescanner/Size;->fitsIn(Lcom/journeyapps/barcodescanner/Size;)Z

    move-result v5

    if-eqz v5, :cond_3a

    move-object v1, v4

    .line 162
    goto :goto_18

    :cond_3a
    move-object v1, v0

    .line 165
    goto :goto_18
.end method


# virtual methods
.method public getBestPreviewSize(Ljava/util/List;Z)Lcom/journeyapps/barcodescanner/Size;
    .registers 8
    .param p2, "isRotated"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/journeyapps/barcodescanner/Size;",
            ">;Z)",
            "Lcom/journeyapps/barcodescanner/Size;"
        }
    .end annotation

    .prologue
    .local p1, "sizes":Ljava/util/List;, "Ljava/util/List<Lcom/journeyapps/barcodescanner/Size;>;"
    const/4 v4, 0x0

    .line 77
    invoke-virtual {p0, p2}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->getDesiredPreviewSize(Z)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v0

    .line 79
    .local v0, "desired":Lcom/journeyapps/barcodescanner/Size;
    if-nez v0, :cond_e

    .line 80
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/journeyapps/barcodescanner/Size;

    .line 119
    :goto_d
    return-object v1

    .line 83
    :cond_e
    new-instance v1, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;

    invoke-direct {v1, p0, v0}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;-><init>(Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;Lcom/journeyapps/barcodescanner/Size;)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 116
    sget-object v1, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Viewfinder size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    sget-object v1, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Preview in order of preference: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/journeyapps/barcodescanner/Size;

    goto :goto_d
.end method

.method public getDesiredPreviewSize(Z)Lcom/journeyapps/barcodescanner/Size;
    .registers 3
    .param p1, "rotate"    # Z

    .prologue
    .line 45
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    if-nez v0, :cond_6

    .line 46
    const/4 v0, 0x0

    .line 50
    :goto_5
    return-object v0

    .line 47
    :cond_6
    if-eqz p1, :cond_f

    .line 48
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/Size;->rotate()Lcom/journeyapps/barcodescanner/Size;

    move-result-object v0

    goto :goto_5

    .line 50
    :cond_f
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    goto :goto_5
.end method

.method public getRotation()I
    .registers 2

    .prologue
    .line 33
    iget v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->rotation:I

    return v0
.end method

.method public getViewfinderSize()Lcom/journeyapps/barcodescanner/Size;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    return-object v0
.end method

.method public scalePreview(Lcom/journeyapps/barcodescanner/Size;)Landroid/graphics/Rect;
    .registers 10
    .param p1, "previewSize"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 185
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    invoke-static {p1, v3}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->scale(Lcom/journeyapps/barcodescanner/Size;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v2

    .line 186
    .local v2, "scaledPreview":Lcom/journeyapps/barcodescanner/Size;
    sget-object v3, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Preview: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; Scaled: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; Want: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    iget v3, v2, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget-object v4, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    iget v4, v4, Lcom/journeyapps/barcodescanner/Size;->width:I

    sub-int/2addr v3, v4

    div-int/lit8 v0, v3, 0x2

    .line 189
    .local v0, "dx":I
    iget v3, v2, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget-object v4, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->viewfinderSize:Lcom/journeyapps/barcodescanner/Size;

    iget v4, v4, Lcom/journeyapps/barcodescanner/Size;->height:I

    sub-int/2addr v3, v4

    div-int/lit8 v1, v3, 0x2

    .line 191
    .local v1, "dy":I
    new-instance v3, Landroid/graphics/Rect;

    neg-int v4, v0

    neg-int v5, v1

    iget v6, v2, Lcom/journeyapps/barcodescanner/Size;->width:I

    sub-int/2addr v6, v0

    iget v7, v2, Lcom/journeyapps/barcodescanner/Size;->height:I

    sub-int/2addr v7, v1

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v3
.end method

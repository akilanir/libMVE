.class Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;
.super Ljava/lang/Object;
.source "DisplayConfiguration.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->getBestPreviewSize(Ljava/util/List;Z)Lcom/journeyapps/barcodescanner/Size;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/journeyapps/barcodescanner/Size;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

.field final synthetic val$desired:Lcom/journeyapps/barcodescanner/Size;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;Lcom/journeyapps/barcodescanner/Size;)V
    .registers 3

    .prologue
    .line 83
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;->this$0:Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;

    iput-object p2, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;->val$desired:Lcom/journeyapps/barcodescanner/Size;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/journeyapps/barcodescanner/Size;Lcom/journeyapps/barcodescanner/Size;)I
    .registers 11
    .param p1, "a"    # Lcom/journeyapps/barcodescanner/Size;
    .param p2, "b"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 86
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;->val$desired:Lcom/journeyapps/barcodescanner/Size;

    invoke-static {p1, v6}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->scale(Lcom/journeyapps/barcodescanner/Size;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v1

    .line 87
    .local v1, "ascaled":Lcom/journeyapps/barcodescanner/Size;
    iget v6, v1, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget v7, p1, Lcom/journeyapps/barcodescanner/Size;->width:I

    sub-int v0, v6, v7

    .line 88
    .local v0, "aScale":I
    iget-object v6, p0, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;->val$desired:Lcom/journeyapps/barcodescanner/Size;

    invoke-static {p2, v6}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration;->scale(Lcom/journeyapps/barcodescanner/Size;Lcom/journeyapps/barcodescanner/Size;)Lcom/journeyapps/barcodescanner/Size;

    move-result-object v3

    .line 89
    .local v3, "bscaled":Lcom/journeyapps/barcodescanner/Size;
    iget v6, v3, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget v7, p2, Lcom/journeyapps/barcodescanner/Size;->width:I

    sub-int v2, v6, v7

    .line 91
    .local v2, "bScale":I
    if-nez v0, :cond_23

    if-nez v2, :cond_23

    .line 93
    invoke-virtual {p1, p2}, Lcom/journeyapps/barcodescanner/Size;->compareTo(Lcom/journeyapps/barcodescanner/Size;)I

    move-result v4

    .line 111
    :cond_22
    :goto_22
    return v4

    .line 94
    :cond_23
    if-eqz v0, :cond_22

    .line 97
    if-nez v2, :cond_29

    move v4, v5

    .line 99
    goto :goto_22

    .line 100
    :cond_29
    if-gez v0, :cond_32

    if-gez v2, :cond_32

    .line 102
    invoke-virtual {p1, p2}, Lcom/journeyapps/barcodescanner/Size;->compareTo(Lcom/journeyapps/barcodescanner/Size;)I

    move-result v4

    goto :goto_22

    .line 103
    :cond_32
    if-lez v0, :cond_3c

    if-lez v2, :cond_3c

    .line 105
    invoke-virtual {p1, p2}, Lcom/journeyapps/barcodescanner/Size;->compareTo(Lcom/journeyapps/barcodescanner/Size;)I

    move-result v4

    neg-int v4, v4

    goto :goto_22

    .line 106
    :cond_3c
    if-ltz v0, :cond_22

    move v4, v5

    .line 111
    goto :goto_22
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 83
    check-cast p1, Lcom/journeyapps/barcodescanner/Size;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/journeyapps/barcodescanner/Size;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/journeyapps/barcodescanner/camera/DisplayConfiguration$1;->compare(Lcom/journeyapps/barcodescanner/Size;Lcom/journeyapps/barcodescanner/Size;)I

    move-result v0

    return v0
.end method

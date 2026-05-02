.class Lcom/melnykov/fab/FloatingActionButton$1;
.super Landroid/view/ViewOutlineProvider;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melnykov/fab/FloatingActionButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method constructor <init>(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 181
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$1;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "outline"    # Landroid/graphics/Outline;

    .prologue
    const/4 v3, 0x0

    .line 184
    iget-object v2, p0, Lcom/melnykov/fab/FloatingActionButton$1;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    iget-object v1, p0, Lcom/melnykov/fab/FloatingActionButton$1;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    # getter for: Lcom/melnykov/fab/FloatingActionButton;->mType:I
    invoke-static {v1}, Lcom/melnykov/fab/FloatingActionButton;->access$000(Lcom/melnykov/fab/FloatingActionButton;)I

    move-result v1

    if-nez v1, :cond_15

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_size_normal:I

    :goto_d
    # invokes: Lcom/melnykov/fab/FloatingActionButton;->getDimension(I)I
    invoke-static {v2, v1}, Lcom/melnykov/fab/FloatingActionButton;->access$100(Lcom/melnykov/fab/FloatingActionButton;I)I

    move-result v0

    .line 185
    .local v0, "size":I
    invoke-virtual {p2, v3, v3, v0, v0}, Landroid/graphics/Outline;->setOval(IIII)V

    .line 186
    return-void

    .line 184
    .end local v0    # "size":I
    :cond_15
    sget v1, Lcom/melnykov/fab/R$dimen;->fab_size_mini:I

    goto :goto_d
.end method

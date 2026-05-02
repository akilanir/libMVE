.class Lcom/gc/materialdesign/widgets/ColorSelector$3;
.super Ljava/lang/Object;
.source "ColorSelector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gc/materialdesign/widgets/ColorSelector;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gc/materialdesign/widgets/ColorSelector;


# direct methods
.method constructor <init>(Lcom/gc/materialdesign/widgets/ColorSelector;)V
    .registers 2

    .prologue
    .line 74
    iput-object p1, p0, Lcom/gc/materialdesign/widgets/ColorSelector$3;->this$0:Lcom/gc/materialdesign/widgets/ColorSelector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 78
    iget-object v1, p0, Lcom/gc/materialdesign/widgets/ColorSelector$3;->this$0:Lcom/gc/materialdesign/widgets/ColorSelector;

    iget-object v1, v1, Lcom/gc/materialdesign/widgets/ColorSelector;->colorView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .local v0, "params":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v1, p0, Lcom/gc/materialdesign/widgets/ColorSelector$3;->this$0:Lcom/gc/materialdesign/widgets/ColorSelector;

    iget-object v1, v1, Lcom/gc/materialdesign/widgets/ColorSelector;->colorView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 80
    iget-object v1, p0, Lcom/gc/materialdesign/widgets/ColorSelector$3;->this$0:Lcom/gc/materialdesign/widgets/ColorSelector;

    iget-object v1, v1, Lcom/gc/materialdesign/widgets/ColorSelector;->colorView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    return-void
.end method

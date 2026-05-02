.class Lcom/rey/material/widget/Spinner$2;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/Spinner;->showPopup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/Spinner;

.field final synthetic val$lv:Lcom/rey/material/widget/ListView;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/ListView;)V
    .registers 3

    .prologue
    .line 895
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$2;->this$0:Lcom/rey/material/widget/Spinner;

    iput-object p2, p0, Lcom/rey/material/widget/Spinner$2;->val$lv:Lcom/rey/material/widget/ListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 898
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$2;->val$lv:Lcom/rey/material/widget/ListView;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 899
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$2;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mArrowDrawable:Lcom/rey/material/drawable/ArrowDrawable;
    invoke-static {v0}, Lcom/rey/material/widget/Spinner;->access$300(Lcom/rey/material/widget/Spinner;)Lcom/rey/material/drawable/ArrowDrawable;

    move-result-object v0

    sget v1, Lcom/rey/material/drawable/ArrowDrawable;->MODE_UP:I

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/drawable/ArrowDrawable;->setMode(IZ)V

    .line 900
    return v2
.end method

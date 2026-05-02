.class Landroid/support/design/widget/CollapsingToolbarLayout$2;
.super Ljava/lang/Object;
.source "CollapsingToolbarLayout.java"

# interfaces
.implements Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/CollapsingToolbarLayout;->animateScrim(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/CollapsingToolbarLayout;


# direct methods
.method constructor <init>(Landroid/support/design/widget/CollapsingToolbarLayout;)V
    .registers 2

    .prologue
    .line 395
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/support/design/widget/ValueAnimatorCompat;)V
    .registers 5
    .param p1, "animator"    # Landroid/support/design/widget/ValueAnimatorCompat;

    .prologue
    .line 398
    invoke-virtual {p1}, Landroid/support/design/widget/ValueAnimatorCompat;->getAnimatedIntValue()I

    move-result v1

    .line 399
    .local v1, "newAlpha":I
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    # getter for: Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I
    invoke-static {v2}, Landroid/support/design/widget/CollapsingToolbarLayout;->access$200(Landroid/support/design/widget/CollapsingToolbarLayout;)I

    move-result v2

    if-eq v1, v2, :cond_2f

    .line 400
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    # getter for: Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;
    invoke-static {v2}, Landroid/support/design/widget/CollapsingToolbarLayout;->access$300(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 401
    .local v0, "contentScrim":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_25

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    # getter for: Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;
    invoke-static {v2}, Landroid/support/design/widget/CollapsingToolbarLayout;->access$400(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    if-eqz v2, :cond_25

    .line 402
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    # getter for: Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;
    invoke-static {v2}, Landroid/support/design/widget/CollapsingToolbarLayout;->access$400(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 404
    :cond_25
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    # setter for: Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I
    invoke-static {v2, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->access$202(Landroid/support/design/widget/CollapsingToolbarLayout;I)I

    .line 405
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout$2;->this$0:Landroid/support/design/widget/CollapsingToolbarLayout;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 407
    .end local v0    # "contentScrim":Landroid/graphics/drawable/Drawable;
    :cond_2f
    return-void
.end method

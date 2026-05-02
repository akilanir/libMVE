.class Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$2;
.super Ljava/lang/Object;
.source "DatePickerDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;->animIn(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;Landroid/view/View;)V
    .registers 3

    .prologue
    .line 324
    iput-object p1, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$2;->this$1:Lcom/rey/material/app/DatePickerDialog$DatePickerLayout;

    iput-object p2, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$2;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 332
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 336
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 327
    iget-object v0, p0, Lcom/rey/material/app/DatePickerDialog$DatePickerLayout$2;->val$v:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 328
    return-void
.end method

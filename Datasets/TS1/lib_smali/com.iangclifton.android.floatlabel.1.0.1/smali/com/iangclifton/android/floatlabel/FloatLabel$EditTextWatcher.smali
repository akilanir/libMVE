.class Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;
.super Ljava/lang/Object;
.source "FloatLabel.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/iangclifton/android/floatlabel/FloatLabel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EditTextWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;


# direct methods
.method private constructor <init>(Lcom/iangclifton/android/floatlabel/FloatLabel;)V
    .registers 2

    .prologue
    .line 448
    iput-object p1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/iangclifton/android/floatlabel/FloatLabel;Lcom/iangclifton/android/floatlabel/FloatLabel$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/iangclifton/android/floatlabel/FloatLabel;
    .param p2, "x1"    # Lcom/iangclifton/android/floatlabel/FloatLabel$1;

    .prologue
    .line 448
    invoke-direct {p0, p1}, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;-><init>(Lcom/iangclifton/android/floatlabel/FloatLabel;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 4
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 451
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    if-nez v0, :cond_24

    .line 453
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    # getter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z
    invoke-static {v0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$200(Lcom/iangclifton/android/floatlabel/FloatLabel;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 454
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    # getter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;
    invoke-static {v0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$400(Lcom/iangclifton/android/floatlabel/FloatLabel;)Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    move-result-object v0

    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    # getter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$300(Lcom/iangclifton/android/floatlabel/FloatLabel;)Landroid/widget/TextView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;->onHideLabel(Landroid/view/View;)V

    .line 455
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    const/4 v1, 0x0

    # setter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z
    invoke-static {v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$202(Lcom/iangclifton/android/floatlabel/FloatLabel;Z)Z

    .line 462
    :cond_23
    :goto_23
    return-void

    .line 457
    :cond_24
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    # getter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z
    invoke-static {v0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$200(Lcom/iangclifton/android/floatlabel/FloatLabel;)Z

    move-result v0

    if-nez v0, :cond_23

    .line 459
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    const/4 v1, 0x1

    # setter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelShowing:Z
    invoke-static {v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$202(Lcom/iangclifton/android/floatlabel/FloatLabel;Z)Z

    .line 460
    iget-object v0, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    # getter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabelAnimator:Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;
    invoke-static {v0}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$400(Lcom/iangclifton/android/floatlabel/FloatLabel;)Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;

    move-result-object v0

    iget-object v1, p0, Lcom/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher;->this$0:Lcom/iangclifton/android/floatlabel/FloatLabel;

    # getter for: Lcom/iangclifton/android/floatlabel/FloatLabel;->mLabel:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/iangclifton/android/floatlabel/FloatLabel;->access$300(Lcom/iangclifton/android/floatlabel/FloatLabel;)Landroid/widget/TextView;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/iangclifton/android/floatlabel/FloatLabel$LabelAnimator;->onDisplayLabel(Landroid/view/View;)V

    goto :goto_23
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 467
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 472
    return-void
.end method

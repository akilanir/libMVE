.class Lcom/rey/material/widget/EditText$InternalEditText;
.super Landroid/widget/EditText;
.source "EditText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/EditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalEditText"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/EditText;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3694
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    .line 3695
    invoke-direct {p0, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 3696
    return-void
.end method

.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 3698
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    .line 3699
    invoke-direct {p0, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3700
    return-void
.end method

.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I

    .prologue
    .line 3702
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    .line 3703
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3704
    return-void
.end method


# virtual methods
.method public onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 3
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 3729
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 3730
    return-void
.end method

.method public onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 3734
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 3735
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 3
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 3739
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method public onEditorAction(I)V
    .registers 3
    .param p1, "actionCode"    # I

    .prologue
    .line 3744
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onEditorAction(I)V

    .line 3745
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3749
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyMultiple(IILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3754
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/EditText;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3759
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3764
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3769
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onSelectionChanged(II)V
    .registers 4
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 3774
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onSelectionChanged(II)V

    .line 3775
    return-void
.end method

.method public refreshDrawableState()V
    .registers 2

    .prologue
    .line 3718
    invoke-super {p0}, Landroid/widget/EditText;->refreshDrawableState()V

    .line 3720
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_10

    .line 3721
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->refreshDrawableState()V

    .line 3723
    :cond_10
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_1d

    .line 3724
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalEditText;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->refreshDrawableState()V

    .line 3725
    :cond_1d
    return-void
.end method

.method public setTextAppearance(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 3708
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 3709
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 3713
    invoke-static {p0, p2}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 3714
    return-void
.end method

.method superOnCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 2
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 3778
    invoke-super {p0, p1}, Landroid/widget/EditText;->onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 3779
    return-void
.end method

.method superOnCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 4
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 3782
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_9

    .line 3783
    invoke-super {p0, p1}, Landroid/widget/EditText;->onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 3784
    :cond_9
    return-void
.end method

.method superOnCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 3
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 3787
    invoke-super {p0, p1}, Landroid/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method superOnEditorAction(I)V
    .registers 2
    .param p1, "actionCode"    # I

    .prologue
    .line 3791
    invoke-super {p0, p1}, Landroid/widget/EditText;->onEditorAction(I)V

    .line 3792
    return-void
.end method

.method superOnKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3795
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyMultiple(IILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3799
    invoke-super {p0, p1, p2, p3}, Landroid/widget/EditText;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3803
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3807
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3811
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnSelectionChanged(II)V
    .registers 3
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 3815
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onSelectionChanged(II)V

    .line 3816
    return-void
.end method

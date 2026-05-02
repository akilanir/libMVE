.class Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;
.super Landroid/widget/AutoCompleteTextView;
.source "EditText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/EditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalAutoCompleteTextView"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/EditText;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3821
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    .line 3822
    invoke-direct {p0, p2}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;)V

    .line 3823
    return-void
.end method

.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 3825
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    .line 3826
    invoke-direct {p0, p2, p3}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3827
    return-void
.end method

.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I

    .prologue
    .line 3829
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    .line 3830
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/AutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3831
    return-void
.end method


# virtual methods
.method protected convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "selectedItem"    # Ljava/lang/Object;

    .prologue
    .line 3906
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method protected getFilter()Landroid/widget/Filter;
    .registers 2

    .prologue
    .line 3921
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    return-object v0
.end method

.method public onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 3
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 3856
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 3857
    return-void
.end method

.method public onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 3861
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 3862
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 3
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 3866
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method public onEditorAction(I)V
    .registers 3
    .param p1, "actionCode"    # I

    .prologue
    .line 3871
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onEditorAction(I)V

    .line 3872
    return-void
.end method

.method public onFilterComplete(I)V
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 3926
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onFilterComplete(I)V

    .line 3927
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3876
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

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
    .line 3881
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/EditText;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3886
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3891
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3896
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onSelectionChanged(II)V
    .registers 4
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 3901
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onSelectionChanged(II)V

    .line 3902
    return-void
.end method

.method protected performFiltering(Ljava/lang/CharSequence;I)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "keyCode"    # I

    .prologue
    .line 3911
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->performFiltering(Ljava/lang/CharSequence;I)V

    .line 3912
    return-void
.end method

.method public refreshDrawableState()V
    .registers 2

    .prologue
    .line 3845
    invoke-super {p0}, Landroid/widget/AutoCompleteTextView;->refreshDrawableState()V

    .line 3847
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_10

    .line 3848
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->refreshDrawableState()V

    .line 3850
    :cond_10
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_1d

    .line 3851
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->refreshDrawableState()V

    .line 3852
    :cond_1d
    return-void
.end method

.method protected replaceText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 3916
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->replaceText(Ljava/lang/CharSequence;)V

    .line 3917
    return-void
.end method

.method public setTextAppearance(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 3835
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 3836
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 3840
    invoke-static {p0, p2}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 3841
    return-void
.end method

.method superConvertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "selectedItem"    # Ljava/lang/Object;

    .prologue
    .line 3971
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method superGetFilter()Landroid/widget/Filter;
    .registers 2

    .prologue
    .line 3983
    invoke-super {p0}, Landroid/widget/AutoCompleteTextView;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    return-object v0
.end method

.method superOnCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 2
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 3930
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 3931
    return-void
.end method

.method superOnCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 4
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 3934
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_9

    .line 3935
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 3936
    :cond_9
    return-void
.end method

.method superOnCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 3
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 3939
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method superOnEditorAction(I)V
    .registers 2
    .param p1, "actionCode"    # I

    .prologue
    .line 3943
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onEditorAction(I)V

    .line 3944
    return-void
.end method

.method superOnFilterComplete(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 3967
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->onFilterComplete(I)V

    .line 3968
    return-void
.end method

.method superOnKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3947
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyMultiple(IILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3951
    invoke-super {p0, p1, p2, p3}, Landroid/widget/AutoCompleteTextView;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3955
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3959
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 3963
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnSelectionChanged(II)V
    .registers 3
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 3987
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->onSelectionChanged(II)V

    .line 3988
    return-void
.end method

.method superPerformFiltering(Ljava/lang/CharSequence;I)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "keyCode"    # I

    .prologue
    .line 3975
    invoke-super {p0, p1, p2}, Landroid/widget/AutoCompleteTextView;->performFiltering(Ljava/lang/CharSequence;I)V

    .line 3976
    return-void
.end method

.method superReplaceText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 3979
    invoke-super {p0, p1}, Landroid/widget/AutoCompleteTextView;->replaceText(Ljava/lang/CharSequence;)V

    .line 3980
    return-void
.end method

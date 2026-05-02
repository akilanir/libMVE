.class Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;
.super Landroid/widget/MultiAutoCompleteTextView;
.source "EditText.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/EditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalMultiAutoCompleteTextView"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/EditText;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 3993
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    .line 3994
    invoke-direct {p0, p2}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;)V

    .line 3995
    return-void
.end method

.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 3997
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    .line 3998
    invoke-direct {p0, p2, p3}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3999
    return-void
.end method

.method public constructor <init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I

    .prologue
    .line 4001
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    .line 4002
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4003
    return-void
.end method


# virtual methods
.method protected convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "selectedItem"    # Ljava/lang/Object;

    .prologue
    .line 4083
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method protected getFilter()Landroid/widget/Filter;
    .registers 2

    .prologue
    .line 4098
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    return-object v0
.end method

.method public onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 3
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 4028
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 4029
    return-void
.end method

.method public onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 4033
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 4034
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 3
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 4038
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method public onEditorAction(I)V
    .registers 3
    .param p1, "actionCode"    # I

    .prologue
    .line 4043
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onEditorAction(I)V

    .line 4044
    return-void
.end method

.method public onFilterComplete(I)V
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 4078
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->onFilterComplete(I)V

    .line 4079
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4048
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

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
    .line 4053
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/EditText;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4058
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4063
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4068
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onSelectionChanged(II)V
    .registers 4
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 4073
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->onSelectionChanged(II)V

    .line 4074
    return-void
.end method

.method protected performFiltering(Ljava/lang/CharSequence;I)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "keyCode"    # I

    .prologue
    .line 4088
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText;->performFiltering(Ljava/lang/CharSequence;I)V

    .line 4089
    return-void
.end method

.method protected performFiltering(Ljava/lang/CharSequence;III)V
    .registers 6
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "keyCode"    # I

    .prologue
    .line 4103
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/rey/material/widget/EditText;->performFiltering(Ljava/lang/CharSequence;III)V

    .line 4104
    return-void
.end method

.method public refreshDrawableState()V
    .registers 2

    .prologue
    .line 4017
    invoke-super {p0}, Landroid/widget/MultiAutoCompleteTextView;->refreshDrawableState()V

    .line 4019
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_10

    .line 4020
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->refreshDrawableState()V

    .line 4022
    :cond_10
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_1d

    .line 4023
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->refreshDrawableState()V

    .line 4024
    :cond_1d
    return-void
.end method

.method protected replaceText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 4093
    iget-object v0, p0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->this$0:Lcom/rey/material/widget/EditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText;->replaceText(Ljava/lang/CharSequence;)V

    .line 4094
    return-void
.end method

.method public setTextAppearance(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 4007
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 4008
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 4012
    invoke-static {p0, p2}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 4013
    return-void
.end method

.method superConvertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "selectedItem"    # Ljava/lang/Object;

    .prologue
    .line 4148
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method superGetFilter()Landroid/widget/Filter;
    .registers 2

    .prologue
    .line 4160
    invoke-super {p0}, Landroid/widget/MultiAutoCompleteTextView;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    return-object v0
.end method

.method superOnCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 2
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 4107
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 4108
    return-void
.end method

.method superOnCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 4
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 4111
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_9

    .line 4112
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 4113
    :cond_9
    return-void
.end method

.method superOnCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 3
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 4116
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    return-object v0
.end method

.method superOnEditorAction(I)V
    .registers 2
    .param p1, "actionCode"    # I

    .prologue
    .line 4120
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->onEditorAction(I)V

    .line 4121
    return-void
.end method

.method superOnFilterComplete(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 4144
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->onFilterComplete(I)V

    .line 4145
    return-void
.end method

.method superOnKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4124
    invoke-super {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyMultiple(IILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4128
    invoke-super {p0, p1, p2, p3}, Landroid/widget/MultiAutoCompleteTextView;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4132
    invoke-super {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4136
    invoke-super {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4140
    invoke-super {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method superOnSelectionChanged(II)V
    .registers 3
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 4168
    invoke-super {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;->onSelectionChanged(II)V

    .line 4169
    return-void
.end method

.method superPerformFiltering(Ljava/lang/CharSequence;I)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "keyCode"    # I

    .prologue
    .line 4152
    invoke-super {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;->performFiltering(Ljava/lang/CharSequence;I)V

    .line 4153
    return-void
.end method

.method superPerformFiltering(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "keyCode"    # I

    .prologue
    .line 4164
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/MultiAutoCompleteTextView;->performFiltering(Ljava/lang/CharSequence;III)V

    .line 4165
    return-void
.end method

.method superReplaceText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 4156
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->replaceText(Ljava/lang/CharSequence;)V

    .line 4157
    return-void
.end method

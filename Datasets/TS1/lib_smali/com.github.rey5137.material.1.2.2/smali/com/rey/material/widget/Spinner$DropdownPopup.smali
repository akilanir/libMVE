.class Lcom/rey/material/widget/Spinner$DropdownPopup;
.super Lcom/rey/material/widget/ListPopupWindow;
.source "Spinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Spinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropdownPopup"
.end annotation


# instance fields
.field private layoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

.field private mHintText:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/rey/material/widget/Spinner;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/Spinner;Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I
    .param p5, "defStyleRes"    # I

    .prologue
    .line 1192
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    .line 1193
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/rey/material/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 1181
    new-instance v0, Lcom/rey/material/widget/Spinner$DropdownPopup$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/Spinner$DropdownPopup$1;-><init>(Lcom/rey/material/widget/Spinner$DropdownPopup;)V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->layoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 1195
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setAnchorView(Landroid/view/View;)V

    .line 1196
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setModal(Z)V

    .line 1197
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setPromptPosition(I)V

    .line 1199
    new-instance v0, Lcom/rey/material/widget/Spinner$DropdownPopup$2;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/widget/Spinner$DropdownPopup$2;-><init>(Lcom/rey/material/widget/Spinner$DropdownPopup;Lcom/rey/material/widget/Spinner;)V

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 1216
    return-void
.end method

.method static synthetic access$601(Lcom/rey/material/widget/Spinner$DropdownPopup;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner$DropdownPopup;

    .prologue
    .line 1175
    invoke-super {p0}, Lcom/rey/material/widget/ListPopupWindow;->show()V

    return-void
.end method

.method static synthetic access$700(Lcom/rey/material/widget/Spinner$DropdownPopup;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner$DropdownPopup;

    .prologue
    .line 1175
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->layoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    return-object v0
.end method

.method static synthetic access$900(Lcom/rey/material/widget/Spinner$DropdownPopup;)Lcom/rey/material/widget/Spinner$DropDownAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/Spinner$DropdownPopup;

    .prologue
    .line 1175
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->mAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    return-object v0
.end method


# virtual methods
.method computeContentWidth()V
    .registers 11

    .prologue
    .line 1240
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1241
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x0

    .line 1242
    .local v3, "hOffset":I
    if-eqz v0, :cond_95

    .line 1243
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 1244
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mIsRtl:Z
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1100(Lcom/rey/material/widget/Spinner;)Z

    move-result v7

    if-eqz v7, :cond_8b

    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v7

    iget v3, v7, Landroid/graphics/Rect;->right:I

    .line 1248
    :goto_20
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v7}, Lcom/rey/material/widget/Spinner;->getPaddingLeft()I

    move-result v4

    .line 1249
    .local v4, "spinnerPaddingLeft":I
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v7}, Lcom/rey/material/widget/Spinner;->getPaddingRight()I

    move-result v5

    .line 1250
    .local v5, "spinnerPaddingRight":I
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v7}, Lcom/rey/material/widget/Spinner;->getWidth()I

    move-result v6

    .line 1252
    .local v6, "spinnerWidth":I
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mDropDownWidth:I
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1200(Lcom/rey/material/widget/Spinner;)I

    move-result v7

    const/4 v8, -0x2

    if-ne v7, v8, :cond_a8

    .line 1253
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    iget-object v8, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->mAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    # invokes: Lcom/rey/material/widget/Spinner;->measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    invoke-static {v7, v8, v9}, Lcom/rey/material/widget/Spinner;->access$1300(Lcom/rey/material/widget/Spinner;Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v1

    .line 1254
    .local v1, "contentWidth":I
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v7}, Lcom/rey/material/widget/Spinner;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v8}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v8

    iget-object v8, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v8}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->right:I

    sub-int v2, v7, v8

    .line 1255
    .local v2, "contentWidthLimit":I
    if-le v1, v2, :cond_6d

    .line 1256
    move v1, v2

    .line 1258
    :cond_6d
    sub-int v7, v6, v4

    sub-int/2addr v7, v5

    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setContentWidth(I)V

    .line 1264
    .end local v1    # "contentWidth":I
    .end local v2    # "contentWidthLimit":I
    :goto_77
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mIsRtl:Z
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1100(Lcom/rey/material/widget/Spinner;)Z

    move-result v7

    if-eqz v7, :cond_c2

    .line 1265
    sub-int v7, v6, v5

    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->getWidth()I

    move-result v8

    sub-int/2addr v7, v8

    add-int/2addr v3, v7

    .line 1269
    :goto_87
    invoke-virtual {p0, v3}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setHorizontalOffset(I)V

    .line 1270
    return-void

    .line 1244
    .end local v4    # "spinnerPaddingLeft":I
    .end local v5    # "spinnerPaddingRight":I
    .end local v6    # "spinnerWidth":I
    :cond_8b
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v7

    iget v7, v7, Landroid/graphics/Rect;->left:I

    neg-int v3, v7

    goto :goto_20

    .line 1246
    :cond_95
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v7

    iget-object v8, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mTempRect:Landroid/graphics/Rect;
    invoke-static {v8}, Lcom/rey/material/widget/Spinner;->access$1000(Lcom/rey/material/widget/Spinner;)Landroid/graphics/Rect;

    move-result-object v8

    const/4 v9, 0x0

    iput v9, v8, Landroid/graphics/Rect;->right:I

    iput v9, v7, Landroid/graphics/Rect;->left:I

    goto/16 :goto_20

    .line 1259
    .restart local v4    # "spinnerPaddingLeft":I
    .restart local v5    # "spinnerPaddingRight":I
    .restart local v6    # "spinnerWidth":I
    :cond_a8
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mDropDownWidth:I
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1200(Lcom/rey/material/widget/Spinner;)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_b8

    .line 1260
    sub-int v7, v6, v4

    sub-int/2addr v7, v5

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setContentWidth(I)V

    goto :goto_77

    .line 1262
    :cond_b8
    iget-object v7, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    # getter for: Lcom/rey/material/widget/Spinner;->mDropDownWidth:I
    invoke-static {v7}, Lcom/rey/material/widget/Spinner;->access$1200(Lcom/rey/material/widget/Spinner;)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setContentWidth(I)V

    goto :goto_77

    .line 1267
    :cond_c2
    add-int/2addr v3, v4

    goto :goto_87
.end method

.method public getHintText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1232
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 4
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 1220
    invoke-super {p0, p1}, Lcom/rey/material/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1221
    check-cast p1, Lcom/rey/material/widget/Spinner$DropDownAdapter;

    .end local p1    # "adapter":Landroid/widget/ListAdapter;
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->mAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    .line 1222
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->mAdapter:Lcom/rey/material/widget/Spinner$DropDownAdapter;

    new-instance v1, Lcom/rey/material/widget/Spinner$DropdownPopup$3;

    invoke-direct {v1, p0}, Lcom/rey/material/widget/Spinner$DropdownPopup$3;-><init>(Lcom/rey/material/widget/Spinner$DropdownPopup;)V

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Spinner$DropDownAdapter;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 1229
    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "hintText"    # Ljava/lang/CharSequence;

    .prologue
    .line 1236
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    .line 1237
    return-void
.end method

.method public show()V
    .registers 4

    .prologue
    .line 1273
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->isShowing()Z

    move-result v1

    .line 1275
    .local v1, "wasShowing":Z
    invoke-virtual {p0}, Lcom/rey/material/widget/Spinner$DropdownPopup;->computeContentWidth()V

    .line 1276
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/rey/material/widget/Spinner$DropdownPopup;->setInputMethodMode(I)V

    .line 1277
    invoke-super {p0}, Lcom/rey/material/widget/ListPopupWindow;->show()V

    .line 1279
    if-eqz v1, :cond_11

    .line 1291
    :cond_10
    :goto_10
    return-void

    .line 1288
    :cond_11
    iget-object v2, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v2}, Lcom/rey/material/widget/Spinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1289
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_10

    .line 1290
    iget-object v2, p0, Lcom/rey/material/widget/Spinner$DropdownPopup;->layoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_10
.end method

.class Lcom/rey/material/widget/YearPicker$YearAdapter;
.super Landroid/widget/BaseAdapter;
.source "YearPicker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/YearPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "YearAdapter"
.end annotation


# instance fields
.field private mCurYear:I

.field private mMaxYear:I

.field private mMinYear:I

.field final synthetic this$0:Lcom/rey/material/widget/YearPicker;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/YearPicker;)V
    .registers 3

    .prologue
    .line 314
    iput-object p1, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 310
    const/16 v0, 0x7c6

    iput v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    .line 311
    const v0, 0x7ffffffe

    iput v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMaxYear:I

    .line 312
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    .line 314
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .prologue
    .line 338
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMaxYear:I

    iget v1, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 343
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    add-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 348
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getMaxYear()I
    .registers 2

    .prologue
    .line 321
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMaxYear:I

    return v0
.end method

.method public getMinYear()I
    .registers 2

    .prologue
    .line 317
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/16 v5, 0x11

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 380
    move-object v0, p2

    check-cast v0, Lcom/rey/material/widget/CircleCheckedTextView;

    .line 381
    .local v0, "v":Lcom/rey/material/widget/CircleCheckedTextView;
    if-nez v0, :cond_7a

    .line 382
    new-instance v0, Lcom/rey/material/widget/CircleCheckedTextView;

    .end local v0    # "v":Lcom/rey/material/widget/CircleCheckedTextView;
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v2}, Lcom/rey/material/widget/YearPicker;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;-><init>(Landroid/content/Context;)V

    .line 383
    .restart local v0    # "v":Lcom/rey/material/widget/CircleCheckedTextView;
    invoke-virtual {v0, v5}, Lcom/rey/material/widget/CircleCheckedTextView;->setGravity(I)V

    .line 384
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v5, :cond_1f

    .line 385
    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextAlignment(I)V

    .line 386
    :cond_1f
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$100(Lcom/rey/material/widget/YearPicker;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setMinHeight(I)V

    .line 387
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$100(Lcom/rey/material/widget/YearPicker;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setMaxHeight(I)V

    .line 388
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mAnimDuration:I
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$200(Lcom/rey/material/widget/YearPicker;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setAnimDuration(I)V

    .line 389
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mInInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$300(Lcom/rey/material/widget/YearPicker;)Landroid/view/animation/Interpolator;

    move-result-object v2

    iget-object v5, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mOutInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v5}, Lcom/rey/material/widget/YearPicker;->access$400(Lcom/rey/material/widget/YearPicker;)Landroid/view/animation/Interpolator;

    move-result-object v5

    invoke-virtual {v0, v2, v5}, Lcom/rey/material/widget/CircleCheckedTextView;->setInterpolator(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    .line 390
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mSelectionColor:I
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$500(Lcom/rey/material/widget/YearPicker;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setBackgroundColor(I)V

    .line 391
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mTypeface:Landroid/graphics/Typeface;
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$600(Lcom/rey/material/widget/YearPicker;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 392
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mTextSize:I
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$700(Lcom/rey/material/widget/YearPicker;)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v4, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextSize(IF)V

    .line 393
    new-instance v2, Landroid/content/res/ColorStateList;

    # getter for: Lcom/rey/material/widget/YearPicker;->STATES:[[I
    invoke-static {}, Lcom/rey/material/widget/YearPicker;->access$800()[[I

    move-result-object v5

    iget-object v6, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mTextColors:[I
    invoke-static {v6}, Lcom/rey/material/widget/YearPicker;->access$900(Lcom/rey/material/widget/YearPicker;)[I

    move-result-object v6

    invoke-direct {v2, v5, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 394
    invoke-virtual {v0, p0}, Lcom/rey/material/widget/CircleCheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 397
    :cond_7a
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 398
    .local v1, "year":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setTag(Ljava/lang/Object;)V

    .line 399
    const-string v2, "%4d"

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    iget v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    if-ne v1, v2, :cond_a5

    move v2, v3

    :goto_a1
    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setCheckedImmediately(Z)V

    .line 401
    return-object v0

    :cond_a5
    move v2, v4

    .line 400
    goto :goto_a1
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 370
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 375
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/YearPicker$YearAdapter;->setYear(I)V

    .line 376
    return-void
.end method

.method public positionOfYear(I)I
    .registers 3
    .param p1, "year"    # I

    .prologue
    .line 333
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    sub-int v0, p1, v0

    return v0
.end method

.method public setYear(I)V
    .registers 7
    .param p1, "year"    # I

    .prologue
    .line 352
    iget v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    if-eq v2, p1, :cond_4f

    .line 353
    iget v1, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    .line 354
    .local v1, "old":I
    iput p1, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    .line 356
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/YearPicker$YearAdapter;->positionOfYear(I)I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v4}, Lcom/rey/material/widget/YearPicker;->getFirstVisiblePosition()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/YearPicker;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/rey/material/widget/CircleCheckedTextView;

    .line 357
    .local v0, "child":Lcom/rey/material/widget/CircleCheckedTextView;
    if-eqz v0, :cond_21

    .line 358
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setChecked(Z)V

    .line 360
    :cond_21
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    iget v3, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    invoke-virtual {p0, v3}, Lcom/rey/material/widget/YearPicker$YearAdapter;->positionOfYear(I)I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    invoke-virtual {v4}, Lcom/rey/material/widget/YearPicker;->getFirstVisiblePosition()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/YearPicker;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "child":Lcom/rey/material/widget/CircleCheckedTextView;
    check-cast v0, Lcom/rey/material/widget/CircleCheckedTextView;

    .line 361
    .restart local v0    # "child":Lcom/rey/material/widget/CircleCheckedTextView;
    if-eqz v0, :cond_3c

    .line 362
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setChecked(Z)V

    .line 364
    :cond_3c
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mOnYearChangedListener:Lcom/rey/material/widget/YearPicker$OnYearChangedListener;
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$000(Lcom/rey/material/widget/YearPicker;)Lcom/rey/material/widget/YearPicker$OnYearChangedListener;

    move-result-object v2

    if-eqz v2, :cond_4f

    .line 365
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->this$0:Lcom/rey/material/widget/YearPicker;

    # getter for: Lcom/rey/material/widget/YearPicker;->mOnYearChangedListener:Lcom/rey/material/widget/YearPicker$OnYearChangedListener;
    invoke-static {v2}, Lcom/rey/material/widget/YearPicker;->access$000(Lcom/rey/material/widget/YearPicker;)Lcom/rey/material/widget/YearPicker$OnYearChangedListener;

    move-result-object v2

    iget v3, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mCurYear:I

    invoke-interface {v2, v1, v3}, Lcom/rey/material/widget/YearPicker$OnYearChangedListener;->onYearChanged(II)V

    .line 367
    .end local v0    # "child":Lcom/rey/material/widget/CircleCheckedTextView;
    .end local v1    # "old":I
    :cond_4f
    return-void
.end method

.method public setYearRange(II)V
    .registers 4
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 325
    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    if-ne v0, p1, :cond_8

    iget v0, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMaxYear:I

    if-eq v0, p2, :cond_f

    .line 326
    :cond_8
    iput p1, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMinYear:I

    .line 327
    iput p2, p0, Lcom/rey/material/widget/YearPicker$YearAdapter;->mMaxYear:I

    .line 328
    invoke-virtual {p0}, Lcom/rey/material/widget/YearPicker$YearAdapter;->notifyDataSetChanged()V

    .line 330
    :cond_f
    return-void
.end method

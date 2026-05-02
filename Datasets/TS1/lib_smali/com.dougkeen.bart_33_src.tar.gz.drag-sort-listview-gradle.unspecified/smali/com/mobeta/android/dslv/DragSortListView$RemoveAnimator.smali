.class Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;
.super Lcom/mobeta/android/dslv/DragSortListView$SmoothAnimator;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoveAnimator"
.end annotation


# instance fields
.field private mFirstChildHeight:I

.field private mFirstPos:I

.field private mFirstStartBlank:F

.field private mFloatLocX:F

.field private mSecondChildHeight:I

.field private mSecondPos:I

.field private mSecondStartBlank:F

.field private srcPos:I

.field final synthetic this$0:Lcom/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/mobeta/android/dslv/DragSortListView;FI)V
    .registers 5
    .param p2, "smoothness"    # F
    .param p3, "duration"    # I

    .prologue
    const/4 v0, -0x1

    .line 1314
    iput-object p1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    .line 1315
    invoke-direct {p0, p1, p2, p3}, Lcom/mobeta/android/dslv/DragSortListView$SmoothAnimator;-><init>(Lcom/mobeta/android/dslv/DragSortListView;FI)V

    .line 1307
    iput v0, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    .line 1308
    iput v0, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    .line 1316
    return-void
.end method


# virtual methods
.method public onStart()V
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/high16 v4, 0x40000000    # 2.0f

    const/4 v1, -0x1

    const/4 v5, 0x0

    .line 1320
    iput v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    .line 1321
    iput v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    .line 1322
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I
    invoke-static {v3}, Lcom/mobeta/android/dslv/DragSortListView;->access$1300(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v3

    iput v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    .line 1323
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I
    invoke-static {v3}, Lcom/mobeta/android/dslv/DragSortListView;->access$1400(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v3

    iput v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    .line 1324
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mSrcPos:I
    invoke-static {v3}, Lcom/mobeta/android/dslv/DragSortListView;->access$900(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v3

    iput v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->srcPos:I

    .line 1325
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mDragState:I
    invoke-static {v3, v2}, Lcom/mobeta/android/dslv/DragSortListView;->access$102(Lcom/mobeta/android/dslv/DragSortListView;I)I

    .line 1327
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v3}, Lcom/mobeta/android/dslv/DragSortListView;->access$500(Lcom/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    iput v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    .line 1328
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z
    invoke-static {v3}, Lcom/mobeta/android/dslv/DragSortListView;->access$1500(Lcom/mobeta/android/dslv/DragSortListView;)Z

    move-result v3

    if-eqz v3, :cond_93

    .line 1329
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v3}, Lcom/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v0, v4, v3

    .line 1330
    .local v0, "minVelocity":F
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v3}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v3

    cmpl-float v3, v3, v5

    if-nez v3, :cond_5c

    .line 1331
    iget-object v3, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    iget v4, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_5a

    :goto_54
    int-to-float v1, v1

    mul-float/2addr v1, v0

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v3, v1}, Lcom/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/mobeta/android/dslv/DragSortListView;F)F

    .line 1342
    .end local v0    # "minVelocity":F
    :cond_59
    :goto_59
    return-void

    .restart local v0    # "minVelocity":F
    :cond_5a
    move v1, v2

    .line 1331
    goto :goto_54

    .line 1333
    :cond_5c
    mul-float/2addr v0, v4

    .line 1334
    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    cmpg-float v1, v1, v5

    if-gez v1, :cond_79

    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    neg-float v2, v0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_79

    .line 1335
    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    neg-float v2, v0

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1, v2}, Lcom/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/mobeta/android/dslv/DragSortListView;F)F

    goto :goto_59

    .line 1336
    :cond_79
    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    cmpl-float v1, v1, v5

    if-lez v1, :cond_59

    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    cmpg-float v1, v1, v0

    if-gez v1, :cond_59

    .line 1337
    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1, v0}, Lcom/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/mobeta/android/dslv/DragSortListView;F)F

    goto :goto_59

    .line 1340
    .end local v0    # "minVelocity":F
    :cond_93
    iget-object v1, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # invokes: Lcom/mobeta/android/dslv/DragSortListView;->destroyFloatView()V
    invoke-static {v1}, Lcom/mobeta/android/dslv/DragSortListView;->access$1700(Lcom/mobeta/android/dslv/DragSortListView;)V

    goto :goto_59
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 1396
    iget-object v0, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # invokes: Lcom/mobeta/android/dslv/DragSortListView;->doRemoveItem()V
    invoke-static {v0}, Lcom/mobeta/android/dslv/DragSortListView;->access$1900(Lcom/mobeta/android/dslv/DragSortListView;)V

    .line 1397
    return-void
.end method

.method public onUpdate(FF)V
    .registers 15
    .param p1, "frac"    # F
    .param p2, "smoothFrac"    # F

    .prologue
    .line 1346
    const/high16 v8, 0x3f800000    # 1.0f

    sub-float v3, v8, p2

    .line 1348
    .local v3, "f":F
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v8}, Lcom/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v4

    .line 1349
    .local v4, "firstVis":I
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    sub-int/2addr v9, v4

    invoke-virtual {v8, v9}, Lcom/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1353
    .local v5, "item":Landroid/view/View;
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z
    invoke-static {v8}, Lcom/mobeta/android/dslv/DragSortListView;->access$1500(Lcom/mobeta/android/dslv/DragSortListView;)Z

    move-result v8

    if-eqz v8, :cond_85

    .line 1354
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mStartTime:J

    sub-long/2addr v8, v10

    long-to-float v8, v8

    const/high16 v9, 0x447a0000    # 1000.0f

    div-float v1, v8, v9

    .line 1355
    .local v1, "dt":F
    const/4 v8, 0x0

    cmpl-float v8, v1, v8

    if-nez v8, :cond_2d

    .line 1392
    .end local v1    # "dt":F
    :cond_2c
    :goto_2c
    return-void

    .line 1357
    .restart local v1    # "dt":F
    :cond_2d
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v8}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v8

    mul-float v2, v8, v1

    .line 1358
    .local v2, "dx":F
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v8}, Lcom/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v7

    .line 1359
    .local v7, "w":I
    iget-object v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v8}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v10

    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v8}, Lcom/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v8

    const/4 v11, 0x0

    cmpl-float v8, v8, v11

    if-lez v8, :cond_83

    const/4 v8, 0x1

    :goto_4f
    int-to-float v8, v8

    mul-float/2addr v8, v1

    int-to-float v11, v7

    mul-float/2addr v8, v11

    add-float/2addr v8, v10

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v9, v8}, Lcom/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/mobeta/android/dslv/DragSortListView;F)F

    .line 1360
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    add-float/2addr v8, v2

    iput v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    .line 1361
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v8}, Lcom/mobeta/android/dslv/DragSortListView;->access$500(Lcom/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v8

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    float-to-int v9, v9

    iput v9, v8, Landroid/graphics/Point;->x:I

    .line 1362
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    int-to-float v9, v7

    cmpg-float v8, v8, v9

    if-gez v8, :cond_85

    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    neg-int v9, v7

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_85

    .line 1363
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mStartTime:J

    .line 1364
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    const/4 v9, 0x1

    # invokes: Lcom/mobeta/android/dslv/DragSortListView;->doDragFloatView(Z)V
    invoke-static {v8, v9}, Lcom/mobeta/android/dslv/DragSortListView;->access$700(Lcom/mobeta/android/dslv/DragSortListView;Z)V

    goto :goto_2c

    .line 1359
    :cond_83
    const/4 v8, -0x1

    goto :goto_4f

    .line 1369
    .end local v1    # "dt":F
    .end local v2    # "dx":F
    .end local v7    # "w":I
    :cond_85
    if-eqz v5, :cond_b6

    .line 1370
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_a1

    .line 1371
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    const/4 v10, 0x0

    # invokes: Lcom/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I
    invoke-static {v8, v9, v5, v10}, Lcom/mobeta/android/dslv/DragSortListView;->access$1800(Lcom/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)I

    move-result v8

    iput v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    .line 1372
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iput v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstStartBlank:F

    .line 1374
    :cond_a1
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstStartBlank:F

    mul-float/2addr v8, v3

    float-to-int v8, v8

    const/4 v9, 0x1

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1375
    .local v0, "blank":I
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 1376
    .local v6, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    add-int/2addr v8, v0

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1377
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1379
    .end local v0    # "blank":I
    .end local v6    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_b6
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    if-eq v8, v9, :cond_2c

    .line 1380
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    sub-int/2addr v9, v4

    invoke-virtual {v8, v9}, Lcom/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1381
    if-eqz v5, :cond_2c

    .line 1382
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_e1

    .line 1383
    iget-object v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    const/4 v10, 0x0

    # invokes: Lcom/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I
    invoke-static {v8, v9, v5, v10}, Lcom/mobeta/android/dslv/DragSortListView;->access$1800(Lcom/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)I

    move-result v8

    iput v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    .line 1384
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    iget v9, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iput v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondStartBlank:F

    .line 1386
    :cond_e1
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondStartBlank:F

    mul-float/2addr v8, v3

    float-to-int v8, v8

    const/4 v9, 0x1

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1387
    .restart local v0    # "blank":I
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 1388
    .restart local v6    # "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v8, p0, Lcom/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    add-int/2addr v8, v0

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1389
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_2c
.end method

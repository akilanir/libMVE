.class Lcom/rey/material/app/Dialog$DialogCardView;
.super Landroid/support/v7/widget/CardView;
.source "Dialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DialogCardView"
.end annotation


# instance fields
.field private mContentMarginBottom:I

.field private mContentMarginLeft:I

.field private mContentMarginRight:I

.field private mContentMarginTop:I

.field private mDividerPaint:Landroid/graphics/Paint;

.field private mDividerPos:F

.field private mIsRtl:Z

.field private mShowDivider:Z

.field final synthetic this$0:Lcom/rey/material/app/Dialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/Dialog;Landroid/content/Context;)V
    .registers 6
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 1150
    iput-object p1, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    .line 1151
    invoke-direct {p0, p2}, Landroid/support/v7/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 1140
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPos:F

    .line 1141
    iput-boolean v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mShowDivider:Z

    .line 1148
    iput-boolean v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mIsRtl:Z

    .line 1153
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPaint:Landroid/graphics/Paint;

    .line 1154
    iget-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1155
    invoke-virtual {p0, v2}, Lcom/rey/material/app/Dialog$DialogCardView;->setWillNotDraw(Z)V

    .line 1156
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1413
    invoke-super {p0, p1}, Landroid/support/v7/widget/CardView;->draw(Landroid/graphics/Canvas;)V

    .line 1415
    iget-boolean v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mShowDivider:Z

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3e

    .line 1416
    :cond_25
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingLeft()I

    move-result v0

    int-to-float v1, v0

    iget v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPos:F

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v3, v0

    iget v4, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPos:F

    iget-object v5, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1417
    :cond_3e
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 21
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 1327
    const/4 v5, 0x0

    .line 1328
    .local v5, "childLeft":I
    const/4 v7, 0x0

    .line 1329
    .local v7, "childTop":I
    sub-int v6, p4, p2

    .line 1330
    .local v6, "childRight":I
    sub-int v4, p5, p3

    .line 1332
    .local v4, "childBottom":I
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingLeft()I

    move-result v10

    add-int/2addr v5, v10

    .line 1333
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingTop()I

    move-result v10

    add-int/2addr v7, v10

    .line 1334
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingRight()I

    move-result v10

    sub-int/2addr v6, v10

    .line 1335
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v4, v10

    .line 1337
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v10}, Lcom/rey/material/widget/TextView;->getVisibility()I

    move-result v10

    if-nez v10, :cond_4b

    .line 1338
    iget-boolean v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mIsRtl:Z

    if-eqz v10, :cond_14f

    .line 1339
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v11}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v11

    sub-int v11, v6, v11

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v12, v12, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v12}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v12

    add-int/2addr v12, v7

    invoke-virtual {v10, v11, v7, v6, v12}, Lcom/rey/material/widget/TextView;->layout(IIII)V

    .line 1342
    :goto_42
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v10}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v10

    add-int/2addr v7, v10

    .line 1345
    :cond_4b
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-eqz v10, :cond_69

    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-eqz v10, :cond_69

    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_16a

    :cond_69
    const/4 v8, 0x1

    .line 1346
    .local v8, "hasAction":Z
    :goto_6a
    if-eqz v8, :cond_71

    .line 1347
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionPadding:I

    sub-int/2addr v4, v10

    .line 1349
    :cond_71
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v11, v11, Lcom/rey/material/app/Dialog;->mActionHeight:I

    sub-int/2addr v10, v11

    div-int/lit8 v9, v10, 0x2

    .line 1351
    .local v9, "temp":I
    if-eqz v8, :cond_122

    .line 1352
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mLayoutActionVertical:Z
    invoke-static {v10}, Lcom/rey/material/app/Dialog;->access$1100(Lcom/rey/material/app/Dialog;)Z

    move-result v10

    if-eqz v10, :cond_16d

    .line 1353
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_ba

    .line 1354
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v11, v11, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v11, v6, v11

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v12, v12, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v12}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v12

    sub-int/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v12, v12, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int v12, v4, v12

    add-int/2addr v12, v9

    iget-object v13, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v13, v13, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v13, v6, v13

    sub-int v14, v4, v9

    invoke-virtual {v10, v11, v12, v13, v14}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1355
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int/2addr v4, v10

    .line 1358
    :cond_ba
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_ee

    .line 1359
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v11, v11, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v11, v6, v11

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v12, v12, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v12}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v12

    sub-int/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v12, v12, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int v12, v4, v12

    add-int/2addr v12, v9

    iget-object v13, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v13, v13, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v13, v6, v13

    sub-int v14, v4, v9

    invoke-virtual {v10, v11, v12, v13, v14}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1360
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int/2addr v4, v10

    .line 1363
    :cond_ee
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_122

    .line 1364
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v11, v11, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v11, v6, v11

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v12, v12, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v12}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v12

    sub-int/2addr v11, v12

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v12, v12, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int v12, v4, v12

    add-int/2addr v12, v9

    iget-object v13, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v13, v13, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v13, v6, v13

    sub-int v14, v4, v9

    invoke-virtual {v10, v11, v12, v13, v14}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1365
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int/2addr v4, v10

    .line 1405
    :cond_122
    :goto_122
    int-to-float v10, v4

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPaint:Landroid/graphics/Paint;

    invoke-virtual {v11}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v11

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    sub-float/2addr v10, v11

    iput v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPos:F

    .line 1407
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static {v10}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_14e

    .line 1408
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static {v10}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v10

    iget v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginLeft:I

    add-int/2addr v11, v5

    iget v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginTop:I

    add-int/2addr v12, v7

    iget v13, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginRight:I

    sub-int v13, v6, v13

    iget v14, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginBottom:I

    sub-int v14, v4, v14

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/view/View;->layout(IIII)V

    .line 1409
    :cond_14e
    return-void

    .line 1341
    .end local v8    # "hasAction":Z
    .end local v9    # "temp":I
    :cond_14f
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v11}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v11

    add-int/2addr v11, v5

    iget-object v12, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v12, v12, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v12}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v12

    add-int/2addr v12, v7

    invoke-virtual {v10, v5, v7, v11, v12}, Lcom/rey/material/widget/TextView;->layout(IIII)V

    goto/16 :goto_42

    .line 1345
    :cond_16a
    const/4 v8, 0x0

    goto/16 :goto_6a

    .line 1369
    .restart local v8    # "hasAction":Z
    .restart local v9    # "temp":I
    :cond_16d
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    add-int v1, v5, v10

    .line 1370
    .local v1, "actionLeft":I
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    sub-int v2, v6, v10

    .line 1371
    .local v2, "actionRight":I
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int v10, v4, v10

    add-int v3, v10, v9

    .line 1372
    .local v3, "actionTop":I
    sub-int v0, v4, v9

    .line 1374
    .local v0, "actionBottom":I
    iget-boolean v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mIsRtl:Z

    if-eqz v10, :cond_1eb

    .line 1375
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_1af

    .line 1376
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v11}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    add-int/2addr v11, v1

    invoke-virtual {v10, v1, v3, v11, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1377
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v10

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v11, v11, Lcom/rey/material/app/Dialog;->mActionPadding:I

    add-int/2addr v10, v11

    add-int/2addr v1, v10

    .line 1380
    :cond_1af
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_1c9

    .line 1381
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v11}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    add-int/2addr v11, v1

    invoke-virtual {v10, v1, v3, v11, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1384
    :cond_1c9
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_1e4

    .line 1385
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v11}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    sub-int v11, v2, v11

    invoke-virtual {v10, v11, v3, v2, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1401
    :cond_1e4
    :goto_1e4
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v10, v10, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    sub-int/2addr v4, v10

    goto/16 :goto_122

    .line 1389
    :cond_1eb
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_214

    .line 1390
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v11}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    sub-int v11, v2, v11

    invoke-virtual {v10, v11, v3, v2, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1391
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v10

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget v11, v11, Lcom/rey/material/app/Dialog;->mActionPadding:I

    add-int/2addr v10, v11

    sub-int/2addr v2, v10

    .line 1394
    :cond_214
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_22f

    .line 1395
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v11}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    sub-int v11, v2, v11

    invoke-virtual {v10, v11, v3, v2, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 1397
    :cond_22f
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v10}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v10

    if-nez v10, :cond_1e4

    .line 1398
    iget-object v10, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v10, v10, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    iget-object v11, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v11, v11, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v11}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    add-int/2addr v11, v1

    invoke-virtual {v10, v1, v3, v11, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    goto :goto_1e4
.end method

.method protected onMeasure(II)V
    .registers 32
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1208
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v24

    .line 1209
    .local v24, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v8

    .line 1211
    .local v8, "heightSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mDialogHorizontalPadding:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static/range {v26 .. v26}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingLeft()I

    move-result v26

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 1212
    .local v15, "paddingLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mDialogHorizontalPadding:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static/range {v26 .. v26}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingRight()I

    move-result v26

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 1213
    .local v16, "paddingRight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mDialogVerticalPadding:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static/range {v26 .. v26}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingTop()I

    move-result v26

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->max(II)I

    move-result v17

    .line 1214
    .local v17, "paddingTop":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mDialogVerticalPadding:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static/range {v26 .. v26}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingBottom()I

    move-result v26

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 1216
    .local v14, "paddingBottom":I
    sub-int v25, v24, v15

    sub-int v10, v25, v16

    .line 1217
    .local v10, "maxWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mMaxWidth:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$600(Lcom/rey/material/app/Dialog;)I

    move-result v25

    if-lez v25, :cond_a0

    .line 1218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mMaxWidth:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$600(Lcom/rey/material/app/Dialog;)I

    move-result v25

    move/from16 v0, v25

    invoke-static {v10, v0}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 1219
    :cond_a0
    sub-int v25, v8, v17

    sub-int v9, v25, v14

    .line 1220
    .local v9, "maxHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mMaxHeight:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$700(Lcom/rey/material/app/Dialog;)I

    move-result v25

    if-lez v25, :cond_c0

    .line 1221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mMaxHeight:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$700(Lcom/rey/material/app/Dialog;)I

    move-result v25

    move/from16 v0, v25

    invoke-static {v9, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 1223
    :cond_c0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mLayoutWidth:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$800(Lcom/rey/material/app/Dialog;)I

    move-result v25

    const/16 v26, -0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_481

    move/from16 v22, v10

    .line 1224
    .local v22, "width":I
    :goto_d4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mLayoutHeight:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$900(Lcom/rey/material/app/Dialog;)I

    move-result v25

    const/16 v26, -0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_48d

    move v6, v9

    .line 1229
    .local v6, "height":I
    :goto_e7
    const/16 v20, 0x0

    .line 1230
    .local v20, "titleWidth":I
    const/16 v19, 0x0

    .line 1232
    .local v19, "titleHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/TextView;->getVisibility()I

    move-result v25

    if-nez v25, :cond_148

    .line 1233
    const/16 v25, -0x2

    move/from16 v0, v22

    move/from16 v1, v25

    if-ne v0, v1, :cond_499

    move/from16 v25, v10

    :goto_107
    const/high16 v26, -0x80000000

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    .line 1234
    .local v23, "widthMs":I
    const/high16 v25, -0x80000000

    move/from16 v0, v25

    invoke-static {v9, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1235
    .local v7, "heightMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/TextView;->measure(II)V

    .line 1236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v20

    .line 1237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v19

    .line 1240
    .end local v7    # "heightMs":I
    .end local v23    # "widthMs":I
    :cond_148
    const/4 v5, 0x0

    .line 1241
    .local v5, "contentWidth":I
    const/4 v4, 0x0

    .line 1243
    .local v4, "contentHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v25

    if-eqz v25, :cond_1b9

    .line 1244
    const/16 v25, -0x2

    move/from16 v0, v22

    move/from16 v1, v25

    if-ne v0, v1, :cond_49d

    move/from16 v25, v10

    :goto_160
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginLeft:I

    move/from16 v26, v0

    sub-int v25, v25, v26

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginRight:I

    move/from16 v26, v0

    sub-int v25, v25, v26

    const/high16 v26, -0x80000000

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    .line 1245
    .restart local v23    # "widthMs":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginTop:I

    move/from16 v25, v0

    sub-int v25, v9, v25

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginBottom:I

    move/from16 v26, v0

    sub-int v25, v25, v26

    const/high16 v26, -0x80000000

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1246
    .restart local v7    # "heightMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Landroid/view/View;->measure(II)V

    .line 1247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    .line 1248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    .line 1251
    .end local v7    # "heightMs":I
    .end local v23    # "widthMs":I
    :cond_1b9
    const/16 v21, 0x0

    .line 1252
    .local v21, "visibleActions":I
    const/16 v18, 0x0

    .line 1254
    .local v18, "positiveActionWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v25

    if-nez v25, :cond_251

    .line 1255
    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    .line 1256
    .restart local v23    # "widthMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionHeight:I

    move/from16 v25, v0

    const/high16 v26, 0x40000000    # 2.0f

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1257
    .restart local v7    # "heightMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 1259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v18

    .line 1261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v25, v0

    move/from16 v0, v18

    move/from16 v1, v25

    if-ge v0, v1, :cond_24f

    .line 1262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v26, v0

    const/high16 v27, 0x40000000    # 2.0f

    invoke-static/range {v26 .. v27}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 1263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v18, v0

    .line 1266
    :cond_24f
    add-int/lit8 v21, v21, 0x1

    .line 1269
    .end local v7    # "heightMs":I
    .end local v23    # "widthMs":I
    :cond_251
    const/4 v11, 0x0

    .line 1271
    .local v11, "negativeActionWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v25

    if-nez v25, :cond_2e2

    .line 1272
    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    .line 1273
    .restart local v23    # "widthMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionHeight:I

    move/from16 v25, v0

    const/high16 v26, 0x40000000    # 2.0f

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1274
    .restart local v7    # "heightMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 1276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v11

    .line 1278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v11, v0, :cond_2e0

    .line 1279
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v26, v0

    const/high16 v27, 0x40000000    # 2.0f

    invoke-static/range {v26 .. v27}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 1280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v11, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    .line 1283
    :cond_2e0
    add-int/lit8 v21, v21, 0x1

    .line 1286
    .end local v7    # "heightMs":I
    .end local v23    # "widthMs":I
    :cond_2e2
    const/4 v12, 0x0

    .line 1288
    .local v12, "neutralActionWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v25

    if-nez v25, :cond_373

    .line 1289
    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    .line 1290
    .restart local v23    # "widthMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionHeight:I

    move/from16 v25, v0

    const/high16 v26, 0x40000000    # 2.0f

    invoke-static/range {v25 .. v26}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 1291
    .restart local v7    # "heightMs":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 1293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v12

    .line 1295
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v12, v0, :cond_371

    .line 1296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    move/from16 v26, v0

    const/high16 v27, 0x40000000    # 2.0f

    invoke-static/range {v26 .. v27}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v1, v7}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 1297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v12, v0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    .line 1300
    :cond_371
    add-int/lit8 v21, v21, 0x1

    .line 1303
    .end local v7    # "heightMs":I
    .end local v23    # "widthMs":I
    :cond_373
    add-int v25, v18, v11

    add-int v25, v25, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    move/from16 v26, v0

    mul-int/lit8 v26, v26, 0x2

    add-int v25, v25, v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    move/from16 v26, v0

    const/16 v27, 0x0

    add-int/lit8 v28, v21, -0x1

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->max(II)I

    move-result v27

    mul-int v26, v26, v27

    add-int v3, v25, v26

    .line 1305
    .local v3, "actionBarWidth":I
    const/16 v25, -0x2

    move/from16 v0, v22

    move/from16 v1, v25

    if-ne v0, v1, :cond_3cb

    .line 1306
    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginLeft:I

    move/from16 v25, v0

    add-int v25, v25, v5

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginRight:I

    move/from16 v26, v0

    add-int v25, v25, v26

    move/from16 v0, v25

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v25

    move/from16 v0, v20

    move/from16 v1, v25

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v25

    move/from16 v0, v25

    invoke-static {v10, v0}, Ljava/lang/Math;->min(II)I

    move-result v22

    .line 1308
    :cond_3cb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v26, v0

    move/from16 v0, v22

    if-le v3, v0, :cond_4a1

    const/16 v25, 0x1

    :goto_3d7
    move-object/from16 v0, v26

    move/from16 v1, v25

    # setter for: Lcom/rey/material/app/Dialog;->mLayoutActionVertical:Z
    invoke-static {v0, v1}, Lcom/rey/material/app/Dialog;->access$1102(Lcom/rey/material/app/Dialog;Z)Z

    .line 1310
    if-lez v21, :cond_4a5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    move/from16 v25, v0

    :goto_3ec
    add-int v25, v25, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginTop:I

    move/from16 v26, v0

    add-int v25, v25, v26

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginBottom:I

    move/from16 v26, v0

    add-int v13, v25, v26

    .line 1311
    .local v13, "nonContentHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mLayoutActionVertical:Z
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1100(Lcom/rey/material/app/Dialog;)Z

    move-result v25

    if-eqz v25, :cond_4a9

    .line 1312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    move/from16 v25, v0

    mul-int v25, v25, v21

    add-int v13, v13, v25

    .line 1316
    :goto_41a
    const/16 v25, -0x2

    move/from16 v0, v25

    if-ne v6, v0, :cond_428

    .line 1317
    add-int v25, v4, v13

    move/from16 v0, v25

    invoke-static {v9, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1319
    :cond_428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v25

    if-eqz v25, :cond_45f

    .line 1320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;

    move-result-object v25

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginLeft:I

    move/from16 v26, v0

    sub-int v26, v22, v26

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginRight:I

    move/from16 v27, v0

    sub-int v26, v26, v27

    const/high16 v27, 0x40000000    # 2.0f

    invoke-static/range {v26 .. v27}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v26

    sub-int v27, v6, v13

    const/high16 v28, 0x40000000    # 2.0f

    invoke-static/range {v27 .. v28}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v27

    invoke-virtual/range {v25 .. v27}, Landroid/view/View;->measure(II)V

    .line 1322
    :cond_45f
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingLeft()I

    move-result v25

    add-int v25, v25, v22

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingRight()I

    move-result v26

    add-int v25, v25, v26

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingTop()I

    move-result v26

    add-int v26, v26, v6

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/app/Dialog$DialogCardView;->getPaddingBottom()I

    move-result v27

    add-int v26, v26, v27

    move-object/from16 v0, p0

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/app/Dialog$DialogCardView;->setMeasuredDimension(II)V

    .line 1323
    return-void

    .line 1223
    .end local v3    # "actionBarWidth":I
    .end local v4    # "contentHeight":I
    .end local v5    # "contentWidth":I
    .end local v6    # "height":I
    .end local v11    # "negativeActionWidth":I
    .end local v12    # "neutralActionWidth":I
    .end local v13    # "nonContentHeight":I
    .end local v18    # "positiveActionWidth":I
    .end local v19    # "titleHeight":I
    .end local v20    # "titleWidth":I
    .end local v21    # "visibleActions":I
    .end local v22    # "width":I
    :cond_481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mLayoutWidth:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$800(Lcom/rey/material/app/Dialog;)I

    move-result v22

    goto/16 :goto_d4

    .line 1224
    .restart local v22    # "width":I
    :cond_48d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    # getter for: Lcom/rey/material/app/Dialog;->mLayoutHeight:I
    invoke-static/range {v25 .. v25}, Lcom/rey/material/app/Dialog;->access$900(Lcom/rey/material/app/Dialog;)I

    move-result v6

    goto/16 :goto_e7

    .restart local v6    # "height":I
    .restart local v19    # "titleHeight":I
    .restart local v20    # "titleWidth":I
    :cond_499
    move/from16 v25, v22

    .line 1233
    goto/16 :goto_107

    .restart local v4    # "contentHeight":I
    .restart local v5    # "contentWidth":I
    :cond_49d
    move/from16 v25, v22

    .line 1244
    goto/16 :goto_160

    .line 1308
    .restart local v3    # "actionBarWidth":I
    .restart local v11    # "negativeActionWidth":I
    .restart local v12    # "neutralActionWidth":I
    .restart local v18    # "positiveActionWidth":I
    .restart local v21    # "visibleActions":I
    :cond_4a1
    const/16 v25, 0x0

    goto/16 :goto_3d7

    .line 1310
    :cond_4a5
    const/16 v25, 0x0

    goto/16 :goto_3ec

    .line 1314
    .restart local v13    # "nonContentHeight":I
    :cond_4a9
    if-lez v21, :cond_4bb

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    move/from16 v25, v0

    :goto_4b7
    add-int v13, v13, v25

    goto/16 :goto_41a

    :cond_4bb
    const/16 v25, 0x0

    goto :goto_4b7
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 6
    .param p1, "layoutDirection"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1189
    if-ne p1, v1, :cond_34

    .line 1190
    .local v1, "rtl":Z
    :goto_3
    iget-boolean v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mIsRtl:Z

    if-eq v2, v1, :cond_33

    .line 1191
    iput-boolean v1, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mIsRtl:Z

    .line 1193
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_30

    .line 1194
    iget-boolean v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mIsRtl:Z

    if-eqz v2, :cond_36

    const/4 v0, 0x4

    .line 1196
    .local v0, "direction":I
    :goto_14
    iget-object v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v2, v2, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v2, v0}, Lcom/rey/material/widget/TextView;->setTextDirection(I)V

    .line 1197
    iget-object v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v2, v2, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v2, v0}, Lcom/rey/material/widget/Button;->setTextDirection(I)V

    .line 1198
    iget-object v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v2, v2, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v2, v0}, Lcom/rey/material/widget/Button;->setTextDirection(I)V

    .line 1199
    iget-object v2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->this$0:Lcom/rey/material/app/Dialog;

    iget-object v2, v2, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v2, v0}, Lcom/rey/material/widget/Button;->setTextDirection(I)V

    .line 1202
    .end local v0    # "direction":I
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->requestLayout()V

    .line 1204
    :cond_33
    return-void

    .line 1189
    .end local v1    # "rtl":Z
    :cond_34
    const/4 v1, 0x0

    goto :goto_3

    .line 1194
    .restart local v1    # "rtl":Z
    :cond_36
    const/4 v0, 0x3

    goto :goto_14
.end method

.method public setContentMargin(I)V
    .registers 2
    .param p1, "margin"    # I

    .prologue
    .line 1159
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setContentMargin(IIII)V

    .line 1160
    return-void
.end method

.method public setContentMargin(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 1163
    iput p1, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginLeft:I

    .line 1164
    iput p2, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginTop:I

    .line 1165
    iput p3, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginRight:I

    .line 1166
    iput p4, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mContentMarginBottom:I

    .line 1167
    return-void
.end method

.method public setDividerColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 1170
    iget-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1171
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->invalidate()V

    .line 1172
    return-void
.end method

.method public setDividerHeight(I)V
    .registers 4
    .param p1, "height"    # I

    .prologue
    .line 1175
    iget-object v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mDividerPaint:Landroid/graphics/Paint;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1176
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->invalidate()V

    .line 1177
    return-void
.end method

.method public setShowDivider(Z)V
    .registers 3
    .param p1, "show"    # Z

    .prologue
    .line 1180
    iget-boolean v0, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mShowDivider:Z

    if-eq v0, p1, :cond_9

    .line 1181
    iput-boolean p1, p0, Lcom/rey/material/app/Dialog$DialogCardView;->mShowDivider:Z

    .line 1182
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog$DialogCardView;->invalidate()V

    .line 1184
    :cond_9
    return-void
.end method

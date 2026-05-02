.class Landroid/support/design/widget/TabLayout$TabView;
.super Landroid/widget/LinearLayout;
.source "TabLayout.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TabView"
.end annotation


# instance fields
.field private mCustomIconView:Landroid/widget/ImageView;

.field private mCustomTextView:Landroid/widget/TextView;

.field private mCustomView:Landroid/view/View;

.field private mDefaultMaxLines:I

.field private mIconView:Landroid/widget/ImageView;

.field private final mTab:Landroid/support/design/widget/TabLayout$Tab;

.field private mTextView:Landroid/widget/TextView;

.field final synthetic this$0:Landroid/support/design/widget/TabLayout;


# direct methods
.method public constructor <init>(Landroid/support/design/widget/TabLayout;Landroid/content/Context;Landroid/support/design/widget/TabLayout$Tab;)V
    .registers 8
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 1175
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    .line 1176
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1173
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/design/widget/TabLayout$TabView;->mDefaultMaxLines:I

    .line 1177
    iput-object p3, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    .line 1178
    # getter for: Landroid/support/design/widget/TabLayout;->mTabBackgroundResId:I
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$200(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    if-eqz v0, :cond_1b

    .line 1179
    # getter for: Landroid/support/design/widget/TabLayout;->mTabBackgroundResId:I
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$200(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    invoke-static {p2, v0}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1181
    :cond_1b
    # getter for: Landroid/support/design/widget/TabLayout;->mTabPaddingStart:I
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$300(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    # getter for: Landroid/support/design/widget/TabLayout;->mTabPaddingTop:I
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$400(Landroid/support/design/widget/TabLayout;)I

    move-result v1

    # getter for: Landroid/support/design/widget/TabLayout;->mTabPaddingEnd:I
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$500(Landroid/support/design/widget/TabLayout;)I

    move-result v2

    # getter for: Landroid/support/design/widget/TabLayout;->mTabPaddingBottom:I
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$600(Landroid/support/design/widget/TabLayout;)I

    move-result v3

    invoke-static {p0, v0, v1, v2, v3}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 1183
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->setGravity(I)V

    .line 1184
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->setOrientation(I)V

    .line 1185
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->update()V

    .line 1186
    return-void
.end method

.method private approximateLineWidth(Landroid/text/Layout;IF)F
    .registers 6
    .param p1, "layout"    # Landroid/text/Layout;
    .param p2, "line"    # I
    .param p3, "textSize"    # F

    .prologue
    .line 1418
    invoke-virtual {p1, p2}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v0

    invoke-virtual {p1}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-virtual {v1}, Landroid/text/TextPaint;->getTextSize()F

    move-result v1

    div-float v1, p3, v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private updateTextAndIcon(Landroid/support/design/widget/TabLayout$Tab;Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .registers 13
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "textView"    # Landroid/widget/TextView;
    .param p3, "iconView"    # Landroid/widget/ImageView;

    .prologue
    const/4 v8, 0x0

    const/16 v7, 0x8

    const/4 v5, 0x0

    .line 1341
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 1342
    .local v2, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    .line 1344
    .local v4, "text":Ljava/lang/CharSequence;
    if-eqz p3, :cond_20

    .line 1345
    if-eqz v2, :cond_6b

    .line 1346
    invoke-virtual {p3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1347
    invoke-virtual {p3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1348
    invoke-virtual {p0, v5}, Landroid/support/design/widget/TabLayout$TabView;->setVisibility(I)V

    .line 1353
    :goto_19
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {p3, v6}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1356
    :cond_20
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_72

    const/4 v1, 0x1

    .line 1357
    .local v1, "hasText":Z
    :goto_27
    if-eqz p2, :cond_3b

    .line 1358
    if-eqz v1, :cond_74

    .line 1359
    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1360
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {p2, v6}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1361
    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1362
    invoke-virtual {p0, v5}, Landroid/support/design/widget/TabLayout$TabView;->setVisibility(I)V

    .line 1369
    :cond_3b
    :goto_3b
    if-eqz p3, :cond_5b

    .line 1370
    invoke-virtual {p3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1371
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/4 v0, 0x0

    .line 1372
    .local v0, "bottomMargin":I
    if-eqz v1, :cond_52

    invoke-virtual {p3}, Landroid/widget/ImageView;->getVisibility()I

    move-result v6

    if-nez v6, :cond_52

    .line 1374
    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # invokes: Landroid/support/design/widget/TabLayout;->dpToPx(I)I
    invoke-static {v6, v7}, Landroid/support/design/widget/TabLayout;->access$1400(Landroid/support/design/widget/TabLayout;I)I

    move-result v0

    .line 1376
    :cond_52
    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v0, v6, :cond_5b

    .line 1377
    iput v0, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 1378
    invoke-virtual {p3}, Landroid/widget/ImageView;->requestLayout()V

    .line 1382
    .end local v0    # "bottomMargin":I
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_5b
    if-nez v1, :cond_7b

    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_7b

    .line 1383
    invoke-virtual {p0, p0}, Landroid/support/design/widget/TabLayout$TabView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1388
    :goto_6a
    return-void

    .line 1350
    .end local v1    # "hasText":Z
    :cond_6b
    invoke-virtual {p3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1351
    invoke-virtual {p3, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_19

    :cond_72
    move v1, v5

    .line 1356
    goto :goto_27

    .line 1364
    .restart local v1    # "hasText":Z
    :cond_74
    invoke-virtual {p2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1365
    invoke-virtual {p2, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3b

    .line 1385
    :cond_7b
    invoke-virtual {p0, v8}, Landroid/support/design/widget/TabLayout$TabView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1386
    invoke-virtual {p0, v5}, Landroid/support/design/widget/TabLayout$TabView;->setLongClickable(Z)V

    goto :goto_6a
.end method


# virtual methods
.method public getTab()Landroid/support/design/widget/TabLayout$Tab;
    .registers 2

    .prologue
    .line 1411
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    return-object v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 1207
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1209
    const-class v0, Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 1210
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 1215
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 1217
    const-class v0, Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1218
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x0

    .line 1392
    const/4 v6, 0x2

    new-array v3, v6, [I

    .line 1393
    .local v3, "screenPos":[I
    invoke-virtual {p0, v3}, Landroid/support/design/widget/TabLayout$TabView;->getLocationOnScreen([I)V

    .line 1395
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1396
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getWidth()I

    move-result v5

    .line 1397
    .local v5, "width":I
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getHeight()I

    move-result v2

    .line 1398
    .local v2, "height":I
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v4, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 1400
    .local v4, "screenWidth":I
    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v1, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1403
    .local v0, "cheatSheet":Landroid/widget/Toast;
    const/16 v6, 0x31

    aget v7, v3, v7

    div-int/lit8 v8, v5, 0x2

    add-int/2addr v7, v8

    div-int/lit8 v8, v4, 0x2

    sub-int/2addr v7, v8

    invoke-virtual {v0, v6, v7, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 1406
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1407
    const/4 v6, 0x1

    return v6
.end method

.method public onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1222
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 1223
    .local v7, "specWidth":I
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # invokes: Landroid/support/design/widget/TabLayout;->getTabMaxWidth()I
    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$700(Landroid/support/design/widget/TabLayout;)I

    move-result v5

    .line 1224
    .local v5, "maxWidth":I
    if-lez v5, :cond_8f

    if-eqz v7, :cond_10

    if-le v7, v5, :cond_8f

    .line 1227
    :cond_10
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mTabMaxWidth:I
    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$800(Landroid/support/design/widget/TabLayout;)I

    move-result v10

    const/high16 v11, -0x80000000

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-super {p0, v10, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 1235
    :goto_1f
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v10, :cond_8e

    .line 1236
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    .line 1237
    .local v6, "res":Landroid/content/res/Resources;
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mTabTextSize:F
    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$900(Landroid/support/design/widget/TabLayout;)F

    move-result v8

    .line 1238
    .local v8, "textSize":F
    iget v4, p0, Landroid/support/design/widget/TabLayout$TabView;->mDefaultMaxLines:I

    .line 1240
    .local v4, "maxLines":I
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v10, :cond_93

    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v10}, Landroid/widget/ImageView;->getVisibility()I

    move-result v10

    if-nez v10, :cond_93

    .line 1242
    const/4 v4, 0x1

    .line 1248
    :cond_3c
    :goto_3c
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getTextSize()F

    move-result v2

    .line 1249
    .local v2, "curTextSize":F
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getLineCount()I

    move-result v0

    .line 1250
    .local v0, "curLineCount":I
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-static {v10}, Landroid/support/v4/widget/TextViewCompat;->getMaxLines(Landroid/widget/TextView;)I

    move-result v1

    .line 1252
    .local v1, "curMaxLines":I
    cmpl-float v10, v8, v2

    if-nez v10, :cond_56

    if-ltz v1, :cond_8e

    if-eq v4, v1, :cond_8e

    .line 1254
    :cond_56
    const/4 v9, 0x1

    .line 1256
    .local v9, "updateTextView":Z
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mMode:I
    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$1100(Landroid/support/design/widget/TabLayout;)I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_7e

    cmpl-float v10, v8, v2

    if-lez v10, :cond_7e

    const/4 v10, 0x1

    if-ne v0, v10, :cond_7e

    .line 1261
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v3

    .line 1262
    .local v3, "layout":Landroid/text/Layout;
    if-eqz v3, :cond_7d

    const/4 v10, 0x0

    invoke-direct {p0, v3, v10, v8}, Landroid/support/design/widget/TabLayout$TabView;->approximateLineWidth(Landroid/text/Layout;IF)F

    move-result v10

    invoke-virtual {v3}, Landroid/text/Layout;->getWidth()I

    move-result v11

    int-to-float v11, v11

    cmpl-float v10, v10, v11

    if-lez v10, :cond_7e

    .line 1264
    :cond_7d
    const/4 v9, 0x0

    .line 1268
    .end local v3    # "layout":Landroid/text/Layout;
    :cond_7e
    if-eqz v9, :cond_8e

    .line 1269
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 1270
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 1271
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 1275
    .end local v0    # "curLineCount":I
    .end local v1    # "curMaxLines":I
    .end local v2    # "curTextSize":F
    .end local v4    # "maxLines":I
    .end local v6    # "res":Landroid/content/res/Resources;
    .end local v8    # "textSize":F
    .end local v9    # "updateTextView":Z
    :cond_8e
    return-void

    .line 1231
    :cond_8f
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    goto :goto_1f

    .line 1243
    .restart local v4    # "maxLines":I
    .restart local v6    # "res":Landroid/content/res/Resources;
    .restart local v8    # "textSize":F
    :cond_93
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v10, :cond_3c

    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getLineCount()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_3c

    .line 1245
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mTabTextMultiLineSize:F
    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$1000(Landroid/support/design/widget/TabLayout;)F

    move-result v8

    goto :goto_3c
.end method

.method public setSelected(Z)V
    .registers 4
    .param p1, "selected"    # Z

    .prologue
    .line 1190
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->isSelected()Z

    move-result v1

    if-eq v1, p1, :cond_25

    const/4 v0, 0x1

    .line 1191
    .local v0, "changed":Z
    :goto_7
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 1192
    if-eqz v0, :cond_24

    if-eqz p1, :cond_24

    .line 1193
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Landroid/support/design/widget/TabLayout$TabView;->sendAccessibilityEvent(I)V

    .line 1195
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_1b

    .line 1196
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 1198
    :cond_1b
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v1, :cond_24

    .line 1199
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 1202
    :cond_24
    return-void

    .line 1190
    .end local v0    # "changed":Z
    :cond_25
    const/4 v0, 0x0

    goto :goto_7
.end method

.method final update()V
    .registers 10

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 1278
    iget-object v3, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    .line 1279
    .local v3, "tab":Landroid/support/design/widget/TabLayout$Tab;
    invoke-virtual {v3}, Landroid/support/design/widget/TabLayout$Tab;->getCustomView()Landroid/view/View;

    move-result-object v0

    .line 1280
    .local v0, "custom":Landroid/view/View;
    if-eqz v0, :cond_bf

    .line 1281
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 1282
    .local v1, "customParent":Landroid/view/ViewParent;
    if-eq v1, p0, :cond_1c

    .line 1283
    if-eqz v1, :cond_19

    .line 1284
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "customParent":Landroid/view/ViewParent;
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1286
    :cond_19
    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->addView(Landroid/view/View;)V

    .line 1288
    :cond_1c
    iput-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    .line 1289
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v5, :cond_27

    .line 1290
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1292
    :cond_27
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v5, :cond_35

    .line 1293
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1294
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1297
    :cond_35
    const v5, 0x1020014

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomTextView:Landroid/widget/TextView;

    .line 1298
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomTextView:Landroid/widget/TextView;

    if-eqz v5, :cond_4c

    .line 1299
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomTextView:Landroid/widget/TextView;

    invoke-static {v5}, Landroid/support/v4/widget/TextViewCompat;->getMaxLines(Landroid/widget/TextView;)I

    move-result v5

    iput v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mDefaultMaxLines:I

    .line 1301
    :cond_4c
    const v5, 0x1020006

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomIconView:Landroid/widget/ImageView;

    .line 1312
    :goto_57
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    if-nez v5, :cond_cf

    .line 1314
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-nez v5, :cond_74

    .line 1315
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Landroid/support/design/R$layout;->design_layout_tab_icon:I

    invoke-virtual {v5, v6, p0, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1317
    .local v2, "iconView":Landroid/widget/ImageView;
    invoke-virtual {p0, v2, v7}, Landroid/support/design/widget/TabLayout$TabView;->addView(Landroid/view/View;I)V

    .line 1318
    iput-object v2, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    .line 1320
    .end local v2    # "iconView":Landroid/widget/ImageView;
    :cond_74
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-nez v5, :cond_95

    .line 1321
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Landroid/support/design/R$layout;->design_layout_tab_text:I

    invoke-virtual {v5, v6, p0, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 1323
    .local v4, "textView":Landroid/widget/TextView;
    invoke-virtual {p0, v4}, Landroid/support/design/widget/TabLayout$TabView;->addView(Landroid/view/View;)V

    .line 1324
    iput-object v4, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    .line 1325
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-static {v5}, Landroid/support/v4/widget/TextViewCompat;->getMaxLines(Landroid/widget/TextView;)I

    move-result v5

    iput v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mDefaultMaxLines:I

    .line 1327
    .end local v4    # "textView":Landroid/widget/TextView;
    :cond_95
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mTabTextAppearance:I
    invoke-static {v7}, Landroid/support/design/widget/TabLayout;->access$1200(Landroid/support/design/widget/TabLayout;)I

    move-result v7

    invoke-virtual {v5, v6, v7}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 1328
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;
    invoke-static {v5}, Landroid/support/design/widget/TabLayout;->access$1300(Landroid/support/design/widget/TabLayout;)Landroid/content/res/ColorStateList;

    move-result-object v5

    if-eqz v5, :cond_b7

    .line 1329
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    # getter for: Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;
    invoke-static {v6}, Landroid/support/design/widget/TabLayout;->access$1300(Landroid/support/design/widget/TabLayout;)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 1331
    :cond_b7
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-direct {p0, v3, v5, v6}, Landroid/support/design/widget/TabLayout$TabView;->updateTextAndIcon(Landroid/support/design/widget/TabLayout$Tab;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 1338
    :cond_be
    :goto_be
    return-void

    .line 1304
    :cond_bf
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    if-eqz v5, :cond_ca

    .line 1305
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v5}, Landroid/support/design/widget/TabLayout$TabView;->removeView(Landroid/view/View;)V

    .line 1306
    iput-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    .line 1308
    :cond_ca
    iput-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomTextView:Landroid/widget/TextView;

    .line 1309
    iput-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomIconView:Landroid/widget/ImageView;

    goto :goto_57

    .line 1334
    :cond_cf
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomTextView:Landroid/widget/TextView;

    if-nez v5, :cond_d7

    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomIconView:Landroid/widget/ImageView;

    if-eqz v5, :cond_be

    .line 1335
    :cond_d7
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomTextView:Landroid/widget/TextView;

    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomIconView:Landroid/widget/ImageView;

    invoke-direct {p0, v3, v5, v6}, Landroid/support/design/widget/TabLayout$TabView;->updateTextAndIcon(Landroid/support/design/widget/TabLayout$Tab;Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto :goto_be
.end method

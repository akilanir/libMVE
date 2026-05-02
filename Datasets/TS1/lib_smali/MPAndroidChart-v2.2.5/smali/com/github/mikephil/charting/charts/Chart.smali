.class public abstract Lcom/github/mikephil/charting/charts/Chart;
.super Landroid/view/ViewGroup;
.source "Chart.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/ChartInterface;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/charts/Chart$2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/github/mikephil/charting/data/ChartData",
        "<+",
        "Lcom/github/mikephil/charting/interfaces/datasets/IDataSet",
        "<+",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;>;>",
        "Landroid/view/ViewGroup;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/ChartInterface;"
    }
.end annotation


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "MPAndroidChart"

.field public static final PAINT_CENTER_TEXT:I = 0xe

.field public static final PAINT_DESCRIPTION:I = 0xb

.field public static final PAINT_GRID_BACKGROUND:I = 0x4

.field public static final PAINT_HOLE:I = 0xd

.field public static final PAINT_INFO:I = 0x7

.field public static final PAINT_LEGEND_LABEL:I = 0x12


# instance fields
.field protected mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

.field protected mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

.field protected mData:Lcom/github/mikephil/charting/data/ChartData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected mDefaultFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

.field protected mDescPaint:Landroid/graphics/Paint;

.field protected mDescription:Ljava/lang/String;

.field private mDescriptionPosition:Landroid/graphics/PointF;

.field private mDragDecelerationEnabled:Z

.field private mDragDecelerationFrictionCoef:F

.field protected mDrawMarkerViews:Z

.field protected mDrawPaint:Landroid/graphics/Paint;

.field private mExtraBottomOffset:F

.field private mExtraLeftOffset:F

.field private mExtraRightOffset:F

.field private mExtraTopOffset:F

.field private mGestureListener:Lcom/github/mikephil/charting/listener/OnChartGestureListener;

.field protected mHighLightPerTapEnabled:Z

.field protected mHighlighter:Lcom/github/mikephil/charting/highlight/ChartHighlighter;

.field protected mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

.field protected mInfoPaint:Landroid/graphics/Paint;

.field protected mJobs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected mLegend:Lcom/github/mikephil/charting/components/Legend;

.field protected mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

.field protected mLogEnabled:Z

.field protected mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

.field private mNoDataText:Ljava/lang/String;

.field private mNoDataTextDescription:Ljava/lang/String;

.field private mOffsetsCalculated:Z

.field protected mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

.field protected mSelectionListener:Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;

.field protected mTouchEnabled:Z

.field private mUnbind:Z

.field protected mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

.field protected mXAxis:Lcom/github/mikephil/charting/components/XAxis;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 189
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 72
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    .line 83
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighLightPerTapEnabled:Z

    .line 88
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationEnabled:Z

    .line 96
    const v0, 0x3f666666    # 0.9f

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationFrictionCoef:F

    .line 118
    const-string v0, "Description"

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    .line 128
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mTouchEnabled:Z

    .line 145
    const-string v0, "No chart data available."

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    .line 180
    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraTopOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraRightOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraBottomOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraLeftOffset:F

    .line 405
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mOffsetsCalculated:Z

    .line 664
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawMarkerViews:Z

    .line 1642
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    .line 1755
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mUnbind:Z

    .line 190
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->init()V

    .line 191
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 197
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    .line 83
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighLightPerTapEnabled:Z

    .line 88
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationEnabled:Z

    .line 96
    const v0, 0x3f666666    # 0.9f

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationFrictionCoef:F

    .line 118
    const-string v0, "Description"

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    .line 128
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mTouchEnabled:Z

    .line 145
    const-string v0, "No chart data available."

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    .line 180
    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraTopOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraRightOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraBottomOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraLeftOffset:F

    .line 405
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mOffsetsCalculated:Z

    .line 664
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawMarkerViews:Z

    .line 1642
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    .line 1755
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mUnbind:Z

    .line 198
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->init()V

    .line 199
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 205
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 72
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    .line 83
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighLightPerTapEnabled:Z

    .line 88
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationEnabled:Z

    .line 96
    const v0, 0x3f666666    # 0.9f

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationFrictionCoef:F

    .line 118
    const-string v0, "Description"

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    .line 128
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mTouchEnabled:Z

    .line 145
    const-string v0, "No chart data available."

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    .line 180
    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraTopOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraRightOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraBottomOffset:F

    iput v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraLeftOffset:F

    .line 405
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mOffsetsCalculated:Z

    .line 664
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawMarkerViews:Z

    .line 1642
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    .line 1755
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mUnbind:Z

    .line 206
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->init()V

    .line 207
    return-void
.end method

.method private unbindDrawables(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1765
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 1766
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 1768
    :cond_e
    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2e

    .line 1769
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_29

    move-object v1, p1

    .line 1770
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/github/mikephil/charting/charts/Chart;->unbindDrawables(Landroid/view/View;)V

    .line 1769
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 1772
    :cond_29
    check-cast p1, Landroid/view/ViewGroup;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1774
    .end local v0    # "i":I
    :cond_2e
    return-void
.end method


# virtual methods
.method public addViewportJob(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "job"    # Ljava/lang/Runnable;

    .prologue
    .line 1660
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->hasChartDimens()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1661
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;->post(Ljava/lang/Runnable;)Z

    .line 1665
    :goto_b
    return-void

    .line 1663
    :cond_c
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b
.end method

.method public animateX(I)V
    .registers 3
    .param p1, "durationMillis"    # I

    .prologue
    .line 909
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateX(I)V

    .line 910
    return-void
.end method

.method public animateX(ILcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 4
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    .line 878
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateX(ILcom/github/mikephil/charting/animation/Easing$EasingOption;)V

    .line 879
    return-void
.end method

.method public animateX(ILcom/github/mikephil/charting/animation/EasingFunction;)V
    .registers 4
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/EasingFunction;

    .prologue
    .line 830
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateX(ILcom/github/mikephil/charting/animation/EasingFunction;)V

    .line 831
    return-void
.end method

.method public animateXY(II)V
    .registers 4
    .param p1, "durationMillisX"    # I
    .param p2, "durationMillisY"    # I

    .prologue
    .line 934
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateXY(II)V

    .line 935
    return-void
.end method

.method public animateXY(IILcom/github/mikephil/charting/animation/Easing$EasingOption;Lcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 6
    .param p1, "durationMillisX"    # I
    .param p2, "durationMillisY"    # I
    .param p3, "easingX"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;
    .param p4, "easingY"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    .line 865
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateXY(IILcom/github/mikephil/charting/animation/Easing$EasingOption;Lcom/github/mikephil/charting/animation/Easing$EasingOption;)V

    .line 866
    return-void
.end method

.method public animateXY(IILcom/github/mikephil/charting/animation/EasingFunction;Lcom/github/mikephil/charting/animation/EasingFunction;)V
    .registers 6
    .param p1, "durationMillisX"    # I
    .param p2, "durationMillisY"    # I
    .param p3, "easingX"    # Lcom/github/mikephil/charting/animation/EasingFunction;
    .param p4, "easingY"    # Lcom/github/mikephil/charting/animation/EasingFunction;

    .prologue
    .line 817
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateXY(IILcom/github/mikephil/charting/animation/EasingFunction;Lcom/github/mikephil/charting/animation/EasingFunction;)V

    .line 818
    return-void
.end method

.method public animateY(I)V
    .registers 3
    .param p1, "durationMillis"    # I

    .prologue
    .line 921
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateY(I)V

    .line 922
    return-void
.end method

.method public animateY(ILcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 4
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    .line 891
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateY(ILcom/github/mikephil/charting/animation/Easing$EasingOption;)V

    .line 892
    return-void
.end method

.method public animateY(ILcom/github/mikephil/charting/animation/EasingFunction;)V
    .registers 4
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/EasingFunction;

    .prologue
    .line 843
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0, p1, p2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->animateY(ILcom/github/mikephil/charting/animation/EasingFunction;)V

    .line 844
    return-void
.end method

.method protected abstract calcMinMax()V
.end method

.method protected calculateFormatter(FF)V
    .registers 7
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 389
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v1, 0x0

    .line 391
    .local v1, "reference":F
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-eqz v2, :cond_e

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/ChartData;->getXValCount()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_26

    .line 393
    :cond_e
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 398
    :goto_1a
    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->getDecimals(F)I

    move-result v0

    .line 399
    .local v0, "digits":I
    new-instance v2, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;

    invoke-direct {v2, v0}, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;-><init>(I)V

    iput-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDefaultFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    .line 400
    return-void

    .line 395
    .end local v0    # "digits":I
    :cond_26
    sub-float v2, p2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    goto :goto_1a
.end method

.method protected abstract calculateOffsets()V
.end method

.method public clear()V
    .registers 2

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x0

    .line 330
    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    .line 331
    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    .line 332
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->invalidate()V

    .line 333
    return-void
.end method

.method public clearAllViewportJobs()V
    .registers 2

    .prologue
    .line 1649
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1650
    return-void
.end method

.method public clearValues()V
    .registers 2

    .prologue
    .line 340
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->clearValues()V

    .line 341
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->invalidate()V

    .line 342
    return-void
.end method

.method public disableScroll()V
    .registers 3

    .prologue
    .line 1284
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 1285
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_a

    .line 1286
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 1287
    :cond_a
    return-void
.end method

.method protected drawDescription(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/high16 v4, 0x41200000    # 10.0f

    .line 462
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_31

    .line 464
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescriptionPosition:Landroid/graphics/PointF;

    if-nez v0, :cond_32

    .line 466
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetRight()F

    move-result v2

    sub-float/2addr v1, v2

    sub-float/2addr v1, v4

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getHeight()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetBottom()F

    move-result v3

    sub-float/2addr v2, v3

    sub-float/2addr v2, v4

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 473
    :cond_31
    :goto_31
    return-void

    .line 470
    :cond_32
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescriptionPosition:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescriptionPosition:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_31
.end method

.method protected drawMarkers(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v9, 0x0

    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 677
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    if-eqz v8, :cond_11

    iget-boolean v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawMarkerViews:Z

    if-eqz v8, :cond_11

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->valuesToHighlight()Z

    move-result v8

    if-nez v8, :cond_12

    .line 727
    :cond_11
    return-void

    .line 680
    :cond_12
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_13
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    array-length v8, v8

    if-ge v4, v8, :cond_11

    .line 682
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    aget-object v3, v8, v4

    .line 683
    .local v3, "highlight":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {v3}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v6

    .line 684
    .local v6, "xIndex":I
    invoke-virtual {v3}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v0

    .line 686
    .local v0, "dataSetIndex":I
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    if-eqz v8, :cond_5a

    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v8, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 690
    .local v1, "deltaX":F
    :goto_2c
    int-to-float v8, v6

    cmpg-float v8, v8, v1

    if-gtz v8, :cond_57

    int-to-float v8, v6

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v10

    mul-float/2addr v10, v1

    cmpg-float v8, v8, v10

    if-gtz v8, :cond_57

    .line 692
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    aget-object v10, v10, v4

    invoke-virtual {v8, v10}, Lcom/github/mikephil/charting/data/ChartData;->getEntryForHighlight(Lcom/github/mikephil/charting/highlight/Highlight;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v2

    .line 695
    .local v2, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v2, :cond_57

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v8

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    aget-object v10, v10, v4

    invoke-virtual {v10}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v10

    if-eq v8, v10, :cond_6c

    .line 680
    .end local v2    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_57
    :goto_57
    add-int/lit8 v4, v4, 0x1

    goto :goto_13

    .line 686
    .end local v1    # "deltaX":F
    :cond_5a
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v8, :cond_64

    move v8, v9

    :goto_5f
    const/high16 v10, 0x3f800000    # 1.0f

    sub-float v1, v8, v10

    goto :goto_2c

    :cond_64
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/data/ChartData;->getXValCount()I

    move-result v8

    int-to-float v8, v8

    goto :goto_5f

    .line 698
    .restart local v1    # "deltaX":F
    .restart local v2    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_6c
    invoke-virtual {p0, v2, v3}, Lcom/github/mikephil/charting/charts/Chart;->getMarkerPosition(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)[F

    move-result-object v5

    .line 701
    .local v5, "pos":[F
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v10, v5, v12

    aget v11, v5, v13

    invoke-virtual {v8, v10, v11}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBounds(FF)Z

    move-result v8

    if-eqz v8, :cond_57

    .line 705
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    invoke-virtual {v8, v2, v3}, Lcom/github/mikephil/charting/components/MarkerView;->refreshContent(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)V

    .line 714
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    invoke-static {v12, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-static {v12, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    invoke-virtual {v8, v10, v11}, Lcom/github/mikephil/charting/components/MarkerView;->measure(II)V

    .line 716
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/components/MarkerView;->getMeasuredWidth()I

    move-result v10

    iget-object v11, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/components/MarkerView;->getMeasuredHeight()I

    move-result v11

    invoke-virtual {v8, v12, v12, v10, v11}, Lcom/github/mikephil/charting/components/MarkerView;->layout(IIII)V

    .line 719
    aget v8, v5, v13

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/components/MarkerView;->getHeight()I

    move-result v10

    int-to-float v10, v10

    sub-float/2addr v8, v10

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_c3

    .line 720
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/MarkerView;->getHeight()I

    move-result v8

    int-to-float v8, v8

    aget v10, v5, v13

    sub-float v7, v8, v10

    .line 721
    .local v7, "y":F
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    aget v10, v5, v12

    aget v11, v5, v13

    add-float/2addr v11, v7

    invoke-virtual {v8, p1, v10, v11}, Lcom/github/mikephil/charting/components/MarkerView;->draw(Landroid/graphics/Canvas;FF)V

    goto :goto_57

    .line 723
    .end local v7    # "y":F
    :cond_c3
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    aget v10, v5, v12

    aget v11, v5, v13

    invoke-virtual {v8, p1, v10, v11}, Lcom/github/mikephil/charting/components/MarkerView;->draw(Landroid/graphics/Canvas;FF)V

    goto :goto_57
.end method

.method public enableScroll()V
    .registers 3

    .prologue
    .line 1293
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 1294
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_a

    .line 1295
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 1296
    :cond_a
    return-void
.end method

.method public getAnimator()Lcom/github/mikephil/charting/animation/ChartAnimator;
    .registers 2

    .prologue
    .line 751
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    return-object v0
.end method

.method public getCenter()Landroid/graphics/PointF;
    .registers 5

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/high16 v3, 0x40000000    # 2.0f

    .line 1040
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v3

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method public getCenterOfView()Landroid/graphics/PointF;
    .registers 2

    .prologue
    .line 1482
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public getCenterOffsets()Landroid/graphics/PointF;
    .registers 2

    .prologue
    .line 1051
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentCenter()Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public getChartBitmap()Landroid/graphics/Bitmap;
    .registers 7

    .prologue
    .line 1492
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 1494
    .local v2, "returnedBitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1496
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1497
    .local v0, "bgDrawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_20

    .line 1499
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1505
    :goto_1c
    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/charts/Chart;->draw(Landroid/graphics/Canvas;)V

    .line 1507
    return-object v2

    .line 1503
    :cond_20
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_1c
.end method

.method public getContentRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 1277
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getData()Lcom/github/mikephil/charting/data/ChartData;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 1432
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    return-object v0
.end method

.method public getDefaultValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;
    .registers 2

    .prologue
    .line 961
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDefaultFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    return-object v0
.end method

.method public getDragDecelerationFrictionCoef()F
    .registers 2

    .prologue
    .line 776
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationFrictionCoef:F

    return v0
.end method

.method public getEntriesAtIndex(I)Ljava/util/List;
    .registers 7
    .param p1, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1410
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1412
    .local v3, "vals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetCount()I

    move-result v4

    if-ge v1, v4, :cond_20

    .line 1414
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v4, v1}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    .line 1416
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v2, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 1418
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v0, :cond_1d

    .line 1419
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1412
    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1423
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_20
    return-object v3
.end method

.method public getExtraBottomOffset()F
    .registers 2

    .prologue
    .line 1164
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraBottomOffset:F

    return v0
.end method

.method public getExtraLeftOffset()F
    .registers 2

    .prologue
    .line 1178
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraLeftOffset:F

    return v0
.end method

.method public getExtraRightOffset()F
    .registers 2

    .prologue
    .line 1150
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraRightOffset:F

    return v0
.end method

.method public getExtraTopOffset()F
    .registers 2

    .prologue
    .line 1136
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraTopOffset:F

    return v0
.end method

.method public getHighlighted()[Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 2

    .prologue
    .line 493
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    return-object v0
.end method

.method public getHighlighter()Lcom/github/mikephil/charting/highlight/ChartHighlighter;
    .registers 2

    .prologue
    .line 1466
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighlighter:Lcom/github/mikephil/charting/highlight/ChartHighlighter;

    return-object v0
.end method

.method public getJobs()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1674
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLegend()Lcom/github/mikephil/charting/components/Legend;
    .registers 2

    .prologue
    .line 1256
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    return-object v0
.end method

.method public getLegendRenderer()Lcom/github/mikephil/charting/renderer/LegendRenderer;
    .registers 2

    .prologue
    .line 1266
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    return-object v0
.end method

.method protected abstract getMarkerPosition(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)[F
.end method

.method public getMarkerView()Lcom/github/mikephil/charting/components/MarkerView;
    .registers 2

    .prologue
    .line 1245
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    return-object v0
.end method

.method public getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    .registers 2

    .prologue
    .line 989
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mGestureListener:Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    return-object v0
.end method

.method public getPaint(I)Landroid/graphics/Paint;
    .registers 3
    .param p1, "which"    # I

    .prologue
    .line 1356
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    sparse-switch p1, :sswitch_data_c

    .line 1363
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 1358
    :sswitch_5
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    goto :goto_4

    .line 1360
    :sswitch_8
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    goto :goto_4

    .line 1356
    nop

    :sswitch_data_c
    .sparse-switch
        0x7 -> :sswitch_5
        0xb -> :sswitch_8
    .end sparse-switch
.end method

.method public getRenderer()Lcom/github/mikephil/charting/renderer/DataRenderer;
    .registers 2

    .prologue
    .line 1451
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    return-object v0
.end method

.method public getValueCount()I
    .registers 2

    .prologue
    .line 1031
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getYValCount()I

    move-result v0

    return v0
.end method

.method public getViewPortHandler()Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .registers 2

    .prologue
    .line 1442
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    return-object v0
.end method

.method public getXAxis()Lcom/github/mikephil/charting/components/XAxis;
    .registers 2

    .prologue
    .line 951
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    return-object v0
.end method

.method public getXChartMax()F
    .registers 2

    .prologue
    .line 1012
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    return v0
.end method

.method public getXChartMin()F
    .registers 2

    .prologue
    .line 1017
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    return v0
.end method

.method public getXValCount()I
    .registers 2

    .prologue
    .line 1022
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getXValCount()I

    move-result v0

    return v0
.end method

.method public getXValue(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1394
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getXValCount()I

    move-result v0

    if-gt v0, p1, :cond_e

    .line 1395
    :cond_c
    const/4 v0, 0x0

    .line 1397
    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getXVals()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_d
.end method

.method public getYMax()F
    .registers 2

    .prologue
    .line 998
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getYMax()F

    move-result v0

    return v0
.end method

.method public getYMin()F
    .registers 2

    .prologue
    .line 1007
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getYMin()F

    move-result v0

    return v0
.end method

.method public highlightTouch(Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 3
    .param p1, "high"    # Lcom/github/mikephil/charting/highlight/Highlight;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 643
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/github/mikephil/charting/charts/Chart;->highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;Z)V

    .line 644
    return-void
.end method

.method public highlightValue(II)V
    .registers 4
    .param p1, "xIndex"    # I
    .param p2, "dataSetIndex"    # I

    .prologue
    .line 559
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/github/mikephil/charting/charts/Chart;->highlightValue(IIZ)V

    .line 560
    return-void
.end method

.method public highlightValue(IIZ)V
    .registers 5
    .param p1, "xIndex"    # I
    .param p2, "dataSetIndex"    # I
    .param p3, "callListener"    # Z

    .prologue
    .line 571
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    if-ltz p1, :cond_14

    if-ltz p2, :cond_14

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getXValCount()I

    move-result v0

    if-ge p1, v0, :cond_14

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetCount()I

    move-result v0

    if-lt p2, v0, :cond_19

    .line 574
    :cond_14
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p3}, Lcom/github/mikephil/charting/charts/Chart;->highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;Z)V

    .line 578
    :goto_18
    return-void

    .line 576
    :cond_19
    new-instance v0, Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-direct {v0, p1, p2}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(II)V

    invoke-virtual {p0, v0, p3}, Lcom/github/mikephil/charting/charts/Chart;->highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;Z)V

    goto :goto_18
.end method

.method public highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 3
    .param p1, "highlight"    # Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 587
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/github/mikephil/charting/charts/Chart;->highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;Z)V

    .line 588
    return-void
.end method

.method public highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;Z)V
    .registers 10
    .param p1, "high"    # Lcom/github/mikephil/charting/highlight/Highlight;
    .param p2, "callListener"    # Z

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v5, 0x0

    const/4 v3, -0x1

    .line 600
    const/4 v6, 0x0

    .line 602
    .local v6, "e":Lcom/github/mikephil/charting/data/Entry;
    if-nez p1, :cond_1c

    .line 603
    iput-object v5, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    .line 625
    :goto_7
    if-eqz p2, :cond_18

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mSelectionListener:Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;

    if-eqz v1, :cond_18

    .line 627
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->valuesToHighlight()Z

    move-result v1

    if-nez v1, :cond_6c

    .line 628
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mSelectionListener:Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;

    invoke-interface {v1}, Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;->onNothingSelected()V

    .line 635
    :cond_18
    :goto_18
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->invalidate()V

    .line 636
    return-void

    .line 606
    :cond_1c
    iget-boolean v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    if-eqz v1, :cond_3c

    .line 607
    const-string v1, "MPAndroidChart"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Highlighted: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    :cond_3c
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v1, p1}, Lcom/github/mikephil/charting/data/ChartData;->getEntryForHighlight(Lcom/github/mikephil/charting/highlight/Highlight;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v6

    .line 610
    if-nez v6, :cond_48

    .line 611
    iput-object v5, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    .line 612
    const/4 p1, 0x0

    goto :goto_7

    .line 614
    :cond_48
    instance-of v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    if-eqz v1, :cond_63

    move-object v1, p0

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isHighlightFullBarEnabled()Z

    move-result v1

    if-eqz v1, :cond_63

    .line 616
    new-instance v0, Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v1

    const/high16 v2, 0x7fc00000    # Float.NaN

    move v4, v3

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFIII)V

    .end local p1    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .local v0, "high":Lcom/github/mikephil/charting/highlight/Highlight;
    move-object p1, v0

    .line 619
    .end local v0    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .restart local p1    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    :cond_63
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/github/mikephil/charting/highlight/Highlight;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    iput-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    goto :goto_7

    .line 631
    :cond_6c
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mSelectionListener:Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v2

    invoke-interface {v1, v6, v2, p1}, Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;->onValueSelected(Lcom/github/mikephil/charting/data/Entry;ILcom/github/mikephil/charting/highlight/Highlight;)V

    goto :goto_18
.end method

.method public highlightValues([Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 4
    .param p1, "highs"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v1, 0x0

    .line 539
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    .line 541
    if-eqz p1, :cond_c

    array-length v0, p1

    if-lez v0, :cond_c

    aget-object v0, p1, v1

    if-nez v0, :cond_16

    .line 542
    :cond_c
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->setLastHighlighted(Lcom/github/mikephil/charting/highlight/Highlight;)V

    .line 548
    :goto_12
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->invalidate()V

    .line 549
    return-void

    .line 544
    :cond_16
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->setLastHighlighted(Lcom/github/mikephil/charting/highlight/Highlight;)V

    goto :goto_12
.end method

.method protected init()V
    .registers 5

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v3, 0x1

    .line 214
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/Chart;->setWillNotDraw(Z)V

    .line 217
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_9c

    .line 218
    new-instance v0, Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-direct {v0}, Lcom/github/mikephil/charting/animation/ChartAnimator;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    .line 230
    :goto_12
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->init(Landroid/content/Context;)V

    .line 232
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;

    invoke-direct {v0, v3}, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDefaultFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    .line 234
    new-instance v0, Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 236
    new-instance v0, Lcom/github/mikephil/charting/components/Legend;

    invoke-direct {v0}, Lcom/github/mikephil/charting/components/Legend;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    .line 238
    new-instance v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-direct {v0, v1, v2}, Lcom/github/mikephil/charting/renderer/LegendRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/Legend;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    .line 240
    new-instance v0, Lcom/github/mikephil/charting/components/XAxis;

    invoke-direct {v0}, Lcom/github/mikephil/charting/components/XAxis;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    .line 242
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    .line 243
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 244
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 245
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41100000    # 9.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 247
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    .line 248
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    const/16 v1, 0xf7

    const/16 v2, 0xbd

    const/16 v3, 0x33

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 249
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 250
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 252
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawPaint:Landroid/graphics/Paint;

    .line 254
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    if-eqz v0, :cond_9b

    .line 255
    const-string v0, ""

    const-string v1, "Chart.init()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    :cond_9b
    return-void

    .line 220
    :cond_9c
    new-instance v0, Lcom/github/mikephil/charting/animation/ChartAnimator;

    new-instance v1, Lcom/github/mikephil/charting/charts/Chart$1;

    invoke-direct {v1, p0}, Lcom/github/mikephil/charting/charts/Chart$1;-><init>(Lcom/github/mikephil/charting/charts/Chart;)V

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;-><init>(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    goto/16 :goto_12
.end method

.method public isDragDecelerationEnabled()Z
    .registers 2

    .prologue
    .line 758
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationEnabled:Z

    return v0
.end method

.method public isDrawMarkerViewEnabled()Z
    .registers 2

    .prologue
    .line 1373
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawMarkerViews:Z

    return v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x1

    .line 352
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v1, :cond_6

    .line 359
    :cond_5
    :goto_5
    return v0

    .line 356
    :cond_6
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/ChartData;->getYValCount()I

    move-result v1

    if-lez v1, :cond_5

    .line 359
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isHighlightPerTapEnabled()Z
    .registers 2

    .prologue
    .line 502
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighLightPerTapEnabled:Z

    return v0
.end method

.method public isLogEnabled()Z
    .registers 2

    .prologue
    .line 1197
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    return v0
.end method

.method public abstract notifyDataSetChanged()V
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 1744
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 1748
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mUnbind:Z

    if-eqz v0, :cond_a

    .line 1749
    invoke-direct {p0, p0}, Lcom/github/mikephil/charting/charts/Chart;->unbindDrawables(Landroid/view/View;)V

    .line 1750
    :cond_a
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v7, 0x0

    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 416
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v8, :cond_78

    .line 418
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_70

    move v1, v6

    .line 419
    .local v1, "hasText":Z
    :goto_10
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataTextDescription:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_72

    move v0, v6

    .line 420
    .local v0, "hasDescription":Z
    :goto_19
    if-eqz v1, :cond_74

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v6

    int-to-float v2, v6

    .line 421
    .local v2, "line1height":F
    :goto_24
    if-eqz v0, :cond_76

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataTextDescription:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v6

    int-to-float v3, v6

    .line 422
    .local v3, "line2height":F
    :goto_2f
    if-eqz v1, :cond_3b

    if-eqz v0, :cond_3b

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    invoke-virtual {v6}, Landroid/graphics/Paint;->getFontSpacing()F

    move-result v6

    sub-float v4, v6, v2

    .line 427
    .local v4, "lineSpacing":F
    :cond_3b
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getHeight()I

    move-result v6

    int-to-float v6, v6

    add-float v7, v2, v4

    add-float/2addr v7, v3

    sub-float/2addr v6, v7

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    add-float v5, v6, v2

    .line 431
    .local v5, "y":F
    if-eqz v1, :cond_5f

    .line 432
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7, v5, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 434
    if-eqz v0, :cond_5f

    .line 435
    add-float v6, v5, v2

    add-float v5, v6, v4

    .line 439
    :cond_5f
    if-eqz v0, :cond_6f

    .line 440
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataTextDescription:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    iget-object v8, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v7, v5, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 450
    .end local v0    # "hasDescription":Z
    .end local v1    # "hasText":Z
    .end local v2    # "line1height":F
    .end local v3    # "line2height":F
    .end local v4    # "lineSpacing":F
    .end local v5    # "y":F
    :cond_6f
    :goto_6f
    return-void

    :cond_70
    move v1, v7

    .line 418
    goto :goto_10

    .restart local v1    # "hasText":Z
    :cond_72
    move v0, v7

    .line 419
    goto :goto_19

    .restart local v0    # "hasDescription":Z
    :cond_74
    move v2, v4

    .line 420
    goto :goto_24

    .restart local v2    # "line1height":F
    :cond_76
    move v3, v4

    .line 421
    goto :goto_2f

    .line 445
    .end local v0    # "hasDescription":Z
    .end local v1    # "hasText":Z
    .end local v2    # "line1height":F
    :cond_78
    iget-boolean v7, p0, Lcom/github/mikephil/charting/charts/Chart;->mOffsetsCalculated:Z

    if-nez v7, :cond_6f

    .line 447
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->calculateOffsets()V

    .line 448
    iput-boolean v6, p0, Lcom/github/mikephil/charting/charts/Chart;->mOffsetsCalculated:Z

    goto :goto_6f
.end method

.method protected onLayout(ZIIII)V
    .registers 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 1680
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 1681
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/Chart;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p2, p3, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 1680
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1683
    :cond_11
    return-void
.end method

.method protected onMeasure(II)V
    .registers 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1687
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 1688
    const/high16 v1, 0x42480000    # 50.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    float-to-int v0, v1

    .line 1689
    .local v0, "size":I
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getSuggestedMinimumWidth()I

    move-result v1

    invoke-static {v0, p1}, Lcom/github/mikephil/charting/charts/Chart;->resolveSize(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getSuggestedMinimumHeight()I

    move-result v2

    invoke-static {v0, p2}, Lcom/github/mikephil/charting/charts/Chart;->resolveSize(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/github/mikephil/charting/charts/Chart;->setMeasuredDimension(II)V

    .line 1696
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 10
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/16 v4, 0x2710

    .line 1700
    iget-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    if-eqz v2, :cond_d

    .line 1701
    const-string v2, "MPAndroidChart"

    const-string v3, "OnSizeChanged()"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1703
    :cond_d
    if-lez p1, :cond_5d

    if-lez p2, :cond_5d

    if-ge p1, v4, :cond_5d

    if-ge p2, v4, :cond_5d

    .line 1705
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setChartDimens(FF)V

    .line 1707
    iget-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    if-eqz v2, :cond_42

    .line 1708
    const-string v2, "MPAndroidChart"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting chart dimens, width: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", height: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1710
    :cond_42
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_48
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 1711
    .local v1, "r":Ljava/lang/Runnable;
    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/charts/Chart;->post(Ljava/lang/Runnable;)Z

    goto :goto_48

    .line 1714
    .end local v1    # "r":Ljava/lang/Runnable;
    :cond_58
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1717
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_5d
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->notifyDataSetChanged()V

    .line 1719
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->onSizeChanged(IIII)V

    .line 1720
    return-void
.end method

.method public removeViewportJob(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "job"    # Ljava/lang/Runnable;

    .prologue
    .line 1645
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mJobs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1646
    return-void
.end method

.method public saveToGallery(Ljava/lang/String;I)Z
    .registers 9
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "quality"    # I

    .prologue
    .line 1636
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const-string v2, ""

    const-string v3, "MPAndroidChart-Library Save"

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object v0, p0

    move-object v1, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/charts/Chart;->saveToGallery(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Z

    move-result v0

    return v0
.end method

.method public saveToGallery(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Z
    .registers 23
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "subFolderPath"    # Ljava/lang/String;
    .param p3, "fileDescription"    # Ljava/lang/String;
    .param p4, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p5, "quality"    # I

    .prologue
    .line 1559
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    if-ltz p5, :cond_8

    const/16 v15, 0x64

    move/from16 v0, p5

    if-le v0, v15, :cond_a

    .line 1560
    :cond_8
    const/16 p5, 0x32

    .line 1562
    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 1564
    .local v3, "currentTime":J
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    .line 1565
    .local v6, "extBaseDir":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/DCIM/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v7, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1566
    .local v7, "file":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_42

    .line 1567
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    move-result v15

    if-nez v15, :cond_42

    .line 1568
    const/4 v15, 0x0

    .line 1623
    :goto_41
    return v15

    .line 1572
    :cond_42
    const-string v9, ""

    .line 1573
    .local v9, "mimeType":Ljava/lang/String;
    sget-object v15, Lcom/github/mikephil/charting/charts/Chart$2;->$SwitchMap$android$graphics$Bitmap$CompressFormat:[I

    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Bitmap$CompressFormat;->ordinal()I

    move-result v16

    aget v15, v15, v16

    packed-switch v15, :pswitch_data_162

    .line 1586
    const-string v9, "image/jpeg"

    .line 1587
    const-string v15, ".jpg"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_7a

    const-string v15, ".jpeg"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_7a

    .line 1588
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ".jpg"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1592
    :cond_7a
    :goto_7a
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1593
    .local v8, "filePath":Ljava/lang/String;
    const/4 v10, 0x0

    .line 1595
    .local v10, "out":Ljava/io/FileOutputStream;
    :try_start_98
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_98 .. :try_end_9d} :catch_155

    .line 1597
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .local v11, "out":Ljava/io/FileOutputStream;
    :try_start_9d
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/Chart;->getChartBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 1598
    .local v2, "b":Landroid/graphics/Bitmap;
    move-object/from16 v0, p4

    move/from16 v1, p5

    invoke-virtual {v2, v0, v1, v11}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1600
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->flush()V

    .line 1601
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_ae} :catch_15f

    .line 1609
    new-instance v15, Ljava/io/File;

    invoke-direct {v15, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->length()J

    move-result-wide v12

    .line 1611
    .local v12, "size":J
    new-instance v14, Landroid/content/ContentValues;

    const/16 v15, 0x8

    invoke-direct {v14, v15}, Landroid/content/ContentValues;-><init>(I)V

    .line 1614
    .local v14, "values":Landroid/content/ContentValues;
    const-string v15, "title"

    move-object/from16 v0, p1

    invoke-virtual {v14, v15, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1615
    const-string v15, "_display_name"

    move-object/from16 v0, p1

    invoke-virtual {v14, v15, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1616
    const-string v15, "date_added"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1617
    const-string v15, "mime_type"

    invoke-virtual {v14, v15, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1618
    const-string v15, "description"

    move-object/from16 v0, p3

    invoke-virtual {v14, v15, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1619
    const-string v15, "orientation"

    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1620
    const-string v15, "_data"

    invoke-virtual {v14, v15, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1621
    const-string v15, "_size"

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1623
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/Chart;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v15

    sget-object v16, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v14}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v15

    if-eqz v15, :cond_15c

    const/4 v15, 0x1

    goto/16 :goto_41

    .line 1575
    .end local v2    # "b":Landroid/graphics/Bitmap;
    .end local v8    # "filePath":Ljava/lang/String;
    .end local v11    # "out":Ljava/io/FileOutputStream;
    .end local v12    # "size":J
    .end local v14    # "values":Landroid/content/ContentValues;
    :pswitch_10f
    const-string v9, "image/png"

    .line 1576
    const-string v15, ".png"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_7a

    .line 1577
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ".png"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_7a

    .line 1580
    :pswitch_132
    const-string v9, "image/webp"

    .line 1581
    const-string v15, ".webp"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_7a

    .line 1582
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ".webp"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_7a

    .line 1603
    .restart local v8    # "filePath":Ljava/lang/String;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    :catch_155
    move-exception v5

    .line 1604
    .local v5, "e":Ljava/io/IOException;
    :goto_156
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    .line 1606
    const/4 v15, 0x0

    goto/16 :goto_41

    .line 1623
    .end local v5    # "e":Ljava/io/IOException;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "b":Landroid/graphics/Bitmap;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v12    # "size":J
    .restart local v14    # "values":Landroid/content/ContentValues;
    :cond_15c
    const/4 v15, 0x0

    goto/16 :goto_41

    .line 1603
    .end local v2    # "b":Landroid/graphics/Bitmap;
    .end local v12    # "size":J
    .end local v14    # "values":Landroid/content/ContentValues;
    :catch_15f
    move-exception v5

    move-object v10, v11

    .end local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    goto :goto_156

    .line 1573
    :pswitch_data_162
    .packed-switch 0x1
        :pswitch_10f
        :pswitch_132
    .end packed-switch
.end method

.method public saveToPath(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "pathOnSD"    # Ljava/lang/String;

    .prologue
    .line 1522
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->getChartBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1524
    .local v0, "b":Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    .line 1526
    .local v2, "stream":Ljava/io/OutputStream;
    :try_start_5
    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_33} :catch_40

    .line 1534
    .end local v2    # "stream":Ljava/io/OutputStream;
    .local v3, "stream":Ljava/io/OutputStream;
    :try_start_33
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x28

    invoke-virtual {v0, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1536
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_3d} :catch_46

    .line 1542
    const/4 v4, 0x1

    move-object v2, v3

    .end local v3    # "stream":Ljava/io/OutputStream;
    .restart local v2    # "stream":Ljava/io/OutputStream;
    :goto_3f
    return v4

    .line 1537
    :catch_40
    move-exception v1

    .line 1538
    .local v1, "e":Ljava/lang/Exception;
    :goto_41
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1539
    const/4 v4, 0x0

    goto :goto_3f

    .line 1537
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "stream":Ljava/io/OutputStream;
    .restart local v3    # "stream":Ljava/io/OutputStream;
    :catch_46
    move-exception v1

    move-object v2, v3

    .end local v3    # "stream":Ljava/io/OutputStream;
    .restart local v2    # "stream":Ljava/io/OutputStream;
    goto :goto_41
.end method

.method public setData(Lcom/github/mikephil/charting/data/ChartData;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 300
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    .local p1, "data":Lcom/github/mikephil/charting/data/ChartData;, "TT;"
    if-nez p1, :cond_a

    .line 301
    const-string v2, "MPAndroidChart"

    const-string v3, "Cannot set data for chart. Provided data object is null."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    :cond_9
    :goto_9
    return-void

    .line 307
    :cond_a
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mOffsetsCalculated:Z

    .line 308
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    .line 311
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/ChartData;->getYMin()F

    move-result v2

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/ChartData;->getYMax()F

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/github/mikephil/charting/charts/Chart;->calculateFormatter(FF)V

    .line 313
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/ChartData;->getDataSets()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_24
    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 314
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->needsDefaultFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 315
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mDefaultFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    invoke-interface {v1, v2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V

    goto :goto_24

    .line 319
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_40
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/Chart;->notifyDataSetChanged()V

    .line 321
    iget-boolean v2, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    if-eqz v2, :cond_9

    .line 322
    const-string v2, "MPAndroidChart"

    const-string v3, "Data is set."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 1061
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    if-nez p1, :cond_4

    .line 1062
    const-string p1, ""

    .line 1063
    :cond_4
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescription:Ljava/lang/String;

    .line 1064
    return-void
.end method

.method public setDescriptionColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 1106
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1107
    return-void
.end method

.method public setDescriptionPosition(FF)V
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 1073
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescriptionPosition:Landroid/graphics/PointF;

    .line 1074
    return-void
.end method

.method public setDescriptionTextSize(F)V
    .registers 4
    .param p1, "size"    # F

    .prologue
    .line 1092
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/high16 v0, 0x41800000    # 16.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    .line 1093
    const/high16 p1, 0x41800000    # 16.0f

    .line 1094
    :cond_8
    const/high16 v0, 0x40c00000    # 6.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_10

    .line 1095
    const/high16 p1, 0x40c00000    # 6.0f

    .line 1097
    :cond_10
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1098
    return-void
.end method

.method public setDescriptionTypeface(Landroid/graphics/Typeface;)V
    .registers 3
    .param p1, "t"    # Landroid/graphics/Typeface;

    .prologue
    .line 1082
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 1083
    return-void
.end method

.method public setDragDecelerationEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 767
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationEnabled:Z

    .line 768
    return-void
.end method

.method public setDragDecelerationFrictionCoef(F)V
    .registers 3
    .param p1, "newValue"    # F

    .prologue
    .line 789
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_6

    .line 790
    const/4 p1, 0x0

    .line 792
    :cond_6
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_f

    .line 793
    const p1, 0x3f7fbe77    # 0.999f

    .line 795
    :cond_f
    iput p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mDragDecelerationFrictionCoef:F

    .line 796
    return-void
.end method

.method public setDrawMarkerViews(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1384
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mDrawMarkerViews:Z

    .line 1385
    return-void
.end method

.method public setExtraBottomOffset(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 1157
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraBottomOffset:F

    .line 1158
    return-void
.end method

.method public setExtraLeftOffset(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 1171
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraLeftOffset:F

    .line 1172
    return-void
.end method

.method public setExtraOffsets(FFFF)V
    .registers 5
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    .line 1119
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;->setExtraLeftOffset(F)V

    .line 1120
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/Chart;->setExtraTopOffset(F)V

    .line 1121
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/Chart;->setExtraRightOffset(F)V

    .line 1122
    invoke-virtual {p0, p4}, Lcom/github/mikephil/charting/charts/Chart;->setExtraBottomOffset(F)V

    .line 1123
    return-void
.end method

.method public setExtraRightOffset(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 1143
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraRightOffset:F

    .line 1144
    return-void
.end method

.method public setExtraTopOffset(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 1129
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/charts/Chart;->mExtraTopOffset:F

    .line 1130
    return-void
.end method

.method public setHardwareAccelerationEnabled(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v2, 0x0

    .line 1730
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_13

    .line 1732
    if-eqz p1, :cond_e

    .line 1733
    const/4 v0, 0x2

    invoke-virtual {p0, v0, v2}, Lcom/github/mikephil/charting/charts/Chart;->setLayerType(ILandroid/graphics/Paint;)V

    .line 1740
    :goto_d
    return-void

    .line 1735
    :cond_e
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v2}, Lcom/github/mikephil/charting/charts/Chart;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_d

    .line 1737
    :cond_13
    const-string v0, "MPAndroidChart"

    const-string v1, "Cannot enable/disable hardware acceleration for devices below API level 11."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method public setHighlightPerTapEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 512
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighLightPerTapEnabled:Z

    .line 513
    return-void
.end method

.method public setHighlighter(Lcom/github/mikephil/charting/highlight/ChartHighlighter;)V
    .registers 2
    .param p1, "highlighter"    # Lcom/github/mikephil/charting/highlight/ChartHighlighter;

    .prologue
    .line 1477
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mHighlighter:Lcom/github/mikephil/charting/highlight/ChartHighlighter;

    .line 1478
    return-void
.end method

.method public setLogEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1188
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mLogEnabled:Z

    .line 1189
    return-void
.end method

.method public setMarkerView(Lcom/github/mikephil/charting/components/MarkerView;)V
    .registers 2
    .param p1, "v"    # Lcom/github/mikephil/charting/components/MarkerView;

    .prologue
    .line 1236
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mMarkerView:Lcom/github/mikephil/charting/components/MarkerView;

    .line 1237
    return-void
.end method

.method public setNoDataText(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1207
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataText:Ljava/lang/String;

    .line 1208
    return-void
.end method

.method public setNoDataTextDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1217
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mNoDataTextDescription:Ljava/lang/String;

    .line 1218
    return-void
.end method

.method public setOnChartGestureListener(Lcom/github/mikephil/charting/listener/OnChartGestureListener;)V
    .registers 2
    .param p1, "l"    # Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    .prologue
    .line 980
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mGestureListener:Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    .line 981
    return-void
.end method

.method public setOnChartValueSelectedListener(Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;)V
    .registers 2
    .param p1, "l"    # Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;

    .prologue
    .line 970
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mSelectionListener:Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;

    .line 971
    return-void
.end method

.method public setOnTouchListener(Lcom/github/mikephil/charting/listener/ChartTouchListener;)V
    .registers 2
    .param p1, "l"    # Lcom/github/mikephil/charting/listener/ChartTouchListener;

    .prologue
    .line 653
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    .line 654
    return-void
.end method

.method public setPaint(Landroid/graphics/Paint;I)V
    .registers 3
    .param p1, "p"    # Landroid/graphics/Paint;
    .param p2, "which"    # I

    .prologue
    .line 1339
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    sparse-switch p2, :sswitch_data_a

    .line 1347
    :goto_3
    return-void

    .line 1341
    :sswitch_4
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mInfoPaint:Landroid/graphics/Paint;

    goto :goto_3

    .line 1344
    :sswitch_7
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mDescPaint:Landroid/graphics/Paint;

    goto :goto_3

    .line 1339
    :sswitch_data_a
    .sparse-switch
        0x7 -> :sswitch_4
        0xb -> :sswitch_7
    .end sparse-switch
.end method

.method public setRenderer(Lcom/github/mikephil/charting/renderer/DataRenderer;)V
    .registers 2
    .param p1, "renderer"    # Lcom/github/mikephil/charting/renderer/DataRenderer;

    .prologue
    .line 1461
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    if-eqz p1, :cond_4

    .line 1462
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 1463
    :cond_4
    return-void
.end method

.method public setTouchEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1227
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mTouchEnabled:Z

    .line 1228
    return-void
.end method

.method public setUnbindEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1785
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/Chart;->mUnbind:Z

    .line 1786
    return-void
.end method

.method public valuesToHighlight()Z
    .registers 3

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart;, "Lcom/github/mikephil/charting/charts/Chart<TT;>;"
    const/4 v0, 0x0

    .line 523
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    array-length v1, v1

    if-lez v1, :cond_10

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/Chart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    aget-object v1, v1, v0

    if-nez v1, :cond_11

    :cond_10
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x1

    goto :goto_10
.end method

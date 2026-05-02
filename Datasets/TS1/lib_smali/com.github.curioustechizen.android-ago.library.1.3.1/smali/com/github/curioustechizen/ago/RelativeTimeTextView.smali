.class public Lcom/github/curioustechizen/ago/RelativeTimeTextView;
.super Landroid/widget/TextView;
.source "RelativeTimeTextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/curioustechizen/ago/RelativeTimeTextView$1;,
        Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;,
        Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;
    }
.end annotation


# instance fields
.field private isUpdateTaskRunning:Z

.field private mHandler:Landroid/os/Handler;

.field private mPrefix:Ljava/lang/String;

.field private mReferenceTime:J

.field private mSuffix:Ljava/lang/String;

.field private mText:Ljava/lang/String;

.field private mUpdateTimeTask:Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mHandler:Landroid/os/Handler;

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->isUpdateTaskRunning:Z

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mHandler:Landroid/os/Handler;

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->isUpdateTaskRunning:Z

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    return-void
.end method

.method static synthetic access$200(Lcom/github/curioustechizen/ago/RelativeTimeTextView;)V
    .registers 1
    .param p0, "x0"    # Lcom/github/curioustechizen/ago/RelativeTimeTextView;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->updateTextDisplay()V

    return-void
.end method

.method static synthetic access$300(Lcom/github/curioustechizen/ago/RelativeTimeTextView;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/github/curioustechizen/ago/RelativeTimeTextView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private getRelativeTimeDisplayString()Ljava/lang/CharSequence;
    .registers 10

    .prologue
    const-wide/32 v4, 0xea60

    .line 150
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 151
    .local v2, "now":J
    iget-wide v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    sub-long v7, v2, v0

    .line 152
    .local v7, "difference":J
    const-wide/16 v0, 0x0

    cmp-long v0, v7, v0

    if-ltz v0, :cond_20

    cmp-long v0, v7, v4

    if-gtz v0, :cond_20

    invoke-virtual {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/github/curioustechizen/ago/R$string;->just_now:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1f
    return-object v0

    :cond_20
    iget-wide v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    const/high16 v6, 0x40000

    invoke-static/range {v0 .. v6}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_1f
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    sget-object v3, Lcom/github/curioustechizen/ago/R$styleable;->RelativeTimeTextView:[I

    invoke-virtual {v2, p2, v3, v4, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 46
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_b
    sget v2, Lcom/github/curioustechizen/ago/R$styleable;->RelativeTimeTextView_reference_time:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mText:Ljava/lang/String;

    .line 47
    sget v2, Lcom/github/curioustechizen/ago/R$styleable;->RelativeTimeTextView_relative_time_prefix:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    .line 48
    sget v2, Lcom/github/curioustechizen/ago/R$styleable;->RelativeTimeTextView_relative_time_suffix:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;

    .line 50
    iget-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    if-nez v2, :cond_48

    const-string v2, ""

    :goto_29
    iput-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    .line 51
    iget-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;

    if-nez v2, :cond_4b

    const-string v2, ""

    :goto_31
    iput-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;
    :try_end_33
    .catchall {:try_start_b .. :try_end_33} :catchall_4e

    .line 53
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 57
    :try_start_36
    iget-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mText:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J
    :try_end_42
    .catch Ljava/lang/NumberFormatException; {:try_start_36 .. :try_end_42} :catch_53

    .line 65
    :goto_42
    iget-wide v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    invoke-virtual {p0, v2, v3}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->setReferenceTime(J)V

    .line 67
    return-void

    .line 50
    :cond_48
    :try_start_48
    iget-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    goto :goto_29

    .line 51
    :cond_4b
    iget-object v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;
    :try_end_4d
    .catchall {:try_start_48 .. :try_end_4d} :catchall_4e

    goto :goto_31

    .line 53
    :catchall_4e
    move-exception v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v2

    .line 58
    :catch_53
    move-exception v1

    .line 62
    .local v1, "nfe":Ljava/lang/NumberFormatException;
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    goto :goto_42
.end method

.method private startTaskForPeriodicallyUpdatingRelativeTime()V
    .registers 3

    .prologue
    .line 185
    iget-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mUpdateTimeTask:Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->isUpdateTaskRunning:Z

    .line 187
    return-void
.end method

.method private stopTaskForPeriodicallyUpdatingRelativeTime()V
    .registers 3

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->isUpdateTaskRunning:Z

    if-eqz v0, :cond_e

    .line 191
    iget-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mUpdateTimeTask:Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 192
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->isUpdateTaskRunning:Z

    .line 194
    :cond_e
    return-void
.end method

.method private updateTextDisplay()V
    .registers 5

    .prologue
    .line 144
    iget-wide v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_9

    .line 147
    :goto_8
    return-void

    .line 146
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->getRelativeTimeDisplayString()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_8
.end method


# virtual methods
.method public getPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getSuffix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .registers 1

    .prologue
    .line 163
    invoke-super {p0}, Landroid/widget/TextView;->onAttachedToWindow()V

    .line 164
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->startTaskForPeriodicallyUpdatingRelativeTime()V

    .line 166
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    .prologue
    .line 170
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 171
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->stopTaskForPeriodicallyUpdatingRelativeTime()V

    .line 172
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 206
    instance-of v1, p1, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;

    if-nez v1, :cond_8

    .line 207
    invoke-super {p0, p1}, Landroid/widget/TextView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 214
    :goto_7
    return-void

    :cond_8
    move-object v0, p1

    .line 211
    check-cast v0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;

    .line 212
    .local v0, "ss":Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;
    # getter for: Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->referenceTime:J
    invoke-static {v0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->access$000(Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    .line 213
    invoke-virtual {v0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/TextView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_7
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 198
    invoke-super {p0}, Landroid/widget/TextView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 199
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;

    invoke-direct {v0, v1}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 200
    .local v0, "ss":Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;
    iget-wide v2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    # setter for: Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->referenceTime:J
    invoke-static {v0, v2, v3}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;->access$002(Lcom/github/curioustechizen/ago/RelativeTimeTextView$SavedState;J)J

    .line 201
    return-object v0
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .registers 4
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 176
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onVisibilityChanged(Landroid/view/View;I)V

    .line 177
    const/16 v0, 0x8

    if-eq p2, v0, :cond_a

    const/4 v0, 0x4

    if-ne p2, v0, :cond_e

    .line 178
    :cond_a
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->stopTaskForPeriodicallyUpdatingRelativeTime()V

    .line 182
    :goto_d
    return-void

    .line 180
    :cond_e
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->startTaskForPeriodicallyUpdatingRelativeTime()V

    goto :goto_d
.end method

.method public setPrefix(Ljava/lang/String;)V
    .registers 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mPrefix:Ljava/lang/String;

    .line 86
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->updateTextDisplay()V

    .line 87
    return-void
.end method

.method public setReferenceTime(J)V
    .registers 6
    .param p1, "referenceTime"    # J

    .prologue
    .line 116
    iput-wide p1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    .line 122
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->stopTaskForPeriodicallyUpdatingRelativeTime()V

    .line 127
    new-instance v0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;

    iget-wide v1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mReferenceTime:J

    invoke-direct {v0, p0, v1, v2}, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;-><init>(Lcom/github/curioustechizen/ago/RelativeTimeTextView;J)V

    iput-object v0, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mUpdateTimeTask:Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;

    .line 132
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->startTaskForPeriodicallyUpdatingRelativeTime()V

    .line 137
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->updateTextDisplay()V

    .line 138
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .registers 2
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mSuffix:Ljava/lang/String;

    .line 106
    invoke-direct {p0}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->updateTextDisplay()V

    .line 107
    return-void
.end method

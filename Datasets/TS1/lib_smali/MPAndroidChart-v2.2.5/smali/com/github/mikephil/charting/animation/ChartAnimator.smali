.class public Lcom/github/mikephil/charting/animation/ChartAnimator;
.super Ljava/lang/Object;
.source "ChartAnimator.java"


# instance fields
.field private mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field protected mPhaseX:F

.field protected mPhaseY:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput v0, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseY:F

    .line 36
    iput v0, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseX:F

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput v0, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseY:F

    .line 36
    iput v0, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseX:F

    .line 24
    iput-object p1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 25
    return-void
.end method


# virtual methods
.method public animateX(I)V
    .registers 5
    .param p1, "durationMillis"    # I

    .prologue
    .line 248
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 255
    :goto_6
    return-void

    .line 251
    :cond_7
    const-string v1, "phaseX"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_20

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 252
    .local v0, "animatorX":Landroid/animation/ObjectAnimator;
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 253
    iget-object v1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 254
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6

    .line 251
    :array_20
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateX(ILcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 6
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    .line 172
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 180
    :goto_6
    return-void

    .line 175
    :cond_7
    const-string v1, "phaseX"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_28

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 176
    .local v0, "animatorX":Landroid/animation/ObjectAnimator;
    invoke-static {p2}, Lcom/github/mikephil/charting/animation/Easing;->getEasingFunctionFromOption(Lcom/github/mikephil/charting/animation/Easing$EasingOption;)Lcom/github/mikephil/charting/animation/EasingFunction;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 177
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 178
    iget-object v1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 179
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6

    .line 175
    nop

    :array_28
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateX(ILcom/github/mikephil/charting/animation/EasingFunction;)V
    .registers 6
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/EasingFunction;

    .prologue
    .line 90
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 98
    :goto_6
    return-void

    .line 93
    :cond_7
    const-string v1, "phaseX"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_24

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 94
    .local v0, "animatorX":Landroid/animation/ObjectAnimator;
    invoke-virtual {v0, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 95
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 96
    iget-object v1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 97
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6

    .line 93
    nop

    :array_24
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateXY(II)V
    .registers 8
    .param p1, "durationMillisX"    # I
    .param p2, "durationMillisY"    # I

    .prologue
    const/4 v4, 0x2

    .line 217
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_8

    .line 237
    :goto_7
    return-void

    .line 220
    :cond_8
    const-string v2, "phaseY"

    new-array v3, v4, [F

    fill-array-data v3, :array_3a

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 221
    .local v1, "animatorY":Landroid/animation/ObjectAnimator;
    int-to-long v2, p2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 223
    const-string v2, "phaseX"

    new-array v3, v4, [F

    fill-array-data v3, :array_42

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 224
    .local v0, "animatorX":Landroid/animation/ObjectAnimator;
    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 229
    if-le p1, p2, :cond_34

    .line 230
    iget-object v2, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 235
    :goto_2d
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 236
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_7

    .line 232
    :cond_34
    iget-object v2, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_2d

    .line 220
    :array_3a
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 223
    :array_42
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateXY(IILcom/github/mikephil/charting/animation/Easing$EasingOption;Lcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 10
    .param p1, "durationMillisX"    # I
    .param p2, "durationMillisY"    # I
    .param p3, "easingX"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;
    .param p4, "easingY"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    const/4 v4, 0x2

    .line 138
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_8

    .line 160
    :goto_7
    return-void

    .line 141
    :cond_8
    const-string v2, "phaseY"

    new-array v3, v4, [F

    fill-array-data v3, :array_48

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 142
    .local v1, "animatorY":Landroid/animation/ObjectAnimator;
    invoke-static {p4}, Lcom/github/mikephil/charting/animation/Easing;->getEasingFunctionFromOption(Lcom/github/mikephil/charting/animation/Easing$EasingOption;)Lcom/github/mikephil/charting/animation/EasingFunction;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 143
    int-to-long v2, p2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 145
    const-string v2, "phaseX"

    new-array v3, v4, [F

    fill-array-data v3, :array_50

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 146
    .local v0, "animatorX":Landroid/animation/ObjectAnimator;
    invoke-static {p3}, Lcom/github/mikephil/charting/animation/Easing;->getEasingFunctionFromOption(Lcom/github/mikephil/charting/animation/Easing$EasingOption;)Lcom/github/mikephil/charting/animation/EasingFunction;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 147
    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 152
    if-le p1, p2, :cond_42

    .line 153
    iget-object v2, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 158
    :goto_3b
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 159
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_7

    .line 155
    :cond_42
    iget-object v2, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_3b

    .line 141
    :array_48
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 145
    :array_50
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateXY(IILcom/github/mikephil/charting/animation/EasingFunction;Lcom/github/mikephil/charting/animation/EasingFunction;)V
    .registers 10
    .param p1, "durationMillisX"    # I
    .param p2, "durationMillisY"    # I
    .param p3, "easingX"    # Lcom/github/mikephil/charting/animation/EasingFunction;
    .param p4, "easingY"    # Lcom/github/mikephil/charting/animation/EasingFunction;

    .prologue
    const/4 v4, 0x2

    .line 56
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_8

    .line 78
    :goto_7
    return-void

    .line 59
    :cond_8
    const-string v2, "phaseY"

    new-array v3, v4, [F

    fill-array-data v3, :array_40

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 60
    .local v1, "animatorY":Landroid/animation/ObjectAnimator;
    invoke-virtual {v1, p4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    int-to-long v2, p2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 63
    const-string v2, "phaseX"

    new-array v3, v4, [F

    fill-array-data v3, :array_48

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 64
    .local v0, "animatorX":Landroid/animation/ObjectAnimator;
    invoke-virtual {v0, p3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 65
    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 70
    if-le p1, p2, :cond_3a

    .line 71
    iget-object v2, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 76
    :goto_33
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 77
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_7

    .line 73
    :cond_3a
    iget-object v2, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    goto :goto_33

    .line 59
    :array_40
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 63
    :array_48
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateY(I)V
    .registers 5
    .param p1, "durationMillis"    # I

    .prologue
    .line 266
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 273
    :goto_6
    return-void

    .line 269
    :cond_7
    const-string v1, "phaseY"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_20

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 270
    .local v0, "animatorY":Landroid/animation/ObjectAnimator;
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 271
    iget-object v1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 272
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6

    .line 269
    :array_20
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateY(ILcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 6
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    .line 192
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 200
    :goto_6
    return-void

    .line 195
    :cond_7
    const-string v1, "phaseY"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_28

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 196
    .local v0, "animatorY":Landroid/animation/ObjectAnimator;
    invoke-static {p2}, Lcom/github/mikephil/charting/animation/Easing;->getEasingFunctionFromOption(Lcom/github/mikephil/charting/animation/Easing$EasingOption;)Lcom/github/mikephil/charting/animation/EasingFunction;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 197
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 198
    iget-object v1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 199
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6

    .line 195
    nop

    :array_28
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateY(ILcom/github/mikephil/charting/animation/EasingFunction;)V
    .registers 6
    .param p1, "durationMillis"    # I
    .param p2, "easing"    # Lcom/github/mikephil/charting/animation/EasingFunction;

    .prologue
    .line 110
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 118
    :goto_6
    return-void

    .line 113
    :cond_7
    const-string v1, "phaseY"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_24

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 114
    .local v0, "animatorY":Landroid/animation/ObjectAnimator;
    invoke-virtual {v0, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 115
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 116
    iget-object v1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 117
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6

    .line 113
    nop

    :array_24
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public getPhaseX()F
    .registers 2

    .prologue
    .line 299
    iget v0, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseX:F

    return v0
.end method

.method public getPhaseY()F
    .registers 2

    .prologue
    .line 281
    iget v0, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseY:F

    return v0
.end method

.method public setPhaseX(F)V
    .registers 2
    .param p1, "phase"    # F

    .prologue
    .line 308
    iput p1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseX:F

    .line 309
    return-void
.end method

.method public setPhaseY(F)V
    .registers 2
    .param p1, "phase"    # F

    .prologue
    .line 290
    iput p1, p0, Lcom/github/mikephil/charting/animation/ChartAnimator;->mPhaseY:F

    .line 291
    return-void
.end method

.class public Landroid/support/percent/PercentLayoutHelper;
.super Ljava/lang/Object;
.source "PercentLayoutHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;,
        Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;,
        Landroid/support/percent/PercentLayoutHelper$PercentMarginLayoutParams;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PercentLayout"


# instance fields
.field private final mHost:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 2
    .param p1, "host"    # Landroid/view/ViewGroup;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    .line 79
    return-void
.end method

.method public static fetchWidthAndHeight(Landroid/view/ViewGroup$LayoutParams;Landroid/content/res/TypedArray;II)V
    .registers 6
    .param p0, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .param p1, "array"    # Landroid/content/res/TypedArray;
    .param p2, "widthAttr"    # I
    .param p3, "heightAttr"    # I

    .prologue
    const/4 v1, 0x0

    .line 88
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 89
    invoke-virtual {p1, p3, v1}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 90
    return-void
.end method

.method public static getPercentLayoutInfo(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/high16 v6, -0x40800000    # -1.0f

    .line 137
    const/4 v1, 0x0

    .line 138
    .local v1, "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    sget-object v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout:[I

    invoke-virtual {p0, p1, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 139
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_widthPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 141
    .local v2, "value":F
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_39

    .line 142
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 143
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent width: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_35
    if-eqz v1, :cond_202

    .line 146
    :goto_37
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->widthPercent:F

    .line 148
    :cond_39
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_heightPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 149
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_67

    .line 150
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_63

    .line 151
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent height: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    :cond_63
    if-eqz v1, :cond_209

    .line 154
    :goto_65
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->heightPercent:F

    .line 156
    :cond_67
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 157
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_9b

    .line 158
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_91

    .line 159
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    :cond_91
    if-eqz v1, :cond_210

    .line 162
    :goto_93
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->leftMarginPercent:F

    .line 163
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->topMarginPercent:F

    .line 164
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->rightMarginPercent:F

    .line 165
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->bottomMarginPercent:F

    .line 167
    :cond_9b
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginLeftPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 169
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_c9

    .line 170
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_c5

    .line 171
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent left margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    :cond_c5
    if-eqz v1, :cond_217

    .line 174
    :goto_c7
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->leftMarginPercent:F

    .line 176
    :cond_c9
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginTopPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 178
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_f7

    .line 179
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_f3

    .line 180
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent top margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    :cond_f3
    if-eqz v1, :cond_21e

    .line 183
    :goto_f5
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->topMarginPercent:F

    .line 185
    :cond_f7
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginRightPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 187
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_125

    .line 188
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_121

    .line 189
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent right margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    :cond_121
    if-eqz v1, :cond_225

    .line 192
    :goto_123
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->rightMarginPercent:F

    .line 194
    :cond_125
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginBottomPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 196
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_153

    .line 197
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_14f

    .line 198
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent bottom margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    :cond_14f
    if-eqz v1, :cond_22c

    .line 201
    :goto_151
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->bottomMarginPercent:F

    .line 203
    :cond_153
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginStartPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 205
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_181

    .line 206
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_17d

    .line 207
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent start margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    :cond_17d
    if-eqz v1, :cond_233

    .line 210
    :goto_17f
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->startMarginPercent:F

    .line 212
    :cond_181
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_marginEndPercent:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 214
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_1af

    .line 215
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1ab

    .line 216
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "percent end margin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :cond_1ab
    if-eqz v1, :cond_23a

    .line 219
    :goto_1ad
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->endMarginPercent:F

    .line 222
    :cond_1af
    sget v3, Landroid/support/percent/R$styleable;->PercentLayout_Layout_layout_aspectRatio:I

    invoke-virtual {v0, v3, v7, v7, v6}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v2

    .line 223
    cmpl-float v3, v2, v6

    if-eqz v3, :cond_1dd

    .line 224
    const-string v3, "PercentLayout"

    invoke-static {v3, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1d9

    .line 225
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "aspect ratio: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    :cond_1d9
    if-eqz v1, :cond_241

    .line 228
    :goto_1db
    iput v2, v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->aspectRatio:F

    .line 231
    :cond_1dd
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 232
    const-string v3, "PercentLayout"

    const/4 v4, 0x3

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_201

    .line 233
    const-string v3, "PercentLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "constructed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    :cond_201
    return-object v1

    .line 145
    :cond_202
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_37

    .line 153
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_209
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_65

    .line 161
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_210
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_93

    .line 173
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_217
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_c7

    .line 182
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_21e
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_f5

    .line 191
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_225
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_123

    .line 200
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_22c
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_151

    .line 209
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_233
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_17f

    .line 218
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_23a
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto/16 :goto_1ad

    .line 227
    .restart local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_241
    new-instance v1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .end local v1    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    invoke-direct {v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    goto :goto_1db
.end method

.method private static shouldHandleMeasuredHeightTooSmall(Landroid/view/View;Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;)Z
    .registers 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "info"    # Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .prologue
    .line 317
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMeasuredHeightAndState(Landroid/view/View;)I

    move-result v1

    const/high16 v2, -0x1000000

    and-int v0, v1, v2

    .line 318
    .local v0, "state":I
    const/high16 v1, 0x1000000

    if-ne v0, v1, :cond_1c

    iget v1, p1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->heightPercent:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_1c

    iget-object v1, p1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroid/support/percent/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, v1, Landroid/support/percent/PercentLayoutHelper$PercentMarginLayoutParams;->height:I

    const/4 v2, -0x2

    if-ne v1, v2, :cond_1c

    const/4 v1, 0x1

    :goto_1b
    return v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method private static shouldHandleMeasuredWidthTooSmall(Landroid/view/View;Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;)Z
    .registers 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "info"    # Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .prologue
    .line 311
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMeasuredWidthAndState(Landroid/view/View;)I

    move-result v1

    const/high16 v2, -0x1000000

    and-int v0, v1, v2

    .line 312
    .local v0, "state":I
    const/high16 v1, 0x1000000

    if-ne v0, v1, :cond_1c

    iget v1, p1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->widthPercent:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_1c

    iget-object v1, p1, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroid/support/percent/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, v1, Landroid/support/percent/PercentLayoutHelper$PercentMarginLayoutParams;->width:I

    const/4 v2, -0x2

    if-ne v1, v2, :cond_1c

    const/4 v1, 0x1

    :goto_1b
    return v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method


# virtual methods
.method public adjustChildren(II)V
    .registers 14
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v10, 0x3

    .line 99
    const-string v7, "PercentLayout"

    invoke-static {v7, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_3f

    .line 100
    const-string v7, "PercentLayout"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "adjustChildren: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " widthMeasureSpec: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " heightMeasureSpec: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :cond_3f
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 106
    .local v6, "widthHint":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 107
    .local v1, "heightHint":I
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v7, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_4e
    if-ge v2, v0, :cond_c1

    .line 108
    iget-object v7, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 109
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 110
    .local v4, "params":Landroid/view/ViewGroup$LayoutParams;
    const-string v7, "PercentLayout"

    invoke-static {v7, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_84

    .line 111
    const-string v7, "PercentLayout"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "should adjust "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    :cond_84
    instance-of v7, v4, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;

    if-eqz v7, :cond_ba

    move-object v7, v4

    .line 114
    check-cast v7, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;

    invoke-interface {v7}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;->getPercentLayoutInfo()Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    move-result-object v3

    .line 116
    .local v3, "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    const-string v7, "PercentLayout"

    invoke-static {v7, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v7

    if-eqz v7, :cond_af

    .line 117
    const-string v7, "PercentLayout"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "using "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    :cond_af
    if-eqz v3, :cond_ba

    .line 120
    instance-of v7, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_bd

    .line 121
    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local v4    # "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v3, v5, v4, v6, v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->fillMarginLayoutParams(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;II)V

    .line 107
    .end local v3    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_ba
    :goto_ba
    add-int/lit8 v2, v2, 0x1

    goto :goto_4e

    .line 124
    .restart local v3    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    .restart local v4    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_bd
    invoke-virtual {v3, v4, v6, v1}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->fillLayoutParams(Landroid/view/ViewGroup$LayoutParams;II)V

    goto :goto_ba

    .line 129
    .end local v3    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    .end local v4    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v5    # "view":Landroid/view/View;
    :cond_c1
    return-void
.end method

.method public handleMeasuredStateTooSmall()Z
    .registers 12

    .prologue
    const/4 v10, 0x3

    const/4 v9, -0x2

    .line 282
    const/4 v3, 0x0

    .line 283
    .local v3, "needsSecondMeasure":Z
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v6, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_a
    if-ge v1, v0, :cond_62

    .line 284
    iget-object v6, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 285
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 286
    .local v4, "params":Landroid/view/ViewGroup$LayoutParams;
    const-string v6, "PercentLayout"

    invoke-static {v6, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_40

    .line 287
    const-string v6, "PercentLayout"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "should handle measured state too small "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    :cond_40
    instance-of v6, v4, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;

    if-eqz v6, :cond_5f

    move-object v6, v4

    .line 290
    check-cast v6, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;

    invoke-interface {v6}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;->getPercentLayoutInfo()Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    move-result-object v2

    .line 292
    .local v2, "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    if-eqz v2, :cond_5f

    .line 293
    invoke-static {v5, v2}, Landroid/support/percent/PercentLayoutHelper;->shouldHandleMeasuredWidthTooSmall(Landroid/view/View;Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;)Z

    move-result v6

    if-eqz v6, :cond_56

    .line 294
    const/4 v3, 0x1

    .line 295
    iput v9, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 297
    :cond_56
    invoke-static {v5, v2}, Landroid/support/percent/PercentLayoutHelper;->shouldHandleMeasuredHeightTooSmall(Landroid/view/View;Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;)Z

    move-result v6

    if-eqz v6, :cond_5f

    .line 298
    const/4 v3, 0x1

    .line 299
    iput v9, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 283
    .end local v2    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_5f
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 304
    .end local v4    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v5    # "view":Landroid/view/View;
    :cond_62
    const-string v6, "PercentLayout"

    invoke-static {v6, v10}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_82

    .line 305
    const-string v6, "PercentLayout"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "should trigger second measure pass: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    :cond_82
    return v3
.end method

.method public restoreOriginalParams()V
    .registers 10

    .prologue
    const/4 v8, 0x3

    .line 244
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v5, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_8
    if-ge v1, v0, :cond_7b

    .line 245
    iget-object v5, p0, Landroid/support/percent/PercentLayoutHelper;->mHost:Landroid/view/ViewGroup;

    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 246
    .local v4, "view":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 247
    .local v3, "params":Landroid/view/ViewGroup$LayoutParams;
    const-string v5, "PercentLayout"

    invoke-static {v5, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 248
    const-string v5, "PercentLayout"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "should restore "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_3e
    instance-of v5, v3, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;

    if-eqz v5, :cond_74

    move-object v5, v3

    .line 251
    check-cast v5, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;

    invoke-interface {v5}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;->getPercentLayoutInfo()Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    move-result-object v2

    .line 253
    .local v2, "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    const-string v5, "PercentLayout"

    invoke-static {v5, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_69

    .line 254
    const-string v5, "PercentLayout"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "using "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    :cond_69
    if-eqz v2, :cond_74

    .line 257
    instance-of v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_77

    .line 258
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local v3    # "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v2, v3}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->restoreMarginLayoutParams(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 244
    .end local v2    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    :cond_74
    :goto_74
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 260
    .restart local v2    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    .restart local v3    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_77
    invoke-virtual {v2, v3}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;->restoreLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_74

    .line 265
    .end local v2    # "info":Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    .end local v3    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v4    # "view":Landroid/view/View;
    :cond_7b
    return-void
.end method

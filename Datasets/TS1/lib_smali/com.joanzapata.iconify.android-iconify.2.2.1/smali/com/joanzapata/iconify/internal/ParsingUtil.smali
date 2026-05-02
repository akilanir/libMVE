.class public final Lcom/joanzapata/iconify/internal/ParsingUtil;
.super Ljava/lang/Object;
.source "ParsingUtil.java"


# static fields
.field private static final ANDROID_PACKAGE_NAME:Ljava/lang/String; = "android"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dpToPx(Landroid/content/Context;F)F
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dp"    # F

    .prologue
    .line 207
    const/4 v0, 0x1

    .line 208
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 207
    invoke-static {v0, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    return v0
.end method

.method public static getColorFromResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "resName"    # Ljava/lang/String;

    .prologue
    .line 198
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 199
    .local v1, "resources":Landroid/content/res/Resources;
    const-string v2, "color"

    invoke-virtual {v1, p2, v2, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 202
    .local v0, "resId":I
    if-gtz v0, :cond_10

    const v2, 0x7fffffff

    .line 203
    :goto_f
    return v2

    :cond_10
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    goto :goto_f
.end method

.method public static getPxFromDimen(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)F
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "resName"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 190
    .local v1, "resources":Landroid/content/res/Resources;
    const-string v2, "dimen"

    invoke-virtual {v1, p2, v2, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 193
    .local v0, "resId":I
    if-gtz v0, :cond_f

    const/high16 v2, -0x40800000    # -1.0f

    .line 194
    :goto_e
    return v2

    :cond_f
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    goto :goto_e
.end method

.method private static hasAnimatedSpans(Landroid/text/SpannableStringBuilder;)Z
    .registers 7
    .param p0, "spannableBuilder"    # Landroid/text/SpannableStringBuilder;

    .prologue
    const/4 v2, 0x0

    .line 82
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const-class v4, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;

    invoke-virtual {p0, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;

    .line 83
    .local v1, "spans":[Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;
    array-length v4, v1

    move v3, v2

    :goto_f
    if-ge v3, v4, :cond_1a

    aget-object v0, v1, v3

    .line 84
    .local v0, "span":Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;
    invoke-virtual {v0}, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;->isAnimated()Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 85
    const/4 v2, 0x1

    .line 87
    .end local v0    # "span":Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;
    :cond_1a
    return v2

    .line 83
    .restart local v0    # "span":Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;
    :cond_1b
    add-int/lit8 v3, v3, 0x1

    goto :goto_f
.end method

.method public static parse(Landroid/content/Context;Ljava/util/List;Ljava/lang/CharSequence;Landroid/widget/TextView;)Ljava/lang/CharSequence;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "target"    # Landroid/widget/TextView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;",
            ">;",
            "Ljava/lang/CharSequence;",
            "Landroid/widget/TextView;",
            ")",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "iconFontDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;>;"
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 32
    if-nez p2, :cond_7

    .line 78
    .end local p2    # "text":Ljava/lang/CharSequence;
    .end local p3    # "target":Landroid/widget/TextView;
    :goto_6
    return-object p2

    .line 36
    .restart local p2    # "text":Ljava/lang/CharSequence;
    .restart local p3    # "target":Landroid/widget/TextView;
    :cond_7
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 38
    .local v1, "spannableBuilder":Landroid/text/SpannableStringBuilder;
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 37
    invoke-static {p0, v2, v1, p1, v3}, Lcom/joanzapata/iconify/internal/ParsingUtil;->recursivePrepareSpannableIndexes(Landroid/content/Context;Ljava/lang/String;Landroid/text/SpannableStringBuilder;Ljava/util/List;I)V

    .line 40
    invoke-static {v1}, Lcom/joanzapata/iconify/internal/ParsingUtil;->hasAnimatedSpans(Landroid/text/SpannableStringBuilder;)Z

    move-result v0

    .line 44
    .local v0, "isAnimated":Z
    if-eqz v0, :cond_5c

    .line 45
    if-nez p3, :cond_24

    .line 46
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "You can\'t use \"spin\" without providing the target TextView."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 47
    :cond_24
    instance-of v2, p3, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;

    if-nez v2, :cond_4f

    .line 48
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " does not implement "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "HasOnViewAttachListener. Please use IconTextView, IconButton or IconToggleButton."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_4f
    move-object v2, p3

    .line 51
    check-cast v2, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;

    new-instance v3, Lcom/joanzapata/iconify/internal/ParsingUtil$1;

    invoke-direct {v3, p3}, Lcom/joanzapata/iconify/internal/ParsingUtil$1;-><init>(Landroid/widget/TextView;)V

    invoke-interface {v2, v3}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;->setOnViewAttachListener(Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;)V

    .end local p3    # "target":Landroid/widget/TextView;
    :cond_5a
    :goto_5a
    move-object p2, v1

    .line 78
    goto :goto_6

    .line 74
    .restart local p3    # "target":Landroid/widget/TextView;
    :cond_5c
    instance-of v2, p3, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;

    if-eqz v2, :cond_5a

    .line 75
    check-cast p3, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;

    .end local p3    # "target":Landroid/widget/TextView;
    const/4 v2, 0x0

    invoke-interface {p3, v2}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;->setOnViewAttachListener(Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;)V

    goto :goto_5a
.end method

.method private static recursivePrepareSpannableIndexes(Landroid/content/Context;Ljava/lang/String;Landroid/text/SpannableStringBuilder;Ljava/util/List;I)V
    .registers 28
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fullText"    # Ljava/lang/String;
    .param p2, "text"    # Landroid/text/SpannableStringBuilder;
    .param p4, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/List",
            "<",
            "Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p3, "iconFontDescriptors":Ljava/util/List;, "Ljava/util/List<Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;>;"
    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 99
    .local v19, "stringText":Ljava/lang/String;
    const-string v5, "{"

    move-object/from16 v0, v19

    move/from16 v1, p4

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v18

    .line 100
    .local v18, "startIndex":I
    const/4 v5, -0x1

    move/from16 v0, v18

    if-ne v0, v5, :cond_14

    .line 186
    :cond_13
    :goto_13
    return-void

    .line 101
    :cond_14
    const-string v5, "}"

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    add-int/lit8 v13, v5, 0x1

    .line 102
    .local v13, "endIndex":I
    const/4 v5, -0x1

    if-eq v13, v5, :cond_13

    .line 103
    add-int/lit8 v5, v18, 0x1

    add-int/lit8 v7, v13, -0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 106
    .local v14, "expression":Ljava/lang/String;
    const-string v5, " "

    invoke-virtual {v14, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v21

    .line 107
    .local v21, "strokes":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v17, v21, v5

    .line 110
    .local v17, "key":Ljava/lang/String;
    const/16 v16, 0x0

    .line 111
    .local v16, "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    const/4 v6, 0x0

    .line 112
    .local v6, "icon":Lcom/joanzapata/iconify/Icon;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_3a
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v15, v5, :cond_4e

    .line 113
    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .end local v16    # "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    check-cast v16, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;

    .line 114
    .restart local v16    # "iconFontDescriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    invoke-virtual/range {v16 .. v17}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->getIcon(Ljava/lang/String;)Lcom/joanzapata/iconify/Icon;

    move-result-object v6

    .line 115
    if-eqz v6, :cond_5c

    .line 119
    :cond_4e
    if-nez v6, :cond_5f

    .line 120
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-static {v0, v1, v2, v3, v13}, Lcom/joanzapata/iconify/internal/ParsingUtil;->recursivePrepareSpannableIndexes(Landroid/content/Context;Ljava/lang/String;Landroid/text/SpannableStringBuilder;Ljava/util/List;I)V

    goto :goto_13

    .line 112
    :cond_5c
    add-int/lit8 v15, v15, 0x1

    goto :goto_3a

    .line 125
    :cond_5f
    const/high16 v8, -0x40800000    # -1.0f

    .line 126
    .local v8, "iconSizePx":F
    const v10, 0x7fffffff

    .line 127
    .local v10, "iconColor":I
    const/high16 v9, -0x40800000    # -1.0f

    .line 128
    .local v9, "iconSizeRatio":F
    const/4 v11, 0x0

    .line 129
    .local v11, "spin":Z
    const/4 v12, 0x0

    .line 130
    .local v12, "baselineAligned":Z
    const/4 v15, 0x1

    :goto_69
    move-object/from16 v0, v21

    array-length v5, v0

    if-ge v15, v5, :cond_2a9

    .line 131
    aget-object v20, v21, v15

    .line 134
    .local v20, "stroke":Ljava/lang/String;
    const-string v5, "spin"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7e

    .line 135
    const/4 v11, 0x1

    .line 130
    :cond_7b
    :goto_7b
    add-int/lit8 v15, v15, 0x1

    goto :goto_69

    .line 139
    :cond_7e
    const-string v5, "baseline"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8a

    .line 140
    const/4 v12, 0x1

    goto :goto_7b

    .line 144
    :cond_8a
    const-string v5, "([0-9]*(\\.[0-9]*)?)dp"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b0

    .line 145
    const/4 v5, 0x0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lcom/joanzapata/iconify/internal/ParsingUtil;->dpToPx(Landroid/content/Context;F)F

    move-result v8

    goto :goto_7b

    .line 146
    :cond_b0
    const-string v5, "([0-9]*(\\.[0-9]*)?)sp"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d6

    .line 147
    const/4 v5, 0x0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lcom/joanzapata/iconify/internal/ParsingUtil;->spToPx(Landroid/content/Context;F)F

    move-result v8

    goto :goto_7b

    .line 148
    :cond_d6
    const-string v5, "([0-9]*)px"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_f7

    .line 149
    const/4 v5, 0x0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-float v8, v5

    goto :goto_7b

    .line 150
    :cond_f7
    const-string v5, "@dimen/(.*)"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_14a

    .line 151
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x7

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-static {v0, v5, v7}, Lcom/joanzapata/iconify/internal/ParsingUtil;->getPxFromDimen(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)F

    move-result v8

    .line 152
    const/4 v5, 0x0

    cmpg-float v5, v8, v5

    if-gez v5, :cond_7b

    .line 153
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unknown resource "

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, " in \""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, "\""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 154
    :cond_14a
    const-string v5, "@android:dimen/(.*)"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_19c

    .line 155
    const-string v5, "android"

    const/16 v7, 0xf

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-static {v0, v5, v7}, Lcom/joanzapata/iconify/internal/ParsingUtil;->getPxFromDimen(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)F

    move-result v8

    .line 156
    const/4 v5, 0x0

    cmpg-float v5, v8, v5

    if-gez v5, :cond_7b

    .line 157
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unknown resource "

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, " in \""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, "\""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 158
    :cond_19c
    const-string v5, "([0-9]*(\\.[0-9]*)?)%"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c1

    .line 159
    const/4 v5, 0x0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    const/high16 v7, 0x42c80000    # 100.0f

    div-float v9, v5, v7

    goto/16 :goto_7b

    .line 163
    :cond_1c1
    const-string v5, "#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1d1

    .line 164
    invoke-static/range {v20 .. v20}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    goto/16 :goto_7b

    .line 165
    :cond_1d1
    const-string v5, "@color/(.*)"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_224

    .line 166
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x7

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-static {v0, v5, v7}, Lcom/joanzapata/iconify/internal/ParsingUtil;->getColorFromResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 167
    const v5, 0x7fffffff

    if-ne v10, v5, :cond_7b

    .line 168
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unknown resource "

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, " in \""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, "\""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 169
    :cond_224
    const-string v5, "@android:color/(.*)"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_276

    .line 170
    const-string v5, "android"

    const/16 v7, 0xf

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-static {v0, v5, v7}, Lcom/joanzapata/iconify/internal/ParsingUtil;->getColorFromResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    .line 171
    const v5, 0x7fffffff

    if-ne v10, v5, :cond_7b

    .line 172
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unknown resource "

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, " in \""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, "\""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 174
    :cond_276
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unknown expression "

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, " in \""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v22, "\""

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 179
    .end local v20    # "stroke":Ljava/lang/String;
    :cond_2a9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v6}, Lcom/joanzapata/iconify/Icon;->character()C

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-virtual {v0, v1, v13, v5}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p2

    .line 180
    new-instance v5, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;

    .line 181
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-direct/range {v5 .. v12}, Lcom/joanzapata/iconify/internal/CustomTypefaceSpan;-><init>(Lcom/joanzapata/iconify/Icon;Landroid/graphics/Typeface;FFIZZ)V

    add-int/lit8 v7, v18, 0x1

    const/16 v22, 0x11

    .line 180
    move-object/from16 v0, p2

    move/from16 v1, v18

    move/from16 v2, v22

    invoke-virtual {v0, v5, v1, v7, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 185
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, v18

    invoke-static {v0, v1, v2, v3, v4}, Lcom/joanzapata/iconify/internal/ParsingUtil;->recursivePrepareSpannableIndexes(Landroid/content/Context;Ljava/lang/String;Landroid/text/SpannableStringBuilder;Ljava/util/List;I)V

    goto/16 :goto_13
.end method

.method public static spToPx(Landroid/content/Context;F)F
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sp"    # F

    .prologue
    .line 212
    const/4 v0, 0x2

    .line 213
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 212
    invoke-static {v0, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    return v0
.end method

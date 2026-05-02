.class public Lin/uncod/android/bypass/Bypass;
.super Ljava/lang/Object;
.source "Bypass.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lin/uncod/android/bypass/Bypass$ImageGetter;,
        Lin/uncod/android/bypass/Bypass$Options;
    }
.end annotation


# instance fields
.field private final mBlockQuoteIndent:I

.field private final mCodeBlockIndent:I

.field private final mHruleSize:I

.field private final mHruleTopBottomPadding:I

.field private final mListItemIndent:I

.field private final mOptions:Lin/uncod/android/bypass/Bypass$Options;

.field private final mOrderedListNumber:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lin/uncod/android/bypass/Element;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-string v0, "bypass"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public constructor <init>()V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/16 v2, 0x14

    const/16 v1, 0xa

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    .line 51
    new-instance v0, Lin/uncod/android/bypass/Bypass$Options;

    invoke-direct {v0}, Lin/uncod/android/bypass/Bypass$Options;-><init>()V

    iput-object v0, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    .line 52
    iput v2, p0, Lin/uncod/android/bypass/Bypass;->mListItemIndent:I

    .line 53
    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mBlockQuoteIndent:I

    .line 54
    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mCodeBlockIndent:I

    .line 55
    const/4 v0, 0x2

    iput v0, p0, Lin/uncod/android/bypass/Bypass;->mHruleSize:I

    .line 56
    iput v2, p0, Lin/uncod/android/bypass/Bypass;->mHruleTopBottomPadding:I

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    new-instance v0, Lin/uncod/android/bypass/Bypass$Options;

    invoke-direct {v0}, Lin/uncod/android/bypass/Bypass$Options;-><init>()V

    invoke-direct {p0, p1, v0}, Lin/uncod/android/bypass/Bypass;-><init>(Landroid/content/Context;Lin/uncod/android/bypass/Bypass$Options;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lin/uncod/android/bypass/Bypass$Options;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Lin/uncod/android/bypass/Bypass$Options;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    .line 64
    iput-object p2, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    .line 66
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 68
    .local v0, "dm":Landroid/util/DisplayMetrics;
    iget-object v1, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentUnit:I
    invoke-static {v1}, Lin/uncod/android/bypass/Bypass$Options;->access$000(Lin/uncod/android/bypass/Bypass$Options;)I

    move-result v1

    iget-object v2, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    .line 69
    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mListItemIndentSize:F
    invoke-static {v2}, Lin/uncod/android/bypass/Bypass$Options;->access$100(Lin/uncod/android/bypass/Bypass$Options;)F

    move-result v2

    .line 68
    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mListItemIndent:I

    .line 71
    iget-object v1, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentUnit:I
    invoke-static {v1}, Lin/uncod/android/bypass/Bypass$Options;->access$200(Lin/uncod/android/bypass/Bypass$Options;)I

    move-result v1

    iget-object v2, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    .line 72
    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteIndentSize:F
    invoke-static {v2}, Lin/uncod/android/bypass/Bypass$Options;->access$300(Lin/uncod/android/bypass/Bypass$Options;)F

    move-result v2

    .line 71
    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mBlockQuoteIndent:I

    .line 74
    iget-object v1, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentUnit:I
    invoke-static {v1}, Lin/uncod/android/bypass/Bypass$Options;->access$400(Lin/uncod/android/bypass/Bypass$Options;)I

    move-result v1

    iget-object v2, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    .line 75
    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mCodeBlockIndentSize:F
    invoke-static {v2}, Lin/uncod/android/bypass/Bypass$Options;->access$500(Lin/uncod/android/bypass/Bypass$Options;)F

    move-result v2

    .line 74
    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mCodeBlockIndent:I

    .line 77
    iget-object v1, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mHruleUnit:I
    invoke-static {v1}, Lin/uncod/android/bypass/Bypass$Options;->access$600(Lin/uncod/android/bypass/Bypass$Options;)I

    move-result v1

    iget-object v2, p0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    .line 78
    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mHruleSize:F
    invoke-static {v2}, Lin/uncod/android/bypass/Bypass$Options;->access$700(Lin/uncod/android/bypass/Bypass$Options;)F

    move-result v2

    .line 77
    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mHruleSize:I

    .line 80
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    float-to-int v1, v1

    mul-int/lit8 v1, v1, 0xa

    iput v1, p0, Lin/uncod/android/bypass/Bypass;->mHruleTopBottomPadding:I

    .line 81
    return-void
.end method

.method private native processMarkdown(Ljava/lang/String;)Lin/uncod/android/bypass/Document;
.end method

.method private recurseElement(Lin/uncod/android/bypass/Element;IILin/uncod/android/bypass/Bypass$ImageGetter;)Ljava/lang/CharSequence;
    .registers 28
    .param p1, "element"    # Lin/uncod/android/bypass/Element;
    .param p2, "indexWithinParent"    # I
    .param p3, "numberOfSiblings"    # I
    .param p4, "imageGetter"    # Lin/uncod/android/bypass/Bypass$ImageGetter;

    .prologue
    .line 108
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getType()Lin/uncod/android/bypass/Element$Type;

    move-result-object v18

    .line 110
    .local v18, "type":Lin/uncod/android/bypass/Element$Type;
    const/4 v9, 0x0

    .line 111
    .local v9, "isOrderedList":Z
    sget-object v19, Lin/uncod/android/bypass/Element$Type;->LIST:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_39

    .line 112
    const-string v19, "flags"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 113
    .local v6, "flagsStr":Ljava/lang/String;
    if-eqz v6, :cond_39

    .line 114
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 115
    .local v5, "flags":I
    and-int/lit8 v19, v5, 0x1

    if-eqz v19, :cond_5b

    const/4 v9, 0x1

    .line 116
    :goto_22
    if-eqz v9, :cond_39

    .line 117
    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .end local v5    # "flags":I
    .end local v6    # "flagsStr":Ljava/lang/String;
    :cond_39
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->size()I

    move-result v15

    .line 123
    .local v15, "size":I
    new-array v0, v15, [Ljava/lang/CharSequence;

    move-object/from16 v16, v0

    .line 125
    .local v16, "spans":[Ljava/lang/CharSequence;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_42
    if-ge v7, v15, :cond_5d

    .line 126
    move-object/from16 v0, p1

    iget-object v0, v0, Lin/uncod/android/bypass/Element;->children:[Lin/uncod/android/bypass/Element;

    move-object/from16 v19, v0

    aget-object v19, v19, v7

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v7, v15, v2}, Lin/uncod/android/bypass/Bypass;->recurseElement(Lin/uncod/android/bypass/Element;IILin/uncod/android/bypass/Bypass$ImageGetter;)Ljava/lang/CharSequence;

    move-result-object v19

    aput-object v19, v16, v7

    .line 125
    add-int/lit8 v7, v7, 0x1

    goto :goto_42

    .line 115
    .end local v7    # "i":I
    .end local v15    # "size":I
    .end local v16    # "spans":[Ljava/lang/CharSequence;
    .restart local v5    # "flags":I
    .restart local v6    # "flagsStr":Ljava/lang/String;
    :cond_5b
    const/4 v9, 0x0

    goto :goto_22

    .line 130
    .end local v5    # "flags":I
    .end local v6    # "flagsStr":Ljava/lang/String;
    .restart local v7    # "i":I
    .restart local v15    # "size":I
    .restart local v16    # "spans":[Ljava/lang/CharSequence;
    :cond_5d
    if-eqz v9, :cond_6c

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    :cond_6c
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 136
    .local v4, "concat":Ljava/lang/CharSequence;
    new-instance v3, Lin/uncod/android/bypass/ReverseSpannableStringBuilder;

    invoke-direct {v3}, Lin/uncod/android/bypass/ReverseSpannableStringBuilder;-><init>()V

    .line 138
    .local v3, "builder":Landroid/text/SpannableStringBuilder;
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getText()Ljava/lang/String;

    move-result-object v17

    .line 139
    .local v17, "text":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->size()I

    move-result v19

    if-nez v19, :cond_a3

    .line 140
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    if-eqz v19, :cond_a3

    .line 141
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lin/uncod/android/bypass/Element;->getType()Lin/uncod/android/bypass/Element$Type;

    move-result-object v19

    sget-object v20, Lin/uncod/android/bypass/Element$Type;->BLOCK_CODE:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_a3

    .line 142
    const/16 v19, 0xa

    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v17

    .line 147
    :cond_a3
    const/4 v8, 0x0

    .line 148
    .local v8, "imageDrawable":Landroid/graphics/drawable/Drawable;
    sget-object v19, Lin/uncod/android/bypass/Element$Type;->IMAGE:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_d0

    if-eqz p4, :cond_d0

    const-string v19, "link"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_d0

    .line 149
    const-string v19, "link"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p4

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lin/uncod/android/bypass/Bypass$ImageGetter;->getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 152
    :cond_d0
    sget-object v19, Lin/uncod/android/bypass/Bypass$1;->$SwitchMap$in$uncod$android$bypass$Element$Type:[I

    invoke-virtual/range {v18 .. v18}, Lin/uncod/android/bypass/Element$Type;->ordinal()I

    move-result v20

    aget v19, v19, v20

    packed-switch v19, :pswitch_data_3de

    .line 201
    :cond_db
    :goto_db
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 202
    invoke-virtual {v3, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 208
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    if-nez v19, :cond_f1

    add-int/lit8 v19, p3, -0x1

    move/from16 v0, p2

    move/from16 v1, v19

    if-ge v0, v1, :cond_11a

    .line 209
    :cond_f1
    sget-object v19, Lin/uncod/android/bypass/Element$Type;->LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_224

    .line 210
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->size()I

    move-result v19

    if-eqz v19, :cond_113

    move-object/from16 v0, p1

    iget-object v0, v0, Lin/uncod/android/bypass/Element;->children:[Lin/uncod/android/bypass/Element;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->size()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    aget-object v19, v19, v20

    invoke-virtual/range {v19 .. v19}, Lin/uncod/android/bypass/Element;->isBlockElement()Z

    move-result v19

    if-nez v19, :cond_11a

    .line 211
    :cond_113
    const-string v19, "\n"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 232
    :cond_11a
    :goto_11a
    sget-object v19, Lin/uncod/android/bypass/Bypass$1;->$SwitchMap$in$uncod$android$bypass$Element$Type:[I

    invoke-virtual/range {v18 .. v18}, Lin/uncod/android/bypass/Element$Type;->ordinal()I

    move-result v20

    aget v19, v19, v20

    packed-switch v19, :pswitch_data_3ee

    .line 287
    :cond_125
    :goto_125
    :pswitch_125
    return-object v3

    .line 154
    :pswitch_126
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    if-eqz v19, :cond_db

    .line 155
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lin/uncod/android/bypass/Element;->getType()Lin/uncod/android/bypass/Element$Type;

    move-result-object v19

    sget-object v20, Lin/uncod/android/bypass/Element$Type;->LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_db

    .line 156
    const-string v19, "\n"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_db

    .line 160
    :pswitch_144
    const-string v19, "\n"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_db

    .line 163
    :pswitch_14c
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 164
    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1af

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 166
    .local v13, "number":I
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOrderedListNumber:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v20

    add-int/lit8 v21, v13, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-interface/range {v19 .. v21}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .end local v13    # "number":I
    :goto_1a6
    const-string v19, "  "

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_db

    .line 170
    :cond_1af
    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    move-object/from16 v19, v0

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mUnorderedListItem:Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lin/uncod/android/bypass/Bypass$Options;->access$800(Lin/uncod/android/bypass/Bypass$Options;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_1a6

    .line 175
    :pswitch_1bf
    const-string v19, "link"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_db

    .line 180
    :pswitch_1d0
    const-string v19, "-"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_db

    .line 184
    :pswitch_1d9
    if-nez v8, :cond_21b

    .line 185
    const-string v19, "alt"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 186
    .local v14, "show":Ljava/lang/String;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_1f5

    .line 187
    const-string v19, "title"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 189
    :cond_1f5
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_db

    .line 190
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "["

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "]"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 191
    invoke-virtual {v3, v14}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_db

    .line 196
    .end local v14    # "show":Ljava/lang/String;
    :cond_21b
    const-string v19, "\ufffc"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_db

    .line 214
    :cond_224
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->isBlockElement()Z

    move-result v19

    if-eqz v19, :cond_11a

    sget-object v19, Lin/uncod/android/bypass/Element$Type;->BLOCK_QUOTE:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_11a

    .line 215
    sget-object v19, Lin/uncod/android/bypass/Element$Type;->LIST:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_259

    .line 217
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    if-eqz v19, :cond_250

    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lin/uncod/android/bypass/Element;->getType()Lin/uncod/android/bypass/Element$Type;

    move-result-object v19

    sget-object v20, Lin/uncod/android/bypass/Element$Type;->LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_11a

    .line 218
    :cond_250
    const-string v19, "\n"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_11a

    .line 221
    :cond_259
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    if-eqz v19, :cond_278

    .line 222
    invoke-virtual/range {p1 .. p1}, Lin/uncod/android/bypass/Element;->getParent()Lin/uncod/android/bypass/Element;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lin/uncod/android/bypass/Element;->getType()Lin/uncod/android/bypass/Element$Type;

    move-result-object v19

    sget-object v20, Lin/uncod/android/bypass/Element$Type;->LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_278

    .line 224
    const-string v19, "\n"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_11a

    .line 227
    :cond_278
    const-string v19, "\n\n"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_11a

    .line 234
    :pswitch_281
    const-string v19, "level"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 235
    .local v11, "levelStr":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 236
    .local v10, "level":I
    new-instance v19, Landroid/text/style/RelativeSizeSpan;

    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    move-object/from16 v20, v0

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mHeaderSizes:[F
    invoke-static/range {v20 .. v20}, Lin/uncod/android/bypass/Bypass$Options;->access$900(Lin/uncod/android/bypass/Bypass$Options;)[F

    move-result-object v20

    add-int/lit8 v21, v10, -0x1

    aget v20, v20, v21

    invoke-direct/range {v19 .. v20}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 237
    new-instance v19, Landroid/text/style/StyleSpan;

    const/16 v20, 0x1

    invoke-direct/range {v19 .. v20}, Landroid/text/style/StyleSpan;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 240
    .end local v10    # "level":I
    .end local v11    # "levelStr":Ljava/lang/String;
    :pswitch_2b5
    new-instance v19, Landroid/text/style/LeadingMarginSpan$Standard;

    move-object/from16 v0, p0

    iget v0, v0, Lin/uncod/android/bypass/Bypass;->mListItemIndent:I

    move/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setBlockSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 243
    :pswitch_2c7
    new-instance v19, Landroid/text/style/StyleSpan;

    const/16 v20, 0x2

    invoke-direct/range {v19 .. v20}, Landroid/text/style/StyleSpan;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 246
    :pswitch_2d5
    new-instance v19, Landroid/text/style/StyleSpan;

    const/16 v20, 0x1

    invoke-direct/range {v19 .. v20}, Landroid/text/style/StyleSpan;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 249
    :pswitch_2e3
    new-instance v19, Landroid/text/style/StyleSpan;

    const/16 v20, 0x3

    invoke-direct/range {v19 .. v20}, Landroid/text/style/StyleSpan;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 252
    :pswitch_2f1
    new-instance v19, Landroid/text/style/LeadingMarginSpan$Standard;

    move-object/from16 v0, p0

    iget v0, v0, Lin/uncod/android/bypass/Bypass;->mCodeBlockIndent:I

    move/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 253
    new-instance v19, Landroid/text/style/TypefaceSpan;

    const-string v20, "monospace"

    invoke-direct/range {v19 .. v20}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 256
    :pswitch_30f
    new-instance v19, Landroid/text/style/TypefaceSpan;

    const-string v20, "monospace"

    invoke-direct/range {v19 .. v20}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 260
    :pswitch_31d
    const-string v19, "link"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 261
    .local v12, "link":Ljava/lang/String;
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_350

    sget-object v19, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/regex/Matcher;->matches()Z

    move-result v19

    if-eqz v19, :cond_350

    .line 262
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "mailto:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 264
    :cond_350
    new-instance v19, Landroid/text/style/URLSpan;

    move-object/from16 v0, v19

    invoke-direct {v0, v12}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 269
    .end local v12    # "link":Ljava/lang/String;
    :pswitch_35e
    new-instance v19, Landroid/text/style/LeadingMarginSpan$Standard;

    move-object/from16 v0, p0

    iget v0, v0, Lin/uncod/android/bypass/Bypass;->mBlockQuoteIndent:I

    move/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setBlockSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 270
    new-instance v19, Landroid/text/style/QuoteSpan;

    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    move-object/from16 v20, v0

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mBlockQuoteColor:I
    invoke-static/range {v20 .. v20}, Lin/uncod/android/bypass/Bypass$Options;->access$1000(Lin/uncod/android/bypass/Bypass$Options;)I

    move-result v20

    invoke-direct/range {v19 .. v20}, Landroid/text/style/QuoteSpan;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setBlockSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 271
    new-instance v19, Landroid/text/style/LeadingMarginSpan$Standard;

    move-object/from16 v0, p0

    iget v0, v0, Lin/uncod/android/bypass/Bypass;->mBlockQuoteIndent:I

    move/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Landroid/text/style/LeadingMarginSpan$Standard;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setBlockSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    .line 272
    new-instance v19, Landroid/text/style/StyleSpan;

    const/16 v20, 0x2

    invoke-direct/range {v19 .. v20}, Landroid/text/style/StyleSpan;-><init>(I)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setBlockSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 275
    :pswitch_3a0
    new-instance v19, Landroid/text/style/StrikethroughSpan;

    invoke-direct/range {v19 .. v19}, Landroid/text/style/StrikethroughSpan;-><init>()V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 278
    :pswitch_3ac
    new-instance v19, Lin/uncod/android/bypass/style/HorizontalLineSpan;

    move-object/from16 v0, p0

    iget-object v0, v0, Lin/uncod/android/bypass/Bypass;->mOptions:Lin/uncod/android/bypass/Bypass$Options;

    move-object/from16 v20, v0

    # getter for: Lin/uncod/android/bypass/Bypass$Options;->mHruleColor:I
    invoke-static/range {v20 .. v20}, Lin/uncod/android/bypass/Bypass$Options;->access$1100(Lin/uncod/android/bypass/Bypass$Options;)I

    move-result v20

    move-object/from16 v0, p0

    iget v0, v0, Lin/uncod/android/bypass/Bypass;->mHruleSize:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lin/uncod/android/bypass/Bypass;->mHruleTopBottomPadding:I

    move/from16 v22, v0

    invoke-direct/range {v19 .. v22}, Lin/uncod/android/bypass/style/HorizontalLineSpan;-><init>(III)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 281
    :pswitch_3ce
    if-eqz v8, :cond_125

    .line 282
    new-instance v19, Landroid/text/style/ImageSpan;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lin/uncod/android/bypass/Bypass;->setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V

    goto/16 :goto_125

    .line 152
    :pswitch_data_3de
    .packed-switch 0x1
        :pswitch_126
        :pswitch_144
        :pswitch_14c
        :pswitch_1bf
        :pswitch_1d0
        :pswitch_1d9
    .end packed-switch

    .line 232
    :pswitch_data_3ee
    .packed-switch 0x1
        :pswitch_2b5
        :pswitch_125
        :pswitch_125
        :pswitch_31d
        :pswitch_3ac
        :pswitch_3ce
        :pswitch_281
        :pswitch_2c7
        :pswitch_2d5
        :pswitch_2e3
        :pswitch_2f1
        :pswitch_30f
        :pswitch_31d
        :pswitch_35e
        :pswitch_3a0
    .end packed-switch
.end method

.method private static setBlockSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V
    .registers 5
    .param p0, "builder"    # Landroid/text/SpannableStringBuilder;
    .param p1, "what"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 296
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 297
    .local v0, "length":I
    const/16 v1, 0x21

    invoke-virtual {p0, p1, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 298
    return-void
.end method

.method private static setSpan(Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V
    .registers 5
    .param p0, "builder"    # Landroid/text/SpannableStringBuilder;
    .param p1, "what"    # Ljava/lang/Object;

    .prologue
    .line 291
    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    const/16 v2, 0x21

    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 292
    return-void
.end method


# virtual methods
.method public markdownToSpannable(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "markdown"    # Ljava/lang/String;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lin/uncod/android/bypass/Bypass;->markdownToSpannable(Ljava/lang/String;Lin/uncod/android/bypass/Bypass$ImageGetter;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public markdownToSpannable(Ljava/lang/String;Lin/uncod/android/bypass/Bypass$ImageGetter;)Ljava/lang/CharSequence;
    .registers 8
    .param p1, "markdown"    # Ljava/lang/String;
    .param p2, "imageGetter"    # Lin/uncod/android/bypass/Bypass$ImageGetter;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lin/uncod/android/bypass/Bypass;->processMarkdown(Ljava/lang/String;)Lin/uncod/android/bypass/Document;

    move-result-object v0

    .line 90
    .local v0, "document":Lin/uncod/android/bypass/Document;
    invoke-virtual {v0}, Lin/uncod/android/bypass/Document;->getElementCount()I

    move-result v2

    .line 91
    .local v2, "size":I
    new-array v3, v2, [Ljava/lang/CharSequence;

    .line 93
    .local v3, "spans":[Ljava/lang/CharSequence;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    if-ge v1, v2, :cond_1a

    .line 94
    invoke-virtual {v0, v1}, Lin/uncod/android/bypass/Document;->getElement(I)Lin/uncod/android/bypass/Element;

    move-result-object v4

    invoke-direct {p0, v4, v1, v2, p2}, Lin/uncod/android/bypass/Bypass;->recurseElement(Lin/uncod/android/bypass/Element;IILin/uncod/android/bypass/Bypass$ImageGetter;)Ljava/lang/CharSequence;

    move-result-object v4

    aput-object v4, v3, v1

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 97
    :cond_1a
    invoke-static {v3}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    return-object v4
.end method

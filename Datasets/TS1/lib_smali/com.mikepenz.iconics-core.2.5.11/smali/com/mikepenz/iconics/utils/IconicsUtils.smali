.class public Lcom/mikepenz/iconics/utils/IconicsUtils;
.super Ljava/lang/Object;
.source "IconicsUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyStyles(Landroid/content/Context;Landroid/text/Spannable;Ljava/util/List;Ljava/util/List;Ljava/util/HashMap;)V
    .registers 13
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "text"    # Landroid/text/Spannable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/text/Spannable;",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/iconics/utils/StyleContainer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p2, "styleContainers":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    .local p3, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p4, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    const/16 v7, 0x21

    .line 254
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/iconics/utils/StyleContainer;

    .line 255
    .local v1, "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->style:Landroid/text/style/CharacterStyle;

    if-eqz v2, :cond_4d

    .line 256
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->style:Landroid/text/style/CharacterStyle;

    iget v4, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v2, v4, v5, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 263
    :goto_1f
    if-eqz p4, :cond_70

    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->icon:Ljava/lang/String;

    invoke-virtual {p4, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_70

    .line 264
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->icon:Ljava/lang/String;

    invoke-virtual {p4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_35
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/style/CharacterStyle;

    .line 265
    .local v0, "style":Landroid/text/style/CharacterStyle;
    invoke-static {v0}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v4

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v6, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v4, v5, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_35

    .line 257
    .end local v0    # "style":Landroid/text/style/CharacterStyle;
    :cond_4d
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->span:Landroid/text/ParcelableSpan;

    if-eqz v2, :cond_5b

    .line 258
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->span:Landroid/text/ParcelableSpan;

    iget v4, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v2, v4, v5, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_1f

    .line 260
    :cond_5b
    new-instance v2, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;

    const-string v4, "sans-serif"

    iget-object v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->font:Lcom/mikepenz/iconics/typeface/ITypeface;

    invoke-interface {v5, p0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    iget v4, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v2, v4, v5, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_1f

    .line 267
    :cond_70
    if-eqz p3, :cond_6

    .line 268
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_76
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/style/CharacterStyle;

    .line 269
    .restart local v0    # "style":Landroid/text/style/CharacterStyle;
    invoke-static {v0}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v4

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v6, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v4, v5, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_76

    .line 273
    .end local v0    # "style":Landroid/text/style/CharacterStyle;
    .end local v1    # "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_8e
    return-void
.end method

.method public static findIcons(Landroid/text/Spanned;Ljava/util/HashMap;)Lcom/mikepenz/iconics/utils/TextStyleContainer;
    .registers 18
    .param p0, "spannable"    # Landroid/text/Spanned;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/Spanned;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;)",
            "Lcom/mikepenz/iconics/utils/TextStyleContainer;"
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 138
    .local v8, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 141
    .local v2, "existingSpans":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    const/4 v10, 0x0

    invoke-interface/range {p0 .. p0}, Landroid/text/Spanned;->length()I

    move-result v11

    const-class v12, Landroid/text/ParcelableSpan;

    move-object/from16 v0, p0

    invoke-interface {v0, v10, v11, v12}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Landroid/text/ParcelableSpan;

    array-length v12, v10

    const/4 v11, 0x0

    :goto_1b
    if-ge v11, v12, :cond_36

    aget-object v5, v10, v11

    .line 142
    .local v5, "span":Landroid/text/ParcelableSpan;
    new-instance v13, Lcom/mikepenz/iconics/utils/StyleContainer;

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v14

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v15

    invoke-direct {v13, v14, v15, v5}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILandroid/text/ParcelableSpan;)V

    invoke-virtual {v2, v13}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 141
    add-int/lit8 v11, v11, 0x1

    goto :goto_1b

    .line 144
    .end local v5    # "span":Landroid/text/ParcelableSpan;
    :cond_36
    const/4 v10, 0x0

    invoke-interface/range {p0 .. p0}, Landroid/text/Spanned;->length()I

    move-result v11

    const-class v12, Landroid/text/style/CharacterStyle;

    move-object/from16 v0, p0

    invoke-interface {v0, v10, v11, v12}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Landroid/text/style/CharacterStyle;

    array-length v12, v10

    const/4 v11, 0x0

    :goto_47
    if-ge v11, v12, :cond_62

    aget-object v5, v10, v11

    .line 145
    .local v5, "span":Landroid/text/style/CharacterStyle;
    new-instance v13, Lcom/mikepenz/iconics/utils/StyleContainer;

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v14

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v15

    invoke-direct {v13, v14, v15, v5}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILandroid/text/style/CharacterStyle;)V

    invoke-virtual {v2, v13}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 144
    add-int/lit8 v11, v11, 0x1

    goto :goto_47

    .line 149
    .end local v5    # "span":Landroid/text/style/CharacterStyle;
    :cond_62
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 150
    .local v6, "spannedString":Landroid/text/SpannableStringBuilder;
    new-instance v9, Landroid/text/SpannableStringBuilder;

    invoke-direct {v9}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 152
    .local v9, "tempIconString":Landroid/text/SpannableStringBuilder;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_6d
    invoke-interface/range {p0 .. p0}, Landroid/text/Spanned;->length()I

    move-result v10

    if-ge v4, v10, :cond_106

    .line 153
    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/text/Spanned;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    .line 154
    .local v1, "c":Ljava/lang/Character;
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    const/16 v11, 0x7b

    if-ne v10, v11, :cond_97

    .line 156
    invoke-virtual {v6, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 158
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    invoke-direct {v9}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 159
    .restart local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v9, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 152
    :goto_94
    add-int/lit8 v4, v4, 0x1

    goto :goto_6d

    .line 160
    :cond_97
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    const/16 v11, 0x7d

    if-ne v10, v11, :cond_f0

    .line 161
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v9, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 163
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    const/4 v11, 0x5

    if-le v10, v11, :cond_e7

    .line 164
    move-object/from16 v0, p1

    invoke-static {v6, v9, v0}, Lcom/mikepenz/iconics/utils/IconicsUtils;->placeFontIcon(Landroid/text/SpannableStringBuilder;Landroid/text/SpannableStringBuilder;Ljava/util/HashMap;)Lcom/mikepenz/iconics/utils/StyleContainer;

    move-result-object v7

    .line 165
    .local v7, "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    if-eqz v7, :cond_ea

    .line 166
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 169
    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_bc
    :goto_bc
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_ea

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/iconics/utils/StyleContainer;

    .line 170
    .local v3, "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    iget v11, v3, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    if-le v11, v4, :cond_d7

    .line 171
    iget v11, v3, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v12

    sub-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x1

    iput v11, v3, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 173
    :cond_d7
    iget v11, v3, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    if-le v11, v4, :cond_bc

    .line 174
    iget v11, v3, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v12

    sub-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x1

    iput v11, v3, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    goto :goto_bc

    .line 179
    .end local v3    # "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    .end local v7    # "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_e7
    invoke-virtual {v6, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 181
    :cond_ea
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    invoke-direct {v9}, Landroid/text/SpannableStringBuilder;-><init>()V

    .restart local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    goto :goto_94

    .line 183
    :cond_f0
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    if-nez v10, :cond_fe

    .line 184
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v6, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_94

    .line 186
    :cond_fe
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v9, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_94

    .line 192
    .end local v1    # "c":Ljava/lang/Character;
    :cond_106
    invoke-virtual {v6, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 195
    invoke-virtual {v8, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 197
    new-instance v10, Lcom/mikepenz/iconics/utils/TextStyleContainer;

    invoke-direct {v10, v6, v8}, Lcom/mikepenz/iconics/utils/TextStyleContainer;-><init>(Landroid/text/SpannableStringBuilder;Ljava/util/LinkedList;)V

    return-object v10
.end method

.method public static findIconsFromEditable(Landroid/text/Editable;Ljava/util/HashMap;)Ljava/util/LinkedList;
    .registers 16
    .param p0, "editable"    # Landroid/text/Editable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/Editable;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;)",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mikepenz/iconics/utils/StyleContainer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 34
    .local v7, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 37
    .local v1, "existingSpans":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    const/4 v8, 0x0

    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result v9

    const-class v10, Landroid/text/ParcelableSpan;

    invoke-interface {p0, v8, v9, v10}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Landroid/text/ParcelableSpan;

    array-length v10, v8

    const/4 v9, 0x0

    :goto_19
    if-ge v9, v10, :cond_30

    aget-object v5, v8, v9

    .line 38
    .local v5, "span":Landroid/text/ParcelableSpan;
    new-instance v11, Lcom/mikepenz/iconics/utils/StyleContainer;

    invoke-interface {p0, v5}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v12

    invoke-interface {p0, v5}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v13

    invoke-direct {v11, v12, v13, v5}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILandroid/text/ParcelableSpan;)V

    invoke-virtual {v1, v11}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v9, v9, 0x1

    goto :goto_19

    .line 40
    .end local v5    # "span":Landroid/text/ParcelableSpan;
    :cond_30
    const/4 v8, 0x0

    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result v9

    const-class v10, Landroid/text/style/CharacterStyle;

    invoke-interface {p0, v8, v9, v10}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Landroid/text/style/CharacterStyle;

    array-length v10, v8

    const/4 v9, 0x0

    :goto_3f
    if-ge v9, v10, :cond_56

    aget-object v5, v8, v9

    .line 41
    .local v5, "span":Landroid/text/style/CharacterStyle;
    new-instance v11, Lcom/mikepenz/iconics/utils/StyleContainer;

    invoke-interface {p0, v5}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v12

    invoke-interface {p0, v5}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v13

    invoke-direct {v11, v12, v13, v5}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILandroid/text/style/CharacterStyle;)V

    invoke-virtual {v1, v11}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 40
    add-int/lit8 v9, v9, 0x1

    goto :goto_3f

    .line 44
    .end local v5    # "span":Landroid/text/style/CharacterStyle;
    :cond_56
    :try_start_56
    invoke-interface {p0}, Landroid/text/Editable;->clearSpans()V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_59} :catch_bf

    .line 50
    :goto_59
    const/4 v4, -0x1

    .line 51
    .local v4, "iconStart":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5b
    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result v8

    if-ge v3, v8, :cond_bb

    .line 52
    invoke-interface {p0, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    .line 53
    .local v0, "c":Ljava/lang/Character;
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v8

    const/16 v9, 0x7b

    if-ne v8, v9, :cond_75

    .line 54
    move v4, v3

    .line 51
    :cond_72
    :goto_72
    add-int/lit8 v3, v3, 0x1

    goto :goto_5b

    .line 55
    :cond_75
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v8

    const/16 v9, 0x7d

    if-ne v8, v9, :cond_72

    .line 56
    const/4 v8, -0x1

    if-le v4, v8, :cond_b9

    .line 57
    invoke-static {p0, v4, v3, p1}, Lcom/mikepenz/iconics/utils/IconicsUtils;->placeFontIcon(Landroid/text/Editable;IILjava/util/HashMap;)Lcom/mikepenz/iconics/utils/StyleContainer;

    move-result-object v6

    .line 59
    .local v6, "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    if-eqz v6, :cond_b9

    .line 60
    invoke-virtual {v7, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 63
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_8d
    :goto_8d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_b8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/iconics/utils/StyleContainer;

    .line 64
    .local v2, "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    iget v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    if-le v9, v3, :cond_ac

    .line 65
    iget v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    sub-int v10, v3, v4

    sub-int/2addr v9, v10

    iput v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 66
    iget v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    sub-int v10, v3, v4

    sub-int/2addr v9, v10

    iput v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    goto :goto_8d

    .line 67
    :cond_ac
    iget v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    if-le v9, v3, :cond_8d

    .line 68
    iget v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    sub-int v10, v3, v4

    sub-int/2addr v9, v10

    iput v9, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    goto :goto_8d

    .line 73
    .end local v2    # "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_b8
    sub-int/2addr v3, v4

    .line 77
    .end local v6    # "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_b9
    const/4 v4, -0x1

    goto :goto_72

    .line 82
    .end local v0    # "c":Ljava/lang/Character;
    :cond_bb
    invoke-virtual {v7, v1}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 84
    return-object v7

    .line 45
    .end local v3    # "i":I
    .end local v4    # "iconStart":I
    :catch_bf
    move-exception v8

    goto :goto_59
.end method

.method private static placeFontIcon(Landroid/text/Editable;IILjava/util/HashMap;)Lcom/mikepenz/iconics/utils/StyleContainer;
    .registers 13
    .param p0, "editable"    # Landroid/text/Editable;
    .param p1, "iconStart"    # I
    .param p2, "iconEnd"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/Editable;",
            "II",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;)",
            "Lcom/mikepenz/iconics/utils/StyleContainer;"
        }
    .end annotation

    .prologue
    .line 96
    .local p3, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    sub-int v6, p2, p1

    const/4 v7, 0x6

    if-lt v6, v7, :cond_65

    .line 98
    add-int/lit8 v6, p1, 0x1

    invoke-interface {p0, v6, p2}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "-"

    const-string v8, "_"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 100
    .local v4, "iconString":Ljava/lang/String;
    add-int/lit8 v6, p1, 0x1

    add-int/lit8 v7, p1, 0x4

    invoke-interface {p0, v6, v7}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "fontKey":Ljava/lang/String;
    :try_start_23
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 105
    .local v5, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    if-eqz v5, :cond_67

    .line 107
    invoke-interface {v5, v4}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v3

    .line 109
    .local v3, "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    if-eqz v3, :cond_4d

    .line 111
    invoke-interface {v3}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v1

    .line 112
    .local v1, "fontChar":C
    add-int/lit8 v6, p2, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    invoke-interface {p0, p1, v6, v7}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 115
    new-instance v7, Lcom/mikepenz/iconics/utils/StyleContainer;

    add-int/lit8 v8, p1, 0x1

    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mikepenz/iconics/typeface/ITypeface;

    invoke-direct {v7, p1, v8, v4, v6}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V

    move-object v6, v7

    .line 126
    .end local v1    # "fontChar":C
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_4c
    return-object v6

    .line 117
    .restart local v2    # "fontKey":Ljava/lang/String;
    .restart local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .restart local v4    # "iconString":Ljava/lang/String;
    .restart local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_4d
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong icon name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_65
    :goto_65
    const/4 v6, 0x0

    goto :goto_4c

    .line 120
    .restart local v2    # "fontKey":Ljava/lang/String;
    .restart local v4    # "iconString":Ljava/lang/String;
    .restart local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_67
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong fontId: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_23 .. :try_end_7f} :catch_80

    goto :goto_65

    .line 122
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :catch_80
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong icon name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_65
.end method

.method private static placeFontIcon(Landroid/text/SpannableStringBuilder;Landroid/text/SpannableStringBuilder;Ljava/util/HashMap;)Lcom/mikepenz/iconics/utils/StyleContainer;
    .registers 13
    .param p0, "spannedString"    # Landroid/text/SpannableStringBuilder;
    .param p1, "tempIconString"    # Landroid/text/SpannableStringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/SpannableStringBuilder;",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;)",
            "Lcom/mikepenz/iconics/utils/StyleContainer;"
        }
    .end annotation

    .prologue
    .local p2, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    const/4 v9, 0x1

    .line 208
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    const/4 v7, 0x6

    if-lt v6, v7, :cond_6b

    .line 210
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p1, v9, v6}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "-"

    const-string v8, "_"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 212
    .local v4, "iconString":Ljava/lang/String;
    const/4 v6, 0x4

    invoke-virtual {p1, v9, v6}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 216
    .local v2, "fontKey":Ljava/lang/String;
    :try_start_27
    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 217
    .local v5, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    if-eqz v5, :cond_70

    .line 219
    invoke-interface {v5, v4}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v3

    .line 221
    .local v3, "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    if-eqz v3, :cond_53

    .line 223
    invoke-interface {v3}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v1

    .line 224
    .local v1, "fontChar":C
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 227
    new-instance v7, Lcom/mikepenz/iconics/utils/StyleContainer;

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    add-int/lit8 v8, v6, -0x1

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v9

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mikepenz/iconics/typeface/ITypeface;

    invoke-direct {v7, v8, v9, v4, v6}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V

    move-object v6, v7

    .line 241
    .end local v1    # "fontChar":C
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_52
    return-object v6

    .line 229
    .restart local v2    # "fontKey":Ljava/lang/String;
    .restart local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .restart local v4    # "iconString":Ljava/lang/String;
    .restart local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_53
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong icon name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_27 .. :try_end_6b} :catch_89

    .line 240
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_6b
    :goto_6b
    invoke-virtual {p0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 241
    const/4 v6, 0x0

    goto :goto_52

    .line 232
    .restart local v2    # "fontKey":Ljava/lang/String;
    .restart local v4    # "iconString":Ljava/lang/String;
    .restart local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_70
    :try_start_70
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong fontId: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_88
    .catch Ljava/lang/IllegalArgumentException; {:try_start_70 .. :try_end_88} :catch_89

    goto :goto_6b

    .line 234
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :catch_89
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong icon name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6b
.end method

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

    .line 242
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_80

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/iconics/utils/StyleContainer;

    .line 243
    .local v1, "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->styleSpan:Landroid/text/ParcelableSpan;

    if-eqz v2, :cond_4d

    .line 244
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->styleSpan:Landroid/text/ParcelableSpan;

    iget v4, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v2, v4, v5, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 249
    :goto_1f
    if-eqz p4, :cond_62

    iget-object v2, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->icon:Ljava/lang/String;

    invoke-virtual {p4, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_62

    .line 250
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

    .line 251
    .local v0, "style":Landroid/text/style/CharacterStyle;
    invoke-static {v0}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v4

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v6, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v4, v5, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_35

    .line 246
    .end local v0    # "style":Landroid/text/style/CharacterStyle;
    :cond_4d
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

    .line 253
    :cond_62
    if-eqz p3, :cond_6

    .line 254
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_68
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/style/CharacterStyle;

    .line 255
    .restart local v0    # "style":Landroid/text/style/CharacterStyle;
    invoke-static {v0}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v4

    iget v5, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    iget v6, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-interface {p1, v4, v5, v6, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_68

    .line 259
    .end local v0    # "style":Landroid/text/style/CharacterStyle;
    .end local v1    # "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_80
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
    .line 129
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 130
    .local v8, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 132
    .local v3, "existingStyleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
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

    .line 133
    .local v5, "span":Landroid/text/ParcelableSpan;
    new-instance v13, Lcom/mikepenz/iconics/utils/StyleContainer;

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v14

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v15

    invoke-direct {v13, v14, v15, v5}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILandroid/text/ParcelableSpan;)V

    invoke-virtual {v3, v13}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 132
    add-int/lit8 v11, v11, 0x1

    goto :goto_1b

    .line 137
    .end local v5    # "span":Landroid/text/ParcelableSpan;
    :cond_36
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 138
    .local v6, "spannedString":Landroid/text/SpannableStringBuilder;
    new-instance v9, Landroid/text/SpannableStringBuilder;

    invoke-direct {v9}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 140
    .local v9, "tempIconString":Landroid/text/SpannableStringBuilder;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_41
    invoke-interface/range {p0 .. p0}, Landroid/text/Spanned;->length()I

    move-result v10

    if-ge v4, v10, :cond_da

    .line 141
    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/text/Spanned;->charAt(I)C

    move-result v10

    invoke-static {v10}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    .line 142
    .local v1, "c":Ljava/lang/Character;
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    const/16 v11, 0x7b

    if-ne v10, v11, :cond_6b

    .line 144
    invoke-virtual {v6, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 146
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    invoke-direct {v9}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 147
    .restart local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v9, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 140
    :goto_68
    add-int/lit8 v4, v4, 0x1

    goto :goto_41

    .line 148
    :cond_6b
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    const/16 v11, 0x7d

    if-ne v10, v11, :cond_c4

    .line 149
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v9, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 151
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    const/4 v11, 0x5

    if-le v10, v11, :cond_bb

    .line 152
    move-object/from16 v0, p1

    invoke-static {v6, v9, v0}, Lcom/mikepenz/iconics/utils/IconicsUtils;->placeFontIcon(Landroid/text/SpannableStringBuilder;Landroid/text/SpannableStringBuilder;Ljava/util/HashMap;)Lcom/mikepenz/iconics/utils/StyleContainer;

    move-result-object v7

    .line 153
    .local v7, "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    if-eqz v7, :cond_be

    .line 154
    invoke-virtual {v8, v7}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 157
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_90
    :goto_90
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_be

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/iconics/utils/StyleContainer;

    .line 158
    .local v2, "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    iget v11, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    if-le v11, v4, :cond_ab

    .line 159
    iget v11, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v12

    sub-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x1

    iput v11, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 161
    :cond_ab
    iget v11, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    if-le v11, v4, :cond_90

    .line 162
    iget v11, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v12

    sub-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x1

    iput v11, v2, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    goto :goto_90

    .line 167
    .end local v2    # "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    .end local v7    # "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_bb
    invoke-virtual {v6, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 169
    :cond_be
    new-instance v9, Landroid/text/SpannableStringBuilder;

    .end local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    invoke-direct {v9}, Landroid/text/SpannableStringBuilder;-><init>()V

    .restart local v9    # "tempIconString":Landroid/text/SpannableStringBuilder;
    goto :goto_68

    .line 171
    :cond_c4
    invoke-virtual {v9}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    if-nez v10, :cond_d2

    .line 172
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v6, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_68

    .line 174
    :cond_d2
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v10

    invoke-virtual {v9, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_68

    .line 180
    .end local v1    # "c":Ljava/lang/Character;
    :cond_da
    invoke-virtual {v6, v9}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 183
    invoke-virtual {v8, v3}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 185
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
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    const/4 v9, 0x0

    .line 33
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 34
    .local v7, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 37
    .local v2, "existingStyleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result v8

    const-class v10, Landroid/text/ParcelableSpan;

    invoke-interface {p0, v9, v8, v10}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Landroid/text/ParcelableSpan;

    array-length v10, v8

    :goto_18
    if-ge v9, v10, :cond_2f

    aget-object v5, v8, v9

    .line 38
    .local v5, "span":Landroid/text/ParcelableSpan;
    new-instance v11, Lcom/mikepenz/iconics/utils/StyleContainer;

    invoke-interface {p0, v5}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v12

    invoke-interface {p0, v5}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v13

    invoke-direct {v11, v12, v13, v5}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILandroid/text/ParcelableSpan;)V

    invoke-virtual {v2, v11}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v9, v9, 0x1

    goto :goto_18

    .line 40
    .end local v5    # "span":Landroid/text/ParcelableSpan;
    :cond_2f
    invoke-interface {p0}, Landroid/text/Editable;->clearSpans()V

    .line 42
    const/4 v4, -0x1

    .line 43
    .local v4, "iconStart":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_34
    invoke-interface {p0}, Landroid/text/Editable;->length()I

    move-result v8

    if-ge v3, v8, :cond_94

    .line 44
    invoke-interface {p0, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    .line 45
    .local v0, "c":Ljava/lang/Character;
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v8

    const/16 v9, 0x7b

    if-ne v8, v9, :cond_4e

    .line 46
    move v4, v3

    .line 43
    :cond_4b
    :goto_4b
    add-int/lit8 v3, v3, 0x1

    goto :goto_34

    .line 47
    :cond_4e
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v8

    const/16 v9, 0x7d

    if-ne v8, v9, :cond_4b

    .line 48
    const/4 v8, -0x1

    if-le v4, v8, :cond_92

    .line 49
    invoke-static {p0, v4, v3, p1}, Lcom/mikepenz/iconics/utils/IconicsUtils;->placeFontIcon(Landroid/text/Editable;IILjava/util/HashMap;)Lcom/mikepenz/iconics/utils/StyleContainer;

    move-result-object v6

    .line 51
    .local v6, "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    if-eqz v6, :cond_92

    .line 52
    invoke-virtual {v7, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 55
    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_66
    :goto_66
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_91

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/iconics/utils/StyleContainer;

    .line 56
    .local v1, "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    iget v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    if-le v9, v3, :cond_85

    .line 57
    iget v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    sub-int v10, v3, v4

    sub-int/2addr v9, v10

    iput v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 58
    iget v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    sub-int v10, v3, v4

    sub-int/2addr v9, v10

    iput v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    goto :goto_66

    .line 59
    :cond_85
    iget v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    if-le v9, v3, :cond_66

    .line 60
    iget v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    sub-int v10, v3, v4

    sub-int/2addr v9, v10

    iput v9, v1, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    goto :goto_66

    .line 65
    .end local v1    # "existingStyleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_91
    sub-int/2addr v3, v4

    .line 69
    .end local v6    # "styleContainer":Lcom/mikepenz/iconics/utils/StyleContainer;
    :cond_92
    const/4 v4, -0x1

    goto :goto_4b

    .line 74
    .end local v0    # "c":Ljava/lang/Character;
    :cond_94
    invoke-virtual {v7, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 76
    return-object v7
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
    .line 88
    .local p3, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    sub-int v6, p2, p1

    const/4 v7, 0x6

    if-lt v6, v7, :cond_65

    .line 90
    add-int/lit8 v6, p1, 0x1

    invoke-interface {p0, v6, p2}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "-"

    const-string v8, "_"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 92
    .local v4, "iconString":Ljava/lang/String;
    add-int/lit8 v6, p1, 0x1

    add-int/lit8 v7, p1, 0x4

    invoke-interface {p0, v6, v7}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 96
    .local v2, "fontKey":Ljava/lang/String;
    :try_start_23
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 97
    .local v5, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    if-eqz v5, :cond_67

    .line 99
    invoke-interface {v5, v4}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v3

    .line 101
    .local v3, "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    if-eqz v3, :cond_4d

    .line 103
    invoke-interface {v3}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v1

    .line 104
    .local v1, "fontChar":C
    add-int/lit8 v6, p2, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    invoke-interface {p0, p1, v6, v7}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 107
    new-instance v7, Lcom/mikepenz/iconics/utils/StyleContainer;

    add-int/lit8 v8, p1, 0x1

    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mikepenz/iconics/typeface/ITypeface;

    invoke-direct {v7, p1, v8, v4, v6}, Lcom/mikepenz/iconics/utils/StyleContainer;-><init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V

    move-object v6, v7

    .line 118
    .end local v1    # "fontChar":C
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_4c
    return-object v6

    .line 109
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

    .line 118
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_65
    :goto_65
    const/4 v6, 0x0

    goto :goto_4c

    .line 112
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

    .line 114
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :catch_80
    move-exception v0

    .line 115
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

    .line 196
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    const/4 v7, 0x6

    if-lt v6, v7, :cond_6b

    .line 198
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

    .line 200
    .local v4, "iconString":Ljava/lang/String;
    const/4 v6, 0x4

    invoke-virtual {p1, v9, v6}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 204
    .local v2, "fontKey":Ljava/lang/String;
    :try_start_27
    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 205
    .local v5, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    if-eqz v5, :cond_70

    .line 207
    invoke-interface {v5, v4}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v3

    .line 209
    .local v3, "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    if-eqz v3, :cond_53

    .line 211
    invoke-interface {v3}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v1

    .line 212
    .local v1, "fontChar":C
    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 215
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

    .line 229
    .end local v1    # "fontChar":C
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_52
    return-object v6

    .line 217
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

    .line 228
    .end local v2    # "fontKey":Ljava/lang/String;
    .end local v3    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v4    # "iconString":Ljava/lang/String;
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_6b
    :goto_6b
    invoke-virtual {p0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 229
    const/4 v6, 0x0

    goto :goto_52

    .line 220
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

    .line 222
    .end local v5    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :catch_89
    move-exception v0

    .line 223
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

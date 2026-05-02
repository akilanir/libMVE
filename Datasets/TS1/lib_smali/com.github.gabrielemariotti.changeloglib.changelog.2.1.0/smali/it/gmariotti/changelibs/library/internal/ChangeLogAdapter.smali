.class public Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;
.super Landroid/widget/ArrayAdapter;
.source "ChangeLogAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;,
        Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
        ">;"
    }
.end annotation


# static fields
.field protected static final TYPE_HEADER:I = 0x1

.field protected static final TYPE_ROW:I


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mRowHeaderLayoutId:I

.field private mRowLayoutId:I

.field private mStringVersionHeader:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<Lit/gmariotti/changelibs/library/internal/ChangeLogRow;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 42
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mRowLayoutId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowLayoutId:I

    .line 43
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mRowHeaderLayoutId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowHeaderLayoutId:I

    .line 44
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mStringVersionHeader:I

    iput v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mStringVersionHeader:I

    .line 53
    iput-object p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mContext:Landroid/content/Context;

    .line 54
    return-void
.end method


# virtual methods
.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 181
    invoke-virtual {p0, p1}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    invoke-virtual {v0}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->isHeader()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 182
    const/4 v0, 0x1

    .line 183
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 21
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 67
    invoke-virtual/range {p0 .. p1}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    .line 68
    .local v2, "item":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    move-object/from16 v11, p2

    .line 69
    .local v11, "view":Landroid/view/View;
    invoke-virtual/range {p0 .. p1}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->getItemViewType(I)I

    move-result v14

    .line 71
    .local v14, "viewType":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mContext:Landroid/content/Context;

    const-string v16, "layout_inflater"

    invoke-virtual/range {v15 .. v16}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    .line 73
    .local v4, "mInflater":Landroid/view/LayoutInflater;
    packed-switch v14, :pswitch_data_124

    .line 171
    :cond_1b
    :goto_1b
    return-object v11

    .line 75
    :pswitch_1c
    const/4 v13, 0x0

    .line 77
    .local v13, "viewHolderHeader":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;
    if-eqz v11, :cond_2a

    .line 78
    invoke-virtual {v11}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    .line 79
    .local v5, "obj":Ljava/lang/Object;
    instance-of v15, v5, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;

    if-eqz v15, :cond_98

    move-object v13, v5

    .line 80
    check-cast v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;

    .line 86
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_2a
    :goto_2a
    if-eqz v11, :cond_2e

    if-nez v13, :cond_51

    .line 87
    :cond_2e
    move-object/from16 v0, p0

    iget v3, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowHeaderLayoutId:I

    .line 88
    .local v3, "layout":I
    const/4 v15, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v4, v3, v0, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v11

    .line 91
    sget v15, Lit/gmariotti/changelibs/R$id;->chg_headerVersion:I

    invoke-virtual {v11, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 93
    .local v8, "textHeader":Landroid/widget/TextView;
    sget v15, Lit/gmariotti/changelibs/R$id;->chg_headerDate:I

    invoke-virtual {v11, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 94
    .local v7, "textDate":Landroid/widget/TextView;
    new-instance v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;

    .end local v13    # "viewHolderHeader":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;
    invoke-direct {v13, v8, v7}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 96
    .restart local v13    # "viewHolderHeader":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;
    invoke-virtual {v11, v13}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 99
    .end local v3    # "layout":I
    .end local v7    # "textDate":Landroid/widget/TextView;
    .end local v8    # "textHeader":Landroid/widget/TextView;
    :cond_51
    if-eqz v2, :cond_1b

    if-eqz v13, :cond_1b

    .line 100
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->version:Landroid/widget/TextView;

    if-eqz v15, :cond_7f

    .line 101
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v6, "sb":Ljava/lang/StringBuilder;
    invoke-virtual/range {p0 .. p0}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->getContext()Landroid/content/Context;

    move-result-object v15

    move-object/from16 v0, p0

    iget v0, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mStringVersionHeader:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 104
    .local v10, "versionHeaderString":Ljava/lang/String;
    if-eqz v10, :cond_71

    .line 105
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_71
    iget-object v15, v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->versionName:Ljava/lang/String;

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->version:Landroid/widget/TextView;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    .end local v10    # "versionHeaderString":Ljava/lang/String;
    :cond_7f
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->date:Landroid/widget/TextView;

    if-eqz v15, :cond_1b

    .line 116
    iget-object v15, v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->changeDate:Ljava/lang/String;

    if-eqz v15, :cond_9a

    .line 117
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->date:Landroid/widget/TextView;

    iget-object v0, v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->changeDate:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->date:Landroid/widget/TextView;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1b

    .line 82
    .restart local v5    # "obj":Ljava/lang/Object;
    :cond_98
    const/4 v13, 0x0

    goto :goto_2a

    .line 121
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_9a
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->date:Landroid/widget/TextView;

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v15, v13, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->date:Landroid/widget/TextView;

    const/16 v16, 0x8

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1b

    .line 129
    .end local v13    # "viewHolderHeader":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;
    :pswitch_aa
    const/4 v12, 0x0

    .line 131
    .local v12, "viewHolder":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;
    if-eqz v11, :cond_b8

    .line 132
    invoke-virtual {v11}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    .line 133
    .restart local v5    # "obj":Ljava/lang/Object;
    instance-of v15, v5, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;

    if-eqz v15, :cond_118

    move-object v12, v5

    .line 134
    check-cast v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;

    .line 140
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_b8
    :goto_b8
    if-eqz v11, :cond_bc

    if-nez v12, :cond_df

    .line 141
    :cond_bc
    move-object/from16 v0, p0

    iget v3, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowLayoutId:I

    .line 142
    .restart local v3    # "layout":I
    const/4 v15, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v4, v3, v0, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v11

    .line 144
    sget v15, Lit/gmariotti/changelibs/R$id;->chg_text:I

    invoke-virtual {v11, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 145
    .local v9, "textText":Landroid/widget/TextView;
    sget v15, Lit/gmariotti/changelibs/R$id;->chg_textbullet:I

    invoke-virtual {v11, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 146
    .local v1, "bulletText":Landroid/widget/TextView;
    new-instance v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;

    .end local v12    # "viewHolder":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;
    invoke-direct {v12, v9, v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 147
    .restart local v12    # "viewHolder":Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;
    invoke-virtual {v11, v12}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 152
    .end local v1    # "bulletText":Landroid/widget/TextView;
    .end local v3    # "layout":I
    .end local v9    # "textText":Landroid/widget/TextView;
    :cond_df
    if-eqz v2, :cond_1b

    if-eqz v12, :cond_1b

    .line 153
    iget-object v15, v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->text:Landroid/widget/TextView;

    if-eqz v15, :cond_105

    .line 154
    iget-object v15, v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->text:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->getChangeText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    iget-object v15, v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->text:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 157
    :cond_105
    iget-object v15, v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->bulletText:Landroid/widget/TextView;

    if-eqz v15, :cond_1b

    .line 158
    invoke-virtual {v2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->isBulletedList()Z

    move-result v15

    if-eqz v15, :cond_11a

    .line 159
    iget-object v15, v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->bulletText:Landroid/widget/TextView;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1b

    .line 136
    .restart local v5    # "obj":Ljava/lang/Object;
    :cond_118
    const/4 v12, 0x0

    goto :goto_b8

    .line 161
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_11a
    iget-object v15, v12, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->bulletText:Landroid/widget/TextView;

    const/16 v16, 0x8

    invoke-virtual/range {v15 .. v16}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1b

    .line 73
    nop

    :pswitch_data_124
    .packed-switch 0x0
        :pswitch_aa
        :pswitch_1c
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 176
    const/4 v0, 0x2

    return v0
.end method

.method public getmRowHeaderLayoutId()I
    .registers 2

    .prologue
    .line 224
    iget v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowHeaderLayoutId:I

    return v0
.end method

.method public getmRowLayoutId()I
    .registers 2

    .prologue
    .line 216
    iget v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowLayoutId:I

    return v0
.end method

.method public getmStringVersionHeader()I
    .registers 2

    .prologue
    .line 232
    iget v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mStringVersionHeader:I

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public setmRowHeaderLayoutId(I)V
    .registers 2
    .param p1, "mRowHeaderLayoutId"    # I

    .prologue
    .line 228
    iput p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowHeaderLayoutId:I

    .line 229
    return-void
.end method

.method public setmRowLayoutId(I)V
    .registers 2
    .param p1, "mRowLayoutId"    # I

    .prologue
    .line 220
    iput p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mRowLayoutId:I

    .line 221
    return-void
.end method

.method public setmStringVersionHeader(I)V
    .registers 2
    .param p1, "mStringVersionHeader"    # I

    .prologue
    .line 236
    iput p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;->mStringVersionHeader:I

    .line 237
    return-void
.end method

.class public Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
.super Ljava/lang/Object;
.source "SnackBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mrengineer13/snackbar/SnackBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mActionIcon:I

.field private mActionMessage:Ljava/lang/String;

.field private mAnimateClear:Z

.field private mBackgroundColor:Landroid/content/res/ColorStateList;

.field private mClear:Z

.field private mContext:Landroid/content/Context;

.field private mDuration:S

.field private mHeight:I

.field private mMessage:Ljava/lang/String;

.field private mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field private mToken:Landroid/os/Parcelable;

.field private mTypeFace:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionIcon:I

    .line 102
    const/16 v0, 0xdac

    iput-short v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mDuration:S

    .line 116
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    .line 117
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackBar;

    invoke-direct {v0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    .line 118
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionIcon:I

    .line 102
    const/16 v0, 0xdac

    iput-short v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mDuration:S

    .line 127
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    .line 128
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackBar;

    invoke-direct {v0, p1, p2}, Lcom/github/mrengineer13/snackbar/SnackBar;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    .line 129
    return-void
.end method

.method private getActionTextColor(Lcom/github/mrengineer13/snackbar/SnackBar$Style;)Landroid/content/res/ColorStateList;
    .registers 4
    .param p1, "style"    # Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    .prologue
    .line 336
    sget-object v0, Lcom/github/mrengineer13/snackbar/SnackBar$2;->$SwitchMap$com$github$mrengineer13$snackbar$SnackBar$Style:[I

    invoke-virtual {p1}, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4c

    .line 346
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/github/mrengineer13/snackbar/R$color;->sb__default_button_text_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_17
    return-object v0

    .line 338
    :pswitch_18
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/github/mrengineer13/snackbar/R$color;->sb__button_text_color_red:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_17

    .line 340
    :pswitch_25
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/github/mrengineer13/snackbar/R$color;->sb__button_text_color_yellow:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_17

    .line 342
    :pswitch_32
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/github/mrengineer13/snackbar/R$color;->sb__button_text_color_green:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_17

    .line 344
    :pswitch_3f
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/github/mrengineer13/snackbar/R$color;->sb__default_button_text_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_17

    .line 336
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_18
        :pswitch_25
        :pswitch_32
        :pswitch_3f
    .end packed-switch
.end method


# virtual methods
.method public show()Lcom/github/mrengineer13/snackbar/SnackBar;
    .registers 11

    .prologue
    .line 316
    new-instance v0, Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mMessage:Ljava/lang/String;

    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionMessage:Ljava/lang/String;

    if-eqz v2, :cond_3e

    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionMessage:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    :goto_e
    iget v3, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionIcon:I

    iget-object v4, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mToken:Landroid/os/Parcelable;

    iget-short v5, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mDuration:S

    iget-object v6, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mTextColor:Landroid/content/res/ColorStateList;

    if-eqz v6, :cond_40

    iget-object v6, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mTextColor:Landroid/content/res/ColorStateList;

    :goto_1a
    iget-object v7, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mBackgroundColor:Landroid/content/res/ColorStateList;

    if-eqz v7, :cond_47

    iget-object v7, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mBackgroundColor:Landroid/content/res/ColorStateList;

    :goto_20
    iget v8, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mHeight:I

    if-eqz v8, :cond_54

    iget v8, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mHeight:I

    :goto_26
    iget-object v9, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mTypeFace:Landroid/graphics/Typeface;

    invoke-direct/range {v0 .. v9}, Lcom/github/mrengineer13/snackbar/Snack;-><init>(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Parcelable;SLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILandroid/graphics/Typeface;)V

    .line 326
    .local v0, "message":Lcom/github/mrengineer13/snackbar/Snack;
    iget-boolean v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mClear:Z

    if-eqz v1, :cond_36

    .line 327
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    iget-boolean v2, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mAnimateClear:Z

    invoke-virtual {v1, v2}, Lcom/github/mrengineer13/snackbar/SnackBar;->clear(Z)V

    .line 330
    :cond_36
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    # invokes: Lcom/github/mrengineer13/snackbar/SnackBar;->showMessage(Lcom/github/mrengineer13/snackbar/Snack;)V
    invoke-static {v1, v0}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$200(Lcom/github/mrengineer13/snackbar/SnackBar;Lcom/github/mrengineer13/snackbar/Snack;)V

    .line 332
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    return-object v1

    .line 316
    .end local v0    # "message":Lcom/github/mrengineer13/snackbar/Snack;
    :cond_3e
    const/4 v2, 0x0

    goto :goto_e

    :cond_40
    sget-object v6, Lcom/github/mrengineer13/snackbar/SnackBar$Style;->DEFAULT:Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    invoke-direct {p0, v6}, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->getActionTextColor(Lcom/github/mrengineer13/snackbar/SnackBar$Style;)Landroid/content/res/ColorStateList;

    move-result-object v6

    goto :goto_1a

    :cond_47
    iget-object v7, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/github/mrengineer13/snackbar/R$color;->sb__snack_bkgnd:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    goto :goto_20

    :cond_54
    const/4 v8, 0x0

    goto :goto_26
.end method

.method public withActionIconId(I)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 185
    iput p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionIcon:I

    .line 186
    return-object p0
.end method

.method public withActionMessage(Ljava/lang/String;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2
    .param p1, "actionMessage"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionMessage:Ljava/lang/String;

    .line 161
    return-object p0
.end method

.method public withActionMessageId(I)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "actionMessageResId"    # I

    .prologue
    .line 171
    if-lez p1, :cond_a

    .line 172
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mActionMessage:Ljava/lang/String;

    .line 175
    :cond_a
    return-object p0
.end method

.method public withBackgroundColorId(I)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 4
    .param p1, "colorId"    # I

    .prologue
    .line 241
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 242
    .local v0, "color":Landroid/content/res/ColorStateList;
    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mBackgroundColor:Landroid/content/res/ColorStateList;

    .line 243
    return-object p0
.end method

.method public withClearQueued()Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2

    .prologue
    .line 284
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->withClearQueued(Z)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;

    move-result-object v0

    return-object v0
.end method

.method public withClearQueued(Z)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 294
    iput-boolean p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mAnimateClear:Z

    .line 295
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mClear:Z

    .line 296
    return-object p0
.end method

.method public withDuration(Ljava/lang/Short;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "duration"    # Ljava/lang/Short;

    .prologue
    .line 218
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v0

    iput-short v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mDuration:S

    .line 219
    return-object p0
.end method

.method public withMessage(Ljava/lang/String;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mMessage:Ljava/lang/String;

    .line 139
    return-object p0
.end method

.method public withMessageId(I)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "messageId"    # I

    .prologue
    .line 149
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mMessage:Ljava/lang/String;

    .line 150
    return-object p0
.end method

.method public withOnClickListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "onClickListener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    # invokes: Lcom/github/mrengineer13/snackbar/SnackBar;->setOnClickListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;)Lcom/github/mrengineer13/snackbar/SnackBar;
    invoke-static {v0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$000(Lcom/github/mrengineer13/snackbar/SnackBar;Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;)Lcom/github/mrengineer13/snackbar/SnackBar;

    .line 265
    return-object p0
.end method

.method public withSnackBarHeight(I)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 253
    iput p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mHeight:I

    .line 254
    return-object p0
.end method

.method public withStyle(Lcom/github/mrengineer13/snackbar/SnackBar$Style;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "style"    # Lcom/github/mrengineer13/snackbar/SnackBar$Style;

    .prologue
    .line 196
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->getActionTextColor(Lcom/github/mrengineer13/snackbar/SnackBar$Style;)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mTextColor:Landroid/content/res/ColorStateList;

    .line 197
    return-object p0
.end method

.method public withTextColorId(I)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 4
    .param p1, "colorId"    # I

    .prologue
    .line 229
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 230
    .local v0, "color":Landroid/content/res/ColorStateList;
    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mTextColor:Landroid/content/res/ColorStateList;

    .line 231
    return-object p0
.end method

.method public withToken(Landroid/os/Parcelable;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2
    .param p1, "token"    # Landroid/os/Parcelable;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mToken:Landroid/os/Parcelable;

    .line 208
    return-object p0
.end method

.method public withTypeFace(Landroid/graphics/Typeface;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 2
    .param p1, "typeFace"    # Landroid/graphics/Typeface;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mTypeFace:Landroid/graphics/Typeface;

    .line 307
    return-object p0
.end method

.method public withVisibilityChangeListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)Lcom/github/mrengineer13/snackbar/SnackBar$Builder;
    .registers 3
    .param p1, "visibilityChangeListener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .prologue
    .line 275
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$Builder;->mSnackBar:Lcom/github/mrengineer13/snackbar/SnackBar;

    # invokes: Lcom/github/mrengineer13/snackbar/SnackBar;->setOnVisibilityChangeListener(Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)Lcom/github/mrengineer13/snackbar/SnackBar;
    invoke-static {v0, p1}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$100(Lcom/github/mrengineer13/snackbar/SnackBar;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)Lcom/github/mrengineer13/snackbar/SnackBar;

    .line 276
    return-object p0
.end method

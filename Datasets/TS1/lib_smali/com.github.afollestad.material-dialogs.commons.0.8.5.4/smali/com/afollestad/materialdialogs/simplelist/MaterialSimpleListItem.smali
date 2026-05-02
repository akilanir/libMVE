.class public Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
.super Ljava/lang/Object;
.source "MaterialSimpleListItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$1;,
        Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    }
.end annotation


# instance fields
.field private final mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;


# direct methods
.method private constructor <init>(Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;)V
    .registers 2
    .param p1, "builder"    # Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    .line 28
    return-void
.end method

.method synthetic constructor <init>(Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .param p2, "x1"    # Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$1;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;-><init>(Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;)V

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mBackgroundColor:I

    return v0
.end method

.method public getContent()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContent:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIconPadding()I
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mIconPadding:I

    return v0
.end method

.method public getId()J
    .registers 3

    .prologue
    .line 48
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    iget-wide v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mId:J

    return-wide v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->mBuilder:Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getContent()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 135
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getContent()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    :goto_e
    return-object v0

    :cond_f
    const-string v0, "(no content)"

    goto :goto_e
.end method

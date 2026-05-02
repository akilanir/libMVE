.class public Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "HeaderItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field aboutAppDescription:Landroid/widget/TextView;

.field aboutAppName:Landroid/widget/TextView;

.field aboutDivider:Landroid/view/View;

.field aboutIcon:Landroid/widget/ImageView;

.field aboutSpecial1:Landroid/widget/Button;

.field aboutSpecial2:Landroid/widget/Button;

.field aboutSpecial3:Landroid/widget/Button;

.field aboutSpecialContainer:Landroid/view/View;

.field aboutVersion:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 6
    .param p1, "headerView"    # Landroid/view/View;

    .prologue
    .line 282
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 285
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutIcon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutIcon:Landroid/widget/ImageView;

    .line 286
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutName:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppName:Landroid/widget/TextView;

    .line 287
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppName:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_title_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_title_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 288
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecialContainer:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecialContainer:Landroid/view/View;

    .line 289
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecial1:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial1:Landroid/widget/Button;

    .line 290
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecial2:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial2:Landroid/widget/Button;

    .line 291
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecial3:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial3:Landroid/widget/Button;

    .line 292
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutVersion:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    .line 293
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 294
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutDivider:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutDivider:Landroid/view/View;

    .line 295
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutDivider:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_dividerDark_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_dividerDark_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 296
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutDescription:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    .line 297
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 298
    return-void
.end method

.class public Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "LibsRecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeaderViewHolder"
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
    .line 457
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 460
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutIcon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutIcon:Landroid/widget/ImageView;

    .line 461
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutName:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppName:Landroid/widget/TextView;

    .line 462
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppName:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_title_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_title_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 463
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecialContainer:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecialContainer:Landroid/view/View;

    .line 464
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecial1:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial1:Landroid/widget/Button;

    .line 465
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecial2:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial2:Landroid/widget/Button;

    .line 466
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutSpecial3:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial3:Landroid/widget/Button;

    .line 467
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutVersion:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutVersion:Landroid/widget/TextView;

    .line 468
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutVersion:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 469
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutDivider:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutDivider:Landroid/view/View;

    .line 470
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutDivider:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_dividerDark_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_dividerDark_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 471
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->aboutDescription:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    .line 472
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 473
    return-void
.end method

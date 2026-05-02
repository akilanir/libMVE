.class public Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "LibraryItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field card:Landroid/support/v7/widget/CardView;

.field libraryBottomContainer:Landroid/view/View;

.field libraryBottomDivider:Landroid/view/View;

.field libraryCreator:Landroid/widget/TextView;

.field libraryDescription:Landroid/widget/TextView;

.field libraryDescriptionDivider:Landroid/view/View;

.field libraryLicense:Landroid/widget/TextView;

.field libraryName:Landroid/widget/TextView;

.field libraryVersion:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 6
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 320
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    move-object v0, p1

    .line 321
    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->card:Landroid/support/v7/widget/CardView;

    .line 322
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->card:Landroid/support/v7/widget/CardView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_card:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_card:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/CardView;->setCardBackgroundColor(I)V

    .line 324
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryName:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryName:Landroid/widget/TextView;

    .line 325
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryName:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_title_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_title_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 326
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryCreator:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    .line 327
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 328
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryDescriptionDivider:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescriptionDivider:Landroid/view/View;

    .line 329
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescriptionDivider:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_dividerLight_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_dividerLight_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 330
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryDescription:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    .line 331
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 333
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryBottomDivider:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomDivider:Landroid/view/View;

    .line 334
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomDivider:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_dividerLight_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_dividerLight_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 335
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryBottomContainer:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    .line 337
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryVersion:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryVersion:Landroid/widget/TextView;

    .line 338
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryVersion:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 339
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->libraryLicense:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryLicense:Landroid/widget/TextView;

    .line 340
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryLicense:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->about_libraries_text_openSource:I

    sget v3, Lcom/mikepenz/aboutlibraries/R$color;->about_libraries_text_openSource:I

    invoke-static {v1, v2, v3}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 342
    return-void
.end method

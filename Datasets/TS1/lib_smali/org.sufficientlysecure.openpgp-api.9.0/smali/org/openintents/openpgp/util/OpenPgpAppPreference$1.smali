.class Lorg/openintents/openpgp/util/OpenPgpAppPreference$1;
.super Landroid/widget/ArrayAdapter;
.source "OpenPgpAppPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/openintents/openpgp/util/OpenPgpAppPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;


# direct methods
.method constructor <init>(Lorg/openintents/openpgp/util/OpenPgpAppPreference;Landroid/content/Context;IILjava/util/List;)V
    .registers 6
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # I
    .param p4, "x2"    # I

    .prologue
    .line 92
    .local p5, "x3":Ljava/util/List;, "Ljava/util/List<Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;>;"
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;IILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 95
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 96
    .local v2, "v":Landroid/view/View;
    const v3, 0x1020014

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 99
    .local v1, "tv":Landroid/widget/TextView;
    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$1;->this$0:Lorg/openintents/openpgp/util/OpenPgpAppPreference;

    # getter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference;->mList:Ljava/util/ArrayList;
    invoke-static {v3}, Lorg/openintents/openpgp/util/OpenPgpAppPreference;->access$000(Lorg/openintents/openpgp/util/OpenPgpAppPreference;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;

    # getter for: Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->icon:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->access$100(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 103
    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {p0}, Lorg/openintents/openpgp/util/OpenPgpAppPreference$1;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    const/high16 v4, 0x3f000000    # 0.5f

    add-float/2addr v3, v4

    float-to-int v0, v3

    .line 104
    .local v0, "dp10":I
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 106
    return-object v2
.end method

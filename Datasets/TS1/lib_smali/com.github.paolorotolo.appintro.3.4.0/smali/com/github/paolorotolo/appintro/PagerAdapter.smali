.class Lcom/github/paolorotolo/appintro/PagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "PagerAdapter.java"


# instance fields
.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V
    .registers 3
    .param p1, "fm"    # Landroid/support/v4/app/FragmentManager;
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentManager;",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p2, "fragments":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    invoke-direct {p0, p1}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 15
    iput-object p2, p0, Lcom/github/paolorotolo/appintro/PagerAdapter;->fragments:Ljava/util/List;

    .line 16
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/PagerAdapter;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getFragments()Ljava/util/List;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/PagerAdapter;->fragments:Ljava/util/List;

    return-object v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 20
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/PagerAdapter;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    return-object v0
.end method

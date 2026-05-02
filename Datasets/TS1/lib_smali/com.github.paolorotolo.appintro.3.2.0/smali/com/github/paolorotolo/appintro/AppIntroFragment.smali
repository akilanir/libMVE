.class public Lcom/github/paolorotolo/appintro/AppIntroFragment;
.super Landroid/support/v4/app/Fragment;
.source "AppIntroFragment.java"


# static fields
.field private static final ARG_COLOUR:Ljava/lang/String; = "colour"

.field private static final ARG_DESC:Ljava/lang/String; = "desc"

.field private static final ARG_DRAWABLE:Ljava/lang/String; = "drawable"

.field private static final ARG_TITLE:Ljava/lang/String; = "title"


# instance fields
.field private colour:I

.field private description:Ljava/lang/String;

.field private drawable:I

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/String;II)Lcom/github/paolorotolo/appintro/AppIntroFragment;
    .registers 7
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "imageDrawable"    # I
    .param p3, "colour"    # I

    .prologue
    .line 21
    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntroFragment;

    invoke-direct {v1}, Lcom/github/paolorotolo/appintro/AppIntroFragment;-><init>()V

    .line 23
    .local v1, "sampleSlide":Lcom/github/paolorotolo/appintro/AppIntroFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 24
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "title"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v2, "desc"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    const-string v2, "drawable"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    const-string v2, "colour"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 28
    invoke-virtual {v1, v0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->setArguments(Landroid/os/Bundle;)V

    .line 30
    return-object v1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 42
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_43

    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Bundle;->size()I

    move-result v0

    if-eqz v0, :cond_43

    .line 43
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "drawable"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->drawable:I

    .line 44
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->title:Ljava/lang/String;

    .line 45
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "desc"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->description:Ljava/lang/String;

    .line 46
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "colour"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->colour:I

    .line 48
    :cond_43
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 53
    sget v5, Lcom/github/paolorotolo/appintro/R$layout;->fragment_intro:I

    const/4 v6, 0x0

    invoke-virtual {p1, v5, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 54
    .local v4, "v":Landroid/view/View;
    sget v5, Lcom/github/paolorotolo/appintro/R$id;->title:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 55
    .local v3, "t":Landroid/widget/TextView;
    sget v5, Lcom/github/paolorotolo/appintro/R$id;->description:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 56
    .local v0, "d":Landroid/widget/TextView;
    sget v5, Lcom/github/paolorotolo/appintro/R$id;->image:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 57
    .local v1, "i":Landroid/widget/ImageView;
    sget v5, Lcom/github/paolorotolo/appintro/R$id;->main:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 58
    .local v2, "m":Landroid/widget/LinearLayout;
    iget-object v5, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->title:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v5, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->description:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    iget v6, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->drawable:I

    invoke-static {v5, v6}, Lcom/github/paolorotolo/appintro/ResourceUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    iget v5, p0, Lcom/github/paolorotolo/appintro/AppIntroFragment;->colour:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 62
    return-object v4
.end method

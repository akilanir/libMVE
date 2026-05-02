.class public Lorg/ligi/axt/extensions/FragmentAXT;
.super Ljava/lang/Object;
.source "FragmentAXT.java"


# instance fields
.field private final mFragment:Landroid/app/Fragment;


# direct methods
.method public constructor <init>(Landroid/app/Fragment;)V
    .registers 2
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lorg/ligi/axt/extensions/FragmentAXT;->mFragment:Landroid/app/Fragment;

    .line 11
    return-void
.end method


# virtual methods
.method public findById(I)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 14
    iget-object v0, p0, Lorg/ligi/axt/extensions/FragmentAXT;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

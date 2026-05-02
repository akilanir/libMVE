.class public Lcom/mikepenz/aboutlibraries/ui/LibsFragment;
.super Landroid/app/Fragment;
.source "LibsFragment.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# instance fields
.field private libsFragmentCompat:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 23
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    invoke-direct {v0}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libsFragmentCompat:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    .line 24
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 10
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libsFragmentCompat:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->onCreateView(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libsFragmentCompat:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->onDestroyView()V

    .line 41
    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    .line 42
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 35
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libsFragmentCompat:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 36
    return-void
.end method

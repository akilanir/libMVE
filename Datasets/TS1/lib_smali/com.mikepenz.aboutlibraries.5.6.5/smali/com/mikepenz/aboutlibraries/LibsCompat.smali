.class public Lcom/mikepenz/aboutlibraries/LibsCompat;
.super Ljava/lang/Object;
.source "LibsCompat.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fragment(Lcom/mikepenz/aboutlibraries/LibsBuilder;)Lcom/mikepenz/aboutlibraries/ui/LibsFragment;
    .registers 4
    .param p0, "libsBuilder"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 22
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 23
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "data"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 25
    new-instance v1, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;

    invoke-direct {v1}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;-><init>()V

    .line 26
    .local v1, "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsFragment;
    invoke-virtual {v1, v0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 27
    return-object v1
.end method

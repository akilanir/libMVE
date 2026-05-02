.class public interface abstract Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;
.super Ljava/lang/Object;
.source "LibsConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/LibsConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LibsListener"
.end annotation


# virtual methods
.method public abstract onExtraClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;)Z
.end method

.method public abstract onIconClicked(Landroid/view/View;)V
.end method

.method public abstract onIconLongClicked(Landroid/view/View;)Z
.end method

.method public abstract onLibraryAuthorClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
.end method

.method public abstract onLibraryAuthorLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
.end method

.method public abstract onLibraryBottomClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
.end method

.method public abstract onLibraryBottomLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
.end method

.method public abstract onLibraryContentClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
.end method

.method public abstract onLibraryContentLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
.end method

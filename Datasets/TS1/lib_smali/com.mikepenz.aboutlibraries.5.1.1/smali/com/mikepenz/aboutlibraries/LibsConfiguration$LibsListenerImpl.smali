.class public abstract Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListenerImpl;
.super Ljava/lang/Object;
.source "LibsConfiguration.java"

# interfaces
.implements Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/LibsConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "LibsListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/aboutlibraries/LibsConfiguration;


# direct methods
.method public constructor <init>(Lcom/mikepenz/aboutlibraries/LibsConfiguration;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListenerImpl;->this$0:Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onExtraClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "specialButton"    # Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;

    .prologue
    .line 191
    const/4 v0, 0x0

    return v0
.end method

.method public onIconClicked(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 172
    return-void
.end method

.method public onIconLongClicked(Landroid/view/View;)Z
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 196
    const/4 v0, 0x1

    return v0
.end method

.method public onLibraryAuthorClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 176
    const/4 v0, 0x0

    return v0
.end method

.method public onLibraryAuthorLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 201
    const/4 v0, 0x1

    return v0
.end method

.method public onLibraryBottomClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 186
    const/4 v0, 0x0

    return v0
.end method

.method public onLibraryBottomLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 211
    const/4 v0, 0x1

    return v0
.end method

.method public onLibraryContentClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 181
    const/4 v0, 0x0

    return v0
.end method

.method public onLibraryContentLongClicked(Landroid/view/View;Lcom/mikepenz/aboutlibraries/entity/Library;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 206
    const/4 v0, 0x1

    return v0
.end method

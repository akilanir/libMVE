.class Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$1;
.super Ljava/lang/Object;
.source "AndroidDocumentProvider.java"

# interfaces
.implements Lcom/facebook/stetho/common/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/common/Predicate",
        "<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;)V
    .registers 2
    .param p1, "this$1"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$1;->this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;)Z
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 251
    instance-of v0, p1, Lcom/facebook/stetho/inspector/elements/android/DocumentHiddenView;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 248
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$1;->apply(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

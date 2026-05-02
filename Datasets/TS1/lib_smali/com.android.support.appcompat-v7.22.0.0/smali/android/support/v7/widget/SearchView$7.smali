.class Landroid/support/v7/widget/SearchView$7;
.super Ljava/lang/Object;
.source "SearchView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/SearchView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/SearchView;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/SearchView;)V
    .registers 2

    .prologue
    .line 905
    iput-object p1, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 908
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # getter for: Landroid/support/v7/widget/SearchView;->mSearchButton:Landroid/widget/ImageView;
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$400(Landroid/support/v7/widget/SearchView;)Landroid/widget/ImageView;

    move-result-object v0

    if-ne p1, v0, :cond_e

    .line 909
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # invokes: Landroid/support/v7/widget/SearchView;->onSearchClicked()V
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$500(Landroid/support/v7/widget/SearchView;)V

    .line 921
    :cond_d
    :goto_d
    return-void

    .line 910
    :cond_e
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # getter for: Landroid/support/v7/widget/SearchView;->mCloseButton:Landroid/widget/ImageView;
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$600(Landroid/support/v7/widget/SearchView;)Landroid/widget/ImageView;

    move-result-object v0

    if-ne p1, v0, :cond_1c

    .line 911
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # invokes: Landroid/support/v7/widget/SearchView;->onCloseClicked()V
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$700(Landroid/support/v7/widget/SearchView;)V

    goto :goto_d

    .line 912
    :cond_1c
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # getter for: Landroid/support/v7/widget/SearchView;->mSubmitButton:Landroid/widget/ImageView;
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$800(Landroid/support/v7/widget/SearchView;)Landroid/widget/ImageView;

    move-result-object v0

    if-ne p1, v0, :cond_2a

    .line 913
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # invokes: Landroid/support/v7/widget/SearchView;->onSubmitQuery()V
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$900(Landroid/support/v7/widget/SearchView;)V

    goto :goto_d

    .line 914
    :cond_2a
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # getter for: Landroid/support/v7/widget/SearchView;->mVoiceButton:Landroid/widget/ImageView;
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$1000(Landroid/support/v7/widget/SearchView;)Landroid/widget/ImageView;

    move-result-object v0

    if-ne p1, v0, :cond_3e

    .line 915
    # getter for: Landroid/support/v7/widget/SearchView;->IS_AT_LEAST_FROYO:Z
    invoke-static {}, Landroid/support/v7/widget/SearchView;->access$1100()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 916
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # invokes: Landroid/support/v7/widget/SearchView;->onVoiceClicked()V
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$1200(Landroid/support/v7/widget/SearchView;)V

    goto :goto_d

    .line 918
    :cond_3e
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # getter for: Landroid/support/v7/widget/SearchView;->mQueryTextView:Landroid/support/v7/widget/SearchView$SearchAutoComplete;
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$1300(Landroid/support/v7/widget/SearchView;)Landroid/support/v7/widget/SearchView$SearchAutoComplete;

    move-result-object v0

    if-ne p1, v0, :cond_d

    .line 919
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$7;->this$0:Landroid/support/v7/widget/SearchView;

    # invokes: Landroid/support/v7/widget/SearchView;->forceSuggestionQuery()V
    invoke-static {v0}, Landroid/support/v7/widget/SearchView;->access$1400(Landroid/support/v7/widget/SearchView;)V

    goto :goto_d
.end method
